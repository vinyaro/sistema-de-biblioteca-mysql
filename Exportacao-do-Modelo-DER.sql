-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistema_biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `sistema_biblioteca` ;

-- -----------------------------------------------------
-- Table `sistema_biblioteca`.`LIVRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_biblioteca`.`LIVRO` (
  `ISBN` VARCHAR(13) NOT NULL,
  `Titulo` VARCHAR(255) NOT NULL,
  `AnoPublicacao` YEAR NOT NULL,
  `FK_Editora` INT NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_biblioteca`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_biblioteca`.`AUTOR` (
  `ID_Autor` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Nacionalidade` VARCHAR(50) NULL,
  `DataNascimento` DATE NULL,
  PRIMARY KEY (`ID_Autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_biblioteca`.`EDITORA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_biblioteca`.`EDITORA` (
  `ID_Editora` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Cidade` VARCHAR(80) NOT NULL,
  `Telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_Editora`),
  UNIQUE INDEX `Nome_UNIQUE` (`Nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_biblioteca`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_biblioteca`.`USUARIO` (
  `Matricula` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(150) NOT NULL,
  `Telefone` VARCHAR(15) NULL,
  `Endereco` VARCHAR(255) NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_biblioteca`.`EMPRESTIMO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_biblioteca`.`EMPRESTIMO` (
  `ID_Emprestimo` INT(11) NOT NULL AUTO_INCREMENT,
  `FK_ISBN` VARCHAR(13) NOT NULL,
  `FK_Matricula` INT NOT NULL,
  `DataEmprestimo` DATE NOT NULL,
  `DataDevolucaoPrevista` DATE NOT NULL,
  PRIMARY KEY (`ID_Emprestimo`),
  INDEX `FK_ISBN_idx` (`FK_ISBN` ASC) VISIBLE,
  INDEX `FK_Matricula_idx` (`FK_Matricula` ASC) VISIBLE,
  CONSTRAINT `FK_ISBN`
    FOREIGN KEY (`FK_ISBN`)
    REFERENCES `sistema_biblioteca`.`LIVRO` (`ISBN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Matricula`
    FOREIGN KEY (`FK_Matricula`)
    REFERENCES `sistema_biblioteca`.`USUARIO` (`Matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistema_biblioteca`.`LIVRO_AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_biblioteca`.`LIVRO_AUTOR` (
  `FKK_ISBN` VARCHAR(13) NOT NULL,
  `FK_ID_Autor` INT NOT NULL,
  PRIMARY KEY (`FKK_ISBN`, `FK_ID_Autor`),
  INDEX `FK_ID_Autor_idx` (`FK_ID_Autor` ASC) VISIBLE,
  CONSTRAINT `FKK_ISBN`
    FOREIGN KEY (`FKK_ISBN`)
    REFERENCES `sistema_biblioteca`.`LIVRO` (`ISBN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_Autor`
    FOREIGN KEY (`FK_ID_Autor`)
    REFERENCES `sistema_biblioteca`.`AUTOR` (`ID_Autor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;