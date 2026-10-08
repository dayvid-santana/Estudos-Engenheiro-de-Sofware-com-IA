---
tipo: conceito
status: nao-iniciado
prioridade: avancado
---

# Fine-Tuning

## Ponto de partida

Fine-Tuning continua o treinamento de um modelo pré-treinado com dados selecionados para adaptar seu comportamento a uma tarefa ou domínio. Não substitui automaticamente contexto atualizado nem controles de segurança; dados e avaliação determinam o que a adaptação melhora.

**Quando investigar:** quando exemplos demonstrativos e instruções não produzem comportamento consistente em uma tarefa delimitada.

## Investigue

- Que falha recorrente seria tratada por treinamento, e não por recuperação ou lógica?
- Como separar dados de treino e avaliação para evitar medir memorização?
- Que riscos de privacidade, viés ou regressão surgem nos dados escolhidos?

## Experimente

Compare um guia de fine-tuning do provedor com uma alternativa de prompt e liste requisitos sem iniciar treinamento.

## Conexões

- [LoRA](lora.md) — adaptação parametrizada eficiente.
- [Agent Evals](../05-qualidade-e-seguranca/agent-evals.md) — avaliar mudança de comportamento.

## Onde começar

Fonte a localizar: consulte a documentação oficial do modelo e um artigo técnico primário sobre fine-tuning na tarefa pretendida.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
