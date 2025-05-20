
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

-- ============================
-- Insertar Propietarios
-- ============================
INSERT INTO Propietario (idPropietario, nombre, apellido, clave, fechaIngreso)
VALUES
(1, 'Eduard', 'Quintero', 'clave1', '2022-02-10'),
(2, 'Andrés Felipe', 'Rodriguez Herrera', 'clave2', '2021-05-20'),
(3, 'Luisa', 'Parra', 'clave3', '2023-01-15'),
(4, 'Cristian Daniel', 'Feo Patarroyo', 'clave4', '2020-11-05'),
(5, 'Daniel', 'Cruz', 'clave5', '2019-09-13'),
(6, 'Camila', 'Ríos', 'clave6', '2020-03-01'),
(7, 'Mateo', 'Gómez', 'clave7', '2021-06-21'),
(8, 'Valentina', 'Martínez', 'clave8', '2022-08-17'),
(9, 'Sebastián', 'Torres', 'clave9', '2023-03-09'),
(10, 'Isabela', 'López', 'clave10', '2021-01-01'),
(11, 'Juan Pablo', 'Ramírez', 'clave11', '2022-09-12'),
(12, 'Sara', 'Herrera', 'clave12', '2021-04-25'),
(13, 'Tomás', 'Jiménez', 'clave13', '2023-07-30'),
(14, 'Laura', 'Mejía', 'clave14', '2020-12-05'),
(15, 'Emilio', 'Navarro', 'clave15', '2022-11-11');

-- ============================
-- Insertar Apartamentos
-- ============================
INSERT INTO Apartamento (nombre, coheficiente, Propietario_idPropietario)
VALUES
('101', 1.25, 1),
('102', 1.50, 2),
('103', 1.10, 3),
('104', 1.30, 4),
('105', 1.20, 5),
('106', 1.40, 6),
('107', 1.15, 7),
('108', 1.35, 8),
('109', 1.22, 9),
('110', 1.18, 10),
('111', 1.26, 11),
('112', 1.33, 12),
('113', 1.19, 13),
('114', 1.45, 14),
('	115', 1.29, 15);

-- ============================
-- Insertar Estado de Pago
-- ============================
INSERT INTO EstadoPago (valor)
VALUES
('PAGADO'),     -- id = 1
('ATRASADO');   -- id = 2

-- ============================
-- Insertar Cuentas
-- ============================
INSERT INTO Cuenta (fechaLimite, cantidad, sandoAnterior, Admin_idAdmin, Apartamento_idApartamento, EstadoPago_idEstadoPago)
VALUES
('2025-04-30', 250000, 0, 1001, 1, 1),   -- Eduard - PAGADO
('2025-04-30', 280000, 0, 1002, 2, 1),   -- Andrés - PAGADO
('2025-04-30', 260000, 80000, 1001, 3, 2), -- Luisa - ATRASADO
('2025-04-30', 300000, 150000, 1002, 4, 2), -- Cristian - ATRASADO
('2025-04-30', 270000, 0, 1001, 5, 1),   -- Daniel - PAGADO
('2025-04-30', 240000, 0, 1001, 6, 1),   -- Camila - PAGADO
('2025-04-30', 260000, 50000, 1002, 7, 2), -- Mateo - ATRASADO
('2025-04-30', 250000, 0, 1002, 8, 1),   -- Valentina - PAGADO
('2025-04-30', 265000, 65000, 1001, 9, 2), -- Sebastián - ATRASADO
('2025-04-30', 275000, 0, 1002, 10, 1),  -- Isabela - PAGADO
('2025-04-30', 280000, 0, 1001, 11, 1),  -- Juan Pablo - PAGADO
('2025-04-30', 290000, 90000, 1002, 12, 2), -- Sara - ATRASADO
('2025-04-30', 255000, 0, 1001, 13, 1),  -- Tomás - PAGADO
('2025-04-30', 300000, 120000, 1002, 14, 2), -- Laura - ATRASADO
('2025-04-30', 260000, 0, 1001, 15, 1);  -- Emilio - PAGADO

-- ============================
-- Insertar Pagos (solo para cuentas pagadas)
-- ============================
INSERT INTO Pagos (fechaPago, Cuenta_idCuenta)
VALUES
('2025-04-29', 1),
('2025-04-29', 2),
('2025-04-28', 5),
('2025-04-28', 6),
('2025-04-29', 8),
('2025-04-28', 10),
('2025-04-29', 11),
('2025-04-30', 13),
('2025-04-28', 15);


