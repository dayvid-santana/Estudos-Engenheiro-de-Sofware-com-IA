# Harness — guia de consulta rápida

Notas em português sobre **agent harness** e **harness engineering**: a infraestrutura e as práticas que tornam agentes de IA capazes de executar tarefas com contexto, ferramentas, limites, feedback e prestação de contas.

> **Uso do termo:** este conjunto trata de Harness como conceito de engenharia de agentes. Não trata da empresa/produto [Harness](https://www.harness.io/) nem de *test harness* (infraestrutura de testes), exceto para distingui-los.

## Mapa das notas

| Arquivo | Consulte quando… |
|---|---|
| [01-conceitos.md](01-conceitos.md) | precisar explicar o que é Harness, o que não é e por que importa |
| [02-componentes-e-fluxo.md](02-componentes-e-fluxo.md) | estiver desenhando os componentes ou o ciclo de execução |
| [03-praticas-de-engenharia.md](03-praticas-de-engenharia.md) | estiver preparando um repositório ou melhorando um agente de código |
| [04-seguranca-e-avaliacao.md](04-seguranca-e-avaliacao.md) | precisar limitar riscos, medir qualidade ou investigar falhas |
| [05-glossario-e-fontes.md](05-glossario-e-fontes.md) | consultar termos e fontes primárias |
| [06-estrategias-de-mitigacao.md](06-estrategias-de-mitigacao.md) | escolher controles práticos para reduzir os principais riscos |
| [07-langchain.md](07-langchain.md) | usar LangChain com APIs de modelos, MCP e agentes em aplicações Python |

## Como manter este conjunto

- Regras para agentes e colaboradores: [AGENTS.md](AGENTS.md)
- Estrutura reutilizável: [TEMPLATE.md](TEMPLATE.md)
- Revisão antes de concluir: [REVISAO.md](REVISAO.md)
- Checagem mecânica de extensão, tamanho, índice e links (a partir da raiz do workspace): `pwsh -File Harness/_tools/validar-notas.ps1`
- Após toda solicitação que criar ou alterar arquivos, revise o escopo, faça um commit e depois push para o upstream da branch atual; veja a regra completa em [AGENTS.md](AGENTS.md).

As notas temáticas são arquivos `.md` numerados e ligados neste índice. Elas visam leitura rápida: idealmente 300–900 palavras e no máximo 1.200. O diretório `_tools/` contém a automação de manutenção, não notas.

## Em 30 segundos

**Modelo** gera interpretações e propostas. **Harness** fornece contexto, estado, ferramentas, ambiente de execução e regras; decide como as chamadas são executadas; aplica limites e coleta resultados. **Agente** é o sistema resultante, composto pelo modelo, Harness, ferramentas/dados e processo de operação.

```text
pedido → contexto e política → modelo → ação proposta → autorização/validação
       → ferramenta/ambiente → resultado observado → modelo → conclusão verificada
```

Ao depurar, pergunte: **faltou contexto? a ferramenta não era adequada? a permissão estava errada? o ambiente ou o feedback falhou? o critério de conclusão era fraco?** Não atribua automaticamente todo erro ao modelo ou ao prompt.

## Princípios de bolso

1. Torne a intenção, as restrições e a conclusão esperada explícitas.
2. Dê ao agente somente as ferramentas, dados e permissões necessários.
3. Faça regras importantes serem verificáveis por mecanismos, não apenas por instruções em linguagem natural.
4. Feche o ciclo com feedback observável: execução, validação, resultado e próximo passo.
5. Registre decisões e ações relevantes sem armazenar segredos ou dados desnecessários.
6. Aumente autonomia gradualmente, guiada por evidência de qualidade e risco.
7. Preserve revisão e responsabilidade humanas para mudanças de alto impacto.

**Atualizado em:** 2026-10-15. Veja [fontes e limites](05-glossario-e-fontes.md). Conteúdo estruturado para leitura em poucos minutos e consulta por tópico.
