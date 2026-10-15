---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Autenticação e autorização via headers em integrações com ERP

## Em uma frase

Uma aplicação integrada a um ERP precisa validar de onde vem a identidade do usuário e, separadamente, decidir se essa identidade pode acessar a aplicação e cada recurso solicitado.

## 1. Visão geral do cenário

O desafio é permitir o acesso a uma nova aplicação somente a usuários cadastrados e autorizados no ERP, usando contexto propagado por headers HTTP. O header, por si só, não prova a identidade: um cliente pode enviar ou alterar `X-User-Id` e `X-User-Roles` se a aplicação confiar diretamente no valor recebido.

- **Autenticação:** verifica uma credencial e estabelece quem é o usuário ou serviço que fez a chamada.
- **Autorização:** aplica uma política para decidir se essa identidade pode executar uma ação ou acessar um recurso.

O ERP pode autenticar o usuário e entregar uma afirmação confiável à aplicação; a aplicação ainda deve aplicar autorização no ponto que protege os dados. Uma sessão válida no ERP não significa acesso automático a todo endpoint ou registro.

## 2. Estratégias de autenticação

### API Gateway ou reverse proxy com injeção de headers

O gateway valida sessão ou token do ERP, remove headers de identidade enviados pelo cliente e injeta os valores validados, por exemplo `X-User-Id` e `X-User-Roles`. A aplicação confia neles somente quando consegue confirmar que a chamada veio do proxy autorizado.

Proteja essa fronteira: TLS no transporte; aplicação inacessível por caminhos que contornem o proxy; autenticação do proxy para a aplicação, por exemplo mTLS; e limpeza/substituição de todo header de identidade recebido do cliente. Isolamento de rede ajuda, mas não é uma prova de identidade por si só. Em múltiplos saltos, configure explicitamente quais proxies são confiáveis. A orientação da OWASP para propagação de identidade descreve esses controles e os riscos de *header spoofing*.

### JWT assinado pelo ERP

O ERP ou provedor de identidade emite um JWT (JSON Web Token) e a aplicação o recebe em:

```http
Authorization: Bearer <access-token>
```

O serviço valida assinatura e algoritmo permitido, emissor (`iss`), usuário (`sub`), público-alvo (`aud`) quando aplicável, validade temporal (`exp` e `nbf`) e tipo/uso esperado do token. Não escolha o algoritmo a partir da entrada sem uma lista permitida. JWT assinado costuma ter claims legíveis; não coloque segredos nele.

A validação local evita uma consulta de rede a cada chamada, mas um token emitido continua útil até expirar, salvo mecanismo adicional de revogação. Tokens curtos, rotação de chaves e audiência/escopo restritos reduzem o impacto. Em assinatura assimétrica, a aplicação pode verificar com chave pública sem receber a chave privada emissora; em assinatura simétrica, cada validador que possui o segredo compartilhado também pode emitir tokens.

### Token opaco com introspecção

Um token opaco é um identificador sem claims que a aplicação consiga validar sozinha. O serviço envia-o ao endpoint de introspecção do ERP/provedor e usa a resposta, como `active`, `sub` e `scope`, para reconhecer a sessão e as permissões aplicáveis.

A consulta síncrona pode refletir revogação mais rapidamente, mas aumenta latência e dependência do ERP. Um cache reduz chamadas, porém amplia o intervalo em que uma revogação pode não ser percebida. Defina o prazo máximo de cache conforme o risco. Em timeout, resposta inválida ou erro de introspecção, negue acesso protegido; não converta indisponibilidade em permissão.

### mTLS com identidade propagada

mTLS (TLS mútuo) verifica certificados dos dois lados e protege a comunicação entre, por exemplo, gateway e API. No cenário de headers, ajuda a provar que o chamador é o serviço/gateway esperado.

mTLS autentica a conexão do serviço, **não o usuário humano do ERP**. A API ainda precisa receber e validar a identidade do usuário por um token, afirmação assinada ou header injetado numa rota realmente confiável. Certificados exigem emissão, distribuição, renovação e revogação operacional.

## 3. Estratégias de autorização

| Estratégia | Decisão de acesso | Vantagem | Cuidado principal |
|---|---|---|---|
| Claims/scopes | Perfil ou permissão vem no token/afirmação confiável; ex.: `indicadores:read` | Pouca consulta extra e política próxima da emissão | Claims podem ficar desatualizadas até a expiração; valide `aud`, escopo e recurso. `X-User-Roles` sem origem confiável é entrada controlável pelo cliente. |
| Whitelist local | Tabela da aplicação contém usuários/IDs permitidos | Regra de entrada simples e específica para a aplicação | Sincronize admissão, mudança de perfil e desligamento; audite alterações e negue por padrão se a consulta falhar. |
| Grupos centralizados no ERP | A aplicação ou gateway consulta grupos/perfis do ERP | ERP pode ser fonte única para ciclo de vida e administração | Dependência de disponibilidade, latência, mapeamento de grupos e propagação de revogação. Emitir credencial não deve ser o único controle de acesso ao recurso. |

