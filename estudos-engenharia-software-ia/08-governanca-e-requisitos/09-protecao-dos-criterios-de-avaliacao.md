---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Proteção dos critérios de avaliação

## Em uma frase

Proteger critérios de avaliação significa governar rubricas, casos, dados esperados e gates para que a equipe não altere silenciosamente a medida que deveria avaliar a implementação.

## Problema que resolve

Se o mesmo fluxo pode mudar o produto, editar o teste e declarar aprovação, um agente pode transformar um defeito em aparente sucesso removendo o caso que falha ou elevando uma tolerância. Separar a decisão sobre comportamento da decisão sobre como avaliá-lo torna essa troca visível.

## Como funciona

Identifique o dono da regra, quem mantém os testes e quem aprova mudanças. Proteja rubricas, casos de referência, contratos e workflows de CI com revisão; exija checagens no PR e registre versões e resultados. Regras de branch do GitHub, por exemplo, podem exigir revisões, aprovação de CODEOWNERS e checks de status.

Agentes distintos não são fronteiras de segurança: podem compartilhar credenciais e permissões para editar testes ou CI. A separação depende de identidades, escopos, segredos e permissões no ambiente. Reduza privilégios e mantenha a aprovação dos critérios fora do alcance do agente implementador.

Mudar um critério pode ser legítimo: explique por que deixou de representar a necessidade, peça aprovação do responsável pelo domínio, versione a rubrica e compare resultados antigos e novos.

## Exemplo

Hipotético: um PR muda tolerância numérica. O CI roda o novo limiar, mas a alteração também pede revisão do responsável por fidelidade dos indicadores; o agente que mudou a consulta não aprova sozinho o novo critério.

## Limites e confusões comuns

Um gate obrigatório pode usar uma checagem incompleta; administrador pode ter bypass. Revise permissões e configuração, não só o arquivo de workflow. CI não substitui validação humana de mudança de domínio.

## Conexões

- [[06-avaliacoes-e-agentes-avaliadores|Avaliações]] — define tipos de evidência.
- [[08-controle-de-mudancas|Controle de mudanças]] — rege alterações de critérios.
- [[02-constituicao-do-projeto|Constituição]] — registra autoridade e limites.
- [[menor-privilegio|Menor privilégio]] — reduz alcance das identidades.

## Para investigar

- Quem consegue editar a rubrica, alterar o gate ou aprovar sua própria mudança?
- Que caso de referência detectaria a regressão mais importante?

## Minhas anotações

- **Minha síntese:**
- **Controle observado:**
- **Dúvida:**

## Fontes

- [GitHub Docs — protected branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches) (revisão, checks e permissões).
- [GitHub Docs — Code Owners](https://docs.github.com/en/enterprise-cloud@latest/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) (aprovação de responsáveis por arquivos; depende da configuração da regra de branch). Consulta: 2026-10-15.
