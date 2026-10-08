---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Call Graph

## Ponto de partida

Call Graph representa relações possíveis de chamada entre funções ou métodos. Dependendo de despacho dinâmico, reflexão e análise disponível, pode ser aproximado ou incompleto; uma aresta possível não comprova que a chamada ocorre em toda execução.

**Quando investigar:** ao seguir caminhos de execução ou estimar o alcance de uma alteração.

## Investigue

- Como a ferramenta identifica chamadas dinâmicas ou indiretas?
- Que diferença há entre uma aresta possível e uma chamada observada em runtime?
- Como mudanças em uma função se propagam pelos chamadores?

## Experimente

Desenhe manualmente as chamadas de três funções Python e marque uma referência que não é chamada.

## Conexões

- [Dependency Graph](dependency-graph.md) — dependências em outro nível.
- [Análise de impacto](analise-de-impacto.md) — uso para delimitar testes e revisão.

## Onde começar

Fonte a localizar: procure documentação do analisador de chamadas da linguagem ou ferramenta do projeto.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
