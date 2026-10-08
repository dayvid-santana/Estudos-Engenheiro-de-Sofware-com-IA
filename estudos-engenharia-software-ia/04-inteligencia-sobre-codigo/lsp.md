---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Language Server Protocol (LSP)

## Ponto de partida

LSP define uma comunicação entre ferramentas cliente, como editores, e servidores que oferecem serviços de linguagem, como diagnósticos e navegação. O protocolo padroniza mensagens, mas a qualidade e o conjunto de recursos dependem do servidor e da linguagem.

**Quando investigar:** quando agentes ou editores precisam consultar a inteligência de linguagem já disponível no ambiente.

## Investigue

- Que dados de arquivo e posição o cliente envia para pedir uma referência?
- Como o servidor comunica diagnóstico incompleto ou conteúdo desatualizado?
- Quais ações do Harness poderiam usar LSP em vez de busca textual?

## Experimente

Use um editor com servidor de linguagem e registre uma solicitação de navegação e o resultado observado.

## Conexões

- [AST](ast.md) — representação sintática possível por trás de serviços.
- [Análise de impacto](analise-de-impacto.md) — navegação para alterações dependentes.

## Onde começar

Fonte a localizar: consulte a especificação oficial do Language Server Protocol e escolha uma funcionalidade para acompanhar.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
