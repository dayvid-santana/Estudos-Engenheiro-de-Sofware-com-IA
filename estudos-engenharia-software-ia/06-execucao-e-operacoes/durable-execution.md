---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Durable Execution

## Ponto de partida

Durable Execution busca preservar o progresso de uma execução para que ela continue após reinício, espera ou falha. As garantias variam entre sistemas; durabilidade de estado não torna automaticamente idempotentes os efeitos externos de uma atividade.

**Quando investigar:** em tarefas longas de agente que podem aguardar aprovação ou depender de serviços externos.

## Investigue

- Que partes da execução são persistidas e quais são repetidas na retomada?
- Como o runtime trata uma operação cujo resultado ficou incerto após timeout?
- Que limites de durabilidade são documentados para estados e efeitos externos?

## Experimente

Desenhe um fluxo interrompido entre duas etapas e identifique o que precisa ser refeito ou consultado ao retomar.

## Conexões

- [Checkpointing](../05-qualidade-e-seguranca/checkpointing.md) — registro de progresso.
- [Idempotência](../05-qualidade-e-seguranca/idempotencia.md) — repetição de efeitos.

## Onde começar

Fonte a localizar: leia a documentação oficial do runtime de Durable Execution em estudo, especialmente limites e semântica de retries.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
