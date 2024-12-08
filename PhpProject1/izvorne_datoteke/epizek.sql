-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema WebDiP2022x034
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema WebDiP2022x034
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `WebDiP2022x034` DEFAULT CHARACTER SET utf8 ;
USE `WebDiP2022x034` ;

-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`tip_korisnika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`tip_korisnika` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`konfiguracija_aplikacije`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`konfiguracija_aplikacije` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `trajanje_kolacica` TIME NOT NULL,
  `broj_redaka_za_stanicenje` INT NOT NULL,
  `trajanje_sesije` TIME NOT NULL,
  `broj_neuspjesnih_prijava` INT NOT NULL,
  `status_konfiguracije` VARCHAR(45) NOT NULL,
  `configuration_status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`korisnik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` VARCHAR(50) NOT NULL,
  `lozinka` VARCHAR(50) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `datum_vrijeme_registracije` DATETIME NOT NULL,
  `uviet_koristenja` CHAR(1) NULL,
  `broj_unosa` INT NOT NULL,
  `status_racuna` TINYINT NOT NULL,
  `aktivacijski_kod` VARCHAR(45) NOT NULL,
  `tip_id` INT NOT NULL,
  `lozinka_sha256` CHAR(64) NOT NULL,
  `konfiguracija_aplikacije_id` INT NOT NULL,
  `username` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL,
  `terms_of_use` CHAR(1) NULL,
  `password_sha256` CHAR(64) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_korisnik_tip_idx` (`tip_id` ASC),
  INDEX `fk_korisnik_konfiguracija_aplikacije1_idx` (`konfiguracija_aplikacije_id` ASC),
  CONSTRAINT `fk_korisnik_tip`
    FOREIGN KEY (`tip_id`)
    REFERENCES `WebDiP2022x034`.`tip_korisnika` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisnik_konfiguracija_aplikacije1`
    FOREIGN KEY (`konfiguracija_aplikacije_id`)
    REFERENCES `WebDiP2022x034`.`konfiguracija_aplikacije` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`uvijeti_i_cijena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`uvijeti_i_cijena` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bodovi` INT NOT NULL,
  `cijena` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`proizvod` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(100) NOT NULL,
  `slika` VARCHAR(45) NOT NULL,
  `kolicina` INT NOT NULL,
  `cijena` INT NOT NULL,
  `status_proizvoda` TINYINT NOT NULL,
  `bodovi` INT NOT NULL,
  `korisnik_id` INT NOT NULL,
  `uvijeti_i_cijena_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL,
  `picture` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proizvod_korisnik1_idx` (`korisnik_id` ASC),
  INDEX `fk_proizvod_uvijeti_i_cijena1_idx` (`uvijeti_i_cijena_id` ASC),
  CONSTRAINT `fk_proizvod_korisnik1`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `WebDiP2022x034`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_uvijeti_i_cijena1`
    FOREIGN KEY (`uvijeti_i_cijena_id`)
    REFERENCES `WebDiP2022x034`.`uvijeti_i_cijena` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`kampanja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`kampanja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(100) NOT NULL,
  `datum_vrijeme_pocetka` DATETIME NOT NULL,
  `datum_vrijeme_zavrsetka` DATETIME NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`tip_radnje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`tip_radnje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`dnevnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`dnevnik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datum_vrijeme` DATETIME NOT NULL,
  `radnja` TEXT NOT NULL,
  `upit` TEXT NOT NULL,
  `korisnik_id` INT NOT NULL,
  `tip_id` INT NOT NULL,
  `action` TEXT NULL,
  `query` TEXT NULL,
  PRIMARY KEY (`id`, `korisnik_id`, `tip_id`),
  INDEX `fk_dnevnik_korisnik1_idx` (`korisnik_id` ASC),
  INDEX `fk_dnevnik_tip1_idx` (`tip_id` ASC),
  CONSTRAINT `fk_dnevnik_korisnik1`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `WebDiP2022x034`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dnevnik_tip1`
    FOREIGN KEY (`tip_id`)
    REFERENCES `WebDiP2022x034`.`tip_radnje` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`kampanja_has_proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`kampanja_has_proizvod` (
  `kampanja_id` INT NOT NULL,
  `proizvod_id` INT NOT NULL,
  PRIMARY KEY (`kampanja_id`, `proizvod_id`),
  INDEX `fk_kampanja_has_proizvod_proizvod1_idx` (`proizvod_id` ASC),
  INDEX `fk_kampanja_has_proizvod_kampanja1_idx` (`kampanja_id` ASC),
  CONSTRAINT `fk_kampanja_has_proizvod_kampanja1`
    FOREIGN KEY (`kampanja_id`)
    REFERENCES `WebDiP2022x034`.`kampanja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kampanja_has_proizvod_proizvod1`
    FOREIGN KEY (`proizvod_id`)
    REFERENCES `WebDiP2022x034`.`proizvod` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`profil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`profil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `slika` VARCHAR(45) NOT NULL,
  `nadimak` VARCHAR(45) NOT NULL,
  `bodovi` INT NOT NULL,
  `korisnik_id` INT NOT NULL,
  `picture` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profil_korisnik1_idx` (`korisnik_id` ASC),
  CONSTRAINT `fk_profil_korisnik1`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `WebDiP2022x034`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2022x034`.`kupi_proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2022x034`.`kupi_proizvod` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cijena_proizvoda` INT NULL,
  `bodovi` INT NULL,
  `korisnik_id` INT NOT NULL,
  `proizvod_id` INT NOT NULL,
  PRIMARY KEY (`id`, `korisnik_id`, `proizvod_id`),
  INDEX `fk_kupi_proizvod_korisnik1_idx` (`korisnik_id` ASC),
  INDEX `fk_kupi_proizvod_proizvod1_idx` (`proizvod_id` ASC),
  CONSTRAINT `fk_kupi_proizvod_korisnik1`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `WebDiP2022x034`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kupi_proizvod_proizvod1`
    FOREIGN KEY (`proizvod_id`)
    REFERENCES `WebDiP2022x034`.`proizvod` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
