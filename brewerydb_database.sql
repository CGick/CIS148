-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema brewery_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `brewery_db` ;

-- -----------------------------------------------------
-- Schema brewery_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `brewery_db` DEFAULT CHARACTER SET utf8 ;
USE `brewery_db` ;

-- -----------------------------------------------------
-- Table `place_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `place_types` (
  `place_type_id` INT NOT NULL AUTO_INCREMENT,
  `place_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`place_type_id`))
ENGINE = InnoDB;

-- Add data to Place_Type table

INSERT INTO place_types(place_type_dscp)
VALUES('Brewery'),
	  ('Bars'),
      ('Winery'),
      ('Store')


-- -----------------------------------------------------
-- Table `places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `places` (
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
    REFERENCES `place_types` (`place_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Add data to Places table

INSERT INTO places(place_type, place_name, address_line1, address_line2, city, state, zip_code)
VALUES
	(1, 'Dog Beverage Company', '1203 New Windsor Rd', 'Westminster', 'MD', 21158)


-- -----------------------------------------------------
-- Table `locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locations` (
  `place_id` INT NOT NULL,
  `lat` DECIMAL(6,4) NOT NULL,
  `long` DECIMAL(7,4) NOT NULL,
  INDEX `fk_place_id_idx` (`place_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drinks` (
  `drink_id` INT NOT NULL AUTO_INCREMENT,
  `maker_id` INT NOT NULL,
  `drink_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`drink_id`),
  INDEX `fk_maker_idx` (`maker_id` ASC),
  CONSTRAINT `fk_maker`
    FOREIGN KEY (`maker_id`)
    REFERENCES `places` (`place_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drink_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drink_types` (
  `drink_type_id` INT NOT NULL AUTO_INCREMENT,
  `drink_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`drink_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `server_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `server_types` (
  `serve_type_id` INT NOT NULL AUTO_INCREMENT,
  `serve_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`serve_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `places_drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `places_drinks` (
  `place_id` INT NOT NULL,
  `drink_id` INT NOT NULL,
  `serve_type` INT NULL,
  `price` DECIMAL(6,2) NULL,
  PRIMARY KEY (`place_id`, `drink_id`),
  INDEX `fk_drink_id_idx` (`drink_id` ASC),
  INDEX `fk_server_type_idx` (`serve_type` ASC),
  CONSTRAINT `fk_place_id`
    FOREIGN KEY (`place_id`)
    REFERENCES `places` (`place_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drink_id`
    FOREIGN KEY (`drink_id`)
    REFERENCES `drinks` (`drink_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_server_type`
    FOREIGN KEY (`serve_type`)
    REFERENCES `server_types` (`serve_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drink_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drink_status` (
  `drink_id` INT NOT NULL,
  `drink_type_id` INT NOT NULL,
  `drink_abv` DECIMAL(5,2) NULL,
  `drink_ibu` INT NULL,
  `drink_variation` VARCHAR(45) NULL,
  INDEX `fk_drink_id_idx` (`drink_id` ASC),
  INDEX `fk_drink_type_idx` (`drink_type_id` ASC),
  CONSTRAINT `fk_drink_id`
    FOREIGN KEY (`drink_id`)
    REFERENCES `drinks` (`drink_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drink_type`
    FOREIGN KEY (`drink_type_id`)
    REFERENCES `drink_types` (`drink_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
