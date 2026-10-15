# Checklist de revisão das notas

Use antes de considerar completa uma nota nova ou uma alteração substancial.

## Objetivo e clareza

- [ ] O título diz claramente o assunto?
- [ ] Em menos de um minuto, a seção **Em 30 segundos** explica o que é, para que serve e qual cuidado principal?
- [ ] A nota responde uma pergunta prática identificável?
- [ ] Texto direto, sem repetição nem introdução longa?
- [ ] Termos técnicos importantes estão definidos na primeira ocorrência?

## Aplicação

- [ ] Explica quando usar e, se útil, quando escolher outra abordagem?
- [ ] Fluxo, código ou exemplo é mínimo, legível e marcado como ilustrativo quando não foi validado?
- [ ] Limites, dependências, riscos e erros comuns estão descritos?
- [ ] A conclusão da nota não promete garantias além da evidência apresentada?

## Fontes e atualização

- [ ] Alegações técnicas verificáveis têm fontes primárias ligadas diretamente?
- [ ] APIs, versões e comportamentos mutáveis foram conferidos na documentação atual?
- [ ] A data de consulta está presente quando detalhes podem mudar?
- [ ] Inferências e exemplos didáticos estão diferenciados de fatos documentados?

## Padrões do conjunto

- [ ] O arquivo de nota está em `.md`, segue `NN-kebab-case.md` e tem somente um título H1?
- [ ] Está entre 300 e 900 palavras, idealmente, e nunca passa de 1.200?
- [ ] Links locais são relativos e apontam para arquivos existentes?
- [ ] Não duplica outras notas; links relacionados foram acrescentados quando ajudam?
- [ ] O `README.md` foi atualizado com o link e uma descrição de uma linha?
- [ ] A checagem mecânica passa (da raiz do workspace): `pwsh -File Harness/_tools/validar-notas.ps1`?
- [ ] O roadmap geral e os roadmaps de tema aplicáveis apontam para os arquivos e seções corretos?
- [ ] Novas notas aparecem no mapa de conceitos e nas trilhas relevantes, sem duplicar seu conteúdo?

## Git antes de concluir uma solicitação com mudanças em arquivos

- [ ] `git status` e o diff foram revisados; só arquivos relacionados à solicitação serão incluídos?
- [ ] Os arquivos staged foram conferidos e não incluem segredos ou alterações alheias?
- [ ] Foi criado um commit com mensagem clara?
- [ ] Depois do commit, foi feito push para o upstream da branch atual?
- [ ] Se o push não foi possível, a causa foi registrada e o commit local foi preservado?

## Critério de pronto

A nota está pronta quando uma pessoa consegue entender a ideia central rapidamente, aplicar ou comparar a abordagem com as informações fornecidas e verificar as afirmações importantes pelas referências.
