---
tipo: conceito
status: nao-iniciado
prioridade: avancado
---

# LoRA

## Ponto de partida

LoRA (Low-Rank Adaptation) adapta modelos por meio de matrizes treináveis de baixa dimensão inseridas em partes do modelo, mantendo grande parte dos pesos originais congelada. O suporte e os efeitos dependem da arquitetura, configuração e tarefa.

**Quando investigar:** ao comparar formas de adaptação que reduzem parâmetros treináveis e recursos de treinamento.

## Investigue

- Que camadas recebem adaptadores e que configuração define sua capacidade?
- Como comparar qualidade, tamanho do adaptador e custo com outras abordagens?
- Que limitações aparecem ao combinar ou trocar adaptadores treinados?

## Experimente

Leia um artigo ou guia técnico de LoRA e registre quais parâmetros mudam e quais ficam congelados.

## Conexões

- [Fine-Tuning](fine-tuning.md) — categoria mais ampla de adaptação.
- [Model Distillation](model-distillation.md) — transferência com objetivo distinto.

## Onde começar

Fonte a localizar: procure o artigo original “LoRA: Low-Rank Adaptation of Large Language Models” e documentação de implementação.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
