# 01 — Conceitos essenciais

## Em 30 segundos

- Um agent harness envolve o modelo com contexto, estado, ferramentas, execução e controles.
- Harness engineering é projetar e manter esse ambiente para que agentes sejam úteis, seguros e verificáveis.
- Quando algo falha, investigue o modelo e as camadas ao redor dele.

## Definição curta

Um **agent harness** é a camada de software que envolve um modelo e permite que ele trabalhe em uma tarefa: seleciona e fornece contexto, mantém estado, apresenta ferramentas, executa ou encaminha ações, aplica permissões e aprovações, observa resultados e controla o ciclo até uma condição de parada.

**Harness engineering** é o trabalho de projetar, implementar, testar e manter essa camada e o ambiente em que o agente opera. Em engenharia de software com agentes, inclui também tornar o repositório legível para agentes e criar ciclos de validação que detectem erros cedo.

Não há uma fronteira universalmente padronizada para o termo. Alguns materiais usam Harness para o runtime do agente; outros incluem configuração, instruções, integrações, governança e processos operacionais. Declare o escopo adotado no projeto.

## Modelo mental

| Parte | Responsabilidade principal |
|---|---|
| **Modelo (LLM)** | interpreta a entrada e produz texto, estrutura ou propostas de ação a partir do contexto disponível |
| **Harness** | controla o que chega ao modelo e o que acontece com a saída; conecta estado, ferramentas, políticas, execução e observabilidade |
| **Ferramentas e ambiente** | executam operações concretas: ler ou alterar arquivos, chamar APIs, consultar dados, compilar, testar, implantar |
| **Agente** | sistema operacional completo que combina modelo, Harness, ferramentas, dados e processos humanos |

Uma saída de modelo que descreve uma ação **não é por si só a ação**. O Harness pode rejeitar, pedir aprovação, validar argumentos, executar em sandbox ou registrar a chamada.

## Por que o Harness importa

- Modelos podem errar ou variar; verificações determinísticas e feedback reduzem a chance de erro chegar ao usuário.
- Capacidade depende do contexto, das ferramentas e do ambiente acessíveis, não só da escolha do modelo.
- Permissões, execução, conectores e persistência criam riscos que uma instrução de prompt não consegue eliminar.
- Um agente pode falhar por contexto incompleto, estado incorreto, integração quebrada, política permissiva, timeout ou ausência de verificação.
- Modelos podem ser trocados com mais frequência do que integrações, políticas, memória, avaliações e processos de operação.

## Harness, prompt e contexto

- **Prompt engineering:** formula instruções e exemplos para orientar uma resposta.
- **Context engineering:** seleciona, organiza, recupera, limita e atualiza a informação que o modelo recebe.
- **Harness engineering:** cria o sistema operacional e os controles ao redor do agente: contexto, ciclo, ferramentas, estado, execução, verificações, aprovações e telemetria.

São atividades relacionadas, não sinônimos. Um prompt melhor não substitui uma permissão de sistema, validação de saída ou sandbox.

## Termos próximos que não devem ser confundidos

- **Harness (agent):** camada que opera o agente, conforme estas notas.
- **Harness engineering:** disciplina de tornar essa camada e o ambiente mais confiáveis e úteis.
- **Test harness:** código e dados auxiliares usados para executar testes de um sistema.
- **Harness, a empresa/produto:** plataforma comercial de entrega de software e DevOps; não é o conceito destas notas.
- **Framework de agentes:** biblioteca que pode oferecer partes do Harness; usar framework não garante que todos os controles e necessidades estejam resolvidos.

## Exemplo

Tarefa: “Corrija o erro no cálculo de frete e abra uma alteração revisável.”

1. O Harness carrega instruções do repositório, escopo, estado do Git e comandos de validação.
2. O modelo propõe inspecionar arquivos e editar a lógica.
3. O Harness permite leitura e edição no workspace, mas limita acesso externo e operações destrutivas.
4. O agente executa testes ou checks; o Harness devolve resultados e erros ao modelo.
5. O agente ajusta a mudança; verificações automatizadas confirmam o critério definido.
6. O Harness apresenta diff, evidências e limitações para revisão humana.

## Heurística de diagnóstico

Quando o agente falhar, classifique primeiro o ponto do ciclo:

| Sintoma | Camadas a investigar |
|---|---|
| resposta inventa detalhes | contexto, recuperação, instrução, verificação factual |
| escolhe ferramenta errada | descrição/esquema da ferramenta, contexto e roteamento |
| ação válida, efeito incorreto | autorização, validação de argumentos, execução e estado externo |
| repete sem avançar | feedback, critério de parada, orçamento de iterações, recuperação de erro |
| perde detalhes em tarefas longas | gestão de contexto, estado persistido, resumo/compactação e rastreabilidade |
| funciona no teste, falha em produção | diferenças de dados, permissões, ambiente, dependências e observabilidade |
