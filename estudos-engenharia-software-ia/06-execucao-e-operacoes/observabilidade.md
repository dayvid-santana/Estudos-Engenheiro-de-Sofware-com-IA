---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Observabilidade

## Ponto de partida

Observabilidade é a capacidade de investigar o comportamento interno de um sistema a partir de sinais produzidos durante a execução, comumente logs, métricas e traces. Em sistemas de IA, também pode incluir versões, contexto, chamadas e resultados, respeitando privacidade.

**Quando investigar:** quando uma execução inesperada precisa ser explicada ou comparada.

## Investigue

- Quais eventos permitem reconstruir o caminho sem registrar dados desnecessários?
- Como distinguir falha do modelo, ferramenta, orquestração ou dependência externa?
- Que métrica indica degradação antes de uma falha visível ao usuário?

## Experimente

Desenhe um registro mínimo para uma execução, incluindo identificador, etapa, duração e resultado.

## Conexões

- [Distributed Tracing](distributed-tracing.md) — visão correlacionada de chamadas.
- [Agent Evals](../05-qualidade-e-seguranca/agent-evals.md) — resultados avaliados.

## Onde começar

Fonte a localizar: consulte documentação oficial de observabilidade do framework ou instrumentação usada no projeto.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
