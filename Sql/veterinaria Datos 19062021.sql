-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2021 a las 09:02:16
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
-- Estructura de tabla para la tabla `abono_credito`
--

CREATE TABLE `abono_credito` (
  `id_Abono` int(11) NOT NULL,
  `monto_Abono` double NOT NULL,
  `fecha_Hora` datetime NOT NULL,
  `id_Credito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_Caja` int(11) NOT NULL,
  `id_User` int(11) DEFAULT NULL,
  `Fondo` double NOT NULL,
  `Fecha` date NOT NULL,
  `Ingreso` double NOT NULL,
  `Corte` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

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
-- Estructura de tabla para la tabla `compra_produ`
--

CREATE TABLE `compra_produ` (
  `id_Compra` int(11) NOT NULL,
  `fecha_Hora` datetime NOT NULL,
  `num_Ticket` bigint(20) NOT NULL,
  `Total` float NOT NULL,
  `id_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `compra_produ`
--

INSERT INTO `compra_produ` (`id_Compra`, `fecha_Hora`, `num_Ticket`, `Total`, `id_Proveedor`) VALUES
(1, '2021-06-19 08:27:45', 105780562, 200, 1),
(2, '2021-06-19 08:44:05', 5615613156, 1230, 2),
(3, '2021-06-19 08:45:09', 5615613156, 1230, 2),
(4, '2021-06-19 08:48:07', 53453453, 200, 1),
(5, '2021-06-19 08:50:57', 51615616, 250, 2),
(6, '2021-06-19 08:54:05', 51615616, 250, 2),
(7, '2021-06-19 08:54:23', 51615616, 250, 2),
(8, '2021-06-19 08:55:22', 5616551651, 400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `id_Credito` int(11) NOT NULL,
  `monto_Credito` double NOT NULL,
  `id_Cliente` int(11) DEFAULT NULL,
  `id_Venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

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
(75052478, 'Desodorante rexona', 25, 25, 45, 40, 35),
(75065959, 'Libreta profesional new Wave', 15, 10, 10, 10, 10),
(738545010610, 'Salsa botanera', 10, 35, 45, 44, 43),
(759684154058, 'Vaselina', 9, 10, 25, 20, 17),
(7501000264773, 'Papas chips jalapeño', 5, 10, 15, 14, 13),
(7501040305320, 'Silicon', 69, 12.5, 17.5, 17, 16.5),
(7501055303786, 'Fresca 600 ml', 10, 10, 15, 14, 13),
(7501072204226, 'Alimento campeon 800 gramas', 3, 45, 60, 55, 50),
(7501072211927, 'Gatina 2 Kg sabor salmon para chachorros', 8, 50, 85, 80, 75),
(7501130525102, 'Colorante mariposa ', 178, 16, 100, 10, 10),
(7501310011067, 'Resina epoxica', 140, 20, 25.5, 20, 17.56),
(7501791657693, 'Rastillos', 325, 10, 17.5, 17, 13.5),
(7502212484676, 'hojas blancoas ', 10, 15.5, 50.5, 35.5, 30),
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

--
-- Volcado de datos para la tabla `productos_compra`
--

INSERT INTO `productos_compra` (`id_Compra`, `id_Producto`, `Nombre`, `Cantidad`, `precio_Compra`, `p_Total`) VALUES
(1, 7501791657693, 'Rastillos', 10, 20, 200),
(4, 7501310011067, 'Resina epoxica', 10, 20, 200),
(5, 7501310011067, 'Resina epoxica', 10, 20, 200),
(5, 7501791657693, 'Rastillos', 5, 10, 50),
(5, 7501310011067, 'Resina epoxica', 10, 20, 200),
(5, 7501791657693, 'Rastillos', 5, 10, 50),
(5, 7501310011067, 'Resina epoxica', 10, 20, 200),
(5, 7501791657693, 'Rastillos', 5, 10, 50),
(8, 7501310011067, 'Resina epoxica', 10, 20, 200),
(8, 7501791657693, 'Rastillos', 20, 10, 200);

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
(1, 7501310011067, 'Resina epoxica', 1, 25.5, 25.5),
(1, 7501310011067, 'Resina epoxica', 1, 25.5, 25.5),
(1, 7501310011067, 'Resina epoxica', 1, 25.5, 25.5),
(2, 7501310011067, 'Resina epoxica', 1, 17.56, 17.56),
(2, 7501310011067, 'Resina epoxica', 1, 17.56, 17.56),
(2, 7501310011067, 'Resina epoxica', 1, 17.56, 17.56),
(2, 7501310011067, 'Resina epoxica', 1, 17.56, 17.56),
(3, 7501310011067, 'Resina epoxica', 1, 20, 20),
(3, 7501040305320, 'Silicon', 1, 17, 17),
(3, 7501130525102, 'Colorante mariposa', 1, 10, 10);

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
(1, 'Bodega del perro', 'sdadasd12312fsd asadasd dasd a', 2147483647, 'editedlook@hotmail.com', 'sadasdasdas12312'),
(2, 'sadasfa', '312312assd', 12312231, 'ssdfsdsd@dfad123.com', '312312ssdfdd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiroparcial`
--

CREATE TABLE `retiroparcial` (
  `Id_Retiro` int(11) NOT NULL,
  `fecha_Hora` datetime NOT NULL,
  `Monto` double NOT NULL,
  `id_User` int(11) DEFAULT NULL,
  `id_Caja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_User` int(11) NOT NULL,
  `Usuario` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Puesto` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_User`, `Usuario`, `Password`, `Nombre`, `Puesto`, `Telefono`, `Email`) VALUES
(1, 'Edgar', '123456', 'Edgar Gabriel', 'Admin', 265189, 'saasfsaf@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_Venta` int(11) NOT NULL,
  `fecha_Hora` datetime NOT NULL,
  `id_User` int(11) NOT NULL,
  `id_Cliente` int(11) DEFAULT NULL,
  `Total` double NOT NULL,
  `Pago` double NOT NULL,
  `Cambio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_Venta`, `fecha_Hora`, `id_User`, `id_Cliente`, `Total`, `Pago`, `Cambio`) VALUES
(1, '2021-06-10 12:11:58', 1, 1, 76.5, 100, 23.5),
(2, '2021-06-10 12:12:24', 1, 3, 70.24, 100, 29.76),
(3, '2021-06-10 12:14:26', 1, 2, 47, 50, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono_credito`
--
ALTER TABLE `abono_credito`
  ADD PRIMARY KEY (`id_Abono`,`id_Credito`),
  ADD KEY `Necesita` (`id_Credito`);

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
-- Indices de la tabla `compra_produ`
--
ALTER TABLE `compra_produ`
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
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_Producto`);

--
-- Indices de la tabla `productos_compra`
--
ALTER TABLE `productos_compra`
  ADD KEY `ADDInventario` (`id_Producto`);

--
-- Indices de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD KEY `Contiene` (`id_Venta`),
  ADD KEY `seVende` (`id_Producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_Proveedor`);

--
-- Indices de la tabla `retiroparcial`
--
ALTER TABLE `retiroparcial`
  ADD PRIMARY KEY (`Id_Retiro`),
  ADD KEY `IX_Relationship21` (`id_User`),
  ADD KEY `IX_Relationship22` (`id_Caja`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abono_credito`
--
ALTER TABLE `abono_credito`
  MODIFY `id_Abono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compra_produ`
--
ALTER TABLE `compra_produ`
  MODIFY `id_Compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id_Credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `retiroparcial`
--
ALTER TABLE `retiroparcial`
  MODIFY `Id_Retiro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono_credito`
--
ALTER TABLE `abono_credito`
  ADD CONSTRAINT `Necesita` FOREIGN KEY (`id_Credito`) REFERENCES `credito` (`id_Credito`);

--
-- Filtros para la tabla `caja`
--
ALTER TABLE `caja`
  ADD CONSTRAINT `Relationship19` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`);

--
-- Filtros para la tabla `compra_produ`
--
ALTER TABLE `compra_produ`
  ADD CONSTRAINT `Vende` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`);

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `PuedeSer` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`),
  ADD CONSTRAINT `puedeTener` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);

--
-- Filtros para la tabla `productos_compra`
--
ALTER TABLE `productos_compra`
  ADD CONSTRAINT `ADDInventario` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`);

--
-- Filtros para la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD CONSTRAINT `Contiene` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`),
  ADD CONSTRAINT `seVende` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`);

--
-- Filtros para la tabla `retiroparcial`
--
ALTER TABLE `retiroparcial`
  ADD CONSTRAINT `Relationship21` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `seRetira` FOREIGN KEY (`id_Caja`) REFERENCES `caja` (`id_Caja`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `Realiza` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `compra` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
