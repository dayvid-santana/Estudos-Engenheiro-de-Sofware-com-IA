# 02 — Componentes e ciclo de execução

## Em 30 segundos

- O Harness liga o pedido ao modelo, às ferramentas e ao ambiente de execução.
- Um ciclo típico valida o pedido, monta contexto, executa ações autorizadas e confere o resultado.
- Limites, estado e observabilidade são necessários para interromper, recuperar e explicar a execução.

## Componentes comuns

Os nomes variam entre plataformas. Use a lista como mapa funcional, não como arquitetura obrigatória.

| Componente | Pergunta que responde | Controles típicos |
|---|---|---|
| Interface e entrada | Quem pede o quê? | autenticação, validação e limites de entrada |
| Orquestrador/ciclo | Quando consultar o modelo, executar ação ou encerrar? | orçamento de passos, timeout, cancelamento, condições de parada |
| Camada de instruções e política | Quais objetivos e restrições se aplicam? | regras versionadas, prioridade, conflito e política executável |
| Gerenciador de contexto | Que informação é relevante e pode ser revelada? | recuperação, filtros, limites de tamanho e proveniência |
| Interface do modelo | Como enviar contexto e receber saída? | configuração, tratamento de erro, compatibilidade e custo |
| Registro de ferramentas | Que operações o agente pode solicitar? | contratos, descrição clara, escopo mínimo e validação |
| Autorização e aprovações | Quem pode iniciar cada ação? | identidade, privilégios, aprovação humana, segregação de funções |
| Runtime/ambiente | Onde a ação ocorre? | sandbox, isolamento, limites de rede/CPU/arquivos e limpeza |
| Estado e memória | O que persiste entre etapas ou sessões? | escopo, retenção, integridade, atualização e exclusão |
| Conectores e dados | Que sistemas externos são acessíveis? | credenciais de curta duração, escopos, filtragem e limites de taxa |
| Validação e avaliadores | Como se sabe que houve sucesso? | testes, schemas, invariantes, avaliação e revisão |
| Telemetria e auditoria | O que ocorreu e por quê? | logs, traces, métricas, redaction e correlação |
| Ciclo de vida | Como componentes mudam? | revisão de dependências, versões, rollout e rollback |

## Ciclo básico

```text
1. Receber pedido e identidade
2. Validar escopo, dados, risco e condições de uso
3. Montar contexto mínimo e carregar estado relevante
4. Consultar o modelo
5. Interpretar a saída e validar formato/argumentos
6. Se necessário, autorizar ou solicitar aprovação
7. Executar a ferramenta em ambiente controlado
8. Registrar resultado e devolvê-lo como observação
9. Repetir dentro de limites ou finalizar
10. Validar o resultado final e apresentar evidências
```

O modelo propõe; o Harness deve controlar a execução. A validação final deve ser independente da afirmação do agente “terminei”.

## Estado e memória

- **Estado de execução:** etapa atual, chamadas e resultados desta tarefa.
- **Histórico de conversa:** mensagens e respostas necessárias para continuidade.
- **Memória de sessão:** fatos temporários úteis durante a tarefa.
- **Memória persistente:** fatos retidos para tarefas futuras; precisa de política de validade, origem, acesso e exclusão.
- **Artefatos:** arquivos, relatórios, diffs ou resultados produzidos.

Não persista tudo por padrão. Memória pode ficar desatualizada, expor dados sensíveis ou ser contaminada por instruções maliciosas. Registre origem e data quando um fato persistente puder influenciar decisões.

## Ferramentas e contratos

Uma ferramenta bem projetada tem:

- nome e descrição que deixam clara sua finalidade e limites;
- esquema de entrada explícito, com tipos, valores aceitos e validação;
- resultado estruturado e erros distinguíveis;
- permissões específicas e efeitos colaterais documentados;
- comportamento previsível em repetição, timeout e falha;
- identificador de auditoria e limites de taxa quando necessário.

Prefira ferramentas focadas, com escopo estreito e resultados observáveis. Uma ferramenta genérica com acesso amplo ao sistema aumenta o impacto de uma decisão errada.

## Controles do loop

- Máximo de iterações e chamadas por tarefa.
- Limite de tempo, tokens e custo.
- Tratamento separado de erro recuperável, erro final e ação não autorizada.
- Idempotência ou chave de operação para efeitos externos sujeitos a repetição.
- Cancelamento e interrupção por pessoa responsável.
- Critério explícito de conclusão e resposta quando não for possível concluir.
- Compactação de contexto que preserve decisões, restrições e resultados ainda relevantes.

## Execução em paralelo e múltiplos agentes

Delegar pode ajudar quando partes do trabalho são independentes e têm interfaces claras. Acrescenta coordenação, custo, estado compartilhado e riscos de consistência. Defina escopo e permissões por agente, formato de entrega, como reconciliar resultados e quem valida a integração. Não use múltiplos agentes como substituto para uma arquitetura ou critério de sucesso claro.
