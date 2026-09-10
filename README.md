# 📊 Data Warehouse de Commodities

Projeto desenvolvido para estudar e praticar conceitos de **Engenharia de Dados**, com foco na construção de um **Data Warehouse de commodities**, utilizando **Python, PostgreSQL, dbt e Streamlit**.

O projeto implementa um pipeline de dados que realiza a **extração de dados de mercado**, o carregamento em um banco PostgreSQL e a transformação dos dados por meio de diferentes camadas de modelagem, disponibilizando os dados tratados para análise e visualização.

> **Objetivo:** desenvolver conhecimentos práticos em pipelines de dados, modelagem e transformação utilizando dbt e arquitetura em camadas.

---

## 🛠️ Tecnologias utilizadas

* **Python** — extração e carregamento dos dados
* **yfinance** — acesso aos dados históricos do Yahoo Finance
* **PostgreSQL** — armazenamento dos dados
* **dbt (Data Build Tool)** — transformação e modelagem dos dados
* **Streamlit** — construção do dashboard
* **Pandas** — manipulação dos dados
* **SQLAlchemy** — conexão entre Python e PostgreSQL

---

# 📁 Estrutura do Projeto

## 1. Extract & Load

A etapa de **Extract & Load** é responsável por obter os dados históricos das commodities a partir do **Yahoo Finance** utilizando a biblioteca `yfinance` e carregá-los no PostgreSQL.

O script `extract_load.py`:

1. Consulta os dados históricos das commodities;
2. Seleciona os valores de fechamento (`Close`);
3. Identifica cada commodity pelo seu símbolo;
4. Carrega os dados no banco de dados PostgreSQL.

Atualmente, são utilizadas as seguintes commodities:

* `CL=F` — Petróleo (Crude Oil)
* `GC=F` — Ouro (Gold)
* `SI=F` — Prata (Silver)

Para executar a etapa de extração e carregamento:

```bash
python src/extract_load.py
```

---

## 2. Seeds

Os **Seeds** do dbt são utilizados para carregar dados de movimentações de commodities a partir de arquivos CSV para o Data Warehouse.

Esses dados representam operações de compra e venda e servem como uma das fontes utilizadas na construção dos modelos analíticos.

Para carregar os Seeds:

```bash
dbt seed
```

---

## 3. Models

Os **Models** do dbt são responsáveis pela transformação e organização dos dados.

A modelagem utiliza duas camadas principais:

```text
Raw
 │
 ▼
Silver
 │
 ▼
Gold
```

### 🥈 Silver

A camada **Silver** é responsável pelo tratamento e preparação dos dados.

Nessa etapa são realizadas transformações como:

* limpeza dos dados;
* padronização dos campos;
* organização das informações;
* preparação dos dados para as análises posteriores.

#### `silver_commodities.sql`

Responsável por tratar e estruturar os dados de commodities extraídos do Yahoo Finance.

#### `silver_movimentacao_commodities.sql`

Responsável por tratar e estruturar os dados de movimentações de commodities carregados por meio dos Seeds.

---

### 🥇 Gold

A camada **Gold** contém os dados preparados para consumo analítico.

#### `gold_commodities.sql`

Integra os dados de commodities e suas movimentações, criando um modelo final destinado às análises e à visualização no dashboard.

---

## 4. Dashboard

O projeto possui um dashboard desenvolvido com **Streamlit**, permitindo visualizar os dados tratados e realizar análises sobre as commodities e suas movimentações.

O dashboard utiliza os dados disponibilizados pela camada **Gold** do Data Warehouse.

Para executar:

```bash
streamlit run dashboard.py
```

---

# 🚀 Como executar o projeto

### 1. Clone o repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd commodities-datawarehouse
```

### 2. Crie e ative um ambiente virtual

```bash
python -m venv .venv
```

No Windows:

```bash
.venv\Scripts\activate
```

### 3. Instale as dependências

```bash
pip install -r requirements.txt
```

### 4. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto contendo as credenciais de conexão com o PostgreSQL:

```env
DB_HOST_PROD=
DB_PORT_PROD=
DB_NAME_PROD=
DB_USER_PROD=
DB_PASSWORD_PROD=
DB_SCHEMA_PROD=
```

> **Importante:** não compartilhe o arquivo `.env` nem suas credenciais. Recomenda-se adicioná-lo ao `.gitignore`.

### 5. Execute a extração e o carregamento

```bash
python src/extract_load.py
```

### 6. Execute os Seeds

```bash
dbt seed
```

### 7. Execute os modelos do dbt

```bash
dbt run
```

### 8. Execute o dashboard

```bash
streamlit run dashboard.py
```

---

# 📌 Observações

Este projeto foi desenvolvido principalmente como **projeto de estudo**, com o objetivo de consolidar conhecimentos sobre:

* pipelines de dados;
* processos de Extract & Load;
* Data Warehouse;
* PostgreSQL;
* modelagem de dados;
* arquitetura em camadas;
* dbt;
* transformação de dados com SQL;
* visualização e análise de dados.

Por se tratar de um projeto de aprendizado, a implementação possui uma estrutura simplificada e um volume reduzido de dados.

O projeto foi desenvolvido acompanhando como referência o seguinte conteúdo:

**Tutorial utilizado como referência:**
https://www.youtube.com/watch?v=n3R0c2ZB6BQ&t=8015s
