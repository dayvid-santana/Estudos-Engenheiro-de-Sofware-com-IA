---
tipo: conceito
status: nao-iniciado
prioridade: aprofundamento
---

# Fitness functions

## Em uma frase

Uma fitness function arquitetural é uma verificação repetível que indica se uma implementação continua atendendo a uma característica arquitetural desejada.

## Problema que resolve

Uma arquitetura registra decisões e qualidades pretendidas, mas uma mudança pode corroê-las sem quebrar testes funcionais. Por exemplo, módulos podem passar a depender uns dos outros de um modo proibido ou a latência ultrapassar um limite operacional.

## Como funciona

Escolha uma característica importante, descreva como observá-la, defina limiar e contexto, automatize quando possível e execute a checagem durante mudanças ou em produção. Exemplos: regra estática de dependências, análise de permissões, teste de contrato, verificação de latência por cenário ou alerta de disponibilidade. O resultado pode ser binário ou uma medida; registre o que mede, fonte dos dados, tolerância e quem decide exceções.

A expressão foi difundida em arquitetura evolutiva para avaliar continuamente a distância entre implementação e objetivos de design. Aqui o uso é restrito a essa acepção de engenharia, não às funções de aptidão de algoritmos evolutivos. Uma fitness function pode proteger uma restrição arquitetural ou qualidade mensurável; critérios de aceitação de uma funcionalidade são relacionados, mas têm escopo diferente.

## Exemplo

Hipotético: a equipe define que o serviço do assistente só pode consultar Grafana por meio do proxy. Uma checagem de configuração/rede procura acessos e credenciais diretos e bloqueia a mudança se os encontrar.

## Limites e confusões comuns

Passar uma função não prova toda a arquitetura correta. Métrica proxy pode esconder danos, limiar pode ficar obsoleto e testes podem ser contornados. Combine automação com revisão e revisão periódica dos objetivos.

## Conexões

- [[04-invariantes-de-negocio|Invariantes]] — propriedades obrigatórias do domínio.
- [[06-avaliacoes-e-agentes-avaliadores|Avaliações]] — evidência para comportamento de agentes.
- [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]] — controla alterações nas verificações.
- [[agent-evals|Agent Evals]] — conjunto de casos para avaliar agentes.

## Para investigar

- Que característica crítica ainda depende apenas da memória de alguém?
- O que pode fazer esta checagem passar sem preservar a característica?

## Minhas anotações

- **Minha síntese:**
- **Verificação arquitetural candidata:**
- **Dúvida:**

## Fontes

- [Thoughtworks — Building Evolutionary Architectures, capítulo de amostra](https://www.thoughtworks.com/content/dam/thoughtworks/documents/books/bk_building_evolutionary_architectures_second_edition_free_chapter.pdf) (fitness functions como mecanismo de avaliar mudanças de arquitetura).
- [Martin Fowler — Governing data products using fitness functions](https://martinfowler.com/articles/fitness-functions-data-products.html) (exemplos e governança contínua). Consulta: 2026-10-15.
