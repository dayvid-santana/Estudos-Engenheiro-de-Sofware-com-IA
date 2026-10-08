---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Abstract Syntax Tree (AST)

## Ponto de partida

Uma AST representa a estrutura sintática de um programa como nós relacionados, após análise do texto conforme uma gramática. Ela permite examinar construções do código, embora comentários, formatação e algumas distinções da fonte possam não estar presentes na árvore.

**Quando investigar:** quando uma busca textual não distingue usos sintáticos diferentes de um mesmo identificador.

## Investigue

- O que uma árvore sintática permite distinguir que uma busca por texto pode confundir?
- Que informação de posição ou comentário é preservada pela ferramenta escolhida?
- Como a gramática e a versão da linguagem afetam a árvore construída?

## Experimente

Escolha uma função curta em Python, examine sua AST com o módulo `ast` e registre três informações encontradas.

## Conexões

- [Análise estática](analise-estatica.md) — inspeção sem execução.
- [LSP](lsp.md) — serviços que analisam código para editores.

## Onde começar

Fonte a localizar: pesquise “Python ast documentação oficial” e consulte a referência do módulo `ast`.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
