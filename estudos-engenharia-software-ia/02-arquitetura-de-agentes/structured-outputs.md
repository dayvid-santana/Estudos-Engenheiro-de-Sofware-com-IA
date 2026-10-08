---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Structured Outputs

## Ponto de partida

Structured Outputs restringe ou orienta a resposta de um modelo a uma estrutura definida, como campos tipados ou um esquema. A conformidade estrutural não demonstra que os valores sejam verdadeiros nem que a ação pedida seja segura.

**Quando investigar:** quando sistemas posteriores precisam interpretar respostas sem depender de prosa livre.

## Investigue

- Como o consumidor trata campos ausentes, valores inválidos e versões do esquema?
- Que validações semânticas ainda são necessárias após validar a estrutura?
- A garantia vem da API, do prompt, de uma validação local ou de mais de uma camada?

## Experimente

Defina um esquema pequeno para classificar uma solicitação e liste duas entradas que deveriam ser rejeitadas.

## Conexões

- [Tool Calling](tool-calling.md) — respostas estruturadas podem selecionar ações.
- [Contratos formais](../05-qualidade-e-seguranca/contratos-formais.md) — pré e pós-condições.

## Onde começar

Fonte a localizar: consulte a documentação oficial da API de modelo para o formato estruturado utilizado.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
