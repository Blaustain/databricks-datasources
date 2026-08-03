# Adventure Works Analytics Engineering

## Objetivo

Projeto de Engenharia Analítica desenvolvido utilizando dbt Cloud e Databricks para transformar os dados do Adventure Works em um modelo dimensional (Star Schema) destinado ao consumo pelo Power BI.

## Tecnologias

- Databricks
- dbt Cloud
- GitHub
- Power BI

## Arquitetura

```
RAW
        │
        ▼
STAGING
        │
        ▼
INTERMEDIATE
        │
        ▼
MARTS
        │
        ▼
POWER BI
```

## Estrutura

```
models/

staging/

intermediate/

marts/

dimensions/

facts/
```

## Dimensões

- dim_cliente

- dim_produto

- dim_data

- dim_localizacao

- dim_cartao

- dim_motivo_venda

## Fato

- fct_vendas

## Testes

- Unique

- Not Null

- Relationships

- Source Tests

- Business Tests

## Gerar documentação

dbt docs generate

## Visualizar documentação

dbt docs serve

## Executar projeto

dbt run

## Executar testes

dbt test

Nome: Samuel Souza.
Graduando: Engenharia da Computação (Univesp)
