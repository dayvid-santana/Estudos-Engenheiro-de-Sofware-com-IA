# Nome do Arquivo: 04-lcel-e-chains.md

## O que é LCEL?

**LCEL** (LangChain Expression Language) compõe componentes compatíveis com `Runnable` em pipelines legíveis. O operador `|` passa a saída de uma etapa como entrada da próxima.

```text
entrada → prompt → modelo → parser → saída
```

> Nota: `|` é composição de objetos Python, não um pipe de shell. O tipo de saída de uma etapa precisa ser adequado à entrada da seguinte.

## Exemplo básico

Instale `pip install -U "langchain[openai]"` e configure `OPENAI_API_KEY`.

```python
from langchain.chat_models import init_chat_model
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_messages([
    ("system", "Explique com clareza e em poucas palavras."),
    ("human", "O que é {tema}?"),
])
model = init_chat_model("openai:gpt-4.1-mini", temperature=0)

chain = prompt | model | StrOutputParser()
result = chain.invoke({"tema": "LCEL"})
print(result)  # str
```

## Sintaxe que aparece com frequência

| Padrão | Para quê |
|---|---|
| `a \| b` | Encadear a saída de `a` na entrada de `b`. |
| `{ "x": a, "y": b }` | Criar ramificações paralelas; cada ramo recebe a mesma entrada. |
| `RunnablePassthrough()` | Repassar a entrada sem alteração. |
| `RunnableLambda(fn)` | Adaptar uma função Python a um passo da cadeia. |
| `chain.invoke(x)` | Executar uma entrada e receber o resultado completo. |
| `chain.batch(xs)` | Executar várias entradas independentes. |

O dicionário de ramos também pode ser expresso explicitamente com `RunnableParallel`:

```python
from langchain_core.runnables import RunnableParallel, RunnableLambda

summary = RunnableLambda(lambda text: f"Resumo: {text[:80]}")
length = RunnableLambda(lambda text: len(text))
analyze = RunnableParallel(resumo=summary, caracteres=length)

print(analyze.invoke("LangChain conecta modelos a componentes de aplicação."))
```

## Async e streaming

Runnables disponibilizam variantes assíncronas (`ainvoke`, `abatch`, `astream`) para I/O não bloqueante quando a integração oferece suporte. `astream` entrega partes à medida que chegam; nem todo componente pode produzir saída parcial útil.

```python
import asyncio
from langchain.chat_models import init_chat_model
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_template("Conte uma curiosidade sobre {tema}.")
model = init_chat_model("openai:gpt-4.1-mini")
chain = prompt | model | StrOutputParser()

async def main():
    final = await chain.ainvoke({"tema": "o oceano"})
    print("Completo:", final)

    async for chunk in chain.astream({"tema": "o espaço"}):
        print(chunk, end="", flush=True)

asyncio.run(main())
```

## Métodos para memorizar

| Método | Entrada típica | Resultado |
|---|---|---|
| `invoke` / `ainvoke` | Uma entrada | Uma saída completa |
| `stream` / `astream` | Uma entrada | Iterador de chunks |
| `batch` / `abatch` | Lista de entradas | Lista de saídas |
| `astream_events` | Uma entrada | Eventos de execução e etapas |

> Nota: streaming melhora a experiência percebida, mas não reduz necessariamente o tempo total de geração. Em cadeias, o parser ou etapa posterior pode precisar acumular chunks.

Use LCEL para pipelines declarativos. Se precisar de estado mutável, ciclos, retomada ou caminhos com regras explícitas, veja [[06-langgraph]]. Para agentes com ferramentas, veja [[05-agentes-e-tools]].

### Links oficiais

- [Runnables e composição](https://docs.langchain.com/oss/python/langchain/runnables)
- [Modelos: invoke, stream e batch](https://docs.langchain.com/oss/python/langchain/models)
- [Streaming em aplicações LangChain](https://docs.langchain.com/oss/python/langchain/streaming)
