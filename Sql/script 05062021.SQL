  CREATE TABLE `Producto`
(
  `id_Producto` Bigint NOT NULL,
  `Nombre` Varchar(50) NOT NULL,
  `Cantidad` Int NOT NULL,
  `p_Compra` Double NOT NULL,
  `p_ventaN` Double NOT NULL,
  `p_VentaMe` Double NOT NULL,
  `p_VentaMa` Double NOT NULL
)
;

ALTER TABLE `Producto` ADD PRIMARY KEY (`id_Producto`)
;

-- Table Cliente

CREATE TABLE `Cliente`
(
  `id_Cliente` Int NOT NULL AUTO_INCREMENT,
  `Nombre` Varchar(50) NOT NULL,
  `Direccion` Varchar(50),
  `Telefono` Int NOT NULL,
  `Email` Varchar(30),
  `RFC` Varchar(25),
  `Descuento` Int NOT NULL,
  PRIMARY KEY (`id_Cliente`)
)
;

-- Table Proveedor

CREATE TABLE `Proveedor`
(
  `id_Proveedor` Int NOT NULL AUTO_INCREMENT,
  `Nombre` Varchar(50) NOT NULL,
  `Direccion` Varchar(30) NOT NULL,
  `Telefono` Int NOT NULL,
  `Email` Varchar(30) NOT NULL,
  `RFC` Varchar(20) NOT NULL,
  PRIMARY KEY (`id_Proveedor`)
)
;

-- Table Usuario

CREATE TABLE `Usuario`
(
  `id_User` Int NOT NULL,
  `Usuario` Varchar(20) NOT NULL,
  `Password` Varchar(30) NOT NULL,
  `Nombre` Varchar(50) NOT NULL,
  `Puesto` Varchar(20) NOT NULL,
  `Telefono` Int NOT NULL,
  `Email` Varchar(30) NOT NULL
)
;

ALTER TABLE `Usuario` ADD PRIMARY KEY (`id_User`)
;

ALTER TABLE `Usuario` ADD UNIQUE `Usuario` (`Usuario`)
;

-- Table Venta

CREATE TABLE `Venta`
(
  `id_Venta` Int NOT NULL AUTO_INCREMENT,
  `fecha_Hora` Datetime NOT NULL,
  `id_User` Int NOT NULL,
  `id_Cliente` Int,
  `Total` Float NOT NULL,
  `Pago` Float NOT NULL,
  `Cambio` Float NOT NULL,
  PRIMARY KEY (`id_Venta`)
)
;

CREATE INDEX `IX_Relationship10` ON `Venta` (`id_User`)
;

CREATE INDEX `IX_Relationship18` ON `Venta` (`id_Cliente`)
;

-- Table Credito

CREATE TABLE `Credito`
(
  `id_Credito` Int NOT NULL AUTO_INCREMENT,
  `monto_Credito` Double NOT NULL,
  `id_Cliente` Int,
  `id_Venta` Int,
  PRIMARY KEY (`id_Credito`)
)
;

CREATE INDEX `IX_Relationship8` ON `Credito` (`id_Cliente`)
;

CREATE INDEX `IX_Relationship11` ON `Credito` (`id_Venta`)
;

-- Table abono_Credito

CREATE TABLE `abono_Credito`
(
  `id_Abono` Int NOT NULL AUTO_INCREMENT,
  `monto_Abono` Double NOT NULL,
  `fecha_Hora` Datetime NOT NULL,
  `id_Credito` Int NOT NULL,
  PRIMARY KEY (`id_Abono`,`id_Credito`)
)
;

-- Table compra_Produ

CREATE TABLE `compra_Produ`
(
  `id_Compra` Int NOT NULL AUTO_INCREMENT,
  `fecha_Hora` Datetime NOT NULL,
  `id_Proveedor` Int,
  PRIMARY KEY (`id_Compra`)
)
;

CREATE INDEX `IX_Relationship14` ON `compra_Produ` (`id_Proveedor`)
;

-- Table productos_Venta

CREATE TABLE `productos_Venta`
(
  `id_Venta` Int NOT NULL,
  `id_Producto` Bigint NOT NULL,
  `Nombre` Varchar(50) NOT NULL,
  `Cantidad` Int NOT NULL,
  `precio_Unitario` Double NOT NULL,
  `precio_Total` Float NOT NULL
)
;

ALTER TABLE `productos_Venta` 
;

-- Table productos_Compra

CREATE TABLE `productos_Compra`
(
  `id_Compra` Int NOT NULL,
  `id_Producto` Bigint NOT NULL,
  `Cantidad` Int NOT NULL,
  `precio_Compra` Double NOT NULL
)
;

ALTER TABLE `productos_Compra` ADD PRIMARY KEY (`id_Compra`)
;

-- Table Caja

CREATE TABLE `Caja`
(
  `id_Caja` Int NOT NULL,
  `id_User` Int,
  `Fondo` Double NOT NULL,
  `Fecha` Date NOT NULL,
  `Ingreso` Double NOT NULL,
  `Corte` Double NOT NULL
)
;

CREATE INDEX `IX_Relationship19` ON `Caja` (`id_User`)
;

ALTER TABLE `Caja` ADD PRIMARY KEY (`id_Caja`)
;

-- Table retiroParcial

CREATE TABLE `retiroParcial`
(
  `Id_Retiro` Int NOT NULL AUTO_INCREMENT,
  `fecha_Hora` Datetime NOT NULL,
  `Monto` Double NOT NULL,
  `id_User` Int,
  `id_Caja` Int,
  PRIMARY KEY (`Id_Retiro`)
)
;

CREATE INDEX `IX_Relationship21` ON `retiroParcial` (`id_User`)
;

CREATE INDEX `IX_Relationship22` ON `retiroParcial` (`id_Caja`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Credito` ADD CONSTRAINT `puedeTener` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id_Cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `abono_Credito` ADD CONSTRAINT `Necesita` FOREIGN KEY (`id_Credito`) REFERENCES `Credito` (`id_Credito`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Venta` ADD CONSTRAINT `Realiza` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Credito` ADD CONSTRAINT `PuedeSer` FOREIGN KEY (`id_Venta`) REFERENCES `Venta` (`id_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Venta` ADD CONSTRAINT `Contiene` FOREIGN KEY (`id_Venta`) REFERENCES `Venta` (`id_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Venta` ADD CONSTRAINT `seVende` FOREIGN KEY (`id_Producto`) REFERENCES `Producto` (`id_Producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `compra_Produ` ADD CONSTRAINT `Vende` FOREIGN KEY (`id_Proveedor`) REFERENCES `Proveedor` (`id_Proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Compra` ADD CONSTRAINT `Agrega` FOREIGN KEY (`id_Compra`) REFERENCES `compra_Produ` (`id_Compra`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Compra` ADD CONSTRAINT `ADDInventario` FOREIGN KEY (`id_Producto`) REFERENCES `Producto` (`id_Producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Venta` ADD CONSTRAINT `compra` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id_Cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Caja` ADD CONSTRAINT `Relationship19` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `retiroParcial` ADD CONSTRAINT `Relationship21` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `retiroParcial` ADD CONSTRAINT `seRetira` FOREIGN KEY (`id_Caja`) REFERENCES `Caja` (`id_Caja`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

