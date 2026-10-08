---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Sandboxing

## Ponto de partida

Sandboxing executa código ou ferramentas em um ambiente com limites para reduzir efeitos sobre o sistema hospedeiro. O isolamento depende da tecnologia e configuração; não se deve inferir contenção segura apenas pelo nome “sandbox”.

**Quando investigar:** quando um agente pode executar código, comandos ou operações não totalmente previsíveis.

## Investigue

- Quais recursos, arquivos, processos e destinos de rede o ambiente consegue acessar?
- Como testar se os limites permanecem após erro ou timeout?
- Que ameaças não são contidas pelo mecanismo usado?

## Experimente

Leia a configuração de um ambiente local de estudo e desenhe os recursos permitidos e negados, sem executar ações destrutivas.

## Conexões

- [Menor privilégio](menor-privilegio.md) — reduzir autoridade disponível.
- [Tool Calling](../02-arquitetura-de-agentes/tool-calling.md) — operações que podem exigir isolamento.

## Onde começar

Fonte a localizar: consulte a documentação oficial da tecnologia de isolamento usada e suas considerações de segurança.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**
