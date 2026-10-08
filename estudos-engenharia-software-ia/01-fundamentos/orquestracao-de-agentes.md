---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Orquestração de agentes

## Ponto de partida

Orquestração define como agentes, modelos, ferramentas e etapas colaboram para concluir uma tarefa. Pode incluir roteamento, sequência, paralelismo, passagem de estado e tratamento de falhas.

**Quando investigar:** quando uma tarefa atravessa mais de um agente ou etapa controlada.

## Investigue

- Quem decide a próxima etapa: regra explícita, agente ou combinação dos dois?
- Como o estado e as responsabilidades são transferidos entre agentes?
- Que falha em uma etapa impede, repete ou redireciona o fluxo?

## Experimente

Represente uma execução conhecida como sequência de etapas com entradas, saídas e transições.

## Conexões

- [Máquinas de estados](../06-execucao-e-operacoes/maquinas-de-estados.md) — representação de transições.
- [Coordenação multiagente](../07-topicos-avancados/coordenacao-multiagente.md) — problemas ampliados de coordenação.

## Onde começar

Fonte a localizar: encontre no Harness o grafo, dispatcher ou controlador de fluxo e confronte-o com uma execução observada.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
