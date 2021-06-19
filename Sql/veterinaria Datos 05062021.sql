-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2021 a las 03:45:56
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
  `id_Caja` char(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
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
(1, 'Edgar', '', 123456, '', '', 0),
(2, 'Luis', '', 48949, '', '', 1),
(3, 'Juan', '', 25461, '', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_produ`
--

CREATE TABLE `compra_produ` (
  `id_Compra` int(11) NOT NULL,
  `fecha_Hora` datetime NOT NULL,
  `id_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

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
(7501040305320, 'Silicon', 91, 12.5, 17.5, 17, 16.5),
(7501055303786, 'Fresca 600 ml', 10, 10, 15, 14, 13),
(7501072204226, 'Alimento campeon 800 gramas', 3, 45, 60, 55, 50),
(7501130525102, 'Colorante mariposa ', 13, 10, 10, 10, 10),
(7501310011067, 'Resina epoxica', 81, 12.5, 25.5, 20, 17.56),
(7501791657693, 'Rastillos', 88, 10, 17.5, 17, 13.5),
(7622210833792, 'Galletas oreo', 4, 10, 10, 10, 10),
(7702031311218, 'Crema Lubriderm', 1, 80, 120, 110, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_compra`
--

CREATE TABLE `productos_compra` (
  `id_Compra` int(11) NOT NULL,
  `id_Producto` bigint(20) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `precio_Compra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_venta`
--

CREATE TABLE `productos_venta` (
  `id_Venta` int(11) NOT NULL,
  `id_Producto` bigint(20) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `precio_Unitario` float NOT NULL,
  `precio_Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos_venta`
--

INSERT INTO `productos_venta` (`id_Venta`, `id_Producto`, `Cantidad`, `precio_Unitario`, `precio_Total`) VALUES
(5, 7501130525102, 1, 10, 10),
(5, 7501310011067, 1, 25.5, 25.5),
(6, 7501130525102, 1, 10, 10),
(6, 7501310011067, 1, 25.5, 25.5),
(7, 7501310011067, 1, 25.5, 25.5),
(8, 7501310011067, 1, 25.5, 25.5),
(10, 7501310011067, 1, 25.5, 25.5),
(11, 7501310011067, 1, 25.5, 25.5),
(12, 7501310011067, 1, 25.5, 25.5),
(12, 7501791657693, 1, 17.5, 17.5),
(15, 7501040305320, 1, 17.5, 17.5),
(15, 7501310011067, 1, 25.5, 25.5),
(15, 7501791657693, 1, 17.5, 17.5),
(17, 7501310011067, 1, 25.5, 25.5),
(17, 7501310011067, 1, 25.5, 25.5),
(17, 7501310011067, 1, 25.5, 25.5),
(17, 7501310011067, 1, 25.5, 25.5),
(17, 7501310011067, 1, 25.5, 25.5),
(17, 7501130525102, 1, 10, 10),
(17, 7501130525102, 1, 10, 10),
(17, 7501130525102, 1, 10, 10),
(17, 7501130525102, 1, 10, 10),
(17, 7501130525102, 1, 10, 10),
(17, 7501040305320, 1, 17.5, 17.5),
(17, 7501040305320, 1, 17.5, 17.5),
(17, 7501040305320, 1, 17.5, 17.5),
(17, 7501040305320, 1, 17.5, 17.5),
(17, 7501040305320, 1, 17.5, 17.5),
(20, 7501130525102, 1, 10, 10),
(20, 7501040305320, 1, 17.5, 17.5),
(20, 7501040305320, 1, 17.5, 17.5),
(20, 7501310011067, 1, 25.5, 25.5),
(20, 7501310011067, 1, 25.5, 25.5);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiroparcial`
--

CREATE TABLE `retiroparcial` (
  `Id_Retiro` int(11) NOT NULL,
  `fecha_Hora` datetime NOT NULL,
  `Monto` double NOT NULL,
  `id_User` int(11) DEFAULT NULL,
  `id_Caja` char(20) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_User` int(11) NOT NULL,
  `Usuario` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre` char(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
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
  `Total` float NOT NULL,
  `Pago` float NOT NULL,
  `Cambio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_Venta`, `fecha_Hora`, `id_User`, `id_Cliente`, `Total`, `Pago`, `Cambio`) VALUES
(1, '2021-06-05 15:35:51', 1, 2, 10, 10, 0),
(2, '2021-06-05 15:43:48', 1, 2, 17.5, 50, 32.5),
(3, '2021-06-05 15:44:26', 1, 2, 17.5, 50, 32.5),
(4, '2021-06-05 15:54:26', 1, 2, 27.5, 50, 22.5),
(5, '2021-06-05 15:57:50', 1, 2, 35.5, 50, 14.5),
(6, '2021-06-05 15:59:05', 1, 2, 112, 150, 38),
(7, '2021-06-05 16:00:32', 1, 2, 76.5, 150, 73.5),
(8, '2021-06-05 16:02:04', 1, 2, 102, 200, 98),
(9, '2021-06-05 16:02:41', 1, 2, 102, 150, 48),
(10, '2021-06-05 16:03:36', 1, 2, 25.5, 50, 24.5),
(11, '2021-06-05 16:03:45', 1, 2, 51, 100, 49),
(12, '2021-06-05 16:04:04', 1, 2, 68.5, 100, 31.5),
(13, '2021-06-05 16:04:38', 1, 2, 76.5, 100, 23.5),
(14, '2021-06-06 01:37:20', 1, 2, 51, 100, 49),
(15, '2021-06-06 01:39:20', 1, 2, 60.5, 100, 39.5),
(16, '2021-06-06 01:41:27', 1, 2, 350, 400, 50),
(17, '2021-06-06 01:42:31', 1, 2, 265, 300, 35),
(18, '2021-06-06 01:43:25', 1, 2, 265, 300, 35),
(19, '2021-06-06 03:19:43', 1, 2, 128.5, 150, 21.5),
(20, '2021-06-06 03:20:51', 1, 2, 96, 100, 4);

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
  ADD KEY `Relationship13` (`id_Producto`);

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
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra_produ`
--
ALTER TABLE `compra_produ`
  MODIFY `id_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id_Credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `retiroparcial`
--
ALTER TABLE `retiroparcial`
  MODIFY `Id_Retiro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- Filtros para la tabla `retiroparcial`
--
ALTER TABLE `retiroparcial`
  ADD CONSTRAINT `Relationship21` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `seRetira` FOREIGN KEY (`id_Caja`) REFERENCES `caja` (`id_Caja`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
