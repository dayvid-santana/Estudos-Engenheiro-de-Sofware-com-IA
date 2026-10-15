---
tipo: mapa
status: nao-iniciado
prioridade: essencial
---

# Mapa de estudo — governança e evolução de software com agentes

Esta trilha estuda como preservar compromissos aprovados enquanto agentes e software mudam. Ela complementa [Agent Evals](../05-qualidade-e-seguranca/agent-evals.md), [Contratos formais](../05-qualidade-e-seguranca/contratos-formais.md), [LLM-as-a-Judge](../05-qualidade-e-seguranca/llm-as-a-judge.md), [Análise de impacto](../04-inteligencia-sobre-codigo/analise-de-impacto.md) e [Proveniência e rastreabilidade](../03-contexto-e-conhecimento/proveniencia-e-rastreabilidade.md).

## Ordem sugerida

1. [Governança com agentes](01-governanca-no-desenvolvimento-com-agentes.md): quem define e mantém os compromissos.
2. [Constituição do projeto](02-constituicao-do-projeto.md): princípios, limites e autoridade.
3. [Desenvolvimento orientado por especificações](03-desenvolvimento-orientado-por-especificacoes.md): transformar intenção em critérios observáveis.
4. [Invariantes de negócio](04-invariantes-de-negocio.md): identificar verdades que as mudanças devem preservar.
5. [Fitness functions](05-fitness-functions.md): verificar características arquiteturais durante a evolução.
6. [Avaliações e agentes avaliadores](06-avaliacoes-e-agentes-avaliadores.md): reunir evidências e entender os limites dos julgadores.
7. [Rastreabilidade de requisitos](07-rastreabilidade-de-requisitos.md): ligar compromisso, implementação e evidência.
8. [Controle de mudanças](08-controle-de-mudancas.md): propor e aprovar alterações explicitamente.
9. [Proteção dos critérios de avaliação](09-protecao-dos-criterios-de-avaliacao.md): evitar que a implementação afrouxe seu próprio critério.
10. [Exemplo integrado](10-exemplo-integrado.md): percorrer os conceitos num sistema hipotético.

## Como estudar

Leia **Em uma frase**, responda às perguntas em **Para investigar** sem consultar a nota e depois aplique o conceito ao exemplo integrado. Registre o que descobriu em **Minhas anotações**. Os métodos organizacionais sugeridos são opções adaptáveis, não um framework universal.

### Pergunta de revisão

Para uma mudança, pergunte: **qual compromisso aprovado ela toca, quem pode aprová-la e que evidência mostrará que continua atendido?**

### Exercício

Escolha uma regra de um projeto real e ligue-a a uma especificação, uma verificação e uma evidência de cumprimento. Registre também quem aprova uma mudança nessa regra.
