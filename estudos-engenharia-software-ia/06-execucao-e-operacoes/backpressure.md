---
tipo: conceito
status: nao-iniciado
prioridade: avancado
---

# Backpressure

## Ponto de partida

Backpressure sinaliza ou impõe limites quando produtores geram trabalho mais rápido do que consumidores conseguem processar. Pode propagar espera, rejeitar novas tarefas ou reduzir taxa; a escolha afeta latência e experiência durante picos.

**Quando investigar:** quando filas crescem ou ferramentas e modelos atingem limites de capacidade.

## Investigue

- Como o sistema detecta saturação e comunica o limite ao produtor?
- O que acontece com tarefas prioritárias e com tarefas que excedem o prazo?
- Como distinguir backpressure de uma fila sem limite que apenas adia a falha?

## Experimente

Desenhe três produtores e um consumidor lento e proponha um sinal observável para reduzir entrada.

## Conexões

- [Controle de concorrência](controle-de-concorrencia.md) — limitar execução simultânea.
- [Arquitetura orientada a eventos](arquitetura-orientada-a-eventos.md) — filas e consumo assíncrono.

## Onde começar

Fonte a localizar: procure documentação de backpressure do framework de streaming ou mensageria usado.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
