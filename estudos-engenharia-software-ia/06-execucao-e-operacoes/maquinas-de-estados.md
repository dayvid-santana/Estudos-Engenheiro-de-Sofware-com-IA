---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Máquinas de estados

## Ponto de partida

Máquina de estados representa um sistema por estados possíveis e transições acionadas por eventos ou condições. Em um Harness, essa representação pode tornar explícitos início, espera, aprovação, falha e conclusão, sem presumir que todo fluxo seja implementado como uma máquina formal.

**Quando investigar:** quando tarefas podem pausar, falhar ou seguir caminhos diferentes.

## Investigue

- Que transições são permitidas e quais deveriam ser impossíveis?
- Como o sistema se comporta diante de um evento repetido ou fora de ordem?
- Que estado observado prova conclusão, em vez de apenas tentativa de execução?

## Experimente

Modele como estados e transições uma tarefa curta que aguarda aprovação antes de alterar um arquivo.

## Conexões

- [Orquestração de agentes](../01-fundamentos/orquestracao-de-agentes.md) — coordenação do fluxo.
- [Checkpointing](../05-qualidade-e-seguranca/checkpointing.md) — persistir estado.

## Onde começar

Fonte a localizar: procure documentação de máquina de estados ou workflow no runtime usado pelo Harness.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
