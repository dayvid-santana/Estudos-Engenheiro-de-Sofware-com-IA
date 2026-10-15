---
tipo: exemplo
status: nao-iniciado
prioridade: essencial
---

# Exemplo integrado — consulta de indicadores por chat

> **Cenário inteiramente hipotético para estudo.** Nenhum requisito abaixo descreve um projeto real do vault.

## Compromissos propostos

- **Objetivo:** ajudar gestores a identificar tendências nos indicadores de suas equipes.
- **Autorização:** incluir apenas equipes que o usuário atual pode consultar.
- **Fidelidade:** preservar valor, período e filtro; declarar arredondamento e hora da consulta. Para o exercício, a tolerância aprovada é ≤0,5%.
- **Arquitetura:** acessar Grafana apenas pelo proxy, sem credenciais ou rota direta.
- **Métrica:** medir no piloto o tempo para encontrar um indicador válido; isso informa, mas não substitui, o objetivo.

Uma trilha de requisitos pode ficar assim:

| Identificador | Compromisso | Como verificar | Evidência esperada |
|---|---|---|---|
| OBJ-01 | Encontrar tendências | Observar tarefas do piloto | Tempo, conclusão, comentários |
| BR-01 | Restringir equipes por usuário | Testar acesso dentro/fora do escopo | Teste e decisão de autorização |
| FID-01 | Preservar valor, período, filtro | Comparar com referência | Diferença ≤0,5%, ID da execução |
| ARC-01 | Usar apenas o proxy | Checar configuração e rota | CI, evento no proxy |

## Mudança que preserva os compromissos

O agente melhora chamada ao proxy e mensagens de erro, preservando identidade, escopo, números e rastreamento. Revisão, testes de autorização/fidelidade e inspeção do proxy passam. Isso cobre os casos verificados; o resultado ainda requer piloto.

## Proposta que enfraquece um critério

Para passar após discrepância, o agente propõe ampliar a tolerância de `FID-01` de 0,5% para 2%. Continua reprovado pela versão vigente. A autoridade responsável pelo indicador e pelo produto decide a proposta separada. Se aprovada, versione-a, analise impacto, compare os dois critérios e preserve a execução anterior.

Agentes de implementação e avaliação podem compartilhar credenciais. Use identidades e escopos distintos; nomes ou papéis separados não bastam.

## Conexões e revisão

Revisite [[04-invariantes-de-negocio|Invariantes]], [[07-rastreabilidade-de-requisitos|Rastreabilidade]], [[08-controle-de-mudancas|Controle de mudanças]] e [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]].

### Para investigar

- Quem aprova a semântica e a tolerância?
- Que sinal do uso real pode contradizer os testes aprovados?

### Minhas anotações

- **Regra real que quero analisar:**
- **Autoridade responsável:**
- **Como verificar e guardar evidência:**

## Fontes

- [NASA Systems Engineering Handbook](https://science.nasa.gov/wp-content/uploads/2023/04/nasa_systems_engineering_handbook_0.pdf) (requisitos, evidência e revisão de mudanças).
- [GitHub Docs — protected branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches) (exemplo de revisão e checks configuráveis). Consulta: 2026-10-15.
