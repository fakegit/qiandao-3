-- MySQL Script generated by MySQL Workbench
-- Fri Aug 15 23:00:30 2014
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema qiandao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qiandao` DEFAULT CHARACTER SET utf8 ;
USE `qiandao` ;

-- -----------------------------------------------------
-- Table `qiandao`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qiandao`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(256) CHARACTER SET 'utf8' NOT NULL,
  `email_verified` TINYINT(1) NOT NULL DEFAULT 0,
  `password` VARBINARY(128) NOT NULL,
  `userkey` VARBINARY(128) NOT NULL,
  `nickname` VARCHAR(64) NULL,
  `role` VARCHAR(128) NULL,
  `ctime` INT UNSIGNED NOT NULL,
  `mtime` INT UNSIGNED NOT NULL,
  `atime` INT UNSIGNED NOT NULL,
  `cip` INT UNSIGNED NOT NULL,
  `mip` INT UNSIGNED NOT NULL,
  `aip` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qiandao`.`tpl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qiandao`.`tpl` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` INT UNSIGNED NULL,
  `siteurl` VARCHAR(256) NULL,
  `sitename` VARCHAR(128) NULL,
  `banner` VARCHAR(1024) NULL,
  `disabled` TINYINT(1) NOT NULL DEFAULT 0,
  `public` TINYINT(1) NOT NULL DEFAULT 0,
  `lock` TINYINT(1) NOT NULL DEFAULT 0,
  `fork` INT UNSIGNED NULL,
  `har` MEDIUMBLOB NULL,
  `tpl` MEDIUMBLOB NULL,
  `variables` TEXT NULL,
  `interval` INT UNSIGNED NULL,
  `note` VARCHAR(1024) NULL,
  `success_count` INT UNSIGNED NOT NULL DEFAULT 0,
  `failed_count` INT UNSIGNED NOT NULL DEFAULT 0,
  `last_success` INT UNSIGNED NULL,
  `ctime` INT UNSIGNED NOT NULL,
  `mtime` INT UNSIGNED NOT NULL,
  `atime` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ix_siteurl` (`siteurl` ASC),
  INDEX `ix_sitename` (`sitename` ASC),
  INDEX `ix_public` (`public` ASC)),
  INDEX `ix_userid` (`userid`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `qiandao`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qiandao`.`task` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tplid` INT UNSIGNED NOT NULL,
  `userid` INT UNSIGNED NOT NULL,
  `disabled` TINYINT(1) NOT NULL DEFAULT 0,
  `init_env` BLOB NULL,
  `env` BLOB NULL,
  `session` BLOB NULL,
  `last_success` INT UNSIGNED NULL,
  `last_failed` INT UNSIGNED NULL,
  `success_count` INT UNSIGNED NOT NULL DEFAULT 0,
  `failed_count` INT UNSIGNED NOT NULL DEFAULT 0,
  `last_failed_count` INT UNSIGNED NOT NULL DEFAULT 0,
  `next` INT UNSIGNED NULL DEFAULT NULL,
  `note` VARCHAR(256) NULL,
  `ctime` INT UNSIGNED NOT NULL,
  `mtime` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ix_userid` (`userid` ASC),
  INDEX `ix_tplid` (`tplid` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `qiandao`.`tasklog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qiandao`.`tasklog` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `taskid` INT UNSIGNED NOT NULL,
  `success` TINYINT(1) NOT NULL,
  `ctime` INT UNSIGNED NOT NULL,
  `msg` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `qiandao`.`push_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qiandao`.`push_request` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_tplid` INT UNSIGNED NOT NULL,
  `from_userid` INT UNSIGNED NOT NULL,
  `to_tplid` INT UNSIGNED NULL,
  `to_userid` INT UNSIGNED NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  `msg` VARCHAR(1024) NULL,
  `ctime` INT UNSIGNED NOT NULL,
  `mtime` INT UNSIGNED NOT NULL,
  `atime` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ix_userid` (`to_userid` ASC),
  INDEX `ix_status` (`status` ASC))
ENGINE = MyISAM;

CREATE USER 'qiandao';

GRANT SELECT, INSERT, TRIGGER ON TABLE `qiandao`.* TO 'qiandao';
GRANT SELECT ON TABLE `qiandao`.* TO 'qiandao';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `qiandao`.* TO 'qiandao';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
