# Nome do Arquivo: 02-modelos-e-prompts.md

## Model I/O: entrada → modelo → saída

- Um **chat model** recebe texto ou mensagens com papéis (`system`, `human`, `assistant`) e normalmente retorna um `AIMessage`.
- A mensagem pode incluir `.text`/`.content`, metadados de uso e chamadas de ferramentas em `.tool_calls`.
- Para uma cadeia, conecte prompt, modelo e parser com LCEL: `prompt | model | parser`.
- Instalação para os exemplos: `pip install -U "langchain[openai]"` e defina `OPENAI_API_KEY`.

```python
from langchain.chat_models import init_chat_model

model = init_chat_model("openai:gpt-4.1-mini", temperature=0)
message = model.invoke("Explique embeddings em uma frase.")
print(message.text)
```

## Templates de prompt

| Tipo | Para quê | Exemplo |
|---|---|---|
| `PromptTemplate` | Prompt textual simples com variáveis. | `"Traduza {text} para {language}"` |
| `ChatPromptTemplate` | Montar mensagens com papéis e variáveis. | system + human |
| `MessagesPlaceholder` | Inserir histórico de mensagens. | Histórico de conversa |

```python
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_messages([
    ("system", "Você traduz de forma fiel e concisa."),
    ("human", "Traduza para {idioma}: {texto}"),
])

messages = prompt.invoke({"idioma": "espanhol", "texto": "Bom dia!"})
print(messages)
```

- Variáveis do template usam `{chaves}` e devem existir na entrada.
- Mantenha instruções, contexto e pergunta em campos distintos para facilitar testes e manutenção.
- Não concatene entrada não confiável em instruções de sistema; trate documentos recuperados como dados, não como instruções.

## Output parsers e saída estruturada

| Opção | Retorno | Use quando |
|---|---|---|
| `StrOutputParser` | `str` | Só precisa do texto final. |
| `JsonOutputParser` | Estrutura Python/JSON | Quer interpretar JSON textual com um parser. |
| `with_structured_output(Schema)` | Instância validada do schema, quando o provedor suporta | Quer saída estruturada e validação por esquema. |

```python
from pydantic import BaseModel, Field
from langchain.chat_models import init_chat_model

class Evento(BaseModel):
    nome: str = Field(description="Nome do evento")
    ano: int

model = init_chat_model("openai:gpt-4.1-mini")
structured_model = model.with_structured_output(Evento)
evento = structured_model.invoke("A conferência DevCon aconteceu em 2024.")
print(evento.nome, evento.ano)  # Evento validado
```

> Nota: saída estruturada depende das capacidades da integração/provedor. Valide os dados também no limite da sua aplicação; uma resposta do modelo não é uma garantia de correção semântica.

### Com parser em LCEL

```python
from langchain.chat_models import init_chat_model
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import ChatPromptTemplate

model = init_chat_model("openai:gpt-4.1-mini")
prompt = ChatPromptTemplate.from_messages([
    ("system", "Responda em uma frase."),
    ("human", "Explique {conceito}."),
])
chain = prompt | model | StrOutputParser()

texto: str = chain.invoke({"conceito": "RAG"})
print(texto)
```

## Abstração de provedores

| Abordagem | Vantagem | Trade-off |
|---|---|---|
| `init_chat_model("provedor:modelo")` | Inicialização uniforme e fácil de configurar. | Recursos exclusivos podem pedir parâmetros específicos. |
| Classe do provedor (`ChatOpenAI`, `ChatAnthropic` etc.) | Acesso direto aos parâmetros da integração. | A troca de provedor pode exigir ajustes. |
| SDK nativo do provedor | Controle máximo e acesso imediato às capacidades nativas. | Menos interoperabilidade com componentes LangChain. |

```python
from langchain.chat_models import init_chat_model

# Só a identificação muda; credenciais e capacidades ainda dependem do provedor.
model_openai = init_chat_model("openai:gpt-4.1-mini")
# model_anthropic = init_chat_model("anthropic:claude-sonnet-4-5")
# model_google = init_chat_model("google_genai:gemini-2.5-flash")
```

> Nota: instale a integração correspondente ao provedor e configure suas credenciais. A interface comum facilita a troca; não torna equivalentes custos, nomes de parâmetros, limites ou capacidades.

Próximo: [[04-lcel-e-chains]] explica a composição com `|`; [[03-rag-e-vetores]] usa modelos de embeddings para busca semântica.

### Links oficiais

- [Modelos e interfaces](https://docs.langchain.com/oss/python/langchain/models)
- [Integração OpenAI](https://docs.langchain.com/oss/python/integrations/chat/openai)
- [Prompts](https://docs.langchain.com/oss/python/langchain/prompts)
- [Saída estruturada](https://docs.langchain.com/oss/python/langchain/structured-output)
