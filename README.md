# API_4_BD
Referente ao Banco de Dados da API do quarto semestre da FATEC

# Modelo

![Modelo do banco de dados](./modelo/Modelo.png)

# Diretórios

* `./modelo` - Pasta da imagem do modelo de dados
* `./sql` - Pasta do arquvio .sql com o código do banco

# Dicionário de Dados

<details>
<summary>Usuario</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação do usuário |
| nome | VARCHAR | 100 | NOT NULL | N/A | Nome do usuário |
| email | VARCHAR | 180 | NOT NULL | N/A | Email do usuário |
| senha | VARCHAR | 180 | NOT NULL | N/A | Senha do usuário |

</details>

<details>
<summary>Estacao</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação da estação |
| nome | VARCHAR | 180 | NOT NULL | N/A | Nome da estação |
| endereco | VARCHAR | 200 | NOT NULL | N/A | Endereco da estação |
| latitude | DECIMAL  | (3, 6) | NOT NULL | N/A | Latitude da estação |
| longitude | DECIMAL  | (3, 6) | NOT NULL | N/A | Longitude da estação |
| mac_address | VARCHAR | 20 | NOT NULL | N/A | Mac address da estação |

</details>

<details>
<summary>Unidade_Medida</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação da unidade de medida |
| nome | VARCHAR | 100 | NOT NULL | N/A | Nome da unidade de medida |

</details>

<details>
<summary>Tipo_Parametro</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação do tipo do parâmetro |
| id_unidade | INT | Default | FK, NOT NULL | IDENTITY | Número de identificação da unidade de medida |
| nome | VARCHAR | 100 | NOT NULL | N/A | Nome do tipo do parâmetro |
| fator | DECIMAL  | (100, 10) | NOT NULL | N/A | Fator do tipo do parâmetro |
| offset | DECIMAL  | (100, 10) | NOT NULL | N/A | Offset do tipo do parâmetro |
| nome_json | VARCHAR | 180 | NOT NULL | N/A | Nome do json do tipo do parâmetro |

</details>

<details>
<summary>Parametro</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação do parâmetro |
| id_estacao | INT | Default | FK, NOT NULL | IDENTITY | Número de identificação da estação |
| id_tipo | INT | Default | FK, NOT NULL | IDENTITY | Número de identificação do tipo do parâmetro |

</details>

<details>
<summary>Condicao</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação da condição |
| valor | VARCHAR | 4 | NOT NULL | N/A | Valor da condição |

</details>

<details>
<summary>Alerta</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação do alerta |
| id_condicao | INT | Default | FK, NOT NULL | IDENTITY | Número de identificação da condição |
| id_parametro | INT | Default | FK, NOT NULL | IDENTITY | Número de identificação do parâmetro |
| nome | VARCHAR  | 100 | NOT NULL | N/A | Nome do alerta |
| valor | DECIMAL  | (100, 10) | NOT NULL | N/A | Valor do alerta |

</details>

<details>
<summary>Ocorrencia</summary>

| Colunas | Tipo de dados | Comprimento | Restrições | Valor padrão | Descrição |
|:-:|:-:|:-:|:-:|:-:|:-:|
| id | INT | Default | PK, NOT NULL | IDENTITY | Número de identificação da ocorrência |
| id_alerta | INT | Default | FK, NOT NULL | IDENTITY | Número de identificação do alerta |
| data_hora | TIMESTAMP | 100 | NOT NULL | N/A | Data e hora da ocorrência |
| valor | DECIMAL  | (100, 10) | NOT NULL | N/A | Valor da ocorrência |

</details>

## Descrição das branches
Cada branch é referente a uma tarefa ou um conjunto de tarefas.

- X: Exemplo - Responsável

## Padrão de branch
"Task-{numero da tarefa referente a branch}"

"Task-1"    
"Task-2"

## Padrão de Commit
"{numero da tarefa referente a branch} - {descrição do que fez}"    
"{tipo de commit}: {descrição do que fez}"

"1.1 - Adição da rota de cadastro de ativo"     
"fix: Correção na exibição do elemento X"

### Tipos de Commit

* fix - Indica que o trecho de código commitado está solucionando um problema ou bug.
* docs - Indica que houveram mudanças na documentação.
* test - Indica que houveram alterações criando, alterando ou excluindo testes;
* build - Indica que houveram alterações relacionadas a build do projeto/dependências.
* refactor - Indica que uma parte do código foi refatorada sem alterar nenhuma funcionalidade.
* ci - Indica mudanças relacionadas a integração contínua (Continuous Integration).
* cleanup - Indica a remoção de código comentado ou trechos desnecessários no código-fonte.
* remove - Indica a exclusão de arquivos, diretórios ou funcionalidades obsoletas ou não utilizadas.
