
	SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
	SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
	SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Conjunto` DEFAULT CHARACTER SET utf8 ;
USE `Conjunto` ;


-- -----------------------------------------------------
-- Table `Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Admin` (
  `idAdmin` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Propietario` (
  `idPropietario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  PRIMARY KEY (`idPropietario`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Apartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Apartamento` (
  `idApartamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `coheficiente` DOUBLE NOT NULL,
  `Propietario_idPropietario` INT NOT NULL,
  PRIMARY KEY (`idApartamento`),
  INDEX `fk_Apartamento_Propietario1_idx` (`Propietario_idPropietario` ASC) VISIBLE,
  CONSTRAINT `fk_Apartamento_Propietario1`
    FOREIGN KEY (`Propietario_idPropietario`)
    REFERENCES `Propietario` (`idPropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `EstadoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EstadoPago` (
  `idEstadoPago` INT NOT NULL AUTO_INCREMENT,
  `valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadoPago`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuenta` (
  `idCuenta` INT NOT NULL AUTO_INCREMENT,
  `fechaLimite` DATE NOT NULL,
  `cantidad` DOUBLE NOT NULL,
  `sandoAnterior` DOUBLE NOT NULL,
  `Admin_idAdmin` INT NOT NULL,
  `Apartamento_idApartamento` INT NOT NULL,
  `EstadoPago_idEstadoPago` INT NOT NULL,
  PRIMARY KEY (`idCuenta`),
  INDEX `fk_Cuenta_Admin1_idx` (`Admin_idAdmin` ASC) VISIBLE,
  INDEX `fk_Cuenta_Apartamento1_idx` (`Apartamento_idApartamento` ASC) VISIBLE,
  INDEX `fk_Cuenta_EstadoPago1_idx` (`EstadoPago_idEstadoPago` ASC) VISIBLE,
  CONSTRAINT `fk_Cuenta_Admin1`
    FOREIGN KEY (`Admin_idAdmin`)
    REFERENCES `Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuenta_Apartamento1`
    FOREIGN KEY (`Apartamento_idApartamento`)
    REFERENCES `Apartamento` (`idApartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuenta_EstadoPago1`
    FOREIGN KEY (`EstadoPago_idEstadoPago`)
    REFERENCES `EstadoPago` (`idEstadoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagos` (
  `idPagos` INT NOT NULL AUTO_INCREMENT,
  `fechaPago` DATE NOT NULL,
  `Cuenta_idCuenta` INT NOT NULL,
  PRIMARY KEY (`idPagos`),
  INDEX `fk_Pagos_Cuenta1_idx` (`Cuenta_idCuenta` ASC) VISIBLE,
  CONSTRAINT `fk_Pagos_Cuenta1`
    FOREIGN KEY (`Cuenta_idCuenta`)
    REFERENCES `Cuenta` (`idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


INSERT INTO Admin (idAdmin, nombre, apellido, clave)
VALUES 
(1001, 'Samir', 'Gonzalez', '123'),
(1002, 'Cristian', 'Barrera', '456');


