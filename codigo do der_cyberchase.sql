-- MySQL Script generated by MySQL Workbench
-- Thu Mar 13 21:07:01 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_cyber_chase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_cyber_chase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_cyber_chase` DEFAULT CHARACTER SET utf8 ;
USE `db_cyber_chase` ;

-- -----------------------------------------------------
-- Table `db_cyber_chase`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cyber_chase`.`tb_usuarios` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(500) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `db_cyber_chase`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cyber_chase`.`tb_temas` (
  `category_id` INT NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `db_cyber_chase`.`tb_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_cyber_chase`.`tb_cursos` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `introducao` VARCHAR(1000) NOT NULL,
  `desenvolvimento` VARCHAR(1000) NOT NULL,
  `conclusao` VARCHAR(1000) NOT NULL,
  `foto` VARCHAR(500) NULL,
  `data` DATE NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_temas_category_id` INT NOT NULL,
  `tb_usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_cursos_tb_temas_idx` (`tb_temas_category_id` ASC) VISIBLE,
  INDEX `fk_tb_cursos_tb_usuarios1_idx` (`tb_usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos_tb_temas`
    FOREIGN KEY (`tb_temas_category_id`)
    REFERENCES `db_cyber_chase`.`tb_temas` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cursos_tb_usuarios1`
    FOREIGN KEY (`tb_usuarios_id`)
    REFERENCES `db_cyber_chase`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
