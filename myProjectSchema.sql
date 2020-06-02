-- MySQL Script generated by MySQL Workbench
-- Mon Jun  1 09:56:51 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AUProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AUProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AUProject` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `AUProject` ;

-- -----------------------------------------------------
-- Table `AUProject`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Employee` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Employee` (
  `emp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `company_email` VARCHAR(45) NOT NULL,
  `personal_email` VARCHAR(45) NULL,
  `location` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  UNIQUE INDEX `Company_email_UNIQUE` (`company_email` ASC) VISIBLE,
  UNIQUE INDEX `personal_UNIQUE` (`personal_email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Phone_directory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Phone_directory` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Phone_directory` (
  `country_code` INT UNSIGNED NOT NULL,
  `ph_no` BIGINT UNSIGNED NOT NULL,
  `emp_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`country_code`, `ph_no`),
  INDEX `ph_no` (`ph_no` ASC) INVISIBLE,
  INDEX `emp_id_idx` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `phone_directory_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Document` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Document` (
  `doc_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_id` INT UNSIGNED NOT NULL,
  `type` VARCHAR(45) NULL,
  `document` BLOB NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE INDEX `doc_id_UNIQUE` (`doc_id` ASC) VISIBLE,
  INDEX `emp_id_idx` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `document_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Skill` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Skill` (
  `skill_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE INDEX `skill_id_UNIQUE` (`skill_id` ASC) VISIBLE,
  UNIQUE INDEX `skill name_UNIQUE` (`skill_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Education` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Education` (
  `edu_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_id` INT UNSIGNED NOT NULL,
  `college` VARCHAR(45) NOT NULL,
  `university` VARCHAR(45) NOT NULL,
  `degree` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`edu_id`),
  UNIQUE INDEX `edu_id_UNIQUE` (`edu_id` ASC) VISIBLE,
  INDEX `emp_id_idx` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `education_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Demand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Demand` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Demand` (
  `dem_id` INT UNSIGNED NOT NULL auto_increment,
  `location` VARCHAR(45) NOT NULL,
  `experience_requirement` INT NOT NULL,
  `number_people` INT UNSIGNED NOT NULL,
  `creation_date` DATE NOT NULL,
  `h_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`dem_id`),
  UNIQUE INDEX `dem_id_UNIQUE` (`dem_id` ASC) VISIBLE,
  INDEX `demand_h_id_idx` (`h_id` ASC) VISIBLE,
  CONSTRAINT `demand_h_id`
    FOREIGN KEY (`h_id`)
    REFERENCES `AUProject`.`Hiring_manager` (`h_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Demand_skillset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Demand_skillset` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Demand_skillset` (
  `dem_id` INT UNSIGNED NOT NULL,
  `skill_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`dem_id`, `skill_id`),
  INDEX `skill_id_idx` (`skill_id` ASC) VISIBLE,
  CONSTRAINT `demand_skillset_dem_id`
    FOREIGN KEY (`dem_id`)
    REFERENCES `AUProject`.`Demand` (`dem_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `demand_skillset_skill_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `AUProject`.`Skill` (`skill_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Employee_skillset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Employee_skillset` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Employee_skillset` (
  `emp_id` INT UNSIGNED NOT NULL,
  `skill_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`emp_id`, `skill_id`),
  INDEX `skill_id _idx` (`skill_id` ASC) VISIBLE,
  CONSTRAINT `employee_skillset_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `employee_skillset_skill_id `
    FOREIGN KEY (`skill_id`)
    REFERENCES `AUProject`.`Skill` (`skill_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Project` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Project` (
  `proj_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `manager_id` INT UNSIGNED NOT NULL,
  `project_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`proj_id`),
  INDEX `manager_id_idx` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `project_emp_id`
    FOREIGN KEY (`manager_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Project_allocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Project_allocation` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Project_allocation` (
  `emp_id` INT UNSIGNED NOT NULL,
  `proj_id` INT UNSIGNED NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  PRIMARY KEY (`emp_id`, `proj_id`),
  INDEX `proj_id_idx` (`proj_id` ASC) VISIBLE,
  CONSTRAINT `project_manager_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `project_manager_proj_id`
    FOREIGN KEY (`proj_id`)
    REFERENCES `AUProject`.`Project` (`proj_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Onboard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Onboard` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Onboard` (
  `onb_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_id` INT UNSIGNED NOT NULL,
  `dem_id` INT UNSIGNED NOT NULL,
  `start_date` DATETIME NOT NULL,
  `eta_of_Completion` DATETIME NOT NULL,
  `onboarding_status` VARCHAR(45) NOT NULL,
  `BGC_status` VARCHAR(45) NOT NULL,
  INDEX `dem_id_idx` (`dem_id` ASC) VISIBLE,
  PRIMARY KEY (`onb_id`),
  CONSTRAINT `emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `AUProject`.`Employee` (`emp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dem_id`
    FOREIGN KEY (`dem_id`)
    REFERENCES `AUProject`.`Demand` (`dem_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AUProject`.`Hiring_manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AUProject`.`Hiring_manager` ;

CREATE TABLE IF NOT EXISTS `AUProject`.`Hiring_manager` (
  `h_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `ph_no` BIGINT NOT NULL,
  `country_code` INT NOT NULL,
  `team_name` VARCHAR(45) NOT NULL,
  `dept` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`h_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
  
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

commit;