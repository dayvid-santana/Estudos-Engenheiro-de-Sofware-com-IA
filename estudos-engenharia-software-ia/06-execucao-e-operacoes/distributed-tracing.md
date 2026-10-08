---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Distributed Tracing

## Ponto de partida

Distributed Tracing correlaciona operações relacionadas que atravessam processos ou serviços, normalmente por spans ligados a um trace. A instrumentação pode estar incompleta; ausência de span não prova ausência de trabalho e IDs não revelam causalidade automaticamente.

**Quando investigar:** quando uma solicitação do Harness percorre vários serviços ou ferramentas.

## Investigue

- Como o contexto de trace atravessa chamadas síncronas e mensagens assíncronas?
- Que span revela latência, erro ou espera por aprovação?
- Que dado sensível poderia vazar nos atributos registrados?

## Experimente

Leia um trace de demonstração e anote a ordem, duração e falha de uma operação.

## Conexões

- [Observabilidade](observabilidade.md) — traces como um dos sinais.
- [Arquitetura orientada a eventos](arquitetura-orientada-a-eventos.md) — propagação assíncrona.

## Onde começar

Fonte a localizar: consulte a especificação OpenTelemetry de traces e a documentação do SDK usado.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
