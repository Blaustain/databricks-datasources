<br>

<div align="center" style="border: 2px solid #000000; padding: 20px; background-color: #fff5f5;">
  <img src="images/academy.png" alt="Indicium Academy Logo" width="200"/>
</div>

<div align="center" style="border: 3px solid #ff4d4d; padding: 5px; background-color: #fff5f5;">
<br>
  <h1 style="color: #ff4d4d">⚠️ ATENÇÃO: ESTE É UM REPOSITÓRIO PÚBLICO ⚠️</h1>
</div>

# Todo o conteúdo presente neste repositório é de acesso público. Não adicione informações sensíveis, chaves de acesso, senhas ou quaisquer outros dados confidenciais

## Visão Geral

Bem-vindo(a)!

Este repositório é o ponto de partida para as nossas aulas práticas. Ele contém o código necessário para criar em seu ambiente Databricks as tabelas e os dados que serão utilizados ao longo do curso.

O objetivo é simples: rodar um único notebook que irá gerar automaticamente todas as bases de dados necessárias para os exercícios.

## Pré-requisitos

Antes de começar, você precisa apenas de acesso a um workspace [Databricks Free Edition](https://docs.databricks.com/aws/en/getting-started/free-edition).

## Tutorial: Configurando o Repositório no Databricks (Git Folders)

Para ter acesso aos arquivos do curso, vamos clonar este repositório diretamente para dentro do seu Databricks. Siga os passos abaixo com atenção:

**Acesse a Seção de Repositórios:**

1. No menu lateral esquerdo do Databricks, clique em **+ New**

2. Dentro dele, clique em **More**

3. E, por fim, clique em **Git folder**.

    ![Git folder UI](images/git_folder.png)

**Adicione um Novo Repositório:**

1. **Preencha a URL do Repositório:**
    No campo **URL do repositório Git (Git repository URL)**, cole a seguinte URL:
    ```
    https://bitbucket.org/indiciumtech/databricks-datasources.git
    ```
    O campo "Nome do repositório" (Git folder name) será preenchido automaticamente como `databricks-datasources`. Mantenha o provedor Git como "Bitbucket".

2. **Clone o Repositório:**
    Clique no botão azul **Criar Repositório (Create Git folder)**. O Databricks irá se conectar ao Bitbucket e baixar todos os arquivos.

![Git Folder Creation](images/folder_creation.png)

Pronto! Agora você deve ver a pasta `databricks-datasouces` no seu workspace.

![Workspace Folders](images/workspace.png)

## Como Gerar as Tabelas

Se você é aluno do curso `Formação em Engenharia de Analytics` [clique aqui](./fea/README.md)

Se você é aluno do curso `Formação em Análise de Dados` [clique aqui](./fada/README.md)
