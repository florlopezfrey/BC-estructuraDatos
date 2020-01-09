SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`OpticsGlasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OpticsGlasses` (
  `idOpticsGlasses` INT NOT NULL,
  `glassesColorFrame` VARCHAR(45) NOT NULL,
  `glassesColorGlassRight` VARCHAR(45) NOT NULL,
  `glassesColorGlassLeft` VARCHAR(45) NOT NULL,
  `glassesPrice` INT NOT NULL,
  `glassesFrame` ENUM('flotante','pasta','metalico') NOT NULL,
  `glassesMetricsRight` FLOAT NOT NULL,
  `glassesMetricsLef` FLOAT NOT NULL,
  `OpticsGlassescol` VARCHAR(45) NULL,
  PRIMARY KEY (`idOpticsGlasses`),
  UNIQUE INDEX `idOpticsGlasses_UNIQUE` (`idOpticsGlasses` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GlassesBrand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GlassesBrand` (
  `idGlassesBrand` INT NOT NULL,
  `brandName` VARCHAR(45) NOT NULL,
  `OpticsGlasses_idOpticsGlasses` INT NOT NULL,
  PRIMARY KEY (`idGlassesBrand`, `OpticsGlasses_idOpticsGlasses`),
  INDEX `fk_GlassesBrand_OpticsGlasses1_idx` (`OpticsGlasses_idOpticsGlasses` ASC),
  CONSTRAINT `fk_GlassesBrand_OpticsGlasses1`
    FOREIGN KEY (`OpticsGlasses_idOpticsGlasses`)
    REFERENCES `mydb`.`OpticsGlasses` (`idOpticsGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OpticsSuppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OpticsSuppliers` (
  `supNombre` VARCHAR(45) NOT NULL,
  `supCalle` VARCHAR(45) NOT NULL,
  `supNumeroCalle` VARCHAR(45) NULL,
  `supPiso` VARCHAR(45) NULL,
  `supPiso` VARCHAR(45) NULL,
  `supPuerta` VARCHAR(45) NULL,
  `supCiudad` VARCHAR(45) NOT NULL,
  `supCP` VARCHAR(45) NOT NULL,
  `supPais` VARCHAR(45) NOT NULL,
  `supTel` VARCHAR(45) NOT NULL,
  `supFax` VARCHAR(45) NULL,
  `supNIF` VARCHAR(45) NOT NULL,
  `GlassesBrand_idGlassesBrand` INT NOT NULL,
  `idSupplier` VARCHAR(45) NOT NULL,
  INDEX `fk_OpticsSuppliers_GlassesBrand1_idx` (`GlassesBrand_idGlassesBrand` ASC),
  UNIQUE INDEX `supNIF_UNIQUE` (`supNIF` ASC),
  UNIQUE INDEX `GlassesBrand_idGlassesBrand_UNIQUE` (`GlassesBrand_idGlassesBrand` ASC),
  PRIMARY KEY (`idSupplier`),
  CONSTRAINT `fk_OpticsSuppliers_GlassesBrand1`
    FOREIGN KEY (`GlassesBrand_idGlassesBrand`)
    REFERENCES `mydb`.`GlassesBrand` (`idGlassesBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OpticsCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OpticsCustomer` (
  `idOpticsCustomer` INT NOT NULL,
  `custName` VARCHAR(45) NOT NULL,
  `custAddress` VARCHAR(45) NOT NULL,
  `custTel` VARCHAR(45) NOT NULL,
  `custEmail` VARCHAR(45) NOT NULL,
  `custNew` TINYINT(1) NOT NULL,
  `custRecommended` TINYINT(1) NULL,
  `custWhoRecommended` VARCHAR(45) NULL,
  `OpticsGlasses_idOpticsGlasses` INT NOT NULL,
  PRIMARY KEY (`idOpticsCustomer`),
  INDEX `fk_OpticsCustomer_OpticsGlasses1_idx` (`OpticsGlasses_idOpticsGlasses` ASC),
  CONSTRAINT `fk_OpticsCustomer_OpticsGlasses1`
    FOREIGN KEY (`OpticsGlasses_idOpticsGlasses`)
    REFERENCES `mydb`.`OpticsGlasses` (`idOpticsGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OpticsSeller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OpticsSeller` (
  `idOpticsSeller` INT NOT NULL,
  `sellerName` VARCHAR(45) NOT NULL,
  `OpticsGlasses_idOpticsGlasses` INT NOT NULL,
  PRIMARY KEY (`idOpticsSeller`),
  UNIQUE INDEX `idOpticsSeller_UNIQUE` (`idOpticsSeller` ASC),
  INDEX `fk_OpticsSeller_OpticsGlasses1_idx` (`OpticsGlasses_idOpticsGlasses` ASC),
  CONSTRAINT `fk_OpticsSeller_OpticsGlasses1`
    FOREIGN KEY (`OpticsGlasses_idOpticsGlasses`)
    REFERENCES `mydb`.`OpticsGlasses` (`idOpticsGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
