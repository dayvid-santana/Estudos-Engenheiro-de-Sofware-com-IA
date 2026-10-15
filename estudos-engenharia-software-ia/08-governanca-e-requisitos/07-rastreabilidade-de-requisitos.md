---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Rastreabilidade de requisitos

## Em uma frase

Rastreabilidade de requisitos é a ligação navegável entre uma necessidade, seus requisitos, decisões, implementação, verificações e evidências.

## Problema que resolve

Quando alguém pergunta “por que existe este código?” ou “o que mais pode ser afetado por esta alteração?”, respostas podem depender de memória, chats ou PRs dispersos. Links bem escolhidos ajudam a avaliar impacto, detectar requisitos sem verificação e identificar testes sem finalidade clara.

## Como funciona

Use identificadores estáveis para compromissos importantes e uma matriz simples, issue tracker ou links versionados. Um percurso comum é: objetivo → métrica de resultado → requisito → regra/invariante ou restrição arquitetural → critério de aceitação → implementação → verificação → evidência. Nem todo item exige um elo um-para-um; relações podem ser muitos-para-muitos. Preserve ligações nos dois sentidos quando úteis: requisito para teste e teste para requisito/origem.

Em cada alteração, percorra links afetados, marque relações desatualizadas e atualize a evidência junto da implementação. “Tem teste” não é rastreabilidade se ninguém sabe qual compromisso o teste protege. Em contrapartida, rastrear cada linha de código pode custar mais que o benefício: escolha granularidade baseada em risco, regulação, criticidade e frequência de mudança.

## Exemplo

Hipotético: `BR-04` — gestor só vê equipes autorizadas → critério `AC-04.2` — acesso a equipe alheia é negado → teste automatizado → execução identificada pelo commit e resultado armazenado no CI.

## Limites e confusões comuns

Uma matriz pode estar completa e desatualizada. Links demonstram relação declarada, não que a implementação satisfaz o compromisso. Reavalie evidência e impacto, não só a presença de referências.

## Conexões

- [[01-governanca-no-desenvolvimento-com-agentes|Governança]] — define os donos dos compromissos.
- [[03-desenvolvimento-orientado-por-especificacoes|Especificações]] — detalham comportamento.
- [[08-controle-de-mudancas|Controle de mudanças]] — usa os vínculos para análise de impacto.
- [[proveniencia-e-rastreabilidade|Proveniência e rastreabilidade]] — registra origem de informação.

## Para investigar

- Que requisito aprovado não tem verificação ou evidência identificada?
- Se este critério mudar, quais objetivos, código e testes precisam de revisão?

## Minhas anotações

- **Minha síntese:**
- **Trilha de evidência observada:**
- **Dúvida:**

## Fontes

- [NASA Systems Engineering Handbook](https://science.nasa.gov/wp-content/uploads/2023/04/nasa_systems_engineering_handbook_0.pdf) (rastreabilidade bidirecional, verificação e gestão de mudanças).
- [NASA Handbook — Appendix D: Requirements Verification Matrix](https://www.nasa.gov/reference/system-engineering-handbook-appendix/) (matriz de verificação e responsabilidade). Consulta: 2026-10-15.
