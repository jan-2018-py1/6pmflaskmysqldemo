-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema airbnbdb6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airbnbdb6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airbnbdb6` DEFAULT CHARACTER SET utf8 ;
USE `airbnbdb6` ;

-- -----------------------------------------------------
-- Table `airbnbdb6`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnbdb6`.`addresses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `house_number` VARCHAR(255) NULL DEFAULT NULL,
  `street_name` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airbnbdb6`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnbdb6`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `address_id` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_users_addresses1_idx` (`address_id` ASC),
  CONSTRAINT `fk_users_addresses1`
    FOREIGN KEY (`address_id`)
    REFERENCES `airbnbdb6`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airbnbdb6`.`properties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnbdb6`.`properties` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rooms` INT(3) NULL DEFAULT NULL,
  `private` TINYINT(4) NULL DEFAULT NULL,
  `address_id` INT(11) NOT NULL DEFAULT '0',
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_properties_addresses_idx` (`address_id` ASC),
  INDEX `fk_properties_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_properties_addresses`
    FOREIGN KEY (`address_id`)
    REFERENCES `airbnbdb6`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_properties_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `airbnbdb6`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airbnbdb6`.`reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnbdb6`.`reservations` (
  `property_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`property_id`, `user_id`),
  INDEX `fk_properties_has_users_users1_idx` (`user_id` ASC),
  INDEX `fk_properties_has_users_properties1_idx` (`property_id` ASC),
  CONSTRAINT `fk_properties_has_users_properties1`
    FOREIGN KEY (`property_id`)
    REFERENCES `airbnbdb6`.`properties` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_properties_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `airbnbdb6`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