Escopos tendem a expressar o que uma credencial pode fazer em uma API; papéis/grupos costumam representar atribuições mais amplas. Nenhum deles substitui verificações por recurso, equipe, locatário ou ação quando a regra de negócio exige esse detalhe. A aplicação deve negar por padrão e avaliar a autorização em cada operação protegida.

## 4. Arquitetura recomendada para a biblioteca (`lib`)

```text
ERP / gateway confiável
          ↓ identidade validada
Middleware de autenticação → Principal normalizado
          ↓
Guard de autorização → handler / recurso protegido
```

1. **Middleware de autenticação:** aceita apenas mecanismos configurados, extrai credenciais, valida token ou origem do proxy e cria um `Principal` interno consistente (ID estável, emissor e claims/permissões necessários). Rejeita credencial ausente, inválida, expirada ou de audiência errada com **401 Unauthorized**. Para esquema Bearer, inclua o desafio `WWW-Authenticate: Bearer` conforme o protocolo HTTP.
2. **Guard de autorização:** consulta a política aplicável ao `Principal`, à ação e ao recurso; usa claims confiáveis, whitelist ou fonte central; nega por padrão. Retorna **403 Forbidden** quando a identidade foi autenticada, mas não tem acesso.

Os nomes `X-User-Id` e `X-User-Roles` são exemplos, não um protocolo padronizado. Normalize-os numa estrutura interna e não deixe handlers lerem headers crus. A configuração de proxies confiáveis deve estar explícita; não confie em todo `X-Forwarded-*` ou em headers de identidade apenas porque existem.

## 5. Critérios para escolher

- Use headers do gateway quando o gateway realmente valida o ERP, remove entradas do cliente e é o único caminho para a API.
- Prefira JWT assinado quando a API pode validar emissor, público, validade e chaves localmente e aceita o intervalo de revogação até expirar.
- Considere introspecção para tokens opacos ou quando a política precisa refletir o estado atual da sessão, dimensionando latência, cache e disponibilidade.
- Use mTLS como autenticação de serviço e proteção do canal; combine-o com contexto verificável do usuário.
- Escolha autorização local ou central de acordo com autoridade, atualização e auditoria. Não mantenha uma segunda fonte de permissões sem definir como ela acompanha o ERP.

## Checklist de segurança

- Remover/substituir headers de identidade enviados pelo cliente; impedir acesso direto que contorne o gateway.
- Validar identidade do proxy/serviço, proteger o trajeto com TLS e restringir audiência e escopo.
- Validar emissor, assinatura, algoritmo e validade de JWT; planejar rotação e revogação.
- Aplicar autorização no servidor em toda operação/recurso, com negação por padrão.
- Não registrar tokens completos; registrar decisão, identidade normalizada, fonte e correlação sem expor credenciais.
- Testar usuário autorizado, não autorizado, token vencido, header forjado, proxy indisponível e tentativa de acesso direto à API.

## Conexões

- [[menor-privilegio|Princípio do menor privilégio]] — limita permissões de usuários e serviços.
- [[policy-engines|Policy Engines]] — separa avaliação de política da aplicação da decisão.
- [[04-invariantes-de-negocio|Invariantes de negócio]] — mantém regras de acesso do domínio.
- [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]] — registra responsabilidade e evidência.

## Para investigar

- Qual componente é a autoridade da identidade humana e qual componente autoriza cada operação?
- Quanto tempo uma revogação pode levar para impedir uma nova chamada?

## Minhas descobertas

**Com minhas palavras:**

**Configuração ou evidência observada:**

**Dúvida que permanece:**

## Fontes

- [RFC 6750 — OAuth 2.0 Bearer Token Usage](https://datatracker.ietf.org/doc/html/rfc6750) e [RFC 9110 — HTTP Semantics](https://datatracker.ietf.org/doc/html/rfc9110) (Bearer em `Authorization`, TLS, e semântica 401/403).
- [RFC 7519 — JWT](https://datatracker.ietf.org/doc/html/rfc7519) e [RFC 8725 — JWT Best Current Practices](https://datatracker.ietf.org/doc/html/rfc8725) (claims e validação segura).
- [RFC 7662 — Token Introspection](https://datatracker.ietf.org/doc/html/rfc7662) e [RFC 8705 — OAuth mTLS](https://datatracker.ietf.org/doc/html/rfc8705) (estado de token e identidade de cliente por certificado).
- OWASP: [Identity Propagation Patterns](https://cheatsheetseries.owasp.org/cheatsheets/Identity_Propagation_Patterns_Cheat_Sheet.html), [Authentication Patterns](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Patterns_Cheat_Sheet.html) e [Authorization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html) (confiança em proxy, remoção de headers não confiáveis e autorização por padrão).

**Consultado em:** 2026-10-15.
