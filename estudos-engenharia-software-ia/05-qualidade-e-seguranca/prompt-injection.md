---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Defesa contra Prompt Injection

## Ponto de partida

Prompt Injection ocorre quando conteúdo fornecido como dado tenta influenciar o modelo a ignorar objetivos ou limites, por exemplo em documentos recuperados ou resultados de ferramentas. Separar instruções e dados ajuda, mas não substitui controles de autorização fora do modelo.

**Quando investigar:** quando o agente lê conteúdo não confiável e pode usá-lo para decidir ações.

## Investigue

- Como um texto malicioso poderia atravessar recuperação e influenciar chamada de ferramenta?
- Que controles verificam autorização independentemente da resposta do modelo?
- Como registrar uma tentativa sem expor segredos ou executar a instrução?

## Experimente

Analise um exemplo fictício de documento que tenta mudar instruções e trace quais barreiras deveriam impedir efeitos.

## Conexões

- [System Prompt](../01-fundamentos/system-prompt.md) — instruções e fronteiras.
- [Policy Engines](policy-engines.md) — regras externas à geração.

## Onde começar

Fonte a localizar: consulte orientações oficiais de segurança para sistemas LLM e materiais primários sobre prompt injection.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
