---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Policy Engines

## Ponto de partida

Policy Engine avalia decisões contra regras de autorização ou conformidade, frequentemente separando a política do código que solicita uma ação. Linguagens e mecanismos variam; a cobertura depende de quais caminhos passam por essa avaliação.

**Quando investigar:** quando autorizações precisam ser consistentes entre várias ferramentas ou agentes.

## Investigue

- Que atributos da identidade, recurso e ação entram na decisão?
- Como a política trata ausência de informação e conflitos entre regras?
- Como confirmar que toda chamada sensível passa pelo mecanismo?

## Experimente

Escreva em linguagem natural duas regras de acesso para uma ferramenta de estudo e teste mentalmente casos permitidos e negados.

## Conexões

- [Menor privilégio](menor-privilegio.md) — objetivo de segurança.
- [Prompt Injection](prompt-injection.md) — decisões não delegadas ao texto do modelo.

## Onde começar

Fonte a localizar: consulte a documentação oficial do motor de políticas presente no ambiente ou arquitetura estudada.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
