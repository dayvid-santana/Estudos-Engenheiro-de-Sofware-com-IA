---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Avaliações e agentes avaliadores

## Em uma frase

Uma avaliação (eval) compara o comportamento do sistema com critérios explícitos em casos representativos e reúne evidência para uma decisão, sem garantir correção total.

## Problema que resolve

Uma demonstração bem-sucedida pode ocultar falhas em permissões, ambiguidades, dados ou chamadas a ferramentas. Um agente avaliador pode ampliar a escala de revisão, mas também errar ou preferir respostas convincentes em vez de resultados corretos.

## Como funciona

Use a verificação adequada para cada compromisso:

- **Determinística:** testes, consultas, comparação numérica, checagem estática ou regras de esquema; é reproduzível dentro do ambiente e da implementação do teste.
- **LLM como juiz:** pontua saídas abertas com uma rubrica; compare com exemplos avaliados por pessoas, procure vieses e faça amostragem humana.
- **Revisão humana:** necessária para interpretar contexto, impacto e exceções de alto risco; também pode divergir e precisa de critérios e registro.

Avalie cenários comuns, limites, falhas, recusas e ferramentas. Registre versão do conjunto, rubrica, configuração e resultados. O agente que implementa não deve alterar sozinho o conjunto ou diminuir o limiar para converter falha em aprovação. Mudança de critério é proposta independente para a autoridade do domínio.

## Exemplo

Hipotético: compare valor e intervalo do Grafana com referência; um juiz avalia clareza; uma pessoa verifica se o indicador atende à necessidade dos gestores.

## Limites e confusões comuns

Testes aprovados cobrem apenas casos e propriedades testadas. Evals offline não demonstram impacto no uso real: monitore resultados, incidentes e feedback no contexto de produção. Agentes avaliadores não são árbitros infalíveis.

## Conexões

- [[05-fitness-functions|Fitness functions]] — monitora qualidades ao longo da evolução.
- [[07-rastreabilidade-de-requisitos|Rastreabilidade]] — associa avaliação a compromissos.
- [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]] — governa rubricas e gates.
- [[agent-evals|Agent Evals]] e [[llm-as-a-judge|LLM-as-a-Judge]] — notas relacionadas.

## Para investigar

- Qual parte do critério pode ser verificada sem um modelo avaliador?
- Com que frequência uma amostra avaliada por pessoas discordou do juiz?

## Minhas anotações

- **Minha síntese:**
- **Caso de avaliação observado:**
- **Dúvida:**

## Fontes

- [OpenAI — Graders](https://developers.openai.com/api/docs/guides/graders) (tipos e calibração; em 2026-10-15, a documentação informava que o recurso estava em descontinuação: referência conceitual, não recomendação de ferramenta).
- [Zheng et al. — Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena](https://arxiv.org/abs/2306.05685) (estudo primário sobre concordância e vieses de juízes LLM). Consulta: 2026-10-15.
