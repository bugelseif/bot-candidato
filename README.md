# Bot candidatos
Este projeto te ajuda a construir um bot de cadastro de candidatos utilizando funcionalidades da BotCity, com foco em processamento de itens em lote e paralelismo de execução através do Datapool.

## Requisitos criados no Orquestrador BotCity

### [Credenciais](https://documentation.botcity.dev/pt/maestro/features/credentials/#criando-uma-credencial)
Crie as credenciais no Orquestrador seguindo as orientações da documentação acima, com as chaves e valores abaixo:
- Label:
    - `login_orangehrm`
- Segredos:
    - `username` - `Admin`
    - `password` - `admin123`

### [Datapool](https://documentation.botcity.dev/pt/maestro/features/datapool/#criando-um-datapool)
Crie um datapool no Orquestrador seguindo as orientações da documentação acima, com as informações a seguir:
- Datapool:
    - Label:
        - `dados_cadastro`
    - Nome:
        - `Dados de cadastro`
    - Status:
        - `Ativo`
    - Política de consumo:
        - `FIFO`
- Processamento:
    - Abortar em caso de erro:
        - `Habilitar` 
        - `3 erros`
    - Disparo de tarefas:
        - `Nunca disparar nova tarefa`
- Schema (como está no csv):
    - `full_name` | `TEXT` | `Exibir valor`
    - `vacancy` | `TEXT`
    - `email` | `TEXT` | `ID único`
    - `contact_number` | `TEXT`
    - `keywords` | `TEXT`

### [Log de execução](https://documentation.botcity.dev/pt/maestro/features/logs/#criando-um-log-de-execucao)
Crie o log no Orquestrador com as orientações da documentação acima, com as informações abaixo:
- Label:
    - `controle_cadastro`
- Colunas (label - nome):
    - `nome` - `Nome do candidato`
    - `status` - `Status do cadastro`

### [Carregar itens](https://documentation.botcity.dev/pt/maestro/features/datapool/#adicionando-itens-atraves-de-um-arquivo-csv)

Uma das formas de carregar itens para o Datapool é fazer upload, diretamente no Orquestrador, de um arquivo `.csv`.

- Seguindo as orientações na documentação, carregue os itens no Datapool `dados_cadastro` com base no arquivo `candidatos.csv` que está na pasta `resources`.

### [Build e Deploy](https://documentation.botcity.dev/pt/maestro/features/easy-deploy/)
Seguindo as orientações na documentação acima:
- Faça o build executando o arquivo `build.xxx` que está na raiz do projeto.
- Faça o deploy na plataforma BotCity.

---

## Para testes locais
Você pode fazer a execução do código localmente no seu computador. Para isso, é necessário fazer algumas configurações descritas nos passos a seguir.

### Refatoração
Para executar localmente, é necessário refatorar o código para que ele possa se comunicar com o Orquestrador BotCity.

#### [Método login](https://documentation.botcity.dev/pt/maestro/maestro-sdk/setup/#utilizando-as-informacoes-do-workspace)

Adicionar no início do seu código, as seguintes linhas:

```python
    maestro.login(
        server="https://developers.botcity.dev", 
        login="...", 
        key="..."
    )
```

- Login:
    - [`**encontra em Amb. de Desenvolvedor**`](https://developers.botcity.dev/dev)
- Key:
    - [`**encontra em Amb. de Desenvolvedor**`](https://developers.botcity.dev/dev)
 
Se houver dúvidas de como pegar as informações de Login e Key, acesse a [documentação](https://documentation.botcity.dev/pt/maestro/features/dev-environment/).
OBS: Antes de fazer o deploy do seu bot no Orquestrador, você pode tirar esse trecho de código, pois ele não será necessário.

#### [Criar tarefa](https://documentation.botcity.dev/pt/maestro/features/new-task/)

Adicionar as seguintes linhas:

```python
execution = maestro.get_execution("12345")
execution.task_id = "12345"
```

O número `12345` é referente ao id da tarefa foi criada no Orquestrador BotCity, deve ter o status `Aguardando`.


### Crie e ative um ambiente virtual

   Para garantir que as dependências do projeto sejam isoladas de outros projetos Python, é recomendado usar um ambiente virtual.

   - No macOS/Linux:

     ```bash
     python3 -m venv venv
     source venv/bin/activate
     ```

   - No Windows:

     ```bash
     python -m venv venv
     venv\Scripts\activate
     ```

### Instalação de Dependências

Instale as dependências do projeto com o seguinte comando:

```bash
python -m pip install -r requirements.txt
```

### Executa o arquivo principal

```bash
python bot.py
```
