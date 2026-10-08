---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Análise estática

## Ponto de partida

Análise estática examina código ou artefatos sem executar o programa, aplicando regras, tipos, padrões ou aproximações. Ela pode encontrar defeitos e riscos, mas seus resultados dependem das regras e podem incluir falsos positivos ou não detectar falhas de execução.

**Quando investigar:** antes de executar uma mudança ou quando se quer evidência automatizada sobre propriedades do código.

## Investigue

- Que propriedade cada analisador verifica e quais suposições faz?
- Como separar um alerta acionável de um falso positivo no projeto?
- Que riscos de execução permanecem fora do alcance da análise?

## Experimente

Execute um linter disponível em um arquivo de estudo e classifique um alerta com a regra correspondente.

## Conexões

- [AST](ast.md) — estrutura que alguns analisadores inspecionam.
- [Agent Evals](../05-qualidade-e-seguranca/agent-evals.md) — avaliar tarefas e resultados do agente.

## Onde começar

Fonte a localizar: consulte a documentação oficial de um analisador estático já instalado no ambiente.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
