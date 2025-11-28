# 📚 Sistema de Gerenciamento de Biblioteca em MySQL

Este repositório contém o projeto final da disciplina de **Banco de Dados** (COLTEC-UFMG), focando na aplicação prática dos conceitos de Modelagem Entidade-Relacionamento (DER), DDL (Data Definition Language) e DML (Data Manipulation Language) utilizando o **MySQL Workbench 8.0**.

---

## 🎯 Objetivo do Projeto

O objetivo principal foi desenvolver e implementar um pequeno sistema de gerenciamento de biblioteca capaz de registrar livros, autores, editoras e controlar empréstimos.

### ⚙️ Tecnologias Utilizadas

* **Banco de Dados:** MySQL
* **Ferramenta de Modelagem e Gerenciamento:** MySQL Workbench 8.0
* **Linguagem:** SQL

---

## 🏗️ Estrutura do Banco de Dados

O banco de dados é nomeado `sistema_biblioteca` e foi modelado com as seguintes entidades principais, cumprindo o requisito de **pelo menos 3 entidades** e relacionamentos complexos (1:N e N:M).

### Entidades e Relacionamentos Chave

| Entidade | Chave Primária | Relacionamentos | Detalhes |
| :--- | :--- | :--- | :--- |
| **LIVRO** | `ISBN` | 1:N com **EDITORA** | Títulos de poetas luso-brasileiros. |
| **AUTOR** | `ID_Autor` | N:M com **LIVRO** | Resolução através da tabela associativa `LIVRO_AUTOR`. |
| **USUARIO** | `Matricula` | N:M com **LIVRO** | Resolução através da tabela associativa `EMPRESTIMO`. |
| **EDITORA** | `ID_Editora` | 1:N com **LIVRO** | Editoras fictícias com tema poético. |

---

## 💾 Conteúdo do Repositório

O repositório está estruturado em torno dos **três arquivos SQL principais** que contêm a solução completa para as Partes 1, 2 e 3 do trabalho:

### `Exportacao-do-Modelo-DER.sql`
Contém o DDL (Data Definition Language) gerado diretamente do MySQL Workbench. Ele inclui os comandos CREATE TABLE com todas as definições de Chaves Primárias (PKs) e Chaves Estrangeiras (FKs), representando a Parte 1 (Modelagem). Este script garante que a estrutura criada seja fiel ao Diagrama Entidade-Relacionamento (DER).

### `trabalho_final.sql`
Este é o script completo de implementação. Ele combina o DDL com o DML (Data Manipulation Language). É o arquivo principal para execução, contendo:

Este arquivo está organizado sequencialmente para execução direta no MySQL Workbench:

1.  **Criação do Schema:** `CREATE SCHEMA` e `USE sistema_biblioteca`.
2.  **DML (Manipulação de Dados):** Comandos `INSERT INTO` com **mais de 5 registros** por tabela, usando dados temáticos (poetas luso-brasileiros).
3.  **Verificação:** Comandos `DESCRIBE` para exibir a estrutura das tabelas.

### `parte3-ConsultaSQL.sql`
Contém exclusivamente as consultas solicitadas na Parte 3 do trabalho. Este arquivo inclui:
- A consulta SELECT * FROM ....
- A consulta com condição (WHERE).
- A consulta com junção (JOIN).
- A consulta com função de agregação (COUNT, SUM, etc.).
- A consulta avançada para demonstrar a co-autoria.

---

## 🔎 Exemplos de Consultas SQL (Parte 3)

As seguintes consultas foram desenvolvidas e estão presentes no arquivo `.sql`:

| Tipo de Consulta | Objetivo | Exemplo no Arquivo |
| :--- | :--- | :--- |
| **SELECT Simples** | Listar todos os registros. | `SELECT * FROM LIVRO;` |
| **WHERE (Condição)** | Encontrar empréstimos atrasados. | `WHERE DataDevolucaoPrevista < CURDATE()` |
| **JOIN (N:M)** | Mostrar Título do Livro e Nome do(s) Autor(es). | `INNER JOIN LIVRO_AUTOR ...` |
| **Agregação (COUNT)** | Contar o número de livros por nacionalidade. | `COUNT(...) GROUP BY A.Nacionalidade` |
| **Avançada (Co-autoria)**| Identificar livros escritos por Mário de Andrade E Fernando Pessoa. | `HAVING COUNT(DISTINCT A.ID_Autor) = 2` |

---

## 🧑‍💻 Autor

Este projeto foi desenvolvido por:
* [**Github @vinyaro**](https://github.com/vinyaro)
* [**Medium @vinyaro**](https://medium.com/@vinyaro)
---
