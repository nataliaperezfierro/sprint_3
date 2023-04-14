-- Integrantes:
-- Jennifer Parra
-- Jonathan Gajardo
-- Natalia Pérez
-- Valentín Urrea

-- MySQL Script generated by MySQL Workbench
-- Fri Apr 14 10:47:18 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_categoria`));


-- -----------------------------------------------------
-- Table `mydb`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveedor` (
  `id_proveedor` INT NOT NULL,
  `nombre_legal` VARCHAR(50) NOT NULL,
  `nombre_corporativo` VARCHAR(50) NOT NULL,
  `telefono_1` INT NOT NULL,
  `telefono_2` INT NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contacto_telefono_2` VARCHAR(45),
  `id_categoria_prod` INT NOT NULL,
  INDEX `id_categoria_prod_idx` (`id_categoria_prod` ASC) VISIBLE,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE INDEX `proveedorcol_UNIQUE` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `id_categoria_prod`
    FOREIGN KEY (`id_categoria_prod`)
    REFERENCES `mydb`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `id_producto` INT NOT NULL,
  `precio` INT NOT NULL,
  `color` VARCHAR(32) NOT NULL,
  `stock` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `id_producto_UNIQUE` (`id_producto` ASC) VISIBLE,
  INDEX `id_proveedor_idx` (`id_proveedor` ASC) VISIBLE,
  INDEX `id_categoria__idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `id_proveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `mydb`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `mydb`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE,
  UNIQUE INDEX `direccion_UNIQUE` (`direccion` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orden` (
  `id_orden` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_producto_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/* Poblacion de tablas*/

-- Poblando tabla categoria
insert into categoria (id_categoria, nombre) 
values ('1','Electrodomesticos'),
('2','Celular'),
('3','Vestuario'),
('4','Computacion'),
('5','Jugueteria'),
('6','Musica');

-- Poblando tabla cliente
insert into cliente (id_cliente, nombre,apellido, direccion) values
(1,'Carla','Perez','calle 123'),
(2,'Juanito','Espinoza','calle 543'),
(3,'Andres','Guzman','calle 789'),
(4,'Cristobal','Valdes','avenida 123'),
(5,'Amelia','Aguayo','pasaje 123');

-- Poblando tabla proveedor
insert into proveedor (id_proveedor, nombre_legal, nombre_corporativo,telefono_1,telefono_2, correo, contacto_telefono_2, id_categoria_prod) 
values
(1,'Juan Herrea','Mercado Libre',1111222,2222333,'juan@gmail.com','Ismael',3),
(2,'Alejandra Cortez','Falabella',8888888,9999999,'alejandra@gmail.com','Eduardo',2),
(3,'Cristian Herrea','Ripley',111122,2222333,'cristian@gmail.com','Martina',2),
(4,'Agustina Velasquez','Almaceces Paris',3333333,89898989,'agustina@gmail.com','Ramona',4),
(5,'Natalia Oyarzun','Exportadora SA',444444,555555,'natalia@gmail.com','Ignacia',5),
(6,'Yerko Oyarzun','Taladros SA',444444,555555,'Yerko@gmail.com','Ignacia',1),
(7,'Anibal Viel','Calzado SA',444444,555555,'anibal@gmail.com','Felicia',6);

-- Poblando productos
insert into producto (id_producto, precio, color, stock, id_proveedor, id_categoria) values 
( 1 , 230000, "blanco", 94, 6, 1 ),
( 2, 50000, "blanco", 25, 1, 3 ),
( 3, 75000, "rojo", 39, 5, 5  ),
( 4, 1600000, "gris", 3, 4, 4 ),
( 5, 340000, "negro", 15, 6, 1  ),
( 6, 20000, "rojo", 88, 7, 6 ),
( 7, 90000, "negro", 48, 2, 2 ),
( 8, 120000, "azul", 153, 5, 5 ),
( 9, 560000, "negro", 7, 7,6 ),
( 10, 100000, "rojo", 23, 1,3 );

-- 1. cual es la categoria de productos que mas se repite, en nuestra tenemos 4 categorias que se repiten lo maximo, 
-- lo que es 2 veces por categoria
SELECT c.nombre, COUNT(p.id_categoria) AS cantidad
FROM producto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre
ORDER BY cantidad desc
limit 3;

-- 2. cuales son los producto con mayor stock, Ordenados de forma descendente segun su stock, y se muestra su id
SELECT id_producto, stock
FROM producto
ORDER BY stock DESC;

-- 3. que color de producto es mas comun en la tienda. Segun nuestra tabla creada productos, 
-- los colores mas comunes son rojo y negro
SELECT color, COUNT(*) AS cantidad
FROM Producto
GROUP BY color
ORDER BY cantidad DESC
LIMIT 2;

-- 4 cuales son los provedores con menos stock en la tienda
SELECT pr.nombre_legal, SUM(p.stock) AS cantidad
FROM producto p
INNER JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor
GROUP BY p.id_proveedor
HAVING SUM(p.stock) < 20;

-- 5 para cambiar la categoria de productos mas popular por electronica y computacion :
-- Del ejercicio 1 obtuvimos el que mas se repetia y popular, el cual era "Electrodomesticos" con id_categoria=1
UPDATE categoria
SET nombre = 'Electrónica y computación'
WHERE id_categoria = 1;
-- Para comprobar que resulto el cambio hacemos un select simple y revisamos la columna
SELECT * from categoria;
