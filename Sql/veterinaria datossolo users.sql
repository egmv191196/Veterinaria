-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2021 a las 11:13:21
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Telefono` bigint(11) NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `RFC` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL
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
(3, 'Juan', '123456', 'Juan Perez', 2, 1231556, 'asd@gmail.com', 1),
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_Caja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id_Credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operacion_caja`
--
ALTER TABLE `operacion_caja`
  MODIFY `Id_Operacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operacion_credito`
--
ALTER TABLE `operacion_credito`
  MODIFY `id_Abono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `Realiza` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`),
  ADD CONSTRAINT `compra` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
