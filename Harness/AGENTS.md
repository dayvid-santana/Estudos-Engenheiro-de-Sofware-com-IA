# Regras para editar as notas

Estas instruções valem para todos os arquivos deste diretório e seus subdiretórios.

## Objetivo editorial

Produzir notas de consulta rápida, corretas e práticas. A pessoa deve conseguir entender a ideia central em menos de um minuto e localizar uma decisão, exemplo ou alerta sem ler o documento inteiro.

## Regras obrigatórias

1. **Notas e documentação sempre em Markdown (`.md`).** Não crie notas em DOCX, PDF, HTML, texto simples ou outros formatos. O subdiretório `_tools/` é exceção apenas para ferramentas executáveis que mantêm e verificam as notas.
2. **Português brasileiro claro.** Preserve termos técnicos comuns em inglês quando isso facilitar pesquisa; explique-os na primeira ocorrência quando não forem óbvios.
3. **Seja objetivo.** Mire 300–900 palavras por nota temática; nunca passe de 1.200. Remova repetição, contexto que não muda a decisão e explicações que não ajudam consulta.
4. **Comece pelo essencial.** Toda nota temática abre com um título H1 e uma seção `## Em 30 segundos` com 3–5 bullets curtos.
5. **Organize para escaneamento.** Prefira subtítulos descritivos, listas, tabelas pequenas e exemplos mínimos. Parágrafos devem ter no máximo 3 frases.
6. **Inclua uso prático.** Explique quando o conceito é útil, como se aplica, principais limites/armadilhas e uma forma de reconhecer sucesso ou falha. Adapte as seções ao assunto; não force seções irrelevantes.
7. **Separe conceitos estáveis de detalhes que mudam.** Para APIs, versões, comandos, disponibilidade, preços ou recursos de provedores, informe versão/estado e data de consulta e ligue a documentação oficial atual.
8. **Use fontes rastreáveis.** Afirmações específicas e recomendações técnicas devem ter links diretos para documentação primária ou fonte original. Identifique claramente inferências e exemplos didáticos.
9. **Não invente certeza.** Indique limitações, dependências e pontos incertos. Nunca descreva um exemplo ilustrativo como configuração de produção validada.
10. **Mantenha o conjunto navegável.** Nomeie notas temáticas como `NN-nome-curto.md` em kebab-case, atualize o índice do `README.md` e prefira links relativos entre notas.
11. **Evite duplicação.** Se um conceito já estiver explicado em outra nota, resuma-o e faça referência ao arquivo existente.
12. **Preserve material útil.** Ao revisar, corrija ou compacte sem apagar conteúdo relevante, fontes ou ressalvas sem motivo.

## Estrutura sugerida

Use [TEMPLATE.md](TEMPLATE.md) como ponto de partida. A estrutura pode variar; mantenha obrigatoriamente título, `Em 30 segundos`, conteúdo consultável e fontes quando houver alegações verificáveis.

## Fluxo para criar ou alterar uma nota

1. Identifique pergunta, público e decisão prática que a nota deve apoiar.
2. Procure notas relacionadas para evitar duplicação e escolha o próximo número disponível.
3. Pesquise fontes primárias se o tema for técnico, emergente ou sujeito a mudanças.
4. Escreva a síntese primeiro; depois acrescente só o detalhe necessário para aplicar a ideia.
5. Confira clareza, limite de palavras, exemplos, fontes, versão/data e links locais.
6. Atualize `README.md` e siga [REVISAO.md](REVISAO.md).
7. Da raiz do workspace, rode a checagem mecânica: `pwsh -File Harness/_tools/validar-notas.ps1`.
8. Revise `git status` e o diff; confirme que só serão incluídos arquivos desta solicitação e que não há segredos.
9. Faça um commit com mensagem clara para as alterações concluídas.
10. Depois do commit, faça push do commit para o upstream configurado da branch atual.

## Roadmaps e orientação de aprendizagem

- Mantenha `ROADMAP.md` como ponto de entrada: trilhas por objetivo e mapa dos conceitos para as notas existentes.
- Use `ROADMAP-TEMA.md` para trilhas específicas quando um tema tiver sequência, pré-requisitos ou objetivos próprios.
- Inclua roadmaps no `README.md` e mantenha todos os links locais válidos.
- Roadmaps orientam a leitura; não duplique explicações técnicas das notas. Declare pré-requisitos como recomendações quando não forem obrigatórios.
- Indique etapas em termos de objetivo de aprendizagem e referência. Não marque progresso individual nem invente estados de conclusão.

### Regra obrigatória de Git

Toda solicitação atendida que criar ou alterar arquivos neste conjunto termina com **commit e, em seguida, push**. Faça isso depois da revisão e das validações, antes de encerrar a solicitação. A regra vale também para alterações destas próprias instruções.

- Inclua apenas os arquivos relacionados à solicitação; preserve alterações preexistentes alheias e nunca as descarte ou incorpore por conveniência.
- Confira branch, upstream, diff e arquivos staged antes de confirmar o commit.
- Não inclua credenciais, segredos, dados pessoais desnecessários ou arquivos gerados sem propósito.
- Faça push para o upstream configurado; nunca force o push nem reescreva histórico para contornar uma rejeição.
- Se não houver upstream, o push falhar ou o ambiente não permitir a operação, mantenha o commit local e informe claramente o que impediu o push. Não declare o fluxo concluído sem registrar esse impedimento.

## Convenções de nomenclatura

- Notas temáticas: `NN-kebab-case.md` (ex.: `08-novo-conceito.md`).
- Índice: `README.md`.
- Regras, template e checklist: nomes estáveis em maiúsculas, sempre `.md`.
- Roadmap geral: `ROADMAP.md`; roadmaps temáticos: `ROADMAP-TEMA.md`, em Markdown.
- Não renumere notas existentes só para reorganizar; atualize os links quando um nome realmente precisar mudar.
