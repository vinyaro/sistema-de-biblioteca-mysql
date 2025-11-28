-- 1. DESLIGAR VERIFICAÇÕES (Boas Práticas do Workbench)
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- 2. CRIAÇÃO DO ESQUEMA/DATABASE
CREATE SCHEMA IF NOT EXISTS `sistema_biblioteca` DEFAULT CHARACTER SET utf8;

-- 3. COMANDO PARA SELECIONAR O BANCO DE DADOS
USE `sistema_biblioteca`;

-- Inserção de dados na EDITORA
INSERT INTO EDITORA (Nome, Cidade, Telefone) VALUES
('Círculo de Rimas', 'Lisboa', '(351) 2111-2345'),
('Versos Dourados', 'Rio de Janeiro', '(21) 98765-4321'),
('Albatroz Poesias', 'São Paulo', '(11) 99887-7665'),
('Lira Moderna', 'Porto Alegre', '(51) 98877-6655'),
('Odes Eternas', 'Belo Horizonte', '(31) 97766-5544');

-- Inserção de dados na AUTOR
INSERT INTO AUTOR (Nome, Nacionalidade, DataNascimento) VALUES
('Fernando Pessoa', 'Português', '1888-06-13'),
('Manoel de Barros', 'Brasileiro', '1916-12-19'),
('Carlos Drummond de Andrade', 'Brasileiro', '1902-10-31'),
('Cecília Meireles', 'Brasileira', '1901-11-07'),
('Mário de Andrade', 'Brasileiro', '1893-10-09');

-- Inserção de dados na LIVRO
INSERT INTO LIVRO (ISBN, Titulo, AnoPublicacao, FK_Editora) VALUES
('9788574404391', 'Obra Poética', 2018, 1), -- Fernando Pessoa
('9788528616238', 'Livro Sobre Nada', 2013, 2), -- Manoel de Barros
('9788535904949', 'Alguma Poesia', 2004, 3), -- Carlos Drummond de Andrade
('9788572328107', 'Ou Isto ou Aquilo', 2002, 4), -- Cecília Meireles
('9788532514168', 'Pauliceia Desvairada', 2017, 5); -- Mário de Andrade

-- Inserção de dados na USUARIO
INSERT INTO USUARIO (Matricula, Nome, Email, Telefone, Endereco) VALUES
(2024954213, 'Maria da Silva', 'maria.s@tecnico.com', '(31) 98765-1234', 'Rua das Flores, 100, Centro'),
(2024954214, 'João dos Santos', 'joao.s@tecnico.com', '(31) 99876-5432', 'Av. Tiradentes, 55, Funcionários'),
(2024954215, 'Ana Oliveira', 'ana.o@tecnico.com', '(31) 97777-8888', 'Alameda dos Anjos, 21, Savassi'),
(2024954216, 'Pedro Souza', 'pedro.s@tecnico.com', '(31) 96666-7777', 'Praça da Liberdade, 30, Centro'),
(2024954217, 'Camila Pereira', 'camila.p@tecnico.com', '(31) 95555-6666', 'Rua do Ouro, 45, Bairro Novo');

-- Inserção de dados na LIVRO_AUTOR
INSERT INTO LIVRO_AUTOR (FKK_ISBN, FK_ID_Autor) VALUES
('9788574404391', 1), -- Obra Poética (Pessoa)
('9788528616238', 2), -- Livro Sobre Nada (Barros)
('9788535904949', 3), -- Alguma Poesia (Drummond)
('9788572328107', 4), -- Ou Isto ou Aquilo (Meireles)
('9788532514168', 5), -- Pauliceia Desvairada (Andrade)
('9788574404391', 5); -- Obra Poética (Co-autoria com Mário de Andrade)

-- Inserção de dados na EMPRESTIMO
INSERT INTO EMPRESTIMO (FK_ISBN, FK_Matricula, DataEmprestimo, DataDevolucaoPrevista) VALUES
('9788535904949', 2024954213, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY)),
('9788528616238', 2024954214, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY)),
('9788574404391', 2024954215, '2025-11-01', '2025-11-16'),
('9788532514168', 2024954216, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY)),
('9788572328107', 2024954213, '2025-11-15', '2025-11-30');

-- Comandos DESCRIBE
DESCRIBE EDITORA;
DESCRIBE AUTOR;
DESCRIBE LIVRO;
DESCRIBE USUARIO;
DESCRIBE LIVRO_AUTOR;
DESCRIBE EMPRESTIMO;

-- RELIGAR VERIFICAÇÕES (Boas Práticas do Workbench) 
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;