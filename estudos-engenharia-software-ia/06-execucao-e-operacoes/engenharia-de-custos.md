---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Engenharia de custos

## Ponto de partida

Engenharia de custos examina recursos consumidos por uma funcionalidade de IA, incluindo inferência, ferramentas, armazenamento, latência e revisão humana. Estimativas precisam refletir carga e comportamento observados; preço de uma chamada isolada não representa custo total.

**Quando investigar:** ao comparar alternativas de arquitetura ou planejar limites para uso do Harness.

## Investigue

- Quais etapas e retries dominam o custo por tarefa concluída?
- Como custo varia com tamanho de contexto, número de ferramentas e falhas?
- Que limite reduz gasto sem degradar uma métrica essencial de qualidade?

## Experimente

Faça uma planilha manual de componentes de custo para uma execução hipotética, indicando quais valores ainda precisam ser medidos.

## Conexões

- [Model Routing](../02-arquitetura-de-agentes/model-routing.md) — escolha de modelos.
- [Estratégias de cache](estrategias-de-cache.md) — evitar trabalho repetido.

## Onde começar

Fonte a localizar: consulte a documentação oficial de preços do provedor usado e confronte com telemetria real, quando disponível.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
