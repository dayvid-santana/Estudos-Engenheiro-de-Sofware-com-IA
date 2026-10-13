# 04 — Segurança, avaliação e operação

## Modelo de risco

O risco vem do conjunto **modelo + Harness + ferramentas + dados + identidade + ambiente + pessoas/processos**. Quanto mais acesso e autonomia, maior pode ser o impacto de uma saída errada, de uma falha ou de conteúdo malicioso.

### Controles essenciais

- **Menor privilégio:** identidade e escopo específicos por tarefa; evite credenciais pessoais e acesso amplo.
- **Isolamento:** sandbox para código e comandos; limitar filesystem, rede, recursos e duração.
- **Aprovação humana:** ações sensíveis ou irreversíveis pedem confirmação de pessoa autorizada, com resumo do efeito.
- **Validação:** verificar entradas e saídas; conferir autorização no servidor, não confiar em instrução do modelo.
- **Defesa em profundidade:** permissões, sandbox, validação e monitoramento atuam em camadas.
- **Proteção de dados:** minimização, classificação, redaction em logs, retenção limitada e controle de conectores.
- **Segredos:** armazenar fora do contexto e do código; entregar credenciais temporárias com escopo mínimo.
- **Auditoria:** registrar identidade, tarefa, ferramentas, aprovações, resultados e versão/configuração do Harness.
- **Supply chain:** revisar dependências, plugins, ferramentas, imagens, servidores MCP e atualizações.
- **Resposta a incidentes:** botão de parada, revogação de credenciais, contenção, investigação e recuperação.

## Prompt injection e conteúdo não confiável

Uma página, email, issue, documento ou comentário de código pode conter instruções maliciosas. O agente pode confundir esse conteúdo com instruções legítimas. Marcar texto como “não confiável” ajuda, mas não substitui controles de acesso.

- Separe instruções de sistema/política do conteúdo recuperado e identifique proveniência.
- Não permita que conteúdo externo conceda permissões ou redefina a tarefa.
- Não exponha dados privados a ferramentas ou fontes que não precisam deles.
- Restrinja operações de escrita, execução e envio externo por identidade e política.
- Exija confirmação para transferências, alterações em produção e ações com impacto alto.
- Teste ataques indiretos em documentos e resultados de ferramentas, não só no prompt digitado pelo usuário.

Não existe mitigação baseada apenas no modelo que garanta neutralizar todo prompt injection; reduza capacidade e impacto com controles no Harness e nos sistemas conectados.

## Risco por tipo de ação

| Nível | Exemplo | Política usual |
|---|---|---|
| Baixo | leitura de documentação pública, sumarização local | automático, com limites e logging apropriado |
| Médio | edição de arquivo, criação de branch, atualização de ticket | sandbox, diff e validação; revisão conforme o impacto |
| Alto | publicar, enviar mensagem externa, alterar produção ou dados pessoais | aprovação explícita, identidade autorizada e trilha de auditoria |
| Crítico/irreversível | apagar dados, transferir valores, revogar acesso em massa | bloqueio por padrão ou processo formal de dupla validação e recuperação |

Classifique pelo dano possível, alcance, reversibilidade e sensibilidade dos dados; não somente pelo nome da ferramenta.

## Avaliar qualidade

Avalie tarefa completa e comportamento operacional, não apenas a fluência da resposta.

### Dimensões

- **Sucesso da tarefa:** critérios de aceitação satisfeitos?
- **Correção:** resultados e alterações são corretos?
- **Segurança:** respeitou dados, políticas, permissões e aprovações?
- **Robustez:** tolera variações, falhas de ferramenta e entradas adversariais?
- **Eficiência:** passos, latência, tokens, custo e chamadas desnecessárias?
- **Recuperação:** reconheceu falha, corrigiu ou escalou sem loop infinito?
- **Usabilidade:** apresentou estado, resultado e incerteza de modo claro?

### Estratégia de avaliação

1. Monte um conjunto pequeno de tarefas reais e representativas, com casos normais, limites e ataques.
2. Defina critérios verificáveis: testes, comparação com referência, schema, invariantes ou revisão especializada.
3. Registre versão do modelo, prompts, ferramentas, dados, configuração e ambiente.
4. Meça sucesso e custo; examine falhas por categoria.
5. Teste cada mudança no Harness contra a suíte de regressão e casos adversariais.
6. Faça rollout gradual e monitore efeitos antes de ampliar autonomia.

Não misture avaliação offline com garantia de segurança. Um conjunto de testes finito não cobre todos os usos, usuários e conteúdos externos.

## Observabilidade e métricas

Registre o bastante para reconstruir eventos sem duplicar dados sensíveis:

- ID de tarefa/correlação e identidade/política usada;
- versões do modelo, instruções, ferramentas e Harness;
- fontes relevantes do contexto (sem necessariamente salvar o conteúdo completo);
- chamadas, argumentos saneados, aprovações, latência, status e erros;
- resultado das verificações e decisão de conclusão;
- custo, número de passos e escalonamentos humanos.

Métricas úteis: taxa de sucesso por tipo de tarefa, taxa de intervenção/aprovação, violações de política, falhas de ferramentas, regressões, custo por tarefa concluída, latência e taxa de abandono. Uma métrica isolada pode induzir comportamento ruim; leia-a junto com qualidade e risco.

## Checklist antes de produção

- [ ] Caso de uso e dano aceitável definidos.
- [ ] Acesso a dados e ferramentas inventariado e mínimo.
- [ ] Ações irreversíveis e de alto impacto têm barreiras adequadas.
- [ ] Ambiente de execução isolado e limites configurados.
- [ ] Saídas e efeitos externos são validados.
- [ ] Casos normais, falhas, abuso e prompt injection foram avaliados.
- [ ] Logs, alertas, retenção e redação de dados estão definidos.
- [ ] Há mecanismo de interrupção, revogação e recuperação.
- [ ] Responsáveis por aprovação e incidentes estão identificados.
- [ ] Rollout é gradual e tem critério para avançar ou reverter.
