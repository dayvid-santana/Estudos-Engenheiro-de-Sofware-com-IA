# Roadmap — LangChain, MCP e APIs de modelos

Trilha prática para quem quer estruturar uma aplicação Python com LangChain, conectar ferramentas por MCP ou API REST e entender o papel dos agentes.

## Em 30 segundos

- Entenda primeiro o ciclo, as ferramentas e os controles de um agente.
- Configure um provedor de modelo e mantenha credenciais fora do código.
- Integre MCP ou uma API REST como ferramenta, com permissões limitadas.
- Diferencie o papel de LangChain, LangGraph e outros componentes descritos na nota.
- Complete a leitura com segurança, avaliação e mitigação.

## Pré-requisitos recomendados

- [01 — Conceitos essenciais](01-conceitos.md): modelo mental de Harness e agente.
- [02 — Componentes e ciclo](02-componentes-e-fluxo.md): estado, ferramentas e execução.

## Sequência sugerida

| Etapa | Objetivo | Onde na nota |
|---|---|---|
| 1. Modelo | Configurar acesso a um provedor de modelos | [07 — LangChain](07-langchain.md#1-instalar-e-configurar-um-provedor-de-modelos) |
| 2. MCP | Conectar ferramentas oferecidas por um servidor MCP | [07 — Integração MCP](07-langchain.md#2-consumir-ferramentas-de-um-servidor-mcp) |
| 3. APIs | Expor uma API REST própria como ferramenta | [07 — API REST](07-langchain.md#3-usar-api-rest-propria-como-ferramenta) |
| 4. Agentes | Entender LangChain, LangGraph e Deep Agents e quando cada camada entra | [07 — Agentes](07-langchain.md#5-langchain-langgraph-e-deep-agents) |
| 5. Segurança | Revisar limites e controles de uma aplicação real | [07 — Controles](07-langchain.md#4-controles-para-uma-aplicacao-real), [04 — Segurança e avaliação](04-seguranca-e-avaliacao.md) e [06 — Mitigação](06-estrategias-de-mitigacao.md) |

## Marco de conclusão

Você concluiu a trilha quando consegue explicar o caminho entre a aplicação, o modelo e uma ferramenta, reconhecer as fronteiras de confiança de MCP/API e definir como validar o resultado de uma ação.

## Nota técnica

APIs, pacotes, versões e protocolo MCP podem mudar. Antes de implementar, confira as fontes oficiais e a data de consulta em [07 — LangChain](07-langchain.md). O [roadmap geral](ROADMAP.md) mostra como esta trilha se conecta aos demais temas.
