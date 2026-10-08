---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Recuperação de falhas

## Ponto de partida

Recuperação de falhas define como o sistema detecta, registra e supera interrupções ou resultados incompletos. Estratégias possíveis incluem retry, retomada, compensação e intervenção; a escolha depende de efeitos já realizados e do estado persistido.

**Quando investigar:** quando uma execução do agente pode parar após alguns efeitos terem ocorrido.

## Investigue

- Como distinguir falha transitória de erro que repetir apenas agrava?
- Que estado permite retomar sem perder nem duplicar efeitos?
- Qual é o caminho de recuperação quando uma etapa não pode ser repetida?

## Experimente

Monte uma tabela com três pontos possíveis de falha em uma tarefa e a evidência necessária para retomá-la.

## Conexões

- [Idempotência](idempotencia.md) — repetição segura.
- [Checkpointing](checkpointing.md) — estado recuperável.

## Onde começar

Fonte a localizar: procure documentação do runtime do Harness sobre retry, timeout, cancelamento e retomada.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
