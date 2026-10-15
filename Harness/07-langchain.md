# 07 — LangChain: consulta rápida

Guia prático para usar **LangChain em aplicações Python que chamam APIs de modelos e consomem ferramentas de servidores MCP**, inclusive por meio de agentes.

> **Estado da API:** consultado em 2026-10-15. A documentação atual marca `langchain.mcp` como beta e exige `langchain[mcp]>=1.4.0`; interfaces podem mudar. Fixe versões no projeto e confira a documentação da versão instalada.

## Em 30 segundos

- LangChain conecta APIs de modelos a ferramentas e agentes.
- `create_agent` executa o loop modelo ↔ ferramentas; `MCPAdapter` descobre ferramentas de servidores MCP.
- Chamada ao modelo e conexão MCP são distintas; a aplicação controla credenciais e autorização.
- Agentes LangChain usam primitivas LangGraph; use LangGraph diretamente para controle de fluxo avançado. [Visão geral](https://docs.langchain.com/oss/python/langchain/overview) · [MCP](https://docs.langchain.com/oss/python/langchain/mcp)

```text
Usuário → aplicação LangChain → API do modelo
                             ↘ ferramentas do MCP server → APIs/dados de negócio
```

## 1. Instalar e configurar um provedor de modelos

Para OpenAI, instale o extra oficial e forneça a chave ao ambiente da aplicação:

```powershell
python -m pip install -U "langchain[openai,mcp]>=1.4.0"
$env:OPENAI_API_KEY = "sua-chave"
```

Não coloque a chave no código, no prompt, em arquivos versionados ou no MCP server se a chamada ao modelo é feita pela própria aplicação. Para outros provedores, instale o extra/integrador correspondente e use o identificador/documentação desse provedor.

O agente aceita o identificador `provedor:modelo` ou uma instância de modelo. Exemplo com identificador:

```python
from langchain.agents import create_agent

agent = create_agent(
    model="openai:gpt-5.5",  # exemplo da documentação consultada; escolha um modelo disponível
    tools=[],
    system_prompt="Responda com clareza e use ferramentas apenas quando necessário.",
)

result = agent.invoke({"messages": [{"role": "user", "content": "Olá!"}]})
print(result["messages"][-1].content)
```

Para execução assíncrona em aplicações async, use `await agent.ainvoke(...)`. Confira se o modelo escolhido suporta tool calling quando o agente precisa usar ferramentas. [Agentes](https://docs.langchain.com/oss/python/langchain/agents) · [Modelos](https://docs.langchain.com/oss/python/langchain/models)

## 2. Consumir ferramentas de um servidor MCP

`MCPAdapter` descobre ferramentas no servidor e as converte para objetos que podem ser passados a `create_agent`. A documentação atual suporta, entre outros alvos, URL HTTP(S) via Streamable HTTP, script local via stdio, servidor FastMCP em memória e configuração com vários servidores.

Exemplo com servidor MCP remoto:

```python
import asyncio

from langchain.agents import create_agent
from langchain.mcp import MCPAdapter


async def main():
    async with MCPAdapter("https://example.com/mcp") as adapter:
        tools = await adapter.list_tools()

        # Revise nomes, descrições e permissões disponíveis antes de expor ao modelo.
        agent = create_agent(
            model="openai:gpt-5.5",
            tools=tools,
            system_prompt=(
                "Ajude o usuário usando as ferramentas autorizadas. "
                "Peça confirmação antes de ações que alterem dados ou enviem conteúdo."
            ),
        )

        result = await agent.ainvoke({
            "messages": [{
                "role": "user",
                "content": "Consulte o status do pedido 123.",
            }]
        })
        print(result["messages"][-1].content)


if __name__ == "__main__":
    asyncio.run(main())
```

Troque pela URL MCP real. Revise as ferramentas descobertas; a aplicação e o servidor MCP são responsáveis pela autenticação e autorização.

Para processos locais via stdio, `MCPAdapter` aceita um `Path` para o script. Ele será iniciado como subprocesso; proteja o comando e avalie o isolamento, especialmente em serviços web.

### Mais de um servidor MCP

`MCPAdapter` aceita configuração MCP com `mcpServers`. Para endpoints remotos, cada entrada aponta para sua URL; para processos locais, define comando e argumentos. Consulte [Connections](https://docs.langchain.com/oss/python/langchain/mcp/connections) para o schema exato, autenticação, compartilhamento e ciclo de vida.

Prefira expor ao agente somente as ferramentas necessárias. Nomes prefixados por servidor ajudam a evitar colisões quando ferramentas diferentes têm o mesmo nome.

## 3. Usar API REST própria como ferramenta

Se uma API REST não expõe um servidor MCP, crie uma ferramenta LangChain pequena que chama o endpoint. Não é obrigatório colocar um servidor MCP entre aplicação e toda API.

```python
import os

import httpx
from langchain.agents import create_agent
from langchain.tools import tool


@tool
async def consultar_pedido(numero: str) -> dict:
    """Consulta o status de um pedido pelo número."""
    async with httpx.AsyncClient(timeout=10.0) as client:
        response = await client.get(
            f"{os.environ['ORDERS_API_URL']}/orders/{numero}",
            headers={"Authorization": f"Bearer {os.environ['ORDERS_API_TOKEN']}"},
        )
        response.raise_for_status()
        return response.json()


agent = create_agent(
    model="openai:gpt-5.5",
    tools=[consultar_pedido],
    system_prompt="Consulte pedidos; não altere dados.",
)
```

Em produção, valide o identificador recebido, filtre campos retornados, respeite a identidade/permissões do usuário e não devolva tokens ou dados confidenciais ao modelo.

Um agente pode combinar as ferramentas MCP e estas funções Python em `tools=[*mcp_tools, consultar_pedido]`, dentro do ciclo de vida do adapter.

## 4. Controles para uma aplicação real

- **Autenticação MCP:** configure bearer token/OAuth conforme o servidor; use credenciais por usuário quando a operação depende dos direitos individuais. Veja [Authentication](https://docs.langchain.com/oss/python/langchain/mcp/authentication).
- **Menor privilégio:** separe ferramentas de leitura e escrita e exponha somente as necessárias.
- **Aprovação humana:** use middleware/interruptos para ações de alto impacto; não dependa apenas do system prompt.
- **Validação:** valide argumentos no código da ferramenta e no serviço final; trate timeouts, erros MCP e indisponibilidade.
- **Observabilidade:** registre ferramentas chamadas, status, latência, erros e versão/configuração; evite registrar segredos ou conteúdo sensível indiscriminadamente.
- **Limites:** aplique timeouts, limites de tentativas, custo e iterações; garanta idempotência quando chamadas puderem repetir efeitos.
- **Saídas estruturadas:** quando a aplicação precisa de JSON/schema, configure `response_format` com modelo Pydantic e valide o resultado antes de consumi-lo.
- **Estado de conversa:** para histórico persistente entre turnos, configure um checkpointer e `thread_id`; memória não deve ser compartilhada sem escopo e autorização explícitos.
- **Avaliações:** mantenha exemplos representativos de tool calls, erros e ataques para testar mudanças de prompt/modelo/ferramentas.

## 5. LangChain, LangGraph e Deep Agents

| Opção | Quando começar por ela |
|---|---|
| **LangChain `create_agent`** | Agente padrão com modelo, ferramentas, prompt e middleware configurável |
| **LangGraph** | Fluxo com controle explícito de estado, etapas determinísticas e agentic, ramificações, persistência ou intervenção humana customizada |
| **Deep Agents** | Precisa de capacidades prontas para trabalho complexo, como planejamento, filesystem virtual, compactação de contexto e subagentes |

Escolha o nível de abstração mais simples que ainda deixa o comportamento e os controles claros. [Comparação oficial](https://docs.langchain.com/oss/python/langchain/overview)

## 6. Observação importante sobre versões do MCP

Em versões anteriores, muitos exemplos usam `langchain-mcp-adapters`, `MultiServerMCPClient` e `load_mcp_tools`. A documentação atual migrou essa integração para `langchain.mcp.MCPAdapter`, disponível no extra `langchain[mcp]` e em beta. A API antiga não deve ser copiada como opção padrão para projetos novos; para migração, compare imports, configuração, transporte, autenticação e tratamento de erros na [guia de migração oficial](https://docs.langchain.com/oss/python/migrate/langchain-mcp-adapters).

A integração atual documenta foco em **tools**. MCP prompts e resources não têm wrapper equivalente na API LangChain atual; se o caso depender deles, consulte as notas oficiais de MCP e use diretamente o cliente FastMCP onde necessário.

## 7. Checklist rápido

- [ ] O pacote do provedor/modelo e `OPENAI_API_KEY` (ou credencial equivalente) estão configurados fora do código?
- [ ] A versão instalada corresponde à API documentada?
- [ ] MCP usa transporte/endereço adequado e autenticação segura?
- [ ] Foram inspecionados nomes, descrições, schemas e efeitos das ferramentas descobertas?
- [ ] O agente vê somente as ferramentas necessárias para esta tarefa e usuário?
- [ ] Escritas, exclusões, publicações e chamadas caras exigem a aprovação apropriada?
- [ ] Timeouts, falhas, repetição e limites de custo foram tratados?
- [ ] A aplicação valida o resultado final e registra traces sem vazar dados sensíveis?

## Fontes oficiais

- [LangChain overview](https://docs.langchain.com/oss/python/langchain/overview)
- [LangChain agents](https://docs.langchain.com/oss/python/langchain/agents)
- [Model Context Protocol (MCP) no LangChain](https://docs.langchain.com/oss/python/langchain/mcp)
- [Connections MCP](https://docs.langchain.com/oss/python/langchain/mcp/connections)
- [Authentication MCP](https://docs.langchain.com/oss/python/langchain/mcp/authentication)
- [Migration from `langchain-mcp-adapters`](https://docs.langchain.com/oss/python/migrate/langchain-mcp-adapters)
- [LangChain models](https://docs.langchain.com/oss/python/langchain/models)

**Consultado em:** 2026-10-15.
