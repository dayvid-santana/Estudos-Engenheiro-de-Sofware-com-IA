---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Constituição do projeto

## Em uma frase

Uma constituição do projeto é uma proposta de documento curto que registra objetivos, princípios, limites e autoridades que guiam decisões ao longo do desenvolvimento.

## Problema que resolve

Instruções de tarefa explicam o trabalho imediato, mas raramente carregam o contexto inteiro do produto. Sem referência aprovada, pessoas ou agentes podem divergir sobre o que não deve mudar e quem decide exceções.

## Como funciona

Este nome descreve uma sugestão de organização, não um padrão técnico universal. Uma versão útil pode apontar: objetivo de produto; regras de negócio críticas; restrições arquiteturais; limites de segurança e dados; autoridade de aprovação; processo para propor mudanças; e links para especificações e verificações detalhadas. Mantenha cada compromisso específico o bastante para localizar seu dono e sua evidência.

O `AGENTS.md` e outras instruções do harness orientam o agente sobre como trabalhar: comandos, convenções, ferramentas e limites operacionais. Eles são texto de orientação; não impõem conformidade por si sós. Permissões do sistema, validações determinísticas, revisão e CI (integração contínua) são mecanismos distintos que podem aplicar controles. Uma instrução dizendo “não acesse dados de outra equipe” não substitui autorização efetivamente negada no serviço.

Versione a constituição aprovada. Uma proposta pode ser discutida, mas só substitui a referência vigente após aprovação pela autoridade definida e atualização dos vínculos relacionados.

## Exemplo

Hipotético: a constituição registra “consultas só por meio do proxy autorizado”; `AGENTS.md` orienta como localizar esse proxy no repositório; a identidade de execução impede acesso direto à origem.

## Limites e confusões comuns

Não copie todo requisito para um manifesto longo. O documento não é contrato jurídico automático nem controle técnico. Princípios vagos, sem dono ou forma de aplicação, dão aparência de governança sem fornecer um teste útil.

## Conexões

- [[01-governanca-no-desenvolvimento-com-agentes|Governança]] — estabelece responsabilidades.
- [[03-desenvolvimento-orientado-por-especificacoes|Especificações]] — detalham comportamento esperado.
- [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]] — governa verificações.

## Para investigar

- Qual compromisso merece estar na constituição, em vez de apenas numa tarefa?
- Que mecanismo aplicaria cada limite importante se o agente ignorasse a instrução?

## Minhas anotações

- **Minha síntese:**
- **Princípio ou limite observado:**
- **Dúvida:**

## Fontes

- [NIST AI RMF 1.0 — Core](https://airc.nist.gov/airmf-resources/airmf/5-sec-core/) (políticas, funções e responsabilidade; referência voluntária, não constituição de projeto).
- [GitHub Docs — branches protegidas](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches) (exemplo de controles técnicos configuráveis para revisão e checagens).
