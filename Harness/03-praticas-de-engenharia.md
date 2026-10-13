# 03 — Práticas de engenharia

## Preparar um repositório para agentes de código

Objetivo: reduzir a necessidade de adivinhar e tornar decisões importantes verificáveis.

1. **Dê um mapa do projeto.** Explique módulos, dependências e fluxos principais; mantenha o mapa curto e aponte para detalhes locais.
2. **Declare regras e limites.** Arquivos de orientação (por exemplo `AGENTS.md`) devem conter instruções acionáveis, escopo, caminhos críticos e referências. Elimine duplicação e contradições.
3. **Padronize a execução.** Documente instalação, execução local, formatação, lint, testes e build com comandos exatos e reprodutíveis.
4. **Faça checks automáticos.** Formatação, tipos, lint, testes, migrações, schemas e restrições arquiteturais devem rodar no fluxo de validação adequado.
5. **Mantenha código legível e modular.** Interfaces claras, nomes bons, componentes pequenos e dependências explícitas ajudam humanos e agentes.
6. **Defina critérios de pronto.** O pedido precisa especificar comportamento observado, critérios de aceitação e o que fica fora do escopo.
7. **Exija evidência.** A entrega deve relatar arquivos alterados, validações executadas, resultados e limitações conhecidas.
8. **Reduza entropia.** Remova instruções obsoletas, abstrações duplicadas e checks sem responsável; corrija a fonte da falha em vez de acumular exceções.

## Estrutura útil para instruções de repositório

```markdown
# Como trabalhar neste repositório
## Mapa e convenções
## Regras obrigatórias e áreas sensíveis
## Comandos de desenvolvimento e validação
## Critérios de conclusão
## Referências por módulo
```

Mantenha instruções globais compactas. Detalhes específicos de um módulo ficam perto dele ou em documentação referenciada. O texto deve ser revisado junto com a arquitetura que descreve.

## Especificar uma tarefa para o agente

```text
Objetivo: mudança observável que precisa acontecer.
Contexto: arquivos, fluxo e restrições relevantes.
Critérios de aceitação: condições verificáveis.
Limites: ações, arquivos ou interfaces fora de escopo.
Validação: comandos ou evidências esperadas.
Entrega: resumo, diff, resultados e riscos remanescentes.
```

Evite “melhore tudo”, objetivos vagos e critérios baseados apenas em estilo. Divida mudanças grandes em entregas verificáveis e independentes quando possível.

## Loop de trabalho recomendado

1. Inspecionar instruções, estado do repositório e contexto do pedido.
2. Localizar a implementação e os testes relevantes.
3. Propor um plano curto se o escopo tiver dependências ou risco.
4. Fazer a menor alteração que satisfaça o critério.
5. Rodar as validações autorizadas e disponíveis; não alegar que algo passou sem evidência.
6. Revisar diff, efeitos colaterais, segurança e compatibilidade.
7. Entregar resumo, arquivos, validações, limitações e próximos passos necessários.

## Regras devem ser legíveis e executáveis

Uma instrução textual é útil para intenção; um check é mais confiável para uma regra crítica. Converta restrições importantes em mecanismo sempre que possível:

| Intenção | Mecanismo possível |
|---|---|
| não quebrar contrato público | testes de contrato, schema e compatibilidade |
| respeitar formato | formatter no CI |
| não importar camada proibida | regra de dependência ou análise estática |
| não introduzir segredo | scanner e bloqueio no CI |
| não implantar sem aprovação | política do pipeline e controle de identidade |
| não apagar dados sem revisão | permissão, confirmação e backup/recuperação |

## Feedback que ajuda

- O feedback deve identificar comando, status, saída relevante e próximo passo.
- Retorne ao modelo o erro real de compilação ou validação, de forma limitada e sem segredos.
- Use checks rápidos durante a tarefa e validações completas antes da integração.
- Distinga “não executado”, “falhou” e “passou”.
- Não deixe o próprio agente ser a única autoridade para afirmar que o resultado está correto.

## Como melhorar um Harness com base em falhas

1. Reproduza e classifique a falha: contexto, ferramenta, política, execução, verificação, UX ou integração.
2. Identifique o controle ou informação que faltou.
3. Corrija a camada apropriada; não acrescente uma regra geral ao prompt por reflexo.
4. Adicione um caso de avaliação ou check que represente a falha.
5. Verifique se o controle não bloqueia tarefas válidas e monitore o efeito após a mudança.
