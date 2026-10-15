---
tipo: conceito
status: nao-iniciado
prioridade: essencial
categoria: fundamentos-de-ia
tags:
  - llm
  - prompt-engineering
  - arquitetura-de-agentes
complexidade: iniciante
---

# System Prompt

> **Em uma frase:** System Prompt é um conjunto de instruções de alto nível que orienta o comportamento do modelo durante uma interação, como seu papel, seus limites e o formato esperado das respostas.

## Definição e resumo executivo

O System Prompt fornece ao modelo orientações definidas pela aplicação antes ou junto da solicitação do usuário. Ele ajuda a tornar respostas mais consistentes e adequadas a uma tarefa, mas é uma instrução em linguagem natural: não garante obediência perfeita nem substitui validações, permissões e controles implementados no software.

Ele importa porque separa as regras do produto da entrada variável do usuário. Assim, a aplicação pode orientar o modelo sem repetir o mesmo contexto em cada pergunta e pode mudar as instruções conforme o papel ou fluxo em execução.

## Conceitos-chave

### 1. Instrução e contexto

Um prompt pode conter instruções (o que fazer), contexto (informação necessária para a tarefa), dados de entrada e exemplos. Separe esses elementos para que fique claro o que é regra da aplicação e o que é conteúdo a ser processado.

### 2. Papéis das mensagens

APIs de modelos organizam a conversa em mensagens com papéis. Em geral:

- **System:** instruções gerais da interação, quando esse papel é suportado.
- **Developer:** regras definidas pela aplicação ou por quem integra o modelo.
- **User:** pedido e dados fornecidos pelo usuário.
- **Assistant:** respostas do modelo e, em fluxos com ferramentas, mensagens produzidas pelo modelo.

Os nomes e a hierarquia variam conforme o provedor, o modelo e a API. Na API Responses da OpenAI, `instructions` insere uma mensagem `system` ou `developer`; mensagens `developer` e `system` têm precedência sobre mensagens `user`. Confira sempre a documentação do provedor escolhido.

### 3. O que costuma conter

Um System Prompt útil costuma especificar:

1. **Papel e objetivo:** que tipo de tarefa o modelo deve realizar.
2. **Escopo e limites:** o que deve fazer, evitar ou encaminhar.
3. **Processo:** etapas ou critérios relevantes para executar a tarefa.
4. **Formato da resposta:** idioma, estrutura, tamanho ou formato de dados.
5. **Tratamento de incerteza:** quando pedir contexto, admitir que não sabe ou citar evidências.
6. **Uso de ferramentas:** quando uma ferramenta pode ser chamada e quais informações devem ser devolvidas.

Evite instruções vagas ou contraditórias. Prefira regras observáveis, como “responda em até cinco tópicos” ou “se a informação não estiver no contexto, diga que não foi encontrada”.

### 4. Limites e segurança

- Um prompt orienta probabilisticamente o modelo; não é uma barreira de segurança garantida.
- Não coloque senhas, chaves de API ou outros segredos no prompt.
- Não use o prompt como único mecanismo de autorização. A aplicação deve validar identidade e permissões antes de executar ações.
- Trate texto recuperado, documentos, resultados de ferramentas e mensagens do usuário como dados potencialmente não confiáveis. Eles podem conter instruções maliciosas ou conflitantes.
- Se o modelo puder chamar ferramentas, valide os argumentos e autorize a operação no servidor antes de executá-la.

### 5. Manutenção e avaliação

Armazene prompts em local controlado, versione alterações e teste exemplos representativos antes de publicar. Avalie não só respostas ideais, mas também entradas ambíguas, tentativas de desviar as regras, dados ausentes e erros de ferramenta. Mudanças no prompt podem alterar comportamento, custo e latência.

## Exemplo prático

Neste exemplo, as instruções definem o papel e o formato, enquanto a mensagem do usuário fornece a tarefa específica:

```python
from openai import OpenAI

client = OpenAI()

response = client.responses.create(
    model="MODELO_CONFIGURADO_NO_PROJETO",
    instructions=(
        "Você é um assistente de suporte técnico. "
        "Responda em português, com passos numerados. "
        "Se faltarem dados para diagnosticar, pergunte antes de concluir."
    ),
    input="O serviço retorna erro 503 depois de uma implantação. O que verifico?",
)

print(response.output_text)
```

`instructions` representa as regras relativamente estáveis da aplicação; `input` contém a solicitação concreta. Substitua o valor de `model` por um modelo disponível e configurado no ambiente. Em aplicações com agentes ou ferramentas, restrinja as ferramentas oferecidas e verifique cada chamada fora do modelo.

**Caso de uso:** um assistente interno de suporte pode manter tom, idioma, escopo e política de incerteza consistentes entre diferentes perguntas. A equipe ainda precisa aplicar autorização e validação no serviço que consulta dados ou executa ações.

## Perguntas de fixação

1. Qual a diferença entre as instruções da aplicação e a solicitação do usuário?
2. Por que um System Prompt não deve ser tratado como controle de acesso?
3. O que você testaria antes de alterar o prompt de um agente que executa ferramentas?

## Links e próximos passos

- [Context Engineering](../03-contexto-e-conhecimento/context-engineering.md) — composição de instruções, histórico e contexto recuperado.
- [Prompt Injection](../05-qualidade-e-seguranca/prompt-injection.md) — riscos quando dados não confiáveis contêm instruções.
- [Agentes de IA](agentes-de-ia.md) — instruções e ferramentas em um fluxo agentivo.
- [Documentação da API Responses](https://platform.openai.com/docs/api-reference/responses/create) — campo `instructions` e entrada de mensagens.
- [Guia de engenharia de prompts da OpenAI](https://platform.openai.com/docs/guides/prompt-engineering) — recomendações para escrever e avaliar prompts.

## Minhas descobertas

**Com minhas palavras:**

**Exemplo ou evidência:**

**Dúvida que permanece:**

**Consultado em:** 2026-10-15.
