-- MySQL Script generated by MySQL Workbench
-- Tue Mar 18 16:23:22 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema kubakwzcz0796
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kubakwzcz0796
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kubakwzcz0796` DEFAULT CHARACTER SET utf8 ;
USE `kubakwzcz0796` ;

-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`magic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`magic` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`magic` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `origin` VARCHAR(20) NOT NULL,
  `complexity` INT NOT NULL,
  `fail_rate` INT UNSIGNED NOT NULL,
  `cast_time` INT NOT NULL,
  `rules` TEXT NULL,
  `effects` TEXT NULL,
  `limits` TEXT NULL,
  `tags` VARCHAR(100) NULL,
  `other` TEXT NULL,
  `is_mod` TINYINT UNSIGNED NOT NULL,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  PRIMARY KEY (`id`, `name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`role` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`role` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`character`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`character` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`character` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NULL,
  `age` INT UNSIGNED NOT NULL,
  `circles` INT UNSIGNED NOT NULL,
  `description` TEXT NULL,
  `money` INT UNSIGNED NOT NULL DEFAULT 0,
  `role_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `role_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `character_role1_idx` (`role_id` ASC),
  CONSTRAINT `character_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `kubakwzcz0796`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`character_magic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`character_magic` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`character_magic` (
  `character_id` INT UNSIGNED NOT NULL,
  `magic_name` VARCHAR(255) NOT NULL,
  `complexity` INT UNSIGNED NOT NULL,
  `fail_rate` INT UNSIGNED NOT NULL,
  `cast_time` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`character_id`, `magic_name`),
  CONSTRAINT `character_magic_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `kubakwzcz0796`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`test` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`test` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`type` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`inventory` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`inventory` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type_id` INT UNSIGNED NOT NULL,
  `amount` INT UNSIGNED NOT NULL,
  `charges` INT UNSIGNED NOT NULL,
  `charges_max` INT UNSIGNED NOT NULL,
  `description` TEXT NULL,
  `is_deleted` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `is_favourite` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `is_equipped` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `character_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `type_id`, `character_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `inventory_type1_idx` (`type_id` ASC),
  INDEX `inventory_character1_idx` (`character_id` ASC),
  CONSTRAINT `inventory_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `kubakwzcz0796`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `inventory_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `kubakwzcz0796`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`character_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`character_image` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`character_image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `type` VARCHAR(20) NULL,
  `image` BLOB NOT NULL,
  `description` TEXT NOT NULL,
  `character_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `character_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `character_image_character1_idx` (`character_id` ASC),
  CONSTRAINT `character_image_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `kubakwzcz0796`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`options` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`options` (
  `character_id` INT UNSIGNED NOT NULL,
  `refresh_inventory` INT UNSIGNED NOT NULL DEFAULT 30000,
  `refresh_magic` INT UNSIGNED NOT NULL DEFAULT 30000,
  `show_message` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`character_id`),
  UNIQUE INDEX `character_id_UNIQUE` (`character_id` ASC),
  CONSTRAINT `options_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `kubakwzcz0796`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kubakwzcz0796`.`special_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kubakwzcz0796`.`special_item` ;

CREATE TABLE IF NOT EXISTS `kubakwzcz0796`.`special_item` (
  `inventory_id` INT UNSIGNED NOT NULL,
  `enchantment` VARCHAR(300) NULL,
  `enchantment_eq_only` TINYINT NULL,
  `blessing` VARCHAR(150) NULL,
  `blessing_eq_only` TINYINT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `special_item_inventory1_idx` (`inventory_id` ASC),
  UNIQUE INDEX `inventory_id_UNIQUE` (`inventory_id` ASC),
  CONSTRAINT `special_item_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `kubakwzcz0796`.`inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
