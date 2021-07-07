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
  `id_User` Int NOT NULL AUTO_INCREMENT,
  `Usuario` Varchar(20) NOT NULL,
  `Password` Varchar(30) NOT NULL,
  `Nombre` Varchar(50) NOT NULL,
  `Puesto` Int NOT NULL,
  `Telefono` Int NOT NULL,
  `Email` Varchar(30) NOT NULL,
  `Estado` Int NOT NULL,
  PRIMARY KEY (`id_User`)
)
;

ALTER TABLE `Usuario` ADD UNIQUE `Usuario` (`Usuario`)
;

-- Table Venta

CREATE TABLE `Venta`
(
  `id_Venta` Int NOT NULL AUTO_INCREMENT,
  `Fecha` Date NOT NULL,
  `Hora` Time NOT NULL,
  `id_User` Int NOT NULL,
  `id_Cliente` Int NOT NULL,
  `Total` Float NOT NULL,
  `Pago` Float NOT NULL,
  `Cambio` Float NOT NULL,
  `forma_Pago` Int NOT NULL,
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
  `Fecha` Date NOT NULL,
  `Hora` Time NOT NULL,
  `monto_Credito` Float NOT NULL,
  `monto_Abonado` Float NOT NULL,
  `Estado` Int NOT NULL,
  `id_Cliente` Int,
  `id_Venta` Int,
  PRIMARY KEY (`id_Credito`)
)
;

CREATE INDEX `IX_Relationship8` ON `Credito` (`id_Cliente`)
;

CREATE INDEX `IX_Relationship11` ON `Credito` (`id_Venta`)
;

-- Table operacion_Credito

CREATE TABLE `operacion_Credito`
(
  `id_Abono` Int NOT NULL AUTO_INCREMENT,
  `Fecha` Date NOT NULL,
  `Hora` Time NOT NULL,
  `Monto` Double NOT NULL,
  `id_Credito` Int NOT NULL,
  `id_User` Int NOT NULL,
  PRIMARY KEY (`id_Abono`)
)
;

CREATE INDEX `IX_Relationship1` ON `operacion_Credito` (`id_User`)
;

-- Table Compra

CREATE TABLE `Compra`
(
  `id_Compra` Int NOT NULL AUTO_INCREMENT,
  `Fecha` Date NOT NULL,
  `Hora` Time NOT NULL,
  `num_Ticket` Bigint NOT NULL,
  `Total` Float NOT NULL,
  `id_Proveedor` Int NOT NULL,
  PRIMARY KEY (`id_Compra`)
)
;

CREATE INDEX `IX_Relationship14` ON `Compra` (`id_Proveedor`)
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
  `Nombre` Varchar(50) NOT NULL,
  `Cantidad` Int NOT NULL,
  `precio_Compra` Double NOT NULL,
  `p_Total` Float NOT NULL
)
;

-- Table Caja

CREATE TABLE `Caja`
(
  `id_Caja` Int NOT NULL AUTO_INCREMENT,
  `id_User` Int NOT NULL,
  `Fecha` Date NOT NULL,
  `Hora` Time NOT NULL,
  `Fondo` Double NOT NULL,
  `total_Ingreso` Double NOT NULL DEFAULT 0.0,
  `Corte` Double NOT NULL DEFAULT 0.0,
  `Diferencia` Double NOT NULL DEFAULT 0.0,
  PRIMARY KEY (`id_Caja`)
)
;

CREATE INDEX `IX_Relationship19` ON `Caja` (`id_User`)
;

-- Table operacion_Caja

CREATE TABLE `operacion_Caja`
(
  `Id_Operacion` Int NOT NULL AUTO_INCREMENT,
  `Fecha` Date NOT NULL,
  `Hora` Time NOT NULL,
  `Monto` Double NOT NULL,
  `Tipo` Int NOT NULL,
  `id_User` Int NOT NULL,
  `id_Caja` Int NOT NULL,
  PRIMARY KEY (`Id_Operacion`)
)
;

CREATE INDEX `IX_Relationship21` ON `operacion_Caja` (`id_User`)
;

CREATE INDEX `IX_Relationship22` ON `operacion_Caja` (`id_Caja`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Credito` ADD CONSTRAINT `puedeTener` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id_Cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `operacion_Credito` ADD CONSTRAINT `Tiene` FOREIGN KEY (`id_Credito`) REFERENCES `Credito` (`id_Credito`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Venta` ADD CONSTRAINT `Realiza` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Credito` ADD CONSTRAINT `Pago` FOREIGN KEY (`id_Venta`) REFERENCES `Venta` (`id_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Venta` ADD CONSTRAINT `Contiene` FOREIGN KEY (`id_Venta`) REFERENCES `Venta` (`id_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Venta` ADD CONSTRAINT `seVende` FOREIGN KEY (`id_Producto`) REFERENCES `Producto` (`id_Producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Compra` ADD CONSTRAINT `Vende` FOREIGN KEY (`id_Proveedor`) REFERENCES `Proveedor` (`id_Proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Compra` ADD CONSTRAINT `Agrega` FOREIGN KEY (`id_Compra`) REFERENCES `Compra` (`id_Compra`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `productos_Compra` ADD CONSTRAINT `ADDInventario` FOREIGN KEY (`id_Producto`) REFERENCES `Producto` (`id_Producto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Venta` ADD CONSTRAINT `compra` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente` (`id_Cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Caja` ADD CONSTRAINT `Tiene_su` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `operacion_Caja` ADD CONSTRAINT `Puede_realizar` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `operacion_Caja` ADD CONSTRAINT `Tiene_Op` FOREIGN KEY (`id_Caja`) REFERENCES `Caja` (`id_Caja`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `operacion_Credito` ADD CONSTRAINT `Realiz` FOREIGN KEY (`id_User`) REFERENCES `Usuario` (`id_User`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

