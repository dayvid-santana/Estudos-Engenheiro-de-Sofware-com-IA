---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Invariantes de negócio

## Em uma frase

Um invariante de negócio é uma condição do domínio que deve permanecer verdadeira sempre que o sistema considera válido um estado ou uma operação.

## Problema que resolve

Regras importantes podem ser repetidas em telas, agentes, APIs e rotinas de dados. Se só um caminho as aplica, outra interface ou uma alteração automatizada pode produzir estado inválido. Nomear a condição facilita decidir onde aplicá-la e como demonstrar sua preservação.

## Como funciona

Uma regra de negócio expressa uma política ou decisão do domínio; nem toda regra é um invariante. “Desconto sazonal em dezembro” tem condição temporal. “O total de uma fatura corresponde aos itens e ajustes registrados” pode ser invariável ao longo das atualizações válidas. Em DDD, invariantes frequentemente delimitam consistência dentro de uma operação ou agregado, mas a fronteira correta depende do domínio e da transação.

Escreva a condição sem acoplá-la à solução: estados envolvidos, quando vale, exceções aprovadas e fonte de verdade. Depois localize aplicação no domínio/serviço, restrição de persistência quando apropriado, autorização nas fronteiras e testes que cobrem transições válidas e inválidas. Não confunda invariante com assertion temporária de teste: o primeiro é um compromisso do negócio; a segunda é um mecanismo de verificação.

## Exemplo

Hipotético: “uma resposta de indicador só pode incluir equipes autorizadas para aquele gestor”. A regra continua valendo no chat, API, exportação e retries; filtrar apenas a interface não basta.

## Limites e confusões comuns

Nem toda regra cabe num único objeto ou banco, especialmente quando cruza serviços. Uma verificação local pode não evitar corrida ou atualização distribuída. Decida autoridade de dados, consistência e compensação explicitamente.

## Conexões

- [[03-desenvolvimento-orientado-por-especificacoes|Especificações]] — expressam exemplos da regra.
- [[05-fitness-functions|Fitness functions]] — verificam características sistêmicas.
- [[09-protecao-dos-criterios-de-avaliacao|Proteção dos critérios]] — resguarda quem altera o teste.
- [[contratos-formais|Contratos formais]] — pré-condições, pós-condições e invariantes.

## Para investigar

- A condição deve valer em todo estado ou só após uma operação específica?
- Que caminho alternativo poderia contorná-la?

## Minhas anotações

- **Minha síntese:**
- **Regra de domínio observada:**
- **Dúvida:**

## Fontes

- [Microsoft — validações na camada de domínio](https://learn.microsoft.com/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/domain-model-layer-validations) (invariantes e sua aplicação em DDD).
- [Microsoft — modelo de domínio e agregados](https://learn.microsoft.com/azure/architecture/microservices/model/tactical-domain-driven-design) (limites de consistência e invariantes). Consulta: 2026-10-15.
