---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Controle de mudanças

## Em uma frase

Controle de mudanças mantém compromissos importantes versionados e exige avaliação e aprovação explícitas para substituir a referência vigente.

## Problema que resolve

Objetivos, regras e restrições precisam evoluir, mas uma alteração implícita pode parecer apenas técnica e retirar uma proteção aprovada. Sem histórico, equipe e agente podem não saber quando, por quem ou por qual motivo uma regra foi mudada.

## Como funciona

Trate a versão aprovada como baseline (referência controlada), não como verdade imutável. Um processo proporcional ao risco pode registrar: mudança proposta, motivo e evidência, compromissos afetados, opções e impactos, pessoa autorizadora, versão nova e verificações atualizadas. Mudanças de implementação que preservam o baseline seguem o fluxo normal de desenvolvimento. Mudanças no objetivo, regra, limiar de aceitação ou restrição aprovada precisam de decisão da autoridade definida.

Um ADR (Architecture Decision Record, registro de decisão arquitetural) captura contexto, uma decisão arquitetural significativa e suas consequências. É útil para decisões sobre estrutura, interfaces ou atributos de qualidade. Não substitui a gestão de todos os requisitos, não é a lista completa de mudanças nem prova que a decisão foi implementada. Se uma decisão relevante for substituída, preserve o registro anterior e conecte a nova decisão.

## Exemplo

Hipotético: trocar uma biblioteca preservando a autorização é mudança de implementação; permitir que gestores consultem novas equipes altera regra de acesso e pede análise, aprovação de domínio e atualização dos critérios.

## Limites e confusões comuns

Aprovação burocrática de toda edição desacelera sem proteger o que importa. A ausência de um pedido formal tampouco torna uma mudança de compromisso aceitável. Ajuste o nível de controle à consequência e ao risco.

## Conexões

- [[02-constituicao-do-projeto|Constituição]] — identifica autoridade e princípios.
- [[07-rastreabilidade-de-requisitos|Rastreabilidade]] — mostra alcance da mudança.
- [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]] — aplica revisão às avaliações.

## Para investigar

- Qual autoridade aceita mudança neste requisito e qual evidência ela precisa?
- Esta mudança altera uma decisão de arquitetura ou um requisito de comportamento?

## Minhas anotações

- **Minha síntese:**
- **Mudança aprovada ou proposta observada:**
- **Dúvida:**

## Fontes

- [NASA Systems Engineering Handbook](https://science.nasa.gov/wp-content/uploads/2023/04/nasa_systems_engineering_handbook_0.pdf) (impacto, baseline e aprovação de mudanças de requisitos).
- [Michael Nygard — Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions) e [Martin Fowler — Architecture Decision Record](https://martinfowler.com/bliki/ArchitectureDecisionRecord.html). Consulta: 2026-10-15.
