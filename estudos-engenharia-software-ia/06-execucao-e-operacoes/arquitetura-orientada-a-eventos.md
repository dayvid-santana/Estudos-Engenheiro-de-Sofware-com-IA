---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Arquitetura orientada a eventos

## Ponto de partida

Arquitetura orientada a eventos comunica mudanças ou fatos por eventos consumidos por componentes interessados. Produtores e consumidores podem evoluir separadamente, mas ordem, duplicação, atraso e falha de entrega precisam ser tratados.

**Quando investigar:** quando agentes, ferramentas ou serviços reagem a etapas concluídas sem chamada direta síncrona.

## Investigue

- Quem publica cada evento e qual fato ele afirma que ocorreu?
- Como os consumidores lidam com mensagens duplicadas ou fora de ordem?
- Que mecanismo mostra que um evento foi recebido e processado?

## Experimente

Desenhe a emissão e o consumo de um evento de tarefa concluída, incluindo uma falha de consumidor.

## Conexões

- [Event Sourcing](event-sourcing.md) — eventos como fonte do estado.
- [Backpressure](backpressure.md) — controle da taxa de consumo.

## Onde começar

Fonte a localizar: consulte documentação do broker ou mecanismo de eventos usado no ambiente de estudo.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
