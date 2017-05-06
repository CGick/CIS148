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
      (4, 'Store');


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
    (3, 1, 'Forge Brew Works', '8532 Terminal Rd', 'Ste. LMN', 'Lorton', 'VA', 22079),
    (4, 3, 'Old Westminster Winery & Vineyard', '1550 Old Westminster Rd', NULL, 'Westminster', 'MD', 21157),
    (5, 3, 'Allegro Vineyards & Winery', '3475 Sechrist Rd', NULL, 'Brogue', 'PA', 17309),
    (6, 3, 'Pearmund Cellars', '6190 Georgetown Rd', NULL, 'Broad Run', 'VA', 20137),
    (7, 2, 'The Owl Bar', '1 E Chase St', NULL, 'Baltimore', 'MD', 21202),
    (8, 2, 'Water Way Bar & Grill', '220 West Philadelphia Street', NULL, 'York', 'PA', 17401),
    (9, 2, 'Screwtop Wine Bar', '1025 North Filmore Street', NULL, 'Arlington', 'VA', 22201),
    (10, 4, 'Total Discount Liquors', '1438 Liberty Road', NULL, 'Eldersburg', 'MD', 21784),
    (11, 4, 'Shrewsbury Beer & Soda', '537 S Main St', NULL, 'Shrewsbury', 'PA', 17361),
    (12, 4, 'Virginia ABC Store', '11083 Marsh Rd', NULL, 'Bealeton', 'VA', 22712);


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
	locations(place_id, lat, `long`)
VALUES
    (1, 39.1241, -76.8230),
    (2, 39.8426, -77.1919),
    (3, 38.7275, -77.1974),
    (4, 39.5319, -77.0342),
    (5, 39.8437, -76.4767),
    (6, 38.7834, -77.7390),
    (7, 39.3023, -76.6155),
    (8, 39.9621, -76.7335),
    (9, 38.8854, -77.0927),
    (10, 39.4032, -76.9435),
    (11, 39.7540, -76.6765),
    (12, 38.5792, -77.7653);


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
    (16, 1, 'Big Punisher'),
    (17, 1, 'Feed the Monkey'),
    (18, 1, 'Poor Righteous'),
    (19, 1, 'The Infinite'),
    (20, 1, 'Welcome to Scoville'),
	(21, 2, 'Aero-Head Bock'),
    (22, 2, 'Trail Blaze Maple Brown Ale'),
    (23, 2, 'Chocolate Avenue Stout'),
    (24, 2, 'Outta Focus Double IPA'),
    (25, 2, 'Water Gap Wheat'),
    (26, 3, 'Belgian Blonde'),
    (27, 3, 'Farmhouse'),
    (28, 3, 'Forged Gold'),
    (29, 3, 'Sitobine'),
    (30, 3, 'Ryes Up and Stout');
    

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
	(1, 'Wine'),
    (2, 'Beer');
-- -----------------------------------------------------
-- Table `server_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serve_types` (
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
	(1, 'Bottle'),
    (2, 'On Tap'),
    (3, 'Can'),
    (4, '6 Pack'),
    (5, '12 Pack'),
    (6, 'Glass');

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
    (1, 16, 2, 5.74),
    (1, 17, 2, 5.65),
    (1, 18, 2, 5.49),
    (1, 19, 2, 5.48),
    (1, 20, 2, 5.68),
    (2, 21, 2, 5.29),
    (2, 22, 2, 6.28),
    (2, 23, 2, 5.68),
    (2, 24, 2, 5.98), 
    (2, 25, 2, 5.47),
    (3, 26, 2, 5.87),
    (3, 27, 2, 4.29),
    (3, 28, 2, 5.76),
    (3, 29, 2, 5.87),
    (3, 30, 2, 5.78),
    (7, 18, 2, 5.48),
    (7, 16, 2, 5.38),
    (7, 22, 3, 4.29),
    (7, 24, 1, 5.29),
    (7, 29, 1, 5.87),
    (7, 12, 6, 6.78),
    (7, 8, 6, 6.27),
    (7, 4, 1, 28.38),
    (9, 6, 6, 7.29),
    (9, 1, 1, 52.38),
    (9, 3, 6, 6.98),
    (9, 15, 1, 48.29),
    (9, 14, 6, 8.29),
    (9, 8, 6, 9.28),
    (9, 18, 3, 5.69),
    (9, 28, 3, 5.87),
    (8, 5, 1, 15.27),
    (8, 7, 6, 10.21),
    (8, 11, 6, 7.28),
    (8, 9, 1, 21.29),
    (8, 19, 2, 4.89),
    (8, 30, 2, 5.28),
    (8, 23, 3, 4.87),
    (8, 17, 1, 5.28),
    (10, 20, 4, 14.59),
    (10, 26, 5, 21.48),
    (10, 27, 4, 17.93),
    (10, 28, 5, 23.48),
    (10, 17, 4, 18.33),
    (10, 2, 1, 30.21),
    (10, 5, 1, 34.34),
    (10, 10, 1, 21.29),
    (10, 12, 1, 31.39),
    (10, 13, 1, 29.29),
    (11, 21, 4, 29.28),
    (11, 25, 4, 27.13),
    (11, 19, 5, 34.29),
    (11, 16, 4, 20.28),
    (11, 30, 5, 37.27),
    (11, 17, 4, 22.38),
    (11, 20, 5, 29.48),
    (11, 1, 1, 39.29),
    (11, 2, 1, 29.39),
    (11, 3, 1, 35.28),
    (12, 21, 4, 17.38),
    (12, 30, 4, 19.32),
    (12, 25, 5, 28.29),
    (12, 4, 1, 28.28), 
    (12, 5, 1, 34.28),
    (12, 6, 1, 18.20),
    (12, 7, 1, 19.28),
    (12, 9, 1, 21.28),
    (12, 10, 1, 19.38),
    (12, 11, 1, 51.29);
    
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
  CONSTRAINT `fk_id_drink`
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
    (15, 1, 13.80, NULL, 'Red, Aged 35 months'),
    (16, 2, 8.5, 93, 'Double IPA'),
    (17, 2, 5.6, 14, 'Orange Hefeweizen'),
    (18, 2, 6.5, 55, 'American IPA'),
    (19, 2, 5.0, 19, 'Amber Ale'),
    (20, 2, 6.9, 74, 'Jalapeno IPA'),
    (21, 2, 7.0, 25, 'German-style bock'),
    (22, 2, 6.73, 30, 'American style brown ale'),
    (23, 2, 5.1, 19, 'Chocolate stout'),
    (24, 2, 8, 80, 'Double IPA'),
    (25, 2, 4.78, 15, 'American style wheat'),
    (26, 2, 7.2, NULL, 'Belgian Blonde Ale'),
    (27, 2, 6.5, NULL, 'American Saison'),
    (28, 2, 5.2, NULL, 'Dortmunder Lager'),
    (29, 2, 7.5, NULL, 'Hoppy Saison'),
    (30, 2, 7.5, NULL, 'Belgian Mild Stout');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
