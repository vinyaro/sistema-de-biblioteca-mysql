-- Parte 3

USE  `sistema_biblioteca`

-- Requisito 1: SELECT * FROM ... (Listar todos os livros)
SELECT * FROM LIVRO;

-- Requisito 2: Consulta com Condição (WHERE) - Empréstimos Atrasados
SELECT ID_Emprestimo, FK_Matricula, DataDevolucaoPrevista
FROM EMPRESTIMO
WHERE DataDevolucaoPrevista < CURDATE();

-- Requisito 3: Consulta com Junção (JOIN) - Livro e seus Autores
SELECT 
    L.Titulo,
    A.Nome AS Nome_Autor
FROM LIVRO L
INNER JOIN LIVRO_AUTOR LA ON L.ISBN = LA.FKK_ISBN
INNER JOIN AUTOR A ON LA.FK_ID_Autor = A.ID_Autor
ORDER BY L.Titulo;

-- Requisito 4: Consulta com Agregação (COUNT) - Livros por Nacionalidade
SELECT
    A.Nacionalidade,
    COUNT(LA.FK_ISBN) AS Total_Livros_Cadastrados
FROM AUTOR A
INNER JOIN LIVRO_AUTOR LA ON A.ID_Autor = LA.FK_ID_Autor
GROUP BY A.Nacionalidade;

-- Consulta para identificar especificamente o(s) livro(s) em co-autoria entre Mário de Andrade e Fernando Pessoa
SELECT
    L.Titulo,
    GROUP_CONCAT(A.Nome SEPARATOR ' e ') AS Autores_Confirmados
FROM LIVRO L
INNER JOIN LIVRO_AUTOR LA ON L.ISBN = LA.FKK_ISBN
INNER JOIN AUTOR A ON LA.FK_ID_Autor = A.ID_Autor
WHERE 
    A.Nome IN ('Mário de Andrade', 'Fernando Pessoa')
GROUP BY 
    L.Titulo
HAVING 
    COUNT(DISTINCT A.ID_Autor) = 2; -- Filtra apenas livros que têm exatamente estes 2 autores