-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2021 a las 10:56:39
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_Caja` int(11) NOT NULL,
  `id_User` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Fondo` double NOT NULL,
  `total_Ingreso` double NOT NULL DEFAULT 0,
  `totalDia` double NOT NULL,
  `Corte` double NOT NULL DEFAULT 0,
  `horaCorte` time DEFAULT NULL,
  `Diferencia` double NOT NULL DEFAULT 0,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_Caja`, `id_User`, `Fecha`, `Hora`, `Fondo`, `total_Ingreso`, `totalDia`, `Corte`, `horaCorte`, `Diferencia`, `Estado`) VALUES
(1, 5, '2021-07-06', '09:47:01', 100, 708.18, 808.18, 809, '22:14:53', 0.82, 0),
(2, 3, '2021-07-07', '09:13:00', 100, 0, 0, 0, NULL, 0, 1),
(3, 5, '2021-07-12', '12:28:39', 150, 0, 0, 0, NULL, 0, 1),
(4, 2, '2021-07-15', '09:23:07', 150, 0, 0, 0, NULL, 0, 1),
(5, 2, '2021-07-16', '07:48:53', 150, 0, 0, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_Cliente` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Direccion` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `RFC` varchar(25) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_Cliente`, `Nombre`, `Direccion`, `Telefono`, `Email`, `RFC`, `Descuento`) VALUES
(1, 'Cliente general', '', 0, '', '', 0),
(2, 'Luis', '', 48949, '', '', 1),
(3, 'Juan', '', 25461, '', '', 2),
(4, 'Edgar', '', 2147483647, '', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_Compra` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `num_Ticket` bigint(20) NOT NULL,
  `Total` float NOT NULL,
  `id_Proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `id_Credito` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `monto_Credito` float NOT NULL,
  `monto_Abonado` float NOT NULL,
  `Estado` int(11) NOT NULL,
  `id_Cliente` int(11) DEFAULT NULL,
  `id_Venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `credito`
--

INSERT INTO `credito` (`id_Credito`, `Fecha`, `Hora`, `monto_Credito`, `monto_Abonado`, `Estado`, `id_Cliente`, `id_Venta`) VALUES
(3, '2021-07-12', '12:29:40', 60, 30, 1, 3, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion_caja`
--

CREATE TABLE `operacion_caja` (
  `Id_Operacion` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Monto` double NOT NULL,
  `Tipo` int(11) NOT NULL,
  `id_User` int(11) NOT NULL,
  `id_Caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion_credito`
--

CREATE TABLE `operacion_credito` (
  `id_Abono` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Monto` double NOT NULL,
  `Efectivo` double NOT NULL,
  `Cambio` double NOT NULL,
  `id_Credito` int(11) NOT NULL,
  `id_User` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `operacion_credito`
--

INSERT INTO `operacion_credito` (`id_Abono`, `Fecha`, `Hora`, `Monto`, `Efectivo`, `Cambio`, `id_Credito`, `id_User`) VALUES
(8, '2021-07-12', '12:30:28', 30, 50, 20, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_Producto` bigint(20) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `p_Compra` double NOT NULL,
  `p_ventaN` double NOT NULL,
  `p_VentaMe` double NOT NULL,
  `p_VentaMa` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_Producto`, `Nombre`, `Cantidad`, `p_Compra`, `p_ventaN`, `p_VentaMe`, `p_VentaMa`) VALUES
(75052478, 'Desodorante rexona', 21, 25, 45, 40, 35),
(75065959, 'Libreta profesional new Wave', 14, 10, 10, 10, 10),
(738545010610, 'Salsa botanera', 10, 35, 45, 44, 43),
(759684154058, 'Vaselina', 8, 10, 25, 20, 17),
(7501000264773, 'Papas chips jalapeño', 5, 10, 15, 14, 13),
(7501040305320, 'Silicon', 81, 15, 17.5, 17, 16.5),
(7501055303786, 'Fresca 600 ml', 10, 10, 15, 14, 13),
(7501072204226, 'Alimento campeon 800 gramas', 3, 45, 60, 55, 50),
(7501072211927, 'Gatina 2 Kg sabor salmon para chachorros', 8, 50, 85, 80, 75),
(7501130525102, 'Colorante mariposa ', 168, 16, 100, 10, 10),
(7501310011067, 'Resina epoxica', 226, 13, 25.5, 20, 17.56),
(7501791657693, 'Rastillos', 322, 15, 17.5, 17, 13.5),
(7502212484676, 'hojas blancoas ', 7, 15.5, 50.5, 35.5, 30),
(7622210833792, 'Galletas oreo', 4, 10, 10, 10, 10),
(7702031311218, 'Crema Lubriderm', 1, 80, 120, 110, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_compra`
--

CREATE TABLE `productos_compra` (
  `id_Compra` int(11) NOT NULL,
  `id_Producto` bigint(20) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `precio_Compra` double NOT NULL,
  `p_Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_venta`
--

CREATE TABLE `productos_venta` (
  `id_Venta` int(11) NOT NULL,
  `id_Producto` bigint(20) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `precio_Unitario` double NOT NULL,
  `precio_Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos_venta`
--

INSERT INTO `productos_venta` (`id_Venta`, `id_Producto`, `Nombre`, `Cantidad`, `precio_Unitario`, `precio_Total`) VALUES
(7, 7502212484676, 'hojas blancoas', 1, 50.5, 50.5),
(8, 7502212484676, 'hojas blancoas', 2, 30, 60),
(9, 75052478, 'Desodorante rexona', 1, 35, 35),
(9, 75052478, 'Desodorante rexona', 3, 35, 105),
(10, 75065959, 'Libreta profesional new Wave', 1, 10, 10),
(11, 75052478, 'Desodorante rexona', 1, 35, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_vsuspendida`
--

CREATE TABLE `productos_vsuspendida` (
  `id_Venta` int(11) NOT NULL,
  `id_Producto` bigint(20) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `p_Unitario` float NOT NULL,
  `Cantidad` float NOT NULL,
  `Subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos_vsuspendida`
--

INSERT INTO `productos_vsuspendida` (`id_Venta`, `id_Producto`, `Nombre`, `p_Unitario`, `Cantidad`, `Subtotal`) VALUES
(1, 75065959, 'Libreta profesional new Wave', 10, 1, 10),
(2, 75052478, 'Desodorante rexona', 35, 1, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Direccion` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `RFC` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_Proveedor`, `Nombre`, `Direccion`, `Telefono`, `Email`, `RFC`) VALUES
(1, 'Bodega del perro', 'Rivera del atoyac #2102', 225189926, 'editedlook@hotmail.com', 'sadasdasdas12312'),
(2, 'sadasfa', '312312assd', 12312231, 'ssdfsdsd@dfad123.com', '312312ssdfdd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_User` int(11) NOT NULL,
  `Usuario` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Puesto` int(11) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_User`, `Usuario`, `Password`, `Nombre`, `Puesto`, `Telefono`, `Email`, `Estado`) VALUES
(1, 'Edgar', '123456', 'Edgar Gabriel', 1, 265189, 'saasfsaf@gmail.com', 1),
(2, 'Carmen', '123456', 'Carmen', 3, 2147483647, 'carmen@gmail.com', 1),
(3, 'Juan', '123456', 'Juan Perez', 2, 1231556, '  asd@gmail.com', 1),
(4, 'Pedro', '123456', 'Pedro Rodriguez', 3, 21516232, '    dsada@gmail.com', 1),
(5, 'Luis', '123456', 'Luis Fernandez', 3, 222222, 'asdasd@gmail.com', 1),
(6, 'Felipe', '123456', 'Felipe Lopez Perez', 3, 2147483647, 'fel@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_Venta` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `id_User` int(11) NOT NULL,
  `id_Cliente` int(11) NOT NULL,
  `Total` float NOT NULL,
  `Pago` float NOT NULL,
  `Cambio` float NOT NULL,
  `forma_Pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_Venta`, `Fecha`, `Hora`, `id_User`, `id_Cliente`, `Total`, `Pago`, `Cambio`, `forma_Pago`) VALUES
(1, '2021-07-05', '09:49:08', 5, 1, 117.5, 120, 2.5, 0),
(2, '2021-07-06', '09:49:42', 5, 3, 41.06, 0, 0, 1),
(3, '2021-07-06', '09:50:19', 5, 1, 255, 300, 45, 0),
(4, '2021-07-06', '09:51:25', 5, 1, 160.5, 170, 9.5, 0),
(5, '2021-07-06', '09:57:43', 5, 1, 200, 200, 0, 0),
(6, '2021-07-06', '11:44:33', 5, 4, 61.62, 0, 0, 1),
(7, '2021-07-12', '12:29:12', 5, 1, 50.5, 100, 49.5, 0),
(8, '2021-07-12', '12:29:40', 5, 3, 60, 0, 0, 1),
(9, '2021-07-16', '10:51:25', 2, 4, 140, 150, 10, 0),
(10, '2021-07-16', '10:54:53', 2, 1, 10, 20, 10, 0),
(11, '2021-07-16', '10:55:08', 2, 4, 35, 50, 15, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_suspendida`
--

CREATE TABLE `venta_suspendida` (
  `id_Venta` int(11) NOT NULL,
  `nombreCliente` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_Cliente` int(11) NOT NULL,
  `Descuento` int(11) NOT NULL,
  `Total` float NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `id_User` int(11) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_suspendida`
--

INSERT INTO `venta_suspendida` (`id_Venta`, `nombreCliente`, `id_Cliente`, `Descuento`, `Total`, `Fecha`, `Hora`, `id_User`, `Estado`) VALUES
(1, 'Juan', 1, 0, 10, '2021-07-16', '09:15:56', 5, 0),
(2, 'Edgar', 4, 2, 35, '2021-07-16', '10:48:08', 5, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_Caja`),
  ADD KEY `IX_Relationship19` (`id_User`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_Compra`),
  ADD KEY `IX_Relationship14` (`id_Proveedor`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`id_Credito`),
  ADD KEY `IX_Relationship8` (`id_Cliente`),
  ADD KEY `IX_Relationship11` (`id_Venta`);

--
-- Indices de la tabla `operacion_caja`
--
ALTER TABLE `operacion_caja`
  ADD PRIMARY KEY (`Id_Operacion`),
  ADD KEY `IX_Relationship21` (`id_User`),
  ADD KEY `IX_Relationship22` (`id_Caja`);

--
-- Indices de la tabla `operacion_credito`
--
ALTER TABLE `operacion_credito`
  ADD PRIMARY KEY (`id_Abono`),
  ADD KEY `IX_Relationship1` (`id_User`),
  ADD KEY `Tiene` (`id_Credito`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_Producto`);

--
-- Indices de la tabla `productos_compra`
--
ALTER TABLE `productos_compra`
  ADD KEY `Agrega` (`id_Compra`),
  ADD KEY `ADDInventario` (`id_Producto`);

--
-- Indices de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD KEY `Contiene` (`id_Venta`),
  ADD KEY `seVende` (`id_Producto`);

--
-- Indices de la tabla `productos_vsuspendida`
--
ALTER TABLE `productos_vsuspendida`
  ADD KEY `IX_Relationship1` (`id_Producto`),
  ADD KEY `IX_Relationship2` (`id_Venta`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_Proveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_User`),
  ADD UNIQUE KEY `Usuario` (`Usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_Venta`),
  ADD KEY `IX_Relationship10` (`id_User`),
  ADD KEY `IX_Relationship18` (`id_Cliente`);

--
-- Indices de la tabla `venta_suspendida`
--
ALTER TABLE `venta_suspendida`
  ADD PRIMARY KEY (`id_Venta`),
  ADD KEY `IX_Relationship4` (`id_User`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_Caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id_Credito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `operacion_caja`
--
ALTER TABLE `operacion_caja`
  MODIFY `Id_Operacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operacion_credito`
--
ALTER TABLE `operacion_credito`
  MODIFY `id_Abono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `venta_suspendida`
--
ALTER TABLE `venta_suspendida`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `Tiene_su` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `Vende` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`);

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `Pago` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`),
  ADD CONSTRAINT `puedeTener` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);

--
-- Filtros para la tabla `operacion_caja`
--
ALTER TABLE `operacion_caja`
  ADD CONSTRAINT `Puede_realizar` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `Tiene_Op` FOREIGN KEY (`id_Caja`) REFERENCES `caja` (`id_Caja`);

--
-- Filtros para la tabla `operacion_credito`
--
ALTER TABLE `operacion_credito`
  ADD CONSTRAINT `Realiz` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `Tiene` FOREIGN KEY (`id_Credito`) REFERENCES `credito` (`id_Credito`);

--
-- Filtros para la tabla `productos_compra`
--
ALTER TABLE `productos_compra`
  ADD CONSTRAINT `ADDInventario` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`),
  ADD CONSTRAINT `Agrega` FOREIGN KEY (`id_Compra`) REFERENCES `compra` (`id_Compra`);

--
-- Filtros para la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD CONSTRAINT `Contiene` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`),
  ADD CONSTRAINT `seVende` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`);

--
-- Filtros para la tabla `productos_vsuspendida`
--
ALTER TABLE `productos_vsuspendida`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`),
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`id_Venta`) REFERENCES `venta_suspendida` (`id_Venta`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `Realiza` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `compra` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);

--
-- Filtros para la tabla `venta_suspendida`
--
ALTER TABLE `venta_suspendida`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
