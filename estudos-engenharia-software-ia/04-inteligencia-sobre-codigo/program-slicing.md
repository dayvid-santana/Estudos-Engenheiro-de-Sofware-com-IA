---
tipo: conceito
status: nao-iniciado
prioridade: avancado
---

# Program Slicing

## Ponto de partida

Program Slicing procura o subconjunto de instruções que pode afetar, ou ser afetado por, um valor em um ponto do programa. Um slice depende do critério e da análise usada; aproximações conservadoras podem incluir código que não aparece em uma execução específica.

**Quando investigar:** quando é necessário reduzir uma investigação a instruções relevantes para um resultado ou variável.

## Investigue

- Qual variável e ponto de observação definem o slice escolhido?
- Como dependências de controle alteram o conjunto de instruções incluídas?
- Como comparar slice estático com o caminho de uma execução observada?

## Experimente

Em uma função pequena, marque as linhas que podem influenciar o valor retornado e justifique cada inclusão.

## Conexões

- [Call Graph](call-graph.md) — contexto entre funções.
- [Análise de impacto](analise-de-impacto.md) — foco em efeitos de mudança.

## Onde começar

Fonte a localizar: procure material acadêmico introdutório sobre dependências de dados, controle e slicing estático.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
