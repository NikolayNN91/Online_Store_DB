-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Online_Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Online_Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Online_Store` DEFAULT CHARACTER SET latin1 ;
USE `Online_Store` ;

-- -----------------------------------------------------
-- Table `Online_Store`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Online_Store`.`Users` (
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `isAdmin` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`login`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Online_Store`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Online_Store`.`Orders` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sum_price` INT(11) UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Orders_1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Online_Store`.`Users` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Online_Store`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Online_Store`.`Products` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `price` INT(11) UNSIGNED NOT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Online_Store`.`Orders_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Online_Store`.`Orders_details` (
  `order_id` INT(11) UNSIGNED NOT NULL,
  `product_id` INT(11) UNSIGNED NOT NULL,
  `count` INT(11) UNSIGNED NOT NULL DEFAULT '1',
  INDEX `fk_Orders_details_1_idx` (`order_id` ASC),
  INDEX `fk_Orders_details_2_idx` (`product_id` ASC),
  CONSTRAINT `fk_Orders_details_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Online_Store`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_details_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `Online_Store`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
