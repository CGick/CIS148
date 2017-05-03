-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema brewery_db
-- -----------------------------------------------------
DROP TABLE IF EXISTS brewery_db
-- -----------------------------------------------------
-- Schema brewery_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `brewery_db` DEFAULT CHARACTER SET utf8 ;
USE `brewery_db` ;

-- -----------------------------------------------------
-- Table `brewery_db`.`place_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`place_types` (
  `place_type_id` INT NOT NULL AUTO_INCREMENT,
  `place_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`place_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`places` (
  `place_id` INT NOT NULL AUTO_INCREMENT,
  `place_type` INT NOT NULL,
  `place_name` VARCHAR(50) NOT NULL,
  `address_line1` VARCHAR(50) NOT NULL,
  `address_line2` VARCHAR(50) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zip_code` INT NOT NULL,
  PRIMARY KEY (`place_id`),
  INDEX `fk_place_type_idx` (`place_type` ASC),
  CONSTRAINT `fk_place_type`
    FOREIGN KEY (`place_type`)
    REFERENCES `brewery_db`.`place_types` (`place_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`locations` (
  `place_id` INT NOT NULL,
  `lat` DECIMAL(6,4) NOT NULL,
  `long` DECIMAL(7,4) NOT NULL,
  INDEX `fk_place_id_idx` (`place_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`drinks` (
  `drink_id` INT NOT NULL AUTO_INCREMENT,
  `maker_id` INT NOT NULL,
  `drink_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`drink_id`),
  INDEX `fk_maker_idx` (`maker_id` ASC),
  CONSTRAINT `fk_maker`
    FOREIGN KEY (`maker_id`)
    REFERENCES `brewery_db`.`places` (`place_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`drink_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`drink_types` (
  `drink_type_id` INT NOT NULL AUTO_INCREMENT,
  `drink_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`drink_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`server_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`server_types` (
  `serve_type_id` INT NOT NULL AUTO_INCREMENT,
  `serve_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`serve_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`places_drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`places_drinks` (
  `place_id` INT NOT NULL,
  `drink_id` INT NOT NULL,
  `serve_type` INT NULL,
  `price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`place_id`, `drink_id`),
  INDEX `fk_drink_id_idx` (`drink_id` ASC),
  INDEX `fk_server_type_idx` (`serve_type` ASC),
  CONSTRAINT `fk_place_id`
    FOREIGN KEY (`place_id`)
    REFERENCES `brewery_db`.`places` (`place_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drink_id`
    FOREIGN KEY (`drink_id`)
    REFERENCES `brewery_db`.`drinks` (`drink_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_server_type`
    FOREIGN KEY (`serve_type`)
    REFERENCES `brewery_db`.`server_types` (`serve_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery_db`.`drink_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brewery_db`.`drink_status` (
  `drink_id` INT NOT NULL,
  `drink_type_id` INT NOT NULL,
  `drink_abv` DECIMAL(5,2) NULL,
  `drink_ibu` INT NULL,
  `drink_variation` VARCHAR(45) NULL,
  INDEX `fk_drink_id_idx` (`drink_id` ASC),
  INDEX `fk_drink_type_idx` (`drink_type_id` ASC),
  CONSTRAINT `fk_drink_id`
    FOREIGN KEY (`drink_id`)
    REFERENCES `brewery_db`.`drinks` (`drink_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drink_type`
    FOREIGN KEY (`drink_type_id`)
    REFERENCES `brewery_db`.`drink_types` (`drink_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
