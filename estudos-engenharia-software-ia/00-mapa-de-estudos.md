# Mapa de estudos — Engenharia de software com IA

Use este mapa como índice, não como curso linear. As notas são pontos de partida: investigue uma pergunta, faça o exercício pequeno e acrescente evidências próprias.

## Rota inicial sugerida

1. [AI Engineering](01-fundamentos/ai-engineering.md)
2. [Harness](01-fundamentos/harness.md)
3. [Agentes de IA](01-fundamentos/agentes-de-ia.md)
4. [Context Engineering](03-contexto-e-conhecimento/context-engineering.md)
5. [Tool Calling](02-arquitetura-de-agentes/tool-calling.md)
6. [Agent Evals](05-qualidade-e-seguranca/agent-evals.md)
7. [Sandboxing](05-qualidade-e-seguranca/sandboxing.md)
8. [Observabilidade](06-execucao-e-operacoes/observabilidade.md)

A sequência passa por construção, fornecimento de contexto, uso de ferramentas, verificação de resultados, contenção de riscos e inspeção da execução. Adapte-a às dúvidas que surgirem no Harness estudado.

## Fundamentos

- [AI Engineering](01-fundamentos/ai-engineering.md)
- [Harness](01-fundamentos/harness.md)
- [Agentes de IA](01-fundamentos/agentes-de-ia.md)
- [Roles de agentes](01-fundamentos/roles-de-agentes.md)
- [Orquestração de agentes](01-fundamentos/orquestracao-de-agentes.md)
- [System Prompt](01-fundamentos/system-prompt.md)
- [RAG](01-fundamentos/rag.md)
- [Cápsulas de contexto](01-fundamentos/capsulas-de-contexto.md)
- [Grafos de contexto](01-fundamentos/grafos-de-contexto.md)

## Arquitetura de agentes

- [Arquiteturas agentivas](02-arquitetura-de-agentes/arquiteturas-agentivas.md)
- [Padrões de agentes](02-arquitetura-de-agentes/padroes-de-agentes.md)
- [Workflows determinísticos](02-arquitetura-de-agentes/workflows-deterministicos.md)
- [Model Routing](02-arquitetura-de-agentes/model-routing.md)
- [Structured Outputs](02-arquitetura-de-agentes/structured-outputs.md)
- [Tool Calling](02-arquitetura-de-agentes/tool-calling.md)
- [MCP](02-arquitetura-de-agentes/mcp.md)
- [A2A](02-arquitetura-de-agentes/a2a.md)

## Contexto e conhecimento

- [Context Engineering](03-contexto-e-conhecimento/context-engineering.md)
- [GraphRAG](03-contexto-e-conhecimento/graphrag.md)
- [Knowledge Graphs](03-contexto-e-conhecimento/knowledge-graphs.md)
- [Semantic Chunking](03-contexto-e-conhecimento/semantic-chunking.md)
- [Hierarchical Retrieval](03-contexto-e-conhecimento/hierarchical-retrieval.md)
- [Arquitetura de memória](03-contexto-e-conhecimento/arquitetura-de-memoria.md)
- [Compressão de contexto](03-contexto-e-conhecimento/compressao-de-contexto.md)
- [Proveniência e rastreabilidade](03-contexto-e-conhecimento/proveniencia-e-rastreabilidade.md)

## Inteligência sobre código

- [AST](04-inteligencia-sobre-codigo/ast.md)
- [LSP](04-inteligencia-sobre-codigo/lsp.md)
- [Análise estática](04-inteligencia-sobre-codigo/analise-estatica.md)
- [Call Graph](04-inteligencia-sobre-codigo/call-graph.md)
- [Dependency Graph](04-inteligencia-sobre-codigo/dependency-graph.md)
- [Program Slicing](04-inteligencia-sobre-codigo/program-slicing.md)
- [Análise de impacto](04-inteligencia-sobre-codigo/analise-de-impacto.md)

## Qualidade e segurança

- [Agent Evals](05-qualidade-e-seguranca/agent-evals.md)
- [LLM-as-a-Judge](05-qualidade-e-seguranca/llm-as-a-judge.md)
- [Sandboxing](05-qualidade-e-seguranca/sandboxing.md)
- [Prompt Injection](05-qualidade-e-seguranca/prompt-injection.md)
- [Menor privilégio](05-qualidade-e-seguranca/menor-privilegio.md)
- [Policy Engines](05-qualidade-e-seguranca/policy-engines.md)
- [Human-in-the-Loop](05-qualidade-e-seguranca/human-in-the-loop.md)
- [Checkpointing](05-qualidade-e-seguranca/checkpointing.md)
- [Idempotência](05-qualidade-e-seguranca/idempotencia.md)
- [Recuperação de falhas](05-qualidade-e-seguranca/recuperacao-de-falhas.md)
- [Contratos formais](05-qualidade-e-seguranca/contratos-formais.md)

## Execução e operações

- [Máquinas de estados](06-execucao-e-operacoes/maquinas-de-estados.md)
- [Arquitetura orientada a eventos](06-execucao-e-operacoes/arquitetura-orientada-a-eventos.md)
- [Event Sourcing](06-execucao-e-operacoes/event-sourcing.md)
- [Durable Execution](06-execucao-e-operacoes/durable-execution.md)
- [Controle de concorrência](06-execucao-e-operacoes/controle-de-concorrencia.md)
- [Distributed Tracing](06-execucao-e-operacoes/distributed-tracing.md)
- [Observabilidade](06-execucao-e-operacoes/observabilidade.md)
- [Engenharia de custos](06-execucao-e-operacoes/engenharia-de-custos.md)
- [Estratégias de cache](06-execucao-e-operacoes/estrategias-de-cache.md)
- [Backpressure](06-execucao-e-operacoes/backpressure.md)

## Tópicos avançados

Estes temas podem esperar até que uma necessidade concreta apareça.

- [IA neuro-simbólica](07-topicos-avancados/ia-neuro-simbolica.md)
- [Constraint Solving](07-topicos-avancados/constraint-solving.md)
- [Verificação formal](07-topicos-avancados/verificacao-formal.md)
- [Coordenação multiagente](07-topicos-avancados/coordenacao-multiagente.md)
- [Planejamento adaptativo](07-topicos-avancados/planejamento-adaptativo.md)
- [Estimativa de incerteza](07-topicos-avancados/estimativa-de-incerteza.md)
- [Crítica e revisão](07-topicos-avancados/ciclos-de-critica-e-revisao.md)
- [Model Distillation](07-topicos-avancados/model-distillation.md)
- [Fine-Tuning](07-topicos-avancados/fine-tuning.md)
- [LoRA](07-topicos-avancados/lora.md)

[Como usar as notas](00-como-usar-as-notas.md)
