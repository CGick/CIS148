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

-- ------------------------------------------------------
-- Insert data into Place_Type table
-- ------------------------------------------------------
INSERT INTO place_types(place_type_id, place_type_dscp)
VALUES(1, 'Brewery'),
	  (2, 'Bars'),
      (3, 'Winery'),
      (4, 'Store')


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

-- ------------------------------------------------------
-- Insert data into Places table
-- ------------------------------------------------------
INSERT INTO 
	places(place_id, place_type, place_name, address_line1, address_line2, city, state, zip_code)
VALUES
    (1, 1, 'Jailbreak Brewing Company', '9445 Washington Blvd N', 'STE F', 'Laurel', 'MD', 20723),
    (2, 1, 'Appalachian Brewing Company', '70 Presidential Circle', NULL, 'Gettysburg', 'PA', 17325),
    (3, 1, 'Forge Brew Works', '8532 Terminal Rd', 'Ste. LMN', 'Lorton', 'Virginia', 22079),
    (4, 3, 'Old Westminster Winery & Vineyard', '1550 Old Westminster Rd', NULL, 'Westminster', 'MD', 21157),
    (5, 3, 'Allegro Vineyards & Winery', '3475 Sechrist Rd', NULL, 'Brogue', 'PA', 17309),
    (6, 3, 'Pearmund Cellars', '6190 Georgetown Rd', NULL, 'Broad Run', 'VA', 20137),
    (7, 2, 'The Owl Bar', '1 E Chase St', NULL, 'Baltimore', 'MD', 21202),
    (8, 2, 'Water Way Bar & Grill', '220 West Philadelphia Street', NULL, 'York', 'PA', 17401),
    (9, 2, 'Screwtop Wine Bar', '1025 North Filmore Street', NULL, 'Arlington', 'VA', 22201),
    (10, 4, '', '', NULL, '', '', ),
    (11, 4, '', '', NULL, '', '', ),
    (12, 4, '', '', NULL, '', '', )


-- -----------------------------------------------------
-- Table `locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locations` (
  `place_id` INT NOT NULL,
  `lat` DECIMAL(6,4) NOT NULL,
  `long` DECIMAL(7,4) NOT NULL,
  INDEX `fk_place_id_idx` (`place_id` ASC))
ENGINE = InnoDB;

-- ------------------------------------------------------
-- Insert data into locations
-- ------------------------------------------------------
INSERT INTO 
	locations(place_id, lat, long)
VALUES
    (1, 39.1241, -76.8230),
    (2, 39.8426, -77.1919),
    (3, 38.7275, -77.1974)
    (4, 39.5319, -77.0342),
    (5, 39.8437, -76.4767),
    (6, 38.7834, -77.7390),
    (7, 39.3023, -76.6155),
    (8, 39.9621, -76.7335),
    (9, 38.8854, -77.0927),
    (10, , ),
    (11, , ),
    (12, , ),


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
-- Insert data into drinks
-- -----------------------------------------------------
INSERT INTO 
	drinks(drink_id, maker_id, drink_name)
VALUES
	(1, 4, '2014 Anthem'),
    (2, 4, '2015 Chardonnay'),
    (3, 4, '2014 Farmer Fizz'),
    (4, 4, 'Revelry, Second Edition'),
    (5, 4, 'Greenstone, Third Edition'),
    (6, 5, '2016 Prelude'),
    (7, 5, '2014 Sonata'),
    (8, 5, '2013 Bridge'),
    (9, 5, 'Brut Rosé'),
    (10, 5, '2013 Fanfare'),
    (11, 6, '2014 Malbec Reserve'),
    (12, 6, '2016 Vidal Blanc'),
    (13, 6, '2011 Late harvest Traminette'),
    (14, 6, '2014 Ameritage'),
    (15, 6, 'Black Ops'),
    

-- -----------------------------------------------------
-- Table `drink_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drink_types` (
  `drink_type_id` INT NOT NULL AUTO_INCREMENT,
  `drink_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`drink_type_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert data into drink_types
-- -----------------------------------------------------
INSERT INTO 
	drink_types(drink_type_id, drink_type_dscp)
VALUES
	(1, 'Wine')
-- -----------------------------------------------------
-- Table `server_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serve _types` (
  `serve_type_id` INT NOT NULL AUTO_INCREMENT,
  `serve_type_dscp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`serve_type_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert data into serve_types
-- -----------------------------------------------------
INSERT INTO 
	serve_types(serve_type_id, serve_type_dscp)
VALUES
	(1, 'Bottle')

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
-- Insert data into places_drinks 
-- -----------------------------------------------------
INSERT INTO 
	places_drinks(place_id, drink_id, serve_type, price)
VALUES
	(4, 1, 1, 40.00),
    (4, 2, 1, 28.00),
    (4, 3, 1, 35.00),
    (4, 4, 1, 26.00),
    (4, 5, 1, 30.00),
    (5, 6, 1, 14.00),
    (5, 7, 1, 16.00),
    (5, 8, 1, 27.00),
    (5, 9, 1, 18.00),
    (5, 10, 1, 18.00),
    (6, 11, 1, 42.00),
    (6, 12, 1, 28.00),
    (6, 13, 1, 29.00),
    (6, 14, 1, 28.00),
    (6, 15, 1, 42.00),
    
-- -----------------------------------------------------
-- Table `drink_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drink_stats` (
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

-- -----------------------------------------------------
-- Insert data into drink_stats table
-- -----------------------------------------------------
INSERT INTO 
	drink_stats(drink_id, drink_type_id, drink_abv, drink_ibu, drink_variation)
VALUES
	(1, 1, 13.50, NULL, 'Red, Aged 18 months'),
    (2, 1, 12.30, NULL, 'White, Dry'),
    (3, 1, 10.40, NULL, 'Sparkling/ Bubble Wine'),
    (4, 1, 13.30, NULL, 'Rose, Aged 30 months'),
    (5, 1, 12.80, NULL, 'White, Sweet'),
    (6, 1, 12.50, NULL, 'Rose, Dry'),
    (7, 1, 13.50, NULL, 'White, Dry'),
    (8, 1, 13.90, NULL, 'Red, Aged 22 months'),
    (9, 1, 10.20, NULL, 'Rose, Sparkling Wine'),
    (10, 1, 11.90, NULL, 'White, Sweet'),
    (11, 1, 12.20, NULL, 'Red, Sweet '),
    (12, 1, 11.90, NULL, 'White, Dry'),
    (13, 1, 13.10, NULL, 'White, Sweet'),
    (14, 1, 12.80, NULL, 'White, Aged 14 months'),
    (15, 1, 13.80, NULL, 'Red, Aged 35 months')

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
