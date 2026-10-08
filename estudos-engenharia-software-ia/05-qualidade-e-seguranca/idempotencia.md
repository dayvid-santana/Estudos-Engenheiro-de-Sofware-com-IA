---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Idempotência

## Ponto de partida

Uma operação é idempotente quando repeti-la com a mesma intenção mantém o efeito final equivalente a executá-la uma vez. Isso é importante em sistemas que repetem chamadas após falhas, mas depende da operação e de como a identidade da solicitação é definida.

**Quando investigar:** quando timeout ou retry pode repetir uma ferramenta com efeito externo.

## Investigue

- Como descobrir se repetir uma ferramenta após timeout duplicou um efeito?
- Qual chave identifica solicitações equivalentes e por quanto tempo é lembrada?
- Que leitura do estado final confirma idempotência na prática?

## Experimente

Modele uma operação fictícia de criação de recurso e compare o efeito de duas chamadas com e sem chave de idempotência.

## Conexões

- [Recuperação de falhas](recuperacao-de-falhas.md) — retries e retomada.
- [Durable Execution](../06-execucao-e-operacoes/durable-execution.md) — execução retomável.

## Onde começar

Fonte a localizar: consulte documentação oficial da API ou banco utilizado sobre idempotency keys e garantias declaradas.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
