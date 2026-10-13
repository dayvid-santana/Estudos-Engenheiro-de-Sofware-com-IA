# 05 — Glossário e fontes

## Glossário rápido

| Termo | Significado nestas notas |
|---|---|
| **Agent harness / Harness** | software e configuração ao redor do modelo que controlam contexto, estado, ferramentas, execução, permissões, feedback e parada |
| **Harness engineering** | engenharia dessa camada e do ambiente/processo para confiabilidade, segurança e utilidade |
| **Agent loop** | ciclo de consulta ao modelo, chamada de ferramenta, observação do resultado e continuação ou encerramento |
| **Orquestração** | coordenação de etapas, ferramentas, modelos ou agentes |
| **Context engineering** | seleção e gestão da informação fornecida ao modelo |
| **Tool calling** | saída estruturada do modelo que solicita a execução de uma ferramenta; a execução é responsabilidade do runtime/Harness |
| **MCP** | Model Context Protocol, protocolo para conectar aplicações de IA a ferramentas e fontes de contexto |
| **Sandbox** | ambiente isolado que limita os efeitos de código ou comandos executados |
| **Guardrail** | controle que restringe, valida ou encaminha comportamento e ações |
| **Prompt injection** | tentativa de manipular um modelo por instruções maliciosas presentes no pedido ou em conteúdo processado |
| **Human-in-the-loop** | participação humana em revisão, aprovação, intervenção ou decisão durante o fluxo |
| **Observabilidade** | sinais que ajudam a entender o comportamento: logs, métricas e traces |
| **Avaliação (eval)** | procedimento repetível para medir qualidade ou risco de uma tarefa/sistema |
| **Compactação de contexto** | redução/resumo do histórico para manter informações relevantes dentro do limite do modelo |
| **Idempotência** | repetir uma operação produz o mesmo efeito final, sem duplicar indevidamente a ação |

## Perguntas frequentes

**Harness é só um prompt grande?** Não. Inclui controles e software que gerem contexto, ferramentas, estado, execução, validação e permissões.

**Um modelo melhor elimina a necessidade de Harness?** Não. Modelo e Harness são complementares; ações continuam exigindo controles, integração e validação.

**Um framework de agentes já é o Harness completo?** Pode implementar parte do Harness. Ainda é preciso configurar ferramentas, identidade, segurança, persistência, avaliações e operação para o caso concreto.

**Toda chamada precisa de aprovação humana?** Não. A política deve acompanhar impacto, reversibilidade e sensibilidade. Ações de alto impacto pedem barreiras mais fortes.

**Multiagente sempre melhora resultados?** Não. Pode paralelizar trabalho independente, mas aumenta coordenação, custo, superfície de ataque e dificuldade de depuração.

**Como medir se o Harness melhorou?** Compare tarefas representativas antes/depois, incluindo sucesso, segurança, custo, latência, necessidade de intervenção e regressões.

## Fontes primárias e leituras

1. **OpenAI — Harness engineering: leveraging Codex in an agent-first world.** Relato de engenharia sobre legibilidade do repositório, regras executáveis, loops de feedback, autonomia e manutenção de entropia. [Abrir artigo](https://openai.com/index/harness-engineering/)
2. **OpenAI — Agents (API docs).** Compara runtime gerenciado pelo Codex Harness, Agents SDK e Responses API; documenta estado, ferramentas, sandbox, aprovações e observabilidade. [Abrir documentação](https://developers.openai.com/api/docs/guides/agents)
3. **Australian Signals Directorate / Australian Cyber Security Centre — Agentic AI harnesses.** Definição e componentes do Harness, superfície de risco, menor privilégio, supervisão humana e monitoramento. [Abrir orientação](https://www.cyber.gov.au/advisory/agentic-ai-harnesses)
4. **Microsoft Learn — Agent Harness.** Exemplo de composição de cliente de chat, pipeline, contexto, middleware, aprovação e experiência de aplicação. A tabela de capacidades pertence ao Agent Framework da Microsoft e não é uma definição universal. [Abrir documentação](https://learn.microsoft.com/en-us/agent-framework/concepts/harness)

## Nota de escopo e atualização

O termo está evoluindo e ainda não tem uma definição única aceita por todos. Estas notas adotam uma definição funcional ampla e fazem distinção entre o modelo e os mecanismos ao redor dele. As recomendações são princípios gerais; detalhes como nomes de APIs, opções padrão e capacidades de frameworks podem mudar. Consulte a documentação oficial vinculada antes de implementar uma integração específica.

Fontes consultadas em **2026-10-13**.
