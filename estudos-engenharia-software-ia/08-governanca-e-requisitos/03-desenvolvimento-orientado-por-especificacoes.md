---
tipo: conceito
status: nao-iniciado
prioridade: essencial
---

# Desenvolvimento orientado por especificações

## Em uma frase

Desenvolvimento orientado por especificações (specification-driven development, SDD) trata uma descrição aprovada do comportamento esperado como insumo explícito para planejar, implementar e verificar mudanças.

## Problema que resolve

Um pedido em linguagem natural pode misturar objetivo, solução sugerida e critério de sucesso. Se o agente transforma uma interpretação ambígua diretamente em código, pessoas podem aprovar uma implementação que passa testes locais, mas não atende a necessidade original.

## Como funciona

SDD não identifica uma única prática ou framework universal. Uma forma de aplicá-lo é registrar contexto, usuários, requisitos, restrições e exemplos; revisar ambiguidades com quem entende do domínio; derivar critérios de aceitação verificáveis; implementar; executar as verificações adequadas; e manter links entre versões da especificação e evidências. Exemplos no estilo Given–When–Then podem concretizar comportamentos. Eles ajudam a conversar e testar casos, mas não cobrem automaticamente todas as situações.

Diferencie verificação — “a implementação satisfaz esta especificação?” — de validação — “a especificação e o produto atendem à necessidade?” Requisitos funcionais descrevem comportamentos; requisitos de qualidade descrevem propriedades como latência, disponibilidade ou privacidade. Para cada um, indique contexto, limite, observador e método de evidência quando isso importar.

## Exemplo

Hipotético: “gestor autorizado consulta indicador diário”; um cenário explicita usuário autorizado, período selecionado, consulta via sistema definido e valor retornado comparável à fonte. Outro cenário cobre usuário sem permissão.

## Limites e confusões comuns

Uma especificação pode estar errada ou incompleta. Testes extraídos dela só cobrem casos implementados; não provam valor de produto. Especificação não significa escrever detalhes de implementação antes de conhecer o problema.

## Conexões

- [[04-invariantes-de-negocio|Invariantes de negócio]] — regras que os cenários não podem violar.
- [[07-rastreabilidade-de-requisitos|Rastreabilidade]] — liga especificação e evidência.
- [[08-controle-de-mudancas|Controle de mudanças]] — versiona a referência aprovada.

## Para investigar

- Que exemplo de aceitação revela uma ambiguidade real do requisito?
- Qual evidência valida a necessidade, além de mostrar que o teste passou?

## Minhas anotações

- **Minha síntese:**
- **Especificação ou exemplo observado:**
- **Dúvida:**

## Fontes

- [NASA Systems Engineering Handbook](https://science.nasa.gov/wp-content/uploads/2023/04/nasa_systems_engineering_handbook_0.pdf) (definição, verificação e validação de requisitos).
- [Martin Fowler — Specification by Example](https://martinfowler.com/bliki/SpecificationByExample.html) e [Given–When–Then](https://martinfowler.com/bliki/GivenWhenThen.html). Consulta: 2026-10-15.
