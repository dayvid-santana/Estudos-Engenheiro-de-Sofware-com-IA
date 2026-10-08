---
tipo: conceito
status: nao-iniciado
prioridade: avancado
---

# Event Sourcing

## Ponto de partida

Event Sourcing mantém uma sequência de eventos como registro principal de mudanças e deriva o estado atual ao reproduzi-los ou projetá-los. Não é apenas registrar logs: a modelagem dos eventos, evolução de esquema e reconstrução fazem parte do desenho.

**Quando investigar:** quando histórico auditável ou reconstrução de decisões é requisito do sistema.

## Investigue

- Que evento representa um fato imutável e que dado é apenas estado derivado?
- Como mudanças de esquema afetam a reprodução de eventos antigos?
- Como distinguir Event Sourcing de logs de execução comuns?

## Experimente

Descreva uma sequência de eventos para uma tarefa de agente e derive manualmente seu estado final.

## Conexões

- [Arquitetura orientada a eventos](arquitetura-orientada-a-eventos.md) — publicação e consumo.
- [Proveniência e rastreabilidade](../03-contexto-e-conhecimento/proveniencia-e-rastreabilidade.md) — histórico de evidências.

## Onde começar

Fonte a localizar: procure referência técnica primária sobre Event Sourcing e documentação da implementação escolhida.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
