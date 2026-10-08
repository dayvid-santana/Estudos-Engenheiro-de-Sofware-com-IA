---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Checkpointing

## Ponto de partida

Checkpointing registra um estado recuperável durante uma execução, permitindo retomada ou inspeção após pausa e falha. O que é salvo, a consistência do registro e a compatibilidade de versões determinam se a retomada é segura.

**Quando investigar:** em tarefas longas, revisáveis ou sujeitas a interrupções.

## Investigue

- Que dados e efeitos externos precisam estar alinhados no checkpoint?
- Como uma retomada evita repetir uma operação já concluída?
- Que mudança de código pode tornar um estado persistido incompatível?

## Experimente

Desenhe checkpoints para um fluxo de três etapas e marque o que precisaria ser persistido em cada um.

## Conexões

- [Durable Execution](../06-execucao-e-operacoes/durable-execution.md) — retomada em execução durável.
- [Idempotência](idempotencia.md) — segurança de repetição.

## Onde começar

Fonte a localizar: consulte documentação técnica do mecanismo de checkpoint do framework estudado.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
