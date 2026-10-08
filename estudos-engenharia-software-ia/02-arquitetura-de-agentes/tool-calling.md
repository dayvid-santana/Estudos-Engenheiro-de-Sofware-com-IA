---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Tool Calling

## Ponto de partida

Tool Calling permite ao modelo solicitar uma operação descrita por nome e argumentos; o programa valida, executa e devolve o resultado. A solicitação do modelo não significa que a ferramenta foi executada nem autoriza por si só efeitos externos.

**Quando investigar:** quando um agente precisa consultar dados ou acionar operações por meio do Harness.

## Investigue

- Que validação ocorre entre argumentos gerados e execução efetiva?
- Como identificar diferença entre ferramenta solicitada, chamada e efeito confirmado?
- Que limites impedem que uma ferramenta válida seja usada fora do escopo autorizado?

## Experimente

Rastreie uma chamada não destrutiva e registre entrada, validação, resultado e evidência do efeito.

## Conexões

- [Structured Outputs](structured-outputs.md) — formato de argumentos.
- [Menor privilégio](../05-qualidade-e-seguranca/menor-privilegio.md) — autoridade da operação.

## Onde começar

Fonte a localizar: consulte a documentação oficial do provedor sobre chamadas de ferramentas e execução pelo cliente.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
