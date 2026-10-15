---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Governança no desenvolvimento com agentes

## Em uma frase

Governança define quem pode propor, decidir, implementar e verificar mudanças para que o software continue atendendo propósitos e limites acordados.

## Problema que resolve

Um agente otimiza a tarefa que recebeu; isso não garante que a tarefa ainda represente a necessidade do produto. Uma instrução incompleta, uma alteração de código ou um critério de avaliação enfraquecido pode deslocar o comportamento sem que ninguém tenha aprovado essa troca.

## Como funciona

Separe compromissos de execução. Objetivo de produto descreve a mudança desejada para usuários ou negócio; métricas de resultado são medidas observáveis relacionadas a esse objetivo, não o objetivo em si. Regras de negócio definem decisões do domínio; invariantes são condições que devem continuar verdadeiras através das mudanças. Restrições arquiteturais limitam a solução técnica. Instruções do harness orientam o trabalho do agente. Critérios de aceitação especificam o que precisa ser demonstrado; evidências são resultados de verificações ou observações.

Uma sugestão organizacional é designar pessoas responsáveis por domínio/produto, arquitetura, implementação, avaliação e aprovação de mudanças de alto impacto. Essas funções podem pertencer às mesmas pessoas em uma equipe pequena; o essencial é tornar autoridade e responsabilidade explícitas. Governança acompanha o ciclo de vida e o risco, como estrutura adaptável, não como comitê obrigatório para toda alteração.

## Exemplo

Hipotético: para um assistente de indicadores, “ajudar gestores a perceber tendências” é objetivo; o tempo até localizar um indicador pode ser uma métrica; “usuário só vê equipes autorizadas” é uma regra.

## Limites e confusões comuns

Papéis documentados não aplicam controles automaticamente. Governança não exige congelar o produto: mudanças aprovadas atualizam a referência vigente. Métrica boa também não substitui julgamento sobre valor e efeitos colaterais.

## Conexões

- [[02-constituicao-do-projeto|Constituição do projeto]] — registra compromissos e autoridades.
- [[08-controle-de-mudancas|Controle de mudanças]] — atualiza compromissos aprovados.
- [[07-rastreabilidade-de-requisitos|Rastreabilidade]] — acompanha evidências.

## Para investigar

- Quem é a autoridade para aceitar uma mudança de regra neste contexto?
- Qual métrica pode melhorar enquanto o objetivo de produto piora?

## Minhas anotações

- **Minha síntese:**
- **Observação ou hipótese:**
- **Dúvida:**

## Fontes

- [NIST AI RMF 1.0 — Core](https://airc.nist.gov/airmf-resources/airmf/5-sec-core/) (governança, papéis e gestão contínua de riscos; voluntário e adaptável. Ao consultar em 2026-10-15, a revisão da versão 1.0 estava em curso).
- [NASA Systems Engineering Handbook](https://science.nasa.gov/wp-content/uploads/2023/04/nasa_systems_engineering_handbook_0.pdf) (controle de requisitos e aprovação de mudanças). Consulta: 2026-10-15.
