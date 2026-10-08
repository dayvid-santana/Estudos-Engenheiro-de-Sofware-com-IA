---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Dependency Graph

## Ponto de partida

Dependency Graph representa dependências entre componentes, pacotes, módulos ou serviços. O nível representado varia: dependência declarada não implica que todo caminho de execução use aquele componente, e dependência transitiva pode ser relevante sem aparecer diretamente no código-fonte.

**Quando investigar:** ao entender arquitetura, impacto de atualização ou superfície de componentes envolvidos.

## Investigue

- Que tipos de dependência o grafo inclui e qual fonte de dados o constrói?
- Como separar dependência direta, transitiva e chamada efetivamente executada?
- Que evidência confirma que uma alteração afeta um componente dependente?

## Experimente

Gere ou desenhe um grafo pequeno de dependências para um projeto Python de estudo.

## Conexões

- [Call Graph](call-graph.md) — relações de chamadas entre funções.
- [Análise de impacto](analise-de-impacto.md) — avaliação de alterações.

## Onde começar

Fonte a localizar: consulte a documentação do gerenciador de pacotes ou ferramenta de visualização usada no projeto.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
