---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Análise de impacto

## Ponto de partida

Análise de impacto estima que componentes, comportamentos ou testes podem ser afetados por uma mudança. Ela combina relações disponíveis no código, dependências e conhecimento do domínio; a lista resultante é uma hipótese para revisão, não garantia de cobertura.

**Quando investigar:** ao planejar testes e revisão para uma alteração sugerida por agente.

## Investigue

- Que dependências entram no cálculo e quais relações ficam invisíveis?
- Como validar a lista de impacto contra histórico ou testes existentes?
- Que critério justifica ampliar ou reduzir o conjunto de arquivos revisados?

## Experimente

Escolha uma função de estudo, liste seus chamadores e proponha dois testes que poderiam detectar regressões.

## Conexões

- [Call Graph](call-graph.md) — relações de chamada.
- [Dependency Graph](dependency-graph.md) — relações entre componentes.

## Onde começar

Fonte a localizar: procure documentação de ferramentas de análise de impacto de testes ou dependências do projeto.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
