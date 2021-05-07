-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2021 a las 19:15:21
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
  `Direccion` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `RFC` varchar(25) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_Cliente`, `Nombre`, `Direccion`, `Telefono`, `Email`, `RFC`) VALUES
(3, 'Gabo', 'Rivera del atoyac #2102', 2147483647, 'editedlook@hotmail.com', 'kjvydtf5'),
(4, 'Carmen', 'asdasdas', 123213, 'sdasdas@gmail.com', '21312');

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
  `Nombre` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
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
(7501072204226, 'Campeon alimento 800 gramos', 10, 75, 125, 100, 90),
(7501130525102, 'Colorante mariposa 32G', 10, 15, 15, 15, 15);

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
  `precio_Venta` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

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
(2, 'vETERIARIA', 'asdasd', 265189, 'saasfsaf@gmail.com', 'asfqwqe'),
(6, 'Vet', 'asdsafsfa coaslfi ', 2656, 'sadas@gmail.com', 'ssadsfasf12');

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
  `id_Cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

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
  ADD PRIMARY KEY (`id_Compra`,`id_Producto`),
  ADD KEY `ADDInventario` (`id_Producto`);

--
-- Indices de la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD PRIMARY KEY (`id_Venta`,`id_Producto`),
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
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `retiroparcial`
--
ALTER TABLE `retiroparcial`
  MODIFY `Id_Retiro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `ADDInventario` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`),
  ADD CONSTRAINT `Agrega` FOREIGN KEY (`id_Compra`) REFERENCES `compra_produ` (`id_Compra`);

--
-- Filtros para la tabla `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD CONSTRAINT `Contiene` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`),
  ADD CONSTRAINT `Relationship13` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_Producto`);

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
