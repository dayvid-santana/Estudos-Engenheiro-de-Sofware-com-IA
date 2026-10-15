# 06 — Estratégias para lidar com os problemas do Harness

## Em 30 segundos

- Reduza o impacto potencial limitando ferramentas, dados, permissões e autonomia.
- Verifique ações e resultados fora do prompt; peça aprovação humana para efeitos de alto impacto.
- Comece em modo restrito, observe traces e avaliações e amplie o acesso por etapas.

## Ideia central

As estratégias mais eficazes limitam o que o agente pode fazer, verificam o que ele faz e aumentam sua autonomia aos poucos. Instruções no prompt ajudam, mas controles importantes devem ser aplicados pelo Harness e pelos sistemas conectados.

## Estratégias principais

### 1. Aplicar o menor privilégio

- Conceda apenas os dados, ferramentas e operações necessários para a tarefa.
- Prefira permissões específicas por agente, sessão e ação.
- Quando possível, execute ações no contexto de identidade e autorização da pessoa que iniciou o pedido.
- Separe permissões de leitura e escrita; não dê acesso administrativo por conveniência.
- Revogue credenciais e acessos temporários ao terminar.

### 2. Classificar ações por impacto

Defina políticas diferentes conforme dano possível, alcance e reversibilidade:

| Ação | Política sugerida |
|---|---|
| Consulta de baixo risco | Automática, com escopo e registro apropriados |
| Alteração reversível em workspace | Sandbox, diff e validações automáticas |
| Publicação, mensagem externa ou mudança em produção | Aprovação humana explícita e identidade autorizada |
| Exclusão ou operação crítica difícil de reverter | Bloqueio por padrão ou processo formal de dupla validação e recuperação |

A aprovação deve mostrar claramente qual ação ocorrerá, sobre quais dados/sistemas e qual impacto esperado.

### 3. Isolar a execução

- Execute código e comandos em sandbox ou ambiente separado.
- Restrinja arquivos montados, rede de saída, portas, duração e recursos computacionais.
- Separe ambientes e dados entre tarefas/usuários quando houver risco de compartilhamento.
- Mantenha credenciais sensíveis fora do ambiente do agente; injete apenas credenciais temporárias e estritamente necessárias.
- Separe o plano de controle confiável (autorização, auditoria, faturamento, recuperação) do ambiente onde o código gerado executa.

### 4. Projetar ferramentas estreitas e previsíveis

- Prefira ferramentas focadas, com nomes, descrições, parâmetros e efeitos colaterais explícitos.
- Valide tipos, formatos, limites e autorização no código que executa a operação.
- Retorne resultados estruturados e erros claros.
- Evite ferramentas genéricas com acesso amplo ao shell, banco de dados ou APIs administrativas.
- Para efeitos externos que podem ser repetidos, use idempotência, chaves de operação ou verificações de estado.

O modelo pode propor uma chamada; a aplicação deve validar se a ação é permitida antes de executá-la.

### 5. Tratar conteúdo externo como não confiável

Páginas, documentos, mensagens e resultados de ferramentas podem conter instruções maliciosas. Separe conteúdo recuperado das políticas do sistema e não permita que ele conceda permissões, altere o escopo da tarefa ou dispense aprovações. Limite os dados e as ferramentas acessíveis ao agente. O prompt sozinho não é uma defesa suficiente contra prompt injection.

### 6. Limitar o ciclo do agente

Configure limites explícitos para:

- número de iterações e chamadas a ferramentas;
- tempo, tokens e custo por tarefa;
- tentativas, timeouts e chamadas repetidas;
- condições de parada, cancelamento e escalonamento para uma pessoa.

Ao atingir um limite, pare com estado e evidências suficientes para diagnóstico; não mantenha loops sem progresso.

### 7. Verificar os resultados de forma independente

- Use testes, schemas, invariantes, comparação com fonte confiável ou revisão humana conforme o risco.
- Diferencie “não executado”, “falhou” e “passou”.
- Exija evidências observáveis para declarar conclusão.
- Não use a afirmação do agente como única validação do próprio resultado.
- Faça revisão humana para ações e resultados de alto impacto.

### 8. Observar e avaliar

Registre traces úteis de chamadas ao modelo, ferramentas, aprovações, resultados, erros e versões de configuração. Redija dados sensíveis e defina retenção. Use avaliações repetíveis com tarefas representativas e casos adversariais para detectar regressões. Combine métricas de qualidade, segurança, custo, latência e intervenção humana.

Ao investigar um problema, comece pelo trace ponta a ponta e classifique a falha: contexto, seleção de ferramenta, autorização, execução, validação ou condição de parada.

### 9. Ampliar autonomia gradualmente

1. Comece por tarefas de baixo risco e, quando possível, em modo somente leitura.
2. Teste em sandbox e compare resultados com critérios verificáveis.
3. Ative escrita limitada com diff e revisão.
4. Só depois automatize ações externas ou de maior impacto, com aprovação e monitoramento adequados.
5. Defina mecanismo de interrupção, revogação de acesso, rollback e resposta a incidentes antes da expansão.

## Sequência prática de adoção

```text
Inventariar ferramentas e permissões
    → iniciar em leitura ou sandbox
    → definir aprovações por impacto
    → adicionar validações, logs e avaliações
    → revisar falhas e regressões
    → ampliar autonomia por etapas
```

## Checklist rápido

- [ ] Cada ferramenta tem escopo e permissão mínimos?
- [ ] O Harness verifica autorização fora do prompt?
- [ ] Execução e credenciais estão isoladas e limitadas?
- [ ] Conteúdo externo é tratado como dado não confiável?
- [ ] Ações sensíveis exigem aprovação adequada?
- [ ] Há limites de tempo, custo e iterações?
- [ ] A conclusão depende de evidência independente?
- [ ] Traces permitem reconstruir falhas sem expor dados desnecessários?
- [ ] Existem testes de regressão, casos adversariais e mecanismo de interrupção?

## Fontes

- [Australian Cyber Security Centre — Agentic AI harnesses](https://www.cyber.gov.au/advisory/agentic-ai-harnesses): menor privilégio, controles de identidade, supervisão humana, monitoramento e implantação gradual.
- [OWASP Gen AI Security Project — LLM06:2025 Excessive Agency](https://genai.owasp.org/llmrisk/llm062025-excessive-agency/): permissões mínimas e aprovação para ações de alto impacto.
- [OpenAI — Sandbox security](https://developers.openai.com/api/docs/guides/agents-api/environments/security): isolamento, restrição de rede e separação de credenciais.
- [OpenAI — Evaluate agent workflows](https://developers.openai.com/api/docs/guides/agent-evals): traces para depuração e avaliações repetíveis para regressões.

**Consultado em:** 2026-10-13.
