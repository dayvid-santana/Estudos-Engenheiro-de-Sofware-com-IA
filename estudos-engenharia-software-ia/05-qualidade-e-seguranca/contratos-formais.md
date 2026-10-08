---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Contratos formais

## Ponto de partida

Contratos formais descrevem condições de uma operação: pré-condições que devem valer antes, pós-condições esperadas depois e invariantes que devem permanecer verdadeiros. O contrato torna expectativas explícitas, mas sua força depende de como condições são verificadas.

**Quando investigar:** ao definir limites verificáveis para uma ferramenta ou transformação de código.

## Investigue

- Que pré-condição impede uma entrada inválida de alcançar a operação?
- Que pós-condição comprova o efeito prometido?
- Qual invariante deve sobreviver a retries, exceções ou estados intermediários?

## Experimente

Escolha uma função pequena e escreva uma pré-condição, uma pós-condição e um invariante plausível.

## Conexões

- [Structured Outputs](../02-arquitetura-de-agentes/structured-outputs.md) — esquema de dados não é contrato completo.
- [Verificação formal](../07-topicos-avancados/verificacao-formal.md) — análise de propriedades.

## Onde começar

Fonte a localizar: procure material técnico primário sobre design by contract e documentação da linguagem usada.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
