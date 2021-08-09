-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2021 a las 11:21:19
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
-- Estructura de tabla para la tabla `creditoventa`
--

CREATE TABLE `creditoventa` (
  `id_Credito` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `monto_Credito` float NOT NULL,
  `id_Venta` int(11) DEFAULT NULL,
  `id_creditoTotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineacredito`
--

CREATE TABLE `lineacredito` (
  `id_creditoTotal` bigint(20) NOT NULL,
  `montoCredito` double NOT NULL,
  `montoAbonado` double NOT NULL DEFAULT 0,
  `montoRestante` double NOT NULL DEFAULT 0,
  `id_Cliente` int(11) DEFAULT NULL
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
  `id_User` int(11) NOT NULL,
  `id_Credito` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_Producto` bigint(20) NOT NULL,
  `Laboratorio` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `p_Compra` double NOT NULL,
  `P_CostoLista` double DEFAULT 0,
  `PVPublicoGeneral` double NOT NULL,
  `PVMedioMayoreo` double NOT NULL,
  `PVMayoreo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_Producto`, `Laboratorio`, `Nombre`, `Cantidad`, `p_Compra`, `P_CostoLista`, `PVPublicoGeneral`, `PVMedioMayoreo`, `PVMayoreo`) VALUES
(1, 'adler', 'advac triple aviar  20 ml', 10, 22.56, 58, 25.77777778, 1, 1),
(2, 'adler', 'advac triple aviar  50 ml', 10, 32.27777778, 83, 36.88888889, 1, 1),
(3, 'adler', 'advac triple aviar  100 ml', 10, 41.61111111, 107, 47.55555556, 1, 1),
(4, 'adler', 'advac triple aviar curativa 20 ml', 10, 31.11111111, 80, 35.55555556, 1, 1),
(5, 'adler', 'advac triple aviar curativa 50 ml', 10, 45.88888889, 118, 52.44444444, 1, 1),
(6, 'adler', 'advac triple aviar curativa 100 ml', 10, 65.33333333, 168, 74.66666667, 1, 1),
(7, 'adler', 'advac new castle 25 ds', 10, 23.33333333, 60, 26.66666667, 1, 1),
(8, 'adler', 'advac new castle 50 ds', 10, 26.05555556, 67, 29.77777778, 1, 1),
(9, 'adler', 'advac new castle 100 ds', 10, 29.94444444, 77, 34.22222222, 1, 1),
(10, 'adler', 'advac viruela 50 ds', 10, 30.72222222, 79, 35.11111111, 1, 1),
(11, 'adler', 'advac viruela 100 ds', 10, 35.38888889, 91, 40.44444444, 1, 1),
(12, 'adler', 'adecto forte pasta', 10, 80.11111111, 206, 91.55555556, 1, 1),
(13, 'adler', '11 vias 50', 10, 130.2777778, 335, 148.8888889, 1, 1),
(14, 'adler', '11 vias 100', 10, 221.6666667, 570, 253.3333333, 1, 1),
(15, 'adler', '11 vias 250', 10, 392.7777778, 1010, 448.8888889, 1, 1),
(16, 'adler', 'contrac 10 ml', 10, 24.88888889, 64, 28.44444444, 1, 1),
(17, 'adler', 'proteleer complex 20 ml', 10, 22.55555556, 58, 25.77777778, 1, 1),
(18, 'adler', 'proteleer complex 100 ml', 10, 82.83333333, 213, 94.66666667, 1, 1),
(19, 'adler', 'proteler complex 250 ml', 10, 147, 378, 168, 1, 1),
(20, 'adler', 'proteler 20 ml', 10, 21.77777778, 56, 24.88888889, 1, 1),
(21, 'adler', 'proteleer 100 ml', 10, 78.55555556, 202, 89.77777778, 1, 1),
(22, 'adler', 'estrepto leer forte dex', 10, 58.72222222, 151, 67.11111111, 1, 1),
(23, 'adler', 'estrepto extra f 2 mll', 10, 40.05555556, 103, 45.77777778, 1, 1),
(24, 'adler', 'estrepto extra f 4', 10, 53.27777778, 137, 60.88888889, 1, 1),
(25, 'adler', 'estrepto extra f 6 ml', 10, 61.05555556, 157, 69.77777778, 1, 1),
(26, 'adler', 'adeler 100 ml', 10, 126.3888889, 325, 144.4444444, 1, 1),
(27, 'adler', 'adeler 500 ml', 10, 403.2777778, 1037, 460.8888889, 1, 1),
(28, 'adler', 'kaomol 60 ml', 10, 30.33333333, 78, 34.66666667, 1, 1),
(29, 'adler', 'flohsin jabon 50 gr', 10, 403.2777778, 1037, 460.8888889, 1, 1),
(30, 'adler', 'flohsin jabon 100 gr', 10, 30.33333333, 78, 34.66666667, 1, 1),
(31, 'adler', 'arsiler 100 ml', 10, 96.05555556, 247, 109.7777778, 1, 1),
(32, 'adler', 'arsiler 250 ml', 10, 174.2222222, 448, 199.1111111, 1, 1),
(33, 'adler', '3 sulfas 500 ml', 10, 54.44444444, 140, 62.22222222, 1, 1),
(34, 'adler', '3 sulfas 100 ml', 10, 116.6666667, 300, 133.3333333, 1, 1),
(35, 'adler', 'tylogant 20', 10, 51.33333333, 132, 58.66666667, 1, 1),
(36, 'adler', 'tylogant 100', 10, 210.3888889, 541, 240.4444444, 1, 1),
(37, 'adler', 'vitaler b12 5500 100', 10, 358.1666667, 921, 409.3333333, 1, 1),
(38, 'adler', 'vitrolero  40 jabones', 10, 404.4444444, 1040, 462.2222222, 1, 1),
(39, 'adler', 'vitadunkel 100 ml', 10, 77, 198, 88, 1, 1),
(40, 'adler', 'vitadunkel 250 ml', 10, 165.2777778, 425, 188.8888889, 1, 1),
(41, 'agro vet ', 'ampiso vet', 10, 33.5, 67, 40.2, 1, 1),
(42, 'agro vet ', 'azul c atomizador', 10, 27.5, 55, 33, 1, 1),
(43, 'agro vet ', 'azul vet 100 ml', 10, 20, 40, 24, 1, 1),
(44, 'agro vet ', 'hierro vet 100 ml', 10, 92.5, 185, 111, 1, 1),
(45, 'agro vet ', 'oxitovet', 10, 184, 368, 220.8, 1, 1),
(46, 'agro vet ', 'procamicin 100 ml', 10, 182.5, 365, 219, 1, 1),
(47, 'agrovet', 'dexa estrepto 2 mll', 10, 50.74, 118, 62.54, 1, 1),
(48, 'agrovet', 'dexa estrepto 4 mll', 10, 70.95, 165, 87.45, 1, 1),
(49, 'agrovet', 'dexa estrepto 6 mll', 10, 82.99, 193, 102.29, 1, 1),
(50, 'agrovet', 'dexa estrepto 12 mll', 10, 129.86, 302, 160.06, 1, 1),
(51, 'agrovet', 'dexa estrepto 50 mll', 10, 335.4, 780, 413.4, 1, 1),
(52, 'agrovet', 'dipironil 500 ml', 10, 187.05, 435, 230.55, 1, 1),
(53, 'agrovet', 'estrepto plus 4 mlls', 10, 60.2, 140, 74.2, 1, 1),
(54, 'agrovet', 'estrepto plus 6 mlls', 10, 66.22, 154, 81.62, 1, 1),
(55, 'agrovet', 'estrepto plus 12 mlls', 10, 127.71, 297, 157.41, 1, 1),
(56, 'agrovet', 'estrepto plus 50 mlls', 10, 302.72, 704, 373.12, 1, 1),
(57, 'agrovet', 'streptovet 4 mll', 10, 51.6, 120, 63.6, 1, 1),
(58, 'agrovet', 'streptovet 6 mll', 10, 60.2, 140, 74.2, 1, 1),
(59, 'agrovet', 'streptovet 50 mll', 10, 243.38, 566, 299.98, 1, 1),
(60, 'agrovet', 'vitanhegra 10 ml', 10, 118.68, 276, 146.28, 1, 1),
(61, 'agrovet', 'vitanhegra 20 ml', 10, 35.905, 83.5, 44.255, 1, 1),
(62, 'agrovet', 'vitanhegra 50 ml', 10, 67.94, 158, 83.74, 1, 1),
(63, 'agrovet', 'vitanhegra 100 ml', 10, 107.5, 250, 132.5, 1, 1),
(64, 'agrovet', 'vitanhegra 250 ml', 10, 212.85, 495, 262.35, 1, 1),
(65, 'agrovet', 'crema don Ricardo', 10, 101.05, 235, 124.55, 1, 1),
(66, 'andoci', 'andobiotic 1 ml', 10, 40.94, 89, 49.84, 1, 1),
(67, 'andoci', 'andobiotic 5 ml', 10, 68.54, 149, 83.44, 1, 1),
(68, 'andoci', 'avefenicol 20 ml', 10, 36.34, 79, 44.24, 1, 1),
(69, 'andoci', 'avefenicol 100 ml', 10, 54.74, 119, 66.64, 1, 1),
(70, 'andoci', 'avefenicol tabletas', 10, 125.58, 273, 152.88, 1, 1),
(71, 'andoci', 'closiver ade + b12 50 ml', 10, 169.74, 369, 206.64, 1, 1),
(72, 'andoci', 'closiver ade + b12 250 ml', 10, 583.74, 1269, 710.64, 1, 1),
(73, 'andoci', 'espasmo sedal  50 ml', 10, 57.96, 126, 70.56, 1, 1),
(74, 'andoci', 'fetol 10 ml', 10, 22.54, 49, 27.44, 1, 1),
(75, 'andoci', 'fibrocine 100 ml', 10, 188.14, 409, 229.04, 1, 1),
(76, 'andoci', 'fibrocine 50 ml', 10, 122.36, 266, 148.96, 1, 1),
(77, 'andoci', 'hemoplex 100 ml', 10, 137.54, 299, 167.44, 1, 1),
(78, 'andoci', 'hemoplex 250 ml', 10, 257.14, 559, 313.04, 1, 1),
(79, 'andoci', 'hemoplex 50 ml', 10, 94.76, 206, 115.36, 1, 1),
(80, 'andoci', 'koagusan 100 ml', 10, 74.98, 163, 91.28, 1, 1),
(81, 'andoci', 'koagusan 25 ml', 10, 33.58, 73, 40.88, 1, 1),
(82, 'andoci', 'locion antiverugas ', 10, 57.96, 126, 70.56, 1, 1),
(83, 'andoci', 'rin tin tin jabon', 10, 25.76, 56, 31.36, 1, 1),
(84, 'andoci', 'timpakaps 100 ml', 10, 59.34, 129, 72.24, 1, 1),
(85, 'andoci', 'timpakaps 250 ml', 10, 80.96, 176, 98.56, 1, 1),
(86, 'andoci', 'timpakaps 460 ml', 10, 151.34, 329, 184.24, 1, 1),
(87, 'andoci', 'ubricina  5 mlls', 10, 74.98, 163, 91.28, 1, 1),
(88, 'andoci', 'ubricina plus', 10, 90.16, 196, 109.76, 1, 1),
(89, 'andoci', 'ubricina pomada', 10, 76.36, 166, 92.96, 1, 1),
(90, 'andoci', 'ubricina JERINGA 10 ml', 10, 19.32, 42, 23.52, 1, 1),
(91, 'andoci', 'ubricina infusion 100 ml', 10, 139.38, 303, 169.68, 1, 1),
(92, 'andoci', 'vermicell pastilla', 10, 137.54, 299, 167.44, 1, 1),
(93, 'anglo', 'vermifugo DEL DR BIXLER 10 TABS', 10, 802.8, 1338, 936.6, 1, 1),
(94, 'aranda', 'absorvet ', 10, 119.6, 299, 155.48, 1, 1),
(95, 'aranda', 'ascorbol iny 10 ml', 10, 31.2, 78, 40.56, 1, 1),
(96, 'aranda', 'ascorbol iny 50 ml', 10, 87.2, 218, 113.36, 1, 1),
(97, 'aranda', 'ascorbol iny. B 12 5000  10 ml', 10, 63.6, 159, 82.68, 1, 1),
(98, 'aranda', 'ascorbol plus 100 caps', 10, 95.6, 239, 124.28, 1, 1),
(99, 'aranda', 'ascorbol plus 50', 10, 65.2, 163, 84.76, 1, 1),
(100, 'aranda', 'ascorbol mr t', 10, 23.6, 59, 30.68, 1, 1),
(101, 'aranda', 'balsamo blanco 60 gr', 10, 38, 95, 49.4, 1, 1),
(102, 'aranda', 'balsamo blanco 100 gr', 10, 43.2, 108, 56.16, 1, 1),
(103, 'aranda', 'balsamo blanco 240 gr', 10, 92, 230, 119.6, 1, 1),
(104, 'aranda', 'bebida universal p tos', 10, 63.2, 158, 82.16, 1, 1),
(105, 'aranda', 'beef se 10', 10, 28.4, 71, 36.92, 1, 1),
(106, 'aranda', 'beef se 100 ml', 10, 161.6, 404, 210.08, 1, 1),
(107, 'aranda', 'bolos uterinos', 10, 206, 515, 267.8, 1, 1),
(108, 'aranda', 'caldex fm. 500 ml', 10, 118, 295, 153.4, 1, 1),
(109, 'aranda', 'chevinal jarabe', 10, 135.2, 338, 175.76, 1, 1),
(110, 'aranda', 'colmax 100 ml', 10, 373.6, 934, 485.68, 1, 1),
(111, 'aranda', 'complejo b reforzado 10 ml', 10, 26.8, 67, 34.84, 1, 1),
(112, 'aranda', 'complejo b reforzado 50 ml', 10, 54, 135, 70.2, 1, 1),
(113, 'aranda', 'complejo b reforzado 100 ml', 10, 87.6, 219, 113.88, 1, 1),
(114, 'aranda', 'dexametazona 20 ml', 10, 41.6, 104, 54.08, 1, 1),
(115, 'aranda', 'enroxol 20 ml', 10, 40.4, 101, 52.52, 1, 1),
(116, 'aranda', 'enroxol 100 ml', 10, 119.6, 299, 155.48, 1, 1),
(117, 'aranda', 'enroxol 250 ml', 10, 254, 635, 330.2, 1, 1),
(118, 'aranda', 'eutafin 100 ml', 10, 611.2, 1528, 794.56, 1, 1),
(119, 'aranda', 'euyacol forte 50 ml', 10, 58, 145, 75.4, 1, 1),
(120, 'aranda', 'euyacol forte 100 ml', 10, 85.2, 213, 110.76, 1, 1),
(121, 'aranda', 'ferrajet 10 ml', 10, 30.4, 76, 39.52, 1, 1),
(122, 'aranda', 'ferrajet 100 ml', 10, 135.6, 339, 176.28, 1, 1),
(123, 'aranda', 'ferrajet 25 ml', 10, 45.2, 113, 58.76, 1, 1),
(124, 'aranda', 'ferrajet 50 ml', 10, 79.2, 198, 102.96, 1, 1),
(125, 'aranda', 'fluviotic 4 mll', 10, 77.2, 193, 100.36, 1, 1),
(126, 'aranda', 'iverfull 10 ml', 10, 26.4, 66, 34.32, 1, 1),
(127, 'aranda', 'iverfull 100 ml', 10, 119.2, 298, 154.96, 1, 1),
(128, 'aranda', 'iverfull 250 ml', 10, 225.2, 563, 292.76, 1, 1),
(129, 'aranda', 'iverfull 500 ml', 10, 374, 935, 486.2, 1, 1),
(130, 'aranda', 'iverfull F 100 ML', 10, 165.6, 414, 215.28, 1, 1),
(131, 'aranda', 'iverfull f 500 ml', 10, 518, 1295, 673.4, 1, 1),
(132, 'aranda', 'iverfull F 100 ML bovinos', 10, 245.2, 613, 318.76, 1, 1),
(133, 'aranda', 'iverfull f 500 ml bovinos', 10, 1026.4, 2566, 1334.32, 1, 1),
(134, 'aranda', 'iverfull ade macrovit 10 ml', 10, 40.8, 102, 53.04, 1, 1),
(135, 'aranda', 'iverfull ade macrovit 100 ml', 10, 213.6, 534, 277.68, 1, 1),
(136, 'aranda', 'iverfull ade macrovit 500 ml', 10, 579.6, 1449, 753.48, 1, 1),
(137, 'aranda', 'iverfull pasta', 10, 79.2, 198, 102.96, 1, 1),
(138, 'aranda', 'iverfull pasta vitaminada', 10, 98.4, 246, 127.92, 1, 1),
(139, 'aranda', 'iverfull polvo', 10, 335.6, 839, 436.28, 1, 1),
(140, 'aranda', 'l vermizol 20 ml', 10, 39.2, 98, 50.96, 1, 1),
(141, 'aranda', 'l vermizol 50ml', 10, 62, 155, 80.6, 1, 1),
(142, 'aranda', 'l vermizol 100 m', 10, 83.6, 209, 108.68, 1, 1),
(143, 'aranda', 'l vermizol 250 ml', 10, 190.8, 477, 248.04, 1, 1),
(144, 'aranda', 'l vermizol 500 m', 10, 329.2, 823, 427.96, 1, 1),
(145, 'aranda', 'lasarnol ', 10, 62.8, 157, 81.64, 1, 1),
(146, 'aranda', 'lasarnol  pets', 10, 35.2, 88, 45.76, 1, 1),
(147, 'aranda', 'laxa pets ', 10, 61.6, 154, 80.08, 1, 1),
(148, 'aranda', 'melodex pets oral', 10, 25.6, 64, 33.28, 1, 1),
(149, 'aranda', 'melodex pets iny', 10, 54.8, 137, 71.24, 1, 1),
(150, 'aranda', 'melodex 10 ml', 10, 29.2, 73, 37.96, 1, 1),
(151, 'aranda', 'melodex 100 ml', 10, 112.8, 282, 146.64, 1, 1),
(152, 'aranda', 'meprazolic 25 tabs', 10, 42, 105, 54.6, 1, 1),
(153, 'aranda', 'micobac', 10, 39.6, 99, 51.48, 1, 1),
(154, 'aranda', 'necain 10 ml', 10, 23.6, 59, 30.68, 1, 1),
(155, 'aranda', 'necain pets ', 10, 25.6, 64, 33.28, 1, 1),
(156, 'aranda', 'neumoxol 20 ml', 10, 42.4, 106, 55.12, 1, 1),
(157, 'aranda', 'neumoxol 100 ml', 10, 143.6, 359, 186.68, 1, 1),
(158, 'aranda', 'neumoxol 250 ml', 10, 309.6, 774, 402.48, 1, 1),
(159, 'aranda', 'ocusol polvo', 10, 48, 120, 62.4, 1, 1),
(160, 'aranda', 'oxitocin 10 ml', 10, 25.6, 64, 33.28, 1, 1),
(161, 'aranda', 'parafen fascionil 120 ml', 10, 237.2, 593, 308.36, 1, 1),
(162, 'aranda', 'parafen facionil litro', 10, 1631.2, 4078, 2120.56, 1, 1),
(163, 'aranda', 'parafen pasta', 10, 77.2, 193, 100.36, 1, 1),
(164, 'aranda', 'parafen 3%', 10, 46.4, 116, 60.32, 1, 1),
(165, 'aranda', 'pentobarbital 100 ml', 10, 156.8, 392, 203.84, 1, 1),
(166, 'aranda', 'pervinal jarabe ', 10, 57.2, 143, 74.36, 1, 1),
(167, 'aranda', 'penicilina acuosa 100 ml', 10, 143.6, 359, 186.68, 1, 1),
(168, 'aranda', 'penicilina acuosa 250 ml', 10, 263.6, 659, 342.68, 1, 1),
(169, 'aranda', 'penicilina acuosa 500 ml', 10, 511.2, 1278, 664.56, 1, 1),
(170, 'aranda', 'penicilina oleosa 100 ml', 10, 154, 385, 200.2, 1, 1),
(171, 'aranda', 'pirodex 10 ml', 10, 29.2, 73, 37.96, 1, 1),
(172, 'aranda', 'pirodex 100 ml', 10, 165.6, 414, 215.28, 1, 1),
(173, 'aranda', 'pirodex 250 ml', 10, 295.6, 739, 384.28, 1, 1),
(174, 'aranda', 'purgante rojo ', 10, 50.8, 127, 66.04, 1, 1),
(175, 'aranda', 'sanitor forge ', 10, 39.6, 99, 51.48, 1, 1),
(176, 'aranda', 'sanitor forge economico', 10, 22.4, 56, 29.12, 1, 1),
(177, 'aranda', 'shampoo para perro', 10, 38.4, 96, 49.92, 1, 1),
(178, 'aranda', 'shampoo para caballo 500 ml', 10, 79.6, 199, 103.48, 1, 1),
(179, 'aranda', 'shampoo para caballo lt', 10, 105.6, 264, 137.28, 1, 1),
(180, 'aranda', 'super chevinal jarabe', 10, 204, 510, 265.2, 1, 1),
(181, 'aranda', 'tribendazol litro', 10, 1086.8, 2717, 1412.84, 1, 1),
(182, 'aranda', 'trifen plus 100 caps', 10, 70, 175, 91, 1, 1),
(183, 'aranda', 'trifen plus 25 caps', 10, 29.6, 74, 38.48, 1, 1),
(184, 'aranda', 'trifen plus 50 caps', 10, 50.4, 126, 65.52, 1, 1),
(185, 'aranda', 'yodo desinfectante 120 ml', 10, 39.6, 99, 51.48, 1, 1),
(186, 'aranda', 'yoduro de sodio 250 ml', 10, 175.6, 439, 228.28, 1, 1),
(187, 'aranda', 'jabon antipulgas', 10, 27.6, 69, 35.88, 1, 1),
(188, 'aranda', 'shampo clean guard ', 10, 42, 105, 54.6, 1, 1),
(189, 'aranda', 'talco clean guard', 10, 42.4, 106, 55.12, 1, 1),
(190, 'aranda', 'auricil 10 ml', 10, 50, 125, 65, 1, 1),
(191, 'aranda', 'fortex tabletas', 10, 85.2, 213, 106.5, 1, 1),
(192, 'aranda', 'fortex ', 10, 85.2, 213, 106.5, 1, 1),
(193, 'aranda', 'fortex recovery ', 10, 74.4, 186, 93, 1, 1),
(194, 'aranda', 'maxicef 24 tabs', 10, 94.4, 236, 118, 1, 1),
(195, 'aranda', 'mucotox ', 10, 58.4, 146, 73, 1, 1),
(196, 'aranda', 'onsec ', 10, 40, 100, 50, 1, 1),
(197, 'aranda', 'pet gard iny', 10, 41.2, 103, 51.5, 1, 1),
(198, 'aranda', 'petrgard plus', 10, 64.8, 162, 81, 1, 1),
(199, 'aranda', 'pet gard puppy', 10, 33.6, 84, 42, 1, 1),
(200, 'aranda', 'pet gard reformulado', 10, 42, 105, 52.5, 1, 1),
(201, 'aranda', 'zeefotax', 10, 35.6, 89, 44.5, 1, 1),
(202, 'avilab', 'iverjet f borrego 50 ml', 10, 90, 180, 106.3636364, 1, 1),
(203, 'avilab', 'iverjet f borrego 100 ml', 10, 170, 340, 200.9090909, 1, 1),
(204, 'avilab', 'laringotraqueitis ', 10, 29.7, 54, 37.8, 1, 1),
(205, 'avilab', 'newcastle bronquitis', 10, 29.7, 54, 37.8, 1, 1),
(206, 'avilab', 'novacoc forte', 10, 327.6, 630, 390.6, 1, 1),
(207, 'avilab', 'theranekron', 10, 258.5, 470, 305.5, 1, 1),
(208, 'bayer', 'asuntol jabon', 10, 43.68, 78, 51.48, 1, 1),
(209, 'bayer', 'asuntol 100 ml', 10, 141.2578, 239.42, 165.1998, 1, 1),
(210, 'bayer', 'asuntol litro', 10, 966.5816, 1584.56, 1125.0376, 1, 1),
(211, 'bayer', 'asuntol sobre', 10, 55.0952, 90.32, 64.1272, 1, 1),
(212, 'bayer', 'bamitol   chica', 10, 99.1064, 147.92, 113.8984, 1, 1),
(213, 'bayer', 'bamitol grande', 10, 158.961, 240.85, 183.046, 1, 1),
(214, 'bayer', 'bayticol 3% 100 ml', 10, 142.614, 264.1, 169.024, 1, 1),
(215, 'bayer', 'bayticol litro  P on plus', 10, 349.132, 943.6, 443.492, 1, 1),
(216, 'bayer', 'bayticol litro  ', 10, 926.8675, 1425.95, 1069.4625, 1, 1),
(217, 'bayer', 'baymec ', 10, 1057.1561, 1478.54, 1205.0101, 1, 1),
(218, 'bayer', 'bovitraz 100 ml', 10, 74.5535, 152.15, 89.7685, 1, 1),
(219, 'bayer', 'bovitraz litro', 10, 373.1147, 703.99, 443.5137, 1, 1),
(220, 'bayer', 'baycox 250 ml', 10, 1156.3262, 1725.86, 1328.9122, 1, 1),
(221, 'bayer', 'baycox litro', 10, 4174.9065, 5880.15, 4762.9215, 1, 1),
(222, 'bayer', 'baycox 5 lt', 10, 6415.2, 12960, 7711.2, 1, 1),
(223, 'bayer', 'trucid 500 ml', 10, 1257.425, 1722.5, 1429.675, 1, 1),
(224, 'bayer', 'baytril max 250 mkl', 10, 1325.8776, 1949.82, 1520.8596, 1, 1),
(225, 'bayer', 'baytril 10% 25 ml', 10, 283.136, 442.4, 327.376, 1, 1),
(226, 'bayer', 'baytril 5 % 25 ml', 10, 187.1919, 297.13, 216.9049, 1, 1),
(227, 'bayer', 'baytril 150 MG', 10, 354.06, 562, 410.26, 1, 1),
(228, 'bayer', 'baytril LITRO', 10, 1427.7516, 2163.26, 1644.0776, 1, 1),
(229, 'bayer', 'bolfo (talco)', 10, 79.5, 150, 94.5, 1, 1),
(230, 'bayer', 'bolfo shampoo', 10, 149.42, 241, 173.52, 1, 1),
(231, 'bayer', 'calfon fuerte', 10, 240.2598, 364.03, 276.6628, 1, 1),
(232, 'bayer', 'calfon 500 ml', 10, 984.009, 1513.86, 1135.395, 1, 1),
(233, 'bayer', 'calform ', 10, 338.3415, 537.05, 392.0465, 1, 1),
(234, 'bayer', 'catosal 20 ml', 10, 144.9954, 219.69, 166.9644, 1, 1),
(235, 'bayer', 'catosal 50 ml', 10, 284.8164, 431.54, 327.9704, 1, 1),
(236, 'bayer', 'catosal 100ml', 10, 439.0295, 675.43, 506.5725, 1, 1),
(237, 'bayer', 'catosal 250ml', 10, 944.8296, 1431.56, 1087.9856, 1, 1),
(238, 'bayer', 'neptra', 10, 424.84, 817, 506.54, 1, 1),
(239, 'bayer', 'carbetocina la  50 ml', 10, 679.024, 917.6, 770.784, 1, 1),
(240, 'bayer', 'drontal puppy', 10, 148.68, 252, 173.88, 1, 1),
(241, 'bayer', 'drontal plus pastilla 10 kgs', 10, 20.7916, 35.24, 24.3156, 1, 1),
(242, 'bayer', 'drontal plus pastilla 35 kgs', 10, 64.31, 109, 75.21, 1, 1),
(243, 'bayer', 'fluxabac la ', 10, 752.577, 1075.11, 860.088, 1, 1),
(244, 'bayer', 'HIERROX ', 10, 347.7408, 526.88, 400.4288, 1, 1),
(245, 'bayer', 'glutellac 50 ml', 10, 58.8192, 89.12, 67.7312, 1, 1),
(246, 'bayer', 'korteba', 10, 169.2651, 286.89, 197.9541, 1, 1),
(247, 'bayer', 'magnaphoscal 25 kg', 10, 1661.9984, 2186.84, 1880.6824, 1, 1),
(248, 'bayer', 'penimox ', 10, 424.9796, 624.97, 487.4766, 1, 1),
(249, 'bayer', 'prolajet', 10, 424.9796, 624.97, 487.4766, 1, 1),
(250, 'bayer', 'pecutrim vit', 10, 700.245, 933.66, 793.611, 1, 1),
(251, 'bayer', 'superbayphos', 10, 1367.928, 1688.8, 1536.808, 1, 1),
(252, 'bayer', 'sensiblex', 10, 907.2628, 1334.21, 1040.6838, 1, 1),
(253, 'bayer', 'levaguard', 10, 1257.0016, 1721.92, 1429.1936, 1, 1),
(254, 'bayer', 'negasunt aereosol', 10, 121.099, 220.18, 143.117, 1, 1),
(255, 'bayer', 'negasunt polvo 100gr', 10, 155.8032, 278.22, 183.6252, 1, 1),
(256, 'bayer', 'rodhilon bloc azul 9 kg', 10, 2583.7796, 3399.71, 2923.7506, 1, 1),
(257, 'bayer', 'rodhilon pellets  25 kg', 10, 5327.3252, 8733.32, 6200.6572, 1, 1),
(258, 'bayer', 'quick bay', 10, 85.41, 117, 97.11, 1, 1),
(259, 'bayer', 'virkos 10 kg', 10, 7435.89, 11266.5, 8562.54, 1, 1),
(260, 'bayer', 'super bolfo aereosol', 10, 109.8, 180, 127.8, 1, 1),
(261, 'bayer', 'tetrabac aerosol', 10, 199.2647, 297.41, 229.0057, 1, 1),
(262, 'bayer', 'vetriderm jabon', 10, 61.61, 101, 71.71, 1, 1),
(263, 'bayer', 'vetriderm shampo', 10, 133.32, 202, 153.52, 1, 1),
(264, 'bayer', 'vetriderm essec', 10, 144.46, 233, 167.76, 1, 1),
(265, 'bayer', 'vigantol 100 ml', 10, 463.7338, 692.14, 532.9478, 1, 1),
(266, 'bayer', 'vigantol 25 ml', 10, 175.6137, 262.11, 201.8247, 1, 1),
(267, 'bayer', 'vigantol 500 ml', 10, 2036.8652, 2995.39, 2336.4042, 1, 1),
(268, 'bayer', 'yatren 100 ml', 10, 282.1236, 427.46, 324.8696, 1, 1),
(269, 'bayer', 'carprobay', 10, 444.18, 673, 511.48, 1, 1),
(270, 'bayer', 'advantage multi 4', 10, 151.32, 291, 180.42, 1, 1),
(271, 'bayer', 'advantage multi 10', 10, 159, 300, 189, 1, 1),
(272, 'bayer', 'advantage multi 25', 10, 166.95, 315, 198.45, 1, 1),
(273, 'bayer', 'advantage multi 40', 10, 178.2, 330, 211.2, 1, 1),
(274, 'bayer', 'advantage multi gato 4', 10, 164.64, 294, 194.04, 1, 1),
(275, 'bayer', 'advantage multi gato 8', 10, 189.39, 321, 221.49, 1, 1),
(276, 'bimeda', 'aminolean 500 ml', 10, 64.8, 144, 79.2, 1, 1),
(277, 'bimeda', 'cal mag k 500 ml', 10, 85.05, 189, 103.95, 1, 1),
(278, 'bimeda', 'bimectin pasta', 10, 62.1, 138, 75.9, 1, 1),
(279, 'bimeda', 'exodus pasta', 10, 51.75, 115, 63.25, 1, 1),
(280, 'bimeda', 'copperset', 10, 124.65, 277, 152.35, 1, 1),
(281, 'bimeda', 'pro pen g 100 ml', 10, 83.25, 185, 101.75, 1, 1),
(282, 'bimeda', 'pro pen g 250 ml', 10, 155.25, 345, 189.75, 1, 1),
(283, 'bimeda', 'pro pen g 500 ml', 10, 265.95, 591, 325.05, 1, 1),
(284, 'bimeda', 'dexium 100 ml', 10, 66.15, 147, 80.85, 1, 1),
(285, 'bimeda', 'flunazine 100 ml', 10, 180, 400, 220, 1, 1),
(286, 'bimeda', 'flunazine 250 ml', 10, 328.95, 731, 402.05, 1, 1),
(287, 'biozoo', 'aminotonic 500ml', 10, 90.82, 239, 126.67, 1, 1),
(288, 'biozoo', 'bioarsenol 50 ml', 10, 69.54, 183, 96.99, 1, 1),
(289, 'biozoo', 'bioarsenol 100 ml', 10, 102.6, 270, 143.1, 1, 1),
(290, 'biozoo', 'bioarsenol 250 ml', 10, 204.82, 539, 285.67, 1, 1),
(291, 'biozoo', 'biodipirona 20ml', 10, 36.48, 96, 50.88, 1, 1),
(292, 'biozoo', 'biodipirona 100 ml', 10, 86.64, 228, 120.84, 1, 1),
(293, 'biozoo', 'biodipirona 250 ml', 10, 157.7, 415, 219.95, 1, 1),
(294, 'biozoo', 'biocef ', 10, 234.08, 616, 326.48, 1, 1),
(295, 'biozoo', 'biobac 11 v?as 50 ml', 10, 154.66, 407, 215.71, 1, 1),
(296, 'biozoo', 'biobac 11 v?as 100 ml', 10, 253.84, 668, 354.04, 1, 1),
(297, 'biozoo', 'biobac 11 v?as 250 ml', 10, 413.06, 1087, 576.11, 1, 1),
(298, 'biozoo', 'triple bovina 50 ml', 10, 45.22, 119, 63.07, 1, 1),
(299, 'biozoo', 'triple bovina 100 ', 10, 65.74, 173, 91.69, 1, 1),
(300, 'biozoo', 'triple bovina 250 ml', 10, 127.68, 336, 178.08, 1, 1),
(301, 'biozoo', 'bioquin 20 ml', 10, 44.84, 118, 62.54, 1, 1),
(302, 'biozoo', 'bioquin 6 % oral', 10, 28.5, 75, 39.75, 1, 1),
(303, 'biozoo', 'derriengue biozoo ', 10, 110.96, 292, 154.76, 1, 1),
(304, 'biozoo', 'bioxil la 250  ml', 10, 273.6, 720, 381.6, 1, 1),
(305, 'biozoo', 'bioxil 20 ml', 10, 28.88, 76, 40.28, 1, 1),
(306, 'biozoo', 'bioxil 7% 100 ml', 10, 57.05, 163, 81.5, 1, 1),
(307, 'biozoo', 'bioxil 7% 500 ml', 10, 158.9, 454, 227, 1, 1),
(308, 'biozoo', 'caltonic 500 ml', 10, 112.1, 295, 156.35, 1, 1),
(309, 'biozoo', 'estrepto 4 mll', 10, 49.4, 130, 68.9, 1, 1),
(310, 'biozoo', 'estrepto d 5 mll', 10, 57.38, 151, 80.03, 1, 1),
(311, 'biozoo', 'estrepto plus 5 mlls', 10, 59.66, 157, 83.21, 1, 1),
(312, 'biozoo', 'estrepto ref 5 mll', 10, 55.1, 145, 76.85, 1, 1),
(313, 'biozoo', 'ext. De h?gado 10 ml', 10, 23.18, 61, 32.33, 1, 1),
(314, 'biozoo', 'ext. De h?gado 50 ml', 10, 57, 150, 79.5, 1, 1),
(315, 'biozoo', 'ext. De h?gado 100 ml', 10, 87.4, 230, 121.9, 1, 1),
(316, 'biozoo', 'ext. De h?gado 250 ml', 10, 173.28, 456, 241.68, 1, 1),
(317, 'biozoo', 'flumetzoo', 10, 58.9, 155, 82.15, 1, 1),
(318, 'biozoo', 'genesis pasta ', 10, 85.5, 225, 119.25, 1, 1),
(319, 'biozoo', 'genesis 50ml', 10, 55.1, 145, 76.85, 1, 1),
(320, 'biozoo', 'gorbazoo 30 ml', 10, 82.46, 217, 115.01, 1, 1),
(321, 'biozoo', 'gorbazoo100 ml', 10, 201.02, 529, 280.37, 1, 1),
(322, 'biozoo', 'masticillin', 10, 18.7948, 49.46, 26.2138, 1, 1),
(323, 'biozoo', 'proteizoo 100 ml', 10, 103.36, 272, 144.16, 1, 1),
(324, 'biozoo', 'proteizoo 250 ml', 10, 174.8, 460, 243.8, 1, 1),
(325, 'biozoo', 'secam', 10, 18.7074, 49.23, 26.0919, 1, 1),
(326, 'biozoo', 'tigent 20 ml', 10, 56.62, 149, 78.97, 1, 1),
(327, 'biozoo', 'tigent 100 ml', 10, 208.24, 548, 290.44, 1, 1),
(328, 'biozoo', 'tigent 250 ml', 10, 428.64, 1128, 597.84, 1, 1),
(329, 'biozoo p', 'zoosarni', 10, 70.68, 186, 98.58, 1, 1),
(330, 'biozoo p', 'amox C 30 tabs', 10, 90.06, 237, 125.61, 1, 1),
(331, 'biozoo p', 'cefamax 20 tabs', 10, 90.44, 238, 126.14, 1, 1),
(332, 'biozoo p', 'clindamin 20 tabs', 10, 87.4, 230, 121.9, 1, 1),
(333, 'biozoo p', 'enro T 20 tabs', 10, 60.8, 160, 84.8, 1, 1),
(334, 'biozoo ', 'estrepto 1 mll', 10, 0, 0, 0, 1, 1),
(335, 'biozoo p', 'gorbazoo table', 10, 68.4, 180, 95.4, 1, 1),
(336, 'biozoo p', 'genesis 10 ml', 10, 30.78, 81, 42.93, 1, 1),
(337, 'biozoo p', 'micotic 2 tab', 10, 89.3, 235, 124.55, 1, 1),
(338, 'biozoo p', 'meloximax 1', 10, 127.68, 336, 178.08, 1, 1),
(339, 'biozoo p', 'meloximax 3', 10, 170.24, 448, 237.44, 1, 1),
(340, 'biozoo p', 'meloximax suspt', 10, 154.28, 406, 215.18, 1, 1),
(341, 'biozoo p', 'prednimas 5', 10, 69.16, 182, 96.46, 1, 1),
(342, 'biozoo p', 'prednimas 20', 10, 123.5, 325, 172.25, 1, 1),
(343, 'biozoo p', 'one pastilla 30 pastillas', 10, 10.488, 27.6, 14.628, 1, 1),
(344, 'biozoo p', 'one pastilla 60 tab', 10, 9.12, 24, 12.72, 1, 1),
(345, 'biozoo p', 'growlac pets', 10, 98.8, 260, 137.8, 1, 1),
(346, 'biozoo p', 'parvo biozoo', 10, 31.8554, 83.83, 44.4299, 1, 1),
(347, 'biozoo p', 'quintuple biozoo', 10, 49.9358, 131.41, 69.6473, 1, 1),
(348, 'biozoo p', 'triple canina biozoo ', 10, 38, 100, 53, 1, 1),
(349, 'biozoo ', 'new castle  100 ds', 10, 28.88, 76, 40.28, 1, 1),
(350, 'biozoo ', 'new castle  25 ds', 10, 24.7, 65, 34.45, 1, 1),
(351, 'biozoo ', 'new castle  50 ds', 10, 26.6, 70, 37.1, 1, 1),
(352, 'biozoo ', 'triple avir curativa 100 ml', 10, 64.6, 170, 90.1, 1, 1),
(353, 'biozoo ', 'triple avir curativa 20 ml', 10, 34.96, 92, 48.76, 1, 1),
(354, 'biozoo ', 'triple avir curativa 50 ml', 10, 50.54, 133, 70.49, 1, 1),
(355, 'biozoo ', 'viruela  50 ds', 10, 33.06, 87, 46.11, 1, 1),
(356, 'biozoo ', 'viruela 100 ds', 10, 37.62, 99, 52.47, 1, 1),
(357, 'boheringer', 'amino lite 34 x 250 ml', 10, 208.08, 289, 236.98, 1, 1),
(358, 'boheringer', 'amino lite 500 ml', 10, 113.04, 157, 128.74, 1, 1),
(359, 'boheringer', 'bisolvon veterino 100 ml', 10, 104.4, 145, 118.9, 1, 1),
(360, 'boheringer', 'bivatop 200 de 500 ml', 10, 630, 875, 717.5, 1, 1),
(361, 'boheringer', 'buscapina com. 100 ml', 10, 207.36, 288, 236.16, 1, 1),
(362, 'boheringer', 'ectoline litro ', 10, 437.76, 608, 498.56, 1, 1),
(363, 'boheringer', 'equitop ', 10, 1056.24, 1467, 1202.94, 1, 1),
(364, 'boheringer', 'mamyzin secado jer', 10, 606.96, 843, 691.26, 1, 1),
(365, 'brovel', 'vetoryl 5 mg', 10, 364.1, 662, 430.3, 1, 1),
(366, 'brovel', 'vetoryl 10 mg', 10, 501.6, 912, 592.8, 1, 1),
(367, 'brovel', 'vetoryl 30 mg', 10, 607.2, 1104, 717.6, 1, 1),
(368, 'brovel', 'forthyron 800', 10, 489.5, 890, 578.5, 1, 1),
(369, 'brovel', 'forthyron 600', 10, 426.25, 775, 503.75, 1, 1),
(370, 'brovel', 'forthyron 400', 10, 387.75, 705, 458.25, 1, 1),
(371, 'brovel', 'forthyron 200', 10, 343.2, 624, 405.6, 1, 1),
(372, 'brovel', 'agua oxigenada', 10, 34.65, 77, 42.35, 1, 1),
(373, 'brovel', 'averdan 500 ml', 10, 94.76, 206, 115.36, 1, 1),
(374, 'brovel', 'averdan 120  ml', 10, 60.72, 132, 73.92, 1, 1),
(375, 'brovel', 'avizin10 ds', 10, 40.48, 88, 49.28, 1, 1),
(376, 'brovel', 'avizin 20 ds', 10, 53.36, 116, 64.96, 1, 1),
(377, 'brovel', 'avizin 50 ds', 10, 69.92, 152, 85.12, 1, 1),
(378, 'brovel', 'ambroxin 300 50 ml', 10, 114.08, 248, 138.88, 1, 1),
(379, 'brovel', 'brosin', 10, 57.5, 125, 70, 1, 1),
(380, 'brovel', 'bursol 50 ml', 10, 99.36, 216, 120.96, 1, 1),
(381, 'brovel', 'cefalexina 250mg', 10, 114.08, 248, 138.88, 1, 1),
(382, 'brovel', ' cefalexina 500 mg', 10, 193.2, 420, 235.2, 1, 1),
(383, 'brovel', 'danezona 100 ml', 10, 101.2, 220, 123.2, 1, 1),
(384, 'brovel', 'deltamicin sobre', 10, 5.6672, 12.32, 6.8992, 1, 1),
(385, 'brovel', 'deltamicin 500 gr', 10, 131.56, 286, 160.16, 1, 1),
(386, 'brovel', 'deltamicin 4 kg', 10, 644, 1400, 784, 1, 1),
(387, 'brovel', 'dirulan 15 mg', 10, 45.54, 99, 55.44, 1, 1),
(388, 'brovel', 'dirulan 50 mg', 10, 58.88, 128, 71.68, 1, 1),
(389, 'brovel', 'equixuprina', 10, 753.94, 1639, 917.84, 1, 1),
(390, 'brovel', 'fercobon 100', 10, 134.32, 292, 163.52, 1, 1),
(391, 'brovel', 'ferragan 10 ml', 10, 43.7, 95, 53.2, 1, 1),
(392, 'brovel', 'ferragan 20 ml', 10, 68.54, 149, 83.44, 1, 1),
(393, 'brovel', 'ferragan 100 ml', 10, 204.24, 444, 248.64, 1, 1),
(394, 'brovel', 'fervinac 500 gr', 10, 102.12, 222, 124.32, 1, 1),
(395, 'brovel', 'fervinac kg', 10, 1837.7, 3995, 2237.2, 1, 1),
(396, 'brovel', 'flagisyn ', 10, 34.5, 75, 42, 1, 1),
(397, 'brovel', 'gastropazol 5 mg', 10, 40.02, 87, 48.72, 1, 1),
(398, 'brovel', 'gastropazol 20 mg', 10, 47.38, 103, 57.68, 1, 1),
(399, 'brovel', 'gastroprazol  eq', 10, 231.38, 503, 281.68, 1, 1),
(400, 'brovel', 'guayaneumol 250 ml', 10, 215.28, 468, 262.08, 1, 1),
(401, 'brovel', 'guayaneumol 50 ml', 10, 78.66, 171, 95.76, 1, 1),
(402, 'brovel', 'hytryl', 10, 684.02, 1487, 832.72, 1, 1),
(403, 'brovel', 'kiki riki  60 tabls', 10, 66.24, 144, 80.64, 1, 1),
(404, 'brovel', 'licor de forge 120  ml', 10, 40.48, 88, 49.28, 1, 1),
(405, 'brovel', 'licor de forge litro', 10, 103.5, 225, 126, 1, 1),
(406, 'brovel', 'licor de forge galon', 10, 249.78, 543, 304.08, 1, 1),
(407, 'brovel', 'licor de forge suelto', 10, 71.3, 155, 86.8, 1, 1),
(408, 'brovel', 'melvinac 250 ml', 10, 68.54, 149, 83.44, 1, 1),
(409, 'brovel', 'melvinac ge', 10, 102.12, 222, 124.32, 1, 1),
(410, 'brovel', 'ortolan 100 g', 10, 42.32, 92, 51.52, 1, 1),
(411, 'brovel', 'ortolan 225 g', 10, 92, 200, 112, 1, 1),
(412, 'brovel', 'pom. Amarilla', 10, 81.88, 178, 99.68, 1, 1),
(413, 'brovel', 'pom. Ictiol ', 10, 55.66, 121, 67.76, 1, 1),
(414, 'brovel', 'pom. Yodoformada 250 gr', 10, 181.7, 395, 221.2, 1, 1),
(415, 'brovel', 'pom. Yodoformada 450 gr', 10, 258.06, 561, 314.16, 1, 1),
(416, 'brovel', 'progesvit ae', 10, 97.98, 213, 119.28, 1, 1),
(417, 'brovel', 'super 15', 10, 130.18, 283, 158.48, 1, 1),
(418, 'brovel', 'testosterona 50\" 10 ml', 10, 109.94, 239, 133.84, 1, 1),
(419, 'brovel', 'vitamina b1 20 ml', 10, 58.88, 128, 71.68, 1, 1),
(420, 'brovel', 'vitamina b 15 10 ml', 10, 55.2, 120, 67.2, 1, 1),
(421, 'brovel', 'vitamina b 15 25 ml', 10, 86.94, 189, 105.84, 1, 1),
(422, 'brovel', 'vitamina c 100 ml', 10, 71.3, 155, 86.8, 1, 1),
(423, 'brovel', 'vitamina k 100 ml', 10, 86.94, 189, 105.84, 1, 1),
(424, 'brovel', 'vitamina k 30 ml', 10, 40.02, 87, 48.72, 1, 1),
(425, 'calier', 'decomoton 10 ml', 10, 105, 175, 122.5, 1, 1),
(426, 'calier', 'roborante calier 100 ml', 10, 148.2, 247, 172.9, 1, 1),
(427, 'calier', 'toco selenio 100 ml', 10, 108, 180, 126, 1, 1),
(428, 'cheminova', 'complejo enerjetico 100 ml', 10, 116, 290, 145, 1, 1),
(429, 'cheminova', 'vitaminas  +carnitina lts', 10, 412, 1030, 515, 1, 1),
(430, 'chinoin', 'alin depot  50 ml', 10, 302.5, 605, 363, 1, 1),
(431, 'chinoin', 'alin depot 6 ml', 10, 63, 126, 75.6, 1, 1),
(432, 'chinoin', 'alin oftalmico', 10, 34.5, 69, 41.4, 1, 1),
(433, 'chinoin', 'alin tab', 10, 42, 84, 50.4, 1, 1),
(434, 'chinoin', 'birosin sodica 250 mg', 10, 42, 84, 50.4, 1, 1),
(435, 'chinoin', ' chinoin pn150 ml', 10, 47, 94, 56.4, 1, 1),
(436, 'chinoin', 'chinoin pn 1 250 ml', 10, 127.5, 255, 153, 1, 1),
(437, 'chinoin', 'puppy chinoin ', 10, 55.7, 111.4, 66.84, 1, 1),
(438, 'chinoin', 'closantil  iny 100 ml', 10, 134.5, 269, 161.4, 1, 1),
(439, 'chinoin', 'closantil  iny 500 ml', 10, 499.5, 999, 599.4, 1, 1),
(440, 'chinoin', 'closantil  oral 5 % 100 ml', 10, 74.5, 149, 89.4, 1, 1),
(441, 'chinoin', 'closantil iny 250 ml', 10, 306.5, 613, 367.8, 1, 1),
(442, 'chinoin', 'closantil oral 5% 1000 ml', 10, 524.5, 1049, 629.4, 1, 1),
(443, 'chinoin', 'closantil oral 5% 250 ml', 10, 169.5, 339, 203.4, 1, 1),
(444, 'chinoin', 'closantil oral 15 litro', 10, 884.5, 1769, 1061.4, 1, 1),
(445, 'chinoin', 'dyscural p.v.e 20 ml', 10, 94.5, 189, 113.4, 1, 1),
(446, 'chinoin', 'dyscural porcino 100 ml', 10, 264.5, 529, 317.4, 1, 1),
(447, 'chinoin', 'dyscural porcino 20 ml', 10, 94.5, 189, 113.4, 1, 1),
(448, 'chinoin', 'dyscural rumiante 100 ml', 10, 224.5, 449, 269.4, 1, 1),
(449, 'chinoin', 'dyscural rumiante 20ml', 10, 79.5, 159, 95.4, 1, 1),
(450, 'chinoin', 'exgon 8 100 ml', 10, 150.3, 334, 183.7, 1, 1),
(451, 'chinoin', 'exgon 8 250 ml', 10, 238.05, 529, 290.95, 1, 1),
(452, 'chinoin', 'exgon 8 50 ml', 10, 92.25, 205, 112.75, 1, 1),
(453, 'chinoin', 'grinolon ', 10, 41.4, 92, 50.6, 1, 1),
(454, 'chinoin', 'gluticort t', 10, 154.5, 309, 185.4, 1, 1),
(455, 'chinoin', 'grinolon ', 10, 44.5, 89, 53.4, 1, 1),
(456, 'chinoin', 'kilais  100 ml', 10, 212.5, 425, 255, 1, 1),
(457, 'chinoin', 'kilais  250 ml', 10, 412, 824, 494.4, 1, 1),
(458, 'chinoin', 'koptisin 100 ml', 10, 99.5, 199, 119.4, 1, 1),
(459, 'chinoin', 'koptisin 250 ml', 10, 222.5, 445, 267, 1, 1),
(460, 'chinoin', 'koptin tab', 10, 124.5, 249, 149.4, 1, 1),
(461, 'chinoin', 'koptin ssusp', 10, 79.5, 159, 95.4, 1, 1),
(462, 'chinoin', 'naninvac 50', 10, 169.5, 339, 203.4, 1, 1),
(463, 'chinoin', 'naninvac 100', 10, 284.5, 569, 341.4, 1, 1),
(464, 'chinoin', 'naninvac 250', 10, 529.5, 1059, 635.4, 1, 1),
(465, 'chinoin', 'predoftal', 10, 59.5, 119, 71.4, 1, 1),
(466, 'chinoin', 'parasitin 2.5 kg', 10, 10.5, 21, 12.6, 1, 1),
(467, 'chinoin', 'parasitin 10 kg', 10, 19.415, 38.83, 23.298, 1, 1),
(468, 'chinoin', 'parasitin 30 kg', 10, 38.5, 77, 46.2, 1, 1),
(469, 'chinoin', 'sentopri,m 25 m', 10, 102.5, 205, 123, 1, 1),
(470, 'chinoin', 'severin tab', 10, 83, 166, 99.6, 1, 1),
(471, 'chinoin', 'severin sus', 10, 77, 154, 92.4, 1, 1),
(472, 'chinoin', 'scabisin jabon', 10, 27.5, 55, 33, 1, 1),
(473, 'chinoin', 'scabisin suspensi?n 100 ml', 10, 51, 102, 61.2, 1, 1),
(474, 'chinoin', 'scabisin shampoo ', 10, 69.5, 139, 83.4, 1, 1),
(475, 'chinoin', 'sural 20 ml', 10, 119.5, 239, 143.4, 1, 1),
(476, 'chinoin', 'sural 50 ml', 10, 199.5, 399, 239.4, 1, 1),
(477, 'collins', 'colvit sobre', 10, 30, 60, 36, 1, 1),
(478, 'collins', 'flutyl 100 ml', 10, 195, 390, 234, 1, 1),
(479, 'collins', 'flutyl 250 ml', 10, 412.5, 825, 495, 1, 1),
(480, 'collins', 'dicollfen 250 ml', 10, 162.5, 325, 195, 1, 1),
(481, 'collins', 'collipen LA 250 ml', 10, 282, 600, 342, 1, 1),
(482, 'collins', 'flutyl ap 100 ml', 10, 183.3, 390, 222.3, 1, 1),
(483, 'collins', 'flutyl ap 250 ml', 10, 338.25, 825, 420.75, 1, 1),
(484, 'collins', 'flutyl s 1 lt', 10, 529.2, 1080, 637.2, 1, 1),
(485, 'collins', 'dicollfen 50 100ml', 10, 96, 160, 112, 1, 1),
(486, 'collins', 'dicollfen 50 250ml', 10, 188.5, 325, 221, 1, 1),
(487, 'collins', 'colvit c sobres ', 10, 29.4, 60, 35.4, 1, 1),
(488, 'cpmax', 'pet gard adulto 10 kg', 10, 22.8, 38, 26.6, 1, 1),
(489, 'cpmax', 'pet gard iny.', 10, 26, 40, 30, 1, 1),
(490, 'cpmax', 'pet gard pasta', 10, 42.9, 66, 49.5, 1, 1),
(491, 'cpmax', 'pet gard puppy 5kgs', 10, 3.25, 5, 3.75, 1, 1),
(492, 'cpmax', 'pets shampoo', 10, 25.2, 42, 29.4, 1, 1),
(493, 'econovet', 'antimastitis  250 ml', 10, 180, 400, 220, 1, 1),
(494, 'econovet', 'antimastitis  500 ml', 10, 328.5, 730, 401.5, 1, 1),
(495, 'econovet', 'ecofen plus 100 ml', 10, 256.5, 570, 313.5, 1, 1),
(496, 'econovet', 'ecofen plus 250 ml', 10, 517.5, 1150, 632.5, 1, 1),
(497, 'econovet', 'diclofenaco 100 ml', 10, 94.5, 210, 115.5, 1, 1),
(498, 'econovet', 'diclofenaco 250 ,l', 10, 198, 440, 242, 1, 1),
(499, 'econovet', 'eclipse 100 gr', 10, 85.5, 190, 104.5, 1, 1),
(500, 'econovet', 'eclipse 250 gr', 10, 157.5, 350, 192.5, 1, 1),
(501, 'econovet', 'eco plus 50 tab', 10, 81, 180, 99, 1, 1),
(502, 'econovet', 'eco plus 100 tab', 10, 139.5, 310, 170.5, 1, 1),
(503, 'econovet', 'ecofen oral 20 ml', 10, 13.5, 30, 16.5, 1, 1),
(504, 'econovet', 'ecofen oral 120 ml', 10, 26.1, 58, 31.9, 1, 1),
(505, 'econovet', 'enro 100 ml', 10, 90, 200, 110, 1, 1),
(506, 'econovet', 'enro 250 ml', 10, 175.5, 390, 214.5, 1, 1),
(507, 'econovet', 'ivermectina 50 ml', 10, 63, 140, 77, 1, 1),
(508, 'econovet', 'tetragent aves 10 ml', 10, 21.6, 48, 26.4, 1, 1),
(509, 'econovet', 'tetragent aves 50 ml', 10, 63, 140, 77, 1, 1),
(510, 'econovet', 'tetragent aves 100 ml', 10, 99, 220, 121, 1, 1),
(511, 'econovet', 'tetragent 100 ml', 10, 90, 200, 110, 1, 1),
(512, 'econovet', 'tetragent 250 ml', 10, 157.5, 350, 192.5, 1, 1),
(513, 'econovet', 'toltrazuril 20 ml', 10, 22.05, 49, 26.95, 1, 1),
(514, 'econovet', 'toltrazuril 120 ml', 10, 108, 240, 132, 1, 1),
(515, 'econovet', 'vitamina b 12 6000 con b 15 10 ml', 10, 90, 200, 110, 1, 1),
(516, 'econovet', 'vitamina b 12 6000 con b 15 100 ml', 10, 495, 1100, 605, 1, 1),
(517, 'econovet', 'vitamina b 12 6000 con b 15 30 ml', 10, 216, 480, 264, 1, 1),
(518, 'farmacon', 'spectrum sobre', 10, 45, 90, 54, 1, 1),
(519, 'farmatec', 'ade forte 100 ml', 10, 110, 220, 132, 1, 1),
(520, 'farmatec', 'adeforte 250 mk', 10, 225, 450, 270, 1, 1),
(521, 'farmatec', 'lepecid', 10, 52, 104, 62.4, 1, 1),
(522, 'fiori', 'acuapen 250 ml', 10, 243.75, 487.5, 292.5, 1, 1),
(523, 'fiori', 'acuapen 100 ml', 10, 125, 250, 150, 1, 1),
(524, 'fiori', 'fiolax', 10, 44.5, 89, 53.4, 1, 1),
(525, 'fiori', 'broxacina 20 ml', 10, 57.25, 114.5, 68.7, 1, 1),
(526, 'fiori', 'fiori estreptoenzim 6 mll', 10, 95.25, 190.5, 114.3, 1, 1),
(527, 'fiori', 'flor di bro 100 ml', 10, 336.25, 672.5, 403.5, 1, 1),
(528, 'fiori', 'flormaxicol 20 ml', 10, 58.5, 117, 70.2, 1, 1),
(529, 'gortie', 'albendagort litro 10% litro', 10, 60, 120, 72, 1, 1),
(530, 'halvet', 'animox 15 ml', 10, 26.88, 84, 35.28, 1, 1),
(531, 'halvet', 'bendaval  100 ml', 10, 57.92, 181, 76.02, 1, 1),
(532, 'halvet', 'bravo shampo', 10, 40.3648, 126.14, 52.9788, 1, 1),
(533, 'halvet', 'bravo spray', 10, 49.5168, 154.74, 64.9908, 1, 1),
(534, 'halvet', 'bravo 100 ml', 10, 33.92, 106, 44.52, 1, 1),
(535, 'halvet', 'bravo 250 ml', 10, 66.4736, 207.73, 87.2466, 1, 1),
(536, 'halvet', 'bravo 500 ml', 10, 115.328, 360.4, 151.368, 1, 1),
(537, 'halvet', 'bravo litro', 10, 209.9648, 656.14, 275.5788, 1, 1),
(538, 'halvet', 'broncotrim 30 ml', 10, 36.16, 113, 47.46, 1, 1),
(539, 'halvet', 'carprotec 20', 10, 66.88, 209, 87.78, 1, 1),
(540, 'halvet', 'damax ', 10, 316.48, 989, 415.38, 1, 1),
(541, 'halvet', 'damax 11', 10, 133.76, 418, 175.56, 1, 1),
(542, 'halvet', 'emetin 2', 10, 9.6, 30, 12.6, 1, 1),
(543, 'halvet', 'emetin 10', 10, 20.16, 63, 26.46, 1, 1),
(544, 'halvet', 'emetin 50', 10, 64.64, 202, 84.84, 1, 1),
(545, 'halvet', 'escuderm tabletas', 10, 76.48, 239, 100.38, 1, 1),
(546, 'halvet', 'escuderm shampo', 10, 61.12, 191, 80.22, 1, 1),
(547, 'halvet', 'escuderm spray', 10, 46.08, 144, 60.48, 1, 1),
(548, 'halvet', 'gotikas 18 ml', 10, 46.72, 146, 61.32, 1, 1),
(549, 'halvet', 'metrinid tab', 10, 55.36, 173, 72.66, 1, 1),
(550, 'halvet', 'promofer 250 ml', 10, 74.56, 233, 97.86, 1, 1),
(551, 'halvet', 'tomo 60 ml', 10, 20.16, 63, 26.46, 1, 1),
(552, 'halvet', 'tomo 100  ml', 10, 29.44, 92, 38.64, 1, 1),
(553, 'halvet', 'tomo 250 ml', 10, 46.08, 144, 60.48, 1, 1),
(554, 'halvet', 'tomo litro', 10, 119.04, 372, 156.24, 1, 1),
(555, 'halvet', 'unimast 100 ml', 10, 46.08, 144, 60.48, 1, 1),
(556, 'halvet', 'virustad 50 ml', 10, 69.44, 217, 91.14, 1, 1),
(557, 'halvet', 'xilocam gotas', 10, 85.76, 268, 112.56, 1, 1),
(558, 'lapisa', 'ampipen 10gr', 10, 89.44, 172, 106.64, 1, 1),
(559, 'lapisa', 'estrep-50', 10, 188.76, 363, 225.06, 1, 1),
(560, 'lapisa', 'neumo sp kg', 10, 70.72, 136, 84.32, 1, 1),
(561, 'lapisa', 'pylosin 100ml', 10, 94.64, 182, 112.84, 1, 1),
(562, 'lapisa', 'pylosin 250ml', 10, 218.4, 420, 260.4, 1, 1),
(563, 'lapisa', 'ticoff', 10, 58.24, 112, 69.44, 1, 1),
(564, 'loeffler innopharma', 'meloxinn 30 ml', 10, 120.45, 240.9, 144.54, 1, 1),
(565, 'loeffler innopharma', 'pre pro bios ', 10, 203.5, 407, 244.2, 1, 1),
(566, 'loeffler innopharma', 'sucralvet 15 ml', 10, 120.49, 240.98, 144.588, 1, 1),
(567, 'loeffler innopharma', 'sucravet 30 ml', 10, 147.95, 295.9, 177.54, 1, 1),
(568, 'loeffler innopharma', 'cis a prid 20ml', 10, 102.3, 204.6, 122.76, 1, 1),
(569, 'loeffler innopharma', 'clindafur 25 ml iny', 10, 132.5, 265, 159, 1, 1),
(570, 'loeffler innopharma', 'ondatron 10 ml', 10, 257.95, 515.9, 309.54, 1, 1),
(571, 'loeffler innopharma', 'terbigen 120 ml', 10, 133.84, 267.68, 160.608, 1, 1),
(572, 'loeffler innopharma', 'terbigen shampoo ', 10, 150.64, 301.28, 180.768, 1, 1),
(573, 'loeffler innopharma', 'protozol 120 ml ', 10, 120.45, 240.9, 144.54, 1, 1),
(574, 'loeffler innopharma', 'clindaserin 30 g', 10, 175.45, 350.9, 210.54, 1, 1),
(575, 'loeffler innopharma', 'hialudol 4 ml', 10, 577.5, 1155, 693, 1, 1),
(576, 'loeffler', 'cafeina', 10, 78, 195, 97.5, 1, 1),
(577, 'loeffler', 'calcio reforzado', 10, 140.164, 350.41, 175.205, 1, 1),
(578, 'loeffler', 'diurifler 30 ml', 10, 99.4, 248.5, 124.25, 1, 1),
(579, 'loeffler', 'epironox 500 ml', 10, 345.6, 864, 432, 1, 1),
(580, 'loeffler', 'extracto pituitario anterior', 10, 0.4, 1, 0.5, 1, 1),
(581, 'loeffler', 'extracto pituitario posterior', 10, 38.876, 97.19, 48.595, 1, 1),
(582, 'loeffler', 'formula antidiarreica', 10, 103.016, 257.54, 128.77, 1, 1),
(583, 'loeffler', 'gonadotropina corionica 10,000', 10, 395.56, 988.9, 494.45, 1, 1),
(584, 'loeffler', 'gonadotropina corionica 2,000', 10, 149.2, 373, 186.5, 1, 1),
(585, 'loeffler', 'iverffler tab', 10, 6.336, 15.84, 7.92, 1, 1),
(586, 'loeffler', 'histaffler', 10, 98.928, 247.32, 123.66, 1, 1),
(587, 'loeffler', 'iverffler 500 ml', 10, 321.6, 804, 402, 1, 1),
(588, 'loeffler', 'laxotonico iny', 10, 119.6, 299, 149.5, 1, 1),
(589, 'loeffler', 'laxotonico oral', 10, 184, 460, 230, 1, 1),
(590, 'loeffler', 'neomastil', 10, 21.056, 52.64, 26.32, 1, 1),
(591, 'loeffler', 'p calimag 100 ml', 10, 122, 305, 152.5, 1, 1),
(592, 'loeffler', 'p calimag 250ml', 10, 240, 600, 300, 1, 1),
(593, 'loeffler', 'rumisal', 10, 158.4, 396, 198, 1, 1),
(594, 'loeffler', 'secador loeffler', 10, 23.788, 59.47, 29.735, 1, 1),
(595, 'loeffler', 'sulfato de atropina   10 ML', 10, 40.2, 100.5, 50.25, 1, 1),
(596, 'loeffler', 'sulfato de atropina 60 ml', 10, 202.8, 507, 253.5, 1, 1),
(597, 'loeffler', 'super quimioffler 6 mll', 10, 132.248, 330.62, 165.31, 1, 1),
(598, 'loeffler', 'trisulfa 100 ml', 10, 56.156, 140.39, 70.195, 1, 1),
(599, 'loeffler', 'trisulfa 500ml', 10, 174.652, 436.63, 218.315, 1, 1),
(600, 'loeffler', 'turboffler 100 ml', 10, 119.6, 299, 149.5, 1, 1),
(601, 'loeffler', 'tolerax 100', 10, 355.28, 888.2, 444.1, 1, 1),
(602, 'loeffler', 'triamadol 20 ml', 10, 193.2, 483, 241.5, 1, 1),
(603, 'maver', 'biotavit kg', 10, 351.725, 639.5, 415.675, 1, 1),
(604, 'maver', 'pentosedal  100 ml', 10, 165, 300, 195, 1, 1),
(605, 'maver', 'bonus intra uterino 60 ml', 10, 20.9, 38, 24.7, 1, 1),
(606, 'maver', 'bonus solucin galon', 10, 370.15, 673, 437.45, 1, 1),
(607, 'maver', 'butadex sobre', 10, 110, 200, 130, 1, 1),
(608, 'maver', 'butoral sobre', 10, 90.2, 164, 106.6, 1, 1),
(609, 'maver', 'coribac 100 ml', 10, 46.75, 85, 55.25, 1, 1),
(610, 'maver', 'new castle maver 25 ds', 10, 21.45, 39, 25.35, 1, 1),
(611, 'maver', 'new castle maver 50 ds', 10, 23.65, 43, 27.95, 1, 1),
(612, 'maver', 'new castle maver 100 ds', 10, 26.4, 48, 31.2, 1, 1),
(613, 'maver', 'viruela maver 50 ds', 10, 34.1, 62, 40.3, 1, 1),
(614, 'maver', 'viruela maver 100 ds', 10, 37.4, 68, 44.2, 1, 1),
(615, 'maver', 'cuffer galon', 10, 705, 1175, 822.5, 1, 1),
(616, 'maver', 'cuffer 240 ml', 10, 48.95, 89, 57.85, 1, 1),
(617, 'maver', 'dmso 120 ml', 10, 91.85, 167, 108.55, 1, 1),
(618, 'maver', 'lax-ave 100gr', 10, 19.8, 36, 23.4, 1, 1),
(619, 'boheringer', 'equalan', 10, 123.84, 172, 141.04, 1, 1),
(620, 'merial boheringer', 'broadline ch', 10, 121.46766, 279.236, 149.39126, 1, 1),
(621, 'merial boheringer', 'broadline gde', 10, 130.13895, 299.17, 160.05595, 1, 1),
(622, 'merial boheringer', 'frontline  gatos', 10, 87.11745, 200.27, 107.14445, 1, 1),
(623, 'merial boheringer', 'frontline 2 - 10', 10, 103.2429, 237.34, 126.9769, 1, 1),
(624, 'merial boheringer', 'frontline  10 - 20 kgs', 10, 107.30145, 246.67, 131.96845, 1, 1),
(625, 'merial boheringer', 'frontline  20 - 40 kgs', 10, 109.3329, 251.34, 134.4669, 1, 1),
(626, 'merial boheringer', 'frontline 40 - 60 kgs', 10, 111.795, 257, 137.495, 1, 1),
(627, 'merial boheringer', 'frontline spray 100 ml', 10, 169.3629, 389.34, 208.2969, 1, 1),
(628, 'merial boheringer', 'frontline spray 250 ml', 10, 276.0162, 634.52, 339.4682, 1, 1),
(629, 'merial boheringer', 'heart gard  2-11', 10, 32.26395, 74.17, 39.68095, 1, 1),
(630, 'merial boheringer', 'heart gard  11-22', 10, 37.48395, 86.17, 46.10095, 1, 1),
(631, 'merial boheringer', 'heart gard  22-45', 10, 53.85735, 123.81, 66.23835, 1, 1),
(632, 'merial boheringer', 'recombitek c3', 10, 74.5068, 171.28, 91.6348, 1, 1),
(633, 'merial boheringer', 'recombitek c4', 10, 78.2478, 179.88, 96.2358, 1, 1),
(634, 'merial boheringer', 'recombitek c6', 10, 81.519, 187.4, 100.259, 1, 1),
(635, 'boheringer', 'equalan gold ', 10, 140.184, 194.7, 159.654, 1, 1),
(636, 'boheringer', 'ivomec 1 % 50 ML', 10, 159.84, 222, 182.04, 1, 1),
(637, 'boheringer', 'ivomec 1 % 200 ML', 10, 460.8, 640, 524.8, 1, 1),
(638, 'boheringer', 'ivomec 1 % 500 ML', 10, 805.68, 1119, 917.58, 1, 1),
(639, 'boheringer', 'ivomec-f 50 ml', 10, 269.28, 374, 306.68, 1, 1),
(640, 'boheringer', 'ivomec-f 200 ml', 10, 817.92, 1136, 931.52, 1, 1),
(641, 'boheringer', 'ivomec-f 500 ml', 10, 1672.56, 2323, 1904.86, 1, 1),
(642, 'merial boheringer', 'purevax RCPCH FELV', 10, 211.96245, 487.27, 260.68945, 1, 1),
(643, 'merial boheringer', 'nexgard 2.3', 10, 114.26145, 262.67, 140.52845, 1, 1),
(644, 'merial boheringer', 'nexgard 3.7', 10, 120.93, 278, 148.73, 1, 1),
(645, 'merial boheringer', 'nexgard 7.15', 10, 129.0645, 296.7, 158.7345, 1, 1),
(646, 'merial boheringer', 'nexgard 15.30', 10, 136.3029, 313.34, 167.6369, 1, 1),
(647, 'merial boheringer', 'nexgard 30.60', 10, 157.035, 361, 193.135, 1, 1),
(648, 'boheringer', 'ivomec gold 500 ml ', 10, 2097.36, 2913, 2388.66, 1, 1),
(649, 'boheringer', 'j vac', 10, 233.28, 324, 265.68, 1, 1),
(650, 'boheringer', 'legend amp', 10, 918, 1275, 1045.5, 1, 1),
(651, 'boheringer', 'proteq flu te', 10, 156.24, 217, 177.94, 1, 1),
(652, 'boheringer', 'trodax bovinos 50ml', 10, 128.16, 178, 145.96, 1, 1),
(653, 'boheringer', 'trodax bovinos 500 ml', 10, 811.44, 1127, 924.14, 1, 1),
(654, 'boheringer', 'vetipulmin gel 330', 10, 3719.52, 5166, 4236.12, 1, 1),
(655, 'boheringer', 'zactran 250 ml', 10, 3646.08, 5064, 4152.48, 1, 1),
(656, 'microsules', 'vit mic 500 ml', 10, 73.1, 170, 90.1, 1, 1),
(657, 'msd', 'bacterina mixta bovina 250 ml', 10, 152.4, 254, 177.8, 1, 1),
(658, 'msd', 'bacterina mixta bovina 50 ml', 10, 54, 90, 63, 1, 1),
(659, 'msd', 'bacterina mixta porcina 250 ml', 10, 175.2, 292, 204.4, 1, 1),
(660, 'msd', 'bacterina mixta porcina 50 ml', 10, 58.2, 97, 67.9, 1, 1),
(661, 'msd', 'bacterina triple 250 ml', 10, 169.2, 282, 197.4, 1, 1),
(662, 'msd', 'bacterina triple 50 ml', 10, 59.4, 99, 69.3, 1, 1),
(663, 'msd', 'bobact 8 250 ml', 10, 282.6, 471, 329.7, 1, 1),
(664, 'msd', 'butox 100 ml', 10, 136.2, 227, 158.9, 1, 1),
(665, 'msd', 'folligon ds 1000 ui', 10, 112.97, 173.8, 130.35, 1, 1),
(666, 'msd', 'gorban 100 ml', 10, 438, 730, 511, 1, 1),
(667, 'msd', 'laurabolin 10 ml', 10, 74.555, 114.7, 86.025, 1, 1),
(668, 'msd', 'mastijet jer', 10, 29.562, 49.27, 34.489, 1, 1),
(669, 'msd', 'metricur', 10, 121.875, 187.5, 140.625, 1, 1),
(670, 'msd', 'nafpenzal dc jer', 10, 145.2, 242, 169.4, 1, 1),
(671, 'msd', 'panacur 22 %', 10, 50.88, 84.8, 59.36, 1, 1),
(672, 'msd', 'panacur 4 %', 10, 19.596, 32.66, 22.862, 1, 1),
(673, 'msd', 'pg 600', 10, 98.475, 151.5, 113.625, 1, 1),
(674, 'msd', 'salix', 10, 85.2, 142, 99.4, 1, 1),
(675, 'msd', 'taktic litro', 10, 288.6, 481, 336.7, 1, 1),
(676, 'msd', 'tonofosfan 100 ml', 10, 195.46, 337, 229.16, 1, 1),
(677, 'msd', 'tonofosfan 500 ml', 10, 729.06, 1257, 854.76, 1, 1),
(678, 'msd', 'tonofosfan compositum', 10, 258.68, 446, 303.28, 1, 1),
(679, 'msd', 'vetalgina 100 ml', 10, 161.82, 279, 189.72, 1, 1),
(680, 'msd', 'vetalgina 50 ml', 10, 114.26, 197, 133.96, 1, 1),
(681, 'msd', 'pencivet 6 mlls', 10, 152.75, 235, 176.25, 1, 1),
(682, 'msd', 'agujas para ralgro', 10, 16.998, 28.33, 19.831, 1, 1),
(683, 'msd', 'boostin', 10, 72.672, 121.12, 84.784, 1, 1),
(684, 'msd', 'celocil ', 10, 252, 420, 294, 1, 1),
(685, 'msd', 'finadyne 100 ml', 10, 783.6, 1306, 914.2, 1, 1),
(686, 'msd', 'naquasone', 10, 190.8, 318, 222.6, 1, 1),
(687, 'msd', 'ralgro', 10, 417.9, 696.5, 487.55, 1, 1),
(688, 'mederilab', 'alben max 10 30 t', 10, 16.1172, 36.63, 19.7802, 1, 1),
(689, 'mederilab', 'alben max 30 30t', 10, 12.1, 27.5, 14.85, 1, 1),
(690, 'mederilab', 'alben min litro', 10, 461.56, 1049, 566.46, 1, 1),
(691, 'mederilab', 'artrodol 10 30 t', 10, 188.76, 429, 231.66, 1, 1),
(692, 'mederilab', 'artrodol 30 30 t', 10, 263.56, 599, 323.46, 1, 1),
(693, 'mederilab', 'block in 250 ml', 10, 61.16, 139, 75.06, 1, 1),
(694, 'mederilab', 'block in 500 ml', 10, 91.96, 209, 112.86, 1, 1),
(695, 'mederilab', 'block in litro', 10, 144.76, 329, 177.66, 1, 1),
(696, 'mederilab', 'clindacin 10 30 t', 10, 144.76, 329, 177.66, 1, 1),
(697, 'mederilab', 'clindacion 30 30 t', 10, 250.36, 569, 307.26, 1, 1),
(698, 'mederilab', 'clindagen 25 ml', 10, 105.16, 239, 129.06, 1, 1),
(699, 'mederilab', 'dermisan 10 tab ', 10, 105.16, 239, 129.06, 1, 1),
(700, 'mederilab', 'dermisan 30 tab ', 10, 219.56, 499, 269.46, 1, 1),
(701, 'mederilab', 'dermisan spray', 10, 61.16, 139, 75.06, 1, 1),
(702, 'mederilab', 'dermisan shampo', 10, 109.56, 249, 134.46, 1, 1),
(703, 'mederilab', 'doximed 10 30 tab', 10, 105.16, 239, 129.06, 1, 1),
(704, 'mederilab', 'doximed 30 30 tab', 10, 193.16, 439, 237.06, 1, 1),
(705, 'mederilab', 'enrocam 10', 10, 179.96, 409, 220.86, 1, 1),
(706, 'mederilab', 'enrodip ', 10, 100.76, 229, 123.66, 1, 1),
(707, 'mederilab', 'epilexis 5', 10, 105.16, 239, 129.06, 1, 1),
(708, 'mederilab', 'epilexis 10', 10, 144.76, 329, 177.66, 1, 1),
(709, 'mederilab', 'epilexis 30', 10, 285.56, 649, 350.46, 1, 1),
(710, 'mederilab', 'forte 4 spray 120 ml', 10, 56.76, 129, 69.66, 1, 1),
(711, 'mederilab', 'forte 4 spray 240 ml', 10, 96.36, 219, 118.26, 1, 1),
(712, 'mederilab', 'forte g litro', 10, 615.56, 1399, 755.46, 1, 1),
(713, 'mederilab', 'forte 4 lt ', 10, 281.16, 639, 345.06, 1, 1),
(714, 'mederilab', 'forte 34  100 ml', 10, 91.96, 209, 112.86, 1, 1),
(715, 'mederilab', 'forte 34  lt ', 10, 773.96, 1759, 949.86, 1, 1),
(716, 'mederilab', 'gastryl iny 10 ml', 10, 21.56, 49, 26.46, 1, 1),
(717, 'mederilab', 'gastryl iny 50 ml', 10, 74.36, 169, 91.26, 1, 1),
(718, 'mederilab', 'gentadex ', 10, 39.16, 89, 48.06, 1, 1),
(719, 'mederilab', 'lagrimed10 ml', 10, 47.96, 109, 58.86, 1, 1),
(720, 'mederilab', ' levivet 10 30 tab ', 10, 223.96, 509, 274.86, 1, 1),
(721, 'mederilab', 'omepra ', 10, 61.16, 139, 75.06, 1, 1),
(722, 'mederilab', 'ner mus', 10, 47.96, 109, 58.86, 1, 1),
(723, 'mederilab', 'nidazol oral 60 ml', 10, 153.56, 349, 188.46, 1, 1),
(724, 'mederilab', 'otisan  20 ml', 10, 56.76, 129, 69.66, 1, 1),
(725, 'mederilab', 'nidazol 10 tab', 10, 69.96, 159, 85.86, 1, 1),
(726, 'mederilab', 'nidazol 30 tab', 10, 153.56, 349, 188.46, 1, 1),
(727, 'mederilab', 'nutrivit tab', 10, 109.56, 249, 134.46, 1, 1),
(728, 'mederilab', 'pregabalyn 5', 10, 127.16, 289, 156.06, 1, 1),
(729, 'mederilab', 'pregabalyn 10', 10, 184.36, 419, 226.26, 1, 1),
(730, 'mederilab', 'relax gotas 30 t ', 10, 47.96, 109, 58.86, 1, 1),
(731, 'mederilab', 'relax spray 30 t ', 10, 109.56, 249, 134.46, 1, 1),
(732, 'mederilab', 'respimed 30 tab', 10, 96.36, 219, 118.26, 1, 1),
(733, 'mederilab', 'silk shampoo ', 10, 69.96, 159, 85.86, 1, 1),
(734, 'mederilab', 'sindol  10', 10, 96.36, 219, 118.26, 1, 1),
(735, 'mederilab', 'sindol 30', 10, 175.56, 399, 215.46, 1, 1),
(736, 'mederilab', 'trisul c 60 ml', 10, 52.36, 119, 64.26, 1, 1),
(737, 'mederilab', 'trisul d 25 ml', 10, 56.76, 129, 69.66, 1, 1),
(738, 'mederilab', 'trisul pets 60 ml', 10, 52.36, 119, 64.26, 1, 1),
(739, 'mederilab', 'trisul pets 20 ml', 10, 30.36, 69, 37.26, 1, 1),
(740, 'neofarma', 'clorasul 100', 10, 53.32, 124, 65.72, 1, 1),
(741, 'neofarma', 'clorasul 50', 10, 25.8, 60, 31.8, 1, 1),
(742, 'neofarma', 'clorasul 20', 10, 35.26, 82, 43.46, 1, 1),
(743, 'neofarma', 'maxipen', 10, 90.3, 210, 111.3, 1, 1),
(744, 'neofarma', 'oxichem 20 ml', 10, 30.831, 71.7, 38.001, 1, 1),
(745, 'neofarma', 'oxichem 50 ml', 10, 59.77, 139, 73.67, 1, 1),
(746, 'neofarma', 'oxichem 100 ml', 10, 98.47, 229, 121.37, 1, 1),
(747, 'norvet g', 'oxyjet 100 ml', 10, 72.85, 155, 88.35, 1, 1),
(748, 'norvet g', 'azul vet spray', 10, 72.85, 155, 88.35, 1, 1),
(749, 'norvet g ', 'tylofos 500 ml', 10, 72.85, 155, 88.35, 1, 1),
(750, 'norvet', 'condro jet 10 ml', 10, 539.5, 1079, 647.4, 1, 1),
(751, 'norvet', 'carty jet 4 ml', 10, 1113.2, 2024, 1315.6, 1, 1),
(752, 'norvet', 'azul vet spray', 10, 24.91, 53, 30.21, 1, 1),
(753, 'norvet g', 'enerjet 500 ml sin caja', 10, 75.2, 160, 91.2, 1, 1),
(754, 'norvet', 'genta jet 15 ml', 10, 43.71, 93, 53.01, 1, 1);
INSERT INTO `producto` (`id_Producto`, `Laboratorio`, `Nombre`, `Cantidad`, `p_Compra`, `P_CostoLista`, `PVPublicoGeneral`, `PVMedioMayoreo`, `PVMayoreo`) VALUES
(755, 'norvet', 'giardiaco', 10, 72.85, 155, 88.35, 1, 1),
(756, 'norvet', 'giardiacos susp 20 ml', 10, 88.36, 188, 107.16, 1, 1),
(757, 'norvet', 'giardiacos susp 50 ml', 10, 125.02, 266, 151.62, 1, 1),
(758, 'norvet', 'giardiacos M ', 10, 153.69, 327, 186.39, 1, 1),
(759, 'norvet', 'giardiacos xl  ', 10, 311.61, 663, 377.91, 1, 1),
(760, 'norvet', 'metronidapets 30 ml', 10, 49.35, 105, 59.85, 1, 1),
(761, 'norvet', 'complet plus susp 15 ml', 10, 47.47, 101, 57.57, 1, 1),
(762, 'norvet', 'complet plus sus 30 ml', 10, 66.74, 142, 80.94, 1, 1),
(763, 'norvet', 'complet plus susp 120 ml', 10, 219.02, 466, 265.62, 1, 1),
(764, 'norvet', 'complet plus tab S', 10, 173.43, 369, 210.33, 1, 1),
(765, 'norvet', 'complet plus tab M', 10, 242.05, 515, 293.55, 1, 1),
(766, 'norvet', 'complet plus tab L', 10, 314.43, 669, 381.33, 1, 1),
(767, 'norvet', 'complet plus tabl XL', 10, 97.76, 208, 118.56, 1, 1),
(768, 'norvet', 'complet Max oral 30 ml', 10, 207.27, 441, 251.37, 1, 1),
(769, 'norvet', 'complet Max oral 120 ml', 10, 336.99, 717, 408.69, 1, 1),
(770, 'norvet', 'complet Max S tab', 10, 186.59, 397, 226.29, 1, 1),
(771, 'norvet', 'complet Max M tab', 10, 311.14, 662, 377.34, 1, 1),
(772, 'norvet', 'protecto M', 10, 131.6, 280, 159.6, 1, 1),
(773, 'norvet', 'protecto  L', 10, 208.68, 444, 253.08, 1, 1),
(774, 'norvet', 'protecto XL', 10, 329.47, 701, 399.57, 1, 1),
(775, 'norvet', 'carti pets 10', 10, 204.92, 436, 248.52, 1, 1),
(776, 'norvet', 'cartipets 25', 10, 360.96, 768, 437.76, 1, 1),
(777, 'norvet', 'rampril plus S', 10, 173.43, 369, 210.33, 1, 1),
(778, 'norvet', 'rampril plus M', 10, 242.05, 515, 293.55, 1, 1),
(779, 'norvet', 'rampril plus L', 10, 293.75, 625, 356.25, 1, 1),
(780, 'norvet', 'tyropets S', 10, 48.41, 103, 58.71, 1, 1),
(781, 'norvet', 'tyropets M', 10, 54.99, 117, 66.69, 1, 1),
(782, 'norvet', 'tyropets L', 10, 65.8, 140, 79.8, 1, 1),
(783, 'norvet', 'tyropets XL ', 10, 78.96, 168, 95.76, 1, 1),
(784, 'norvet', 'itraconapets S', 10, 92.12, 196, 111.72, 1, 1),
(785, 'norvet', 'itraconapets M', 10, 138.18, 294, 167.58, 1, 1),
(786, 'norvet', 'itraconapets L ', 10, 201.16, 428, 243.96, 1, 1),
(787, 'norvet', 'stop jet 120 ml', 10, 37.13, 79, 45.03, 1, 1),
(788, 'norvet', 'ondra pets', 10, 421.12, 896, 510.72, 1, 1),
(789, 'norvet', 'masko pets ca', 10, 88.36, 188, 107.16, 1, 1),
(790, 'norvet', 'masko pets plus', 10, 88.36, 188, 107.16, 1, 1),
(791, 'norvet', 'omega pets', 10, 115.62, 246, 140.22, 1, 1),
(792, 'norvet', 'atrayenta natural', 10, 69.56, 148, 84.36, 1, 1),
(793, 'norvet', 'repelente natura', 10, 69.56, 148, 84.36, 1, 1),
(794, 'norvet', 'lubri pets 10 ml', 10, 57.81, 123, 70.11, 1, 1),
(795, 'norvet', 'lubri pets crema', 10, 54.99, 117, 66.69, 1, 1),
(796, 'norvet g', 'ener jet lite 500 ml con caja ', 10, 88.36, 188, 107.16, 1, 1),
(797, 'norvet g', 'equinox pastas', 10, 115.62, 246, 140.22, 1, 1),
(798, 'novartis', 'agita 400 gr', 10, 734.8, 1336, 868.4, 1, 1),
(799, 'novartis', 'alfadex  100 ml', 10, 79.75, 145, 94.25, 1, 1),
(800, 'novartis', 'alfadex sobre', 10, 23.32, 42.4, 27.56, 1, 1),
(801, 'novartis', 'ganaseg b12 25 ml', 10, 79.75, 145, 94.25, 1, 1),
(802, 'novartis', 'lanirat kg  AVENA', 10, 152.4, 254, 177.8, 1, 1),
(803, 'novartis', 'levadura bulto ', 10, 265.85, 409, 306.75, 1, 1),
(804, 'ordonez', 'pom la tia chica', 10, 57.6, 80, 65.6, 1, 1),
(805, 'ordonez', 'pom la tia grande', 10, 162, 225, 184.5, 1, 1),
(806, 'ordonez', 'pom la tia mediana', 10, 97.2, 135, 110.7, 1, 1),
(807, 'panavet', 'anapiro', 10, 179, 358, 214.8, 1, 1),
(808, 'panavet', 'anemin phos 250 ml', 10, 306.5, 613, 367.8, 1, 1),
(809, 'panavet', 'calcio protein fuerte', 10, 126.14, 371, 163.24, 1, 1),
(810, 'panavet', 'calcio protein vit 100 ml', 10, 57.12, 168, 73.92, 1, 1),
(811, 'panavet', 'calcio protein vit 250 m1', 10, 105.4, 310, 136.4, 1, 1),
(812, 'panavet', 'calcio protein vit. 500 ml', 10, 144.16, 424, 186.56, 1, 1),
(813, 'panavet', 'ceptiopan 100 ml', 10, 327.5, 655, 393, 1, 1),
(814, 'panavet', 'diastopan sobre', 10, 71.675, 143.35, 86.01, 1, 1),
(815, 'panavet', 'diastopan 2.4 kg ', 10, 1905, 3810, 2286, 1, 1),
(816, 'panavet', 'lactocin 250 ml', 10, 125, 250, 150, 1, 1),
(817, 'panavet', 'iverpan 3.5 500 ml', 10, 737, 1474, 884.4, 1, 1),
(818, 'parfarm', 'arsil 50 ml', 10, 75.18, 179, 93.08, 1, 1),
(819, 'parfarm', 'arsil 100 ml', 10, 116.34, 277, 144.04, 1, 1),
(820, 'parfarm', 'cadef 500', 10, 137.76, 328, 170.56, 1, 1),
(821, 'parfarm', 'centryl 5% 20 ml', 10, 23.5032, 55.96, 29.0992, 1, 1),
(822, 'parfarm', 'dexvet 10 ml', 10, 43.68, 104, 54.08, 1, 1),
(823, 'parfarm', 'dexvet 50 ml', 10, 101.64, 242, 125.84, 1, 1),
(824, 'parfarm', 'edemofin 10 ml', 10, 59.22, 141, 73.32, 1, 1),
(825, 'parfarm', 'ericlor avicoa 100 gms', 10, 149.1, 355, 184.6, 1, 1),
(826, 'parfarm', 'ericlor avicoa 10 gms', 10, 16.548, 39.4, 20.488, 1, 1),
(827, 'parfarm', 'espenfort 100 ml', 10, 155.4, 370, 192.4, 1, 1),
(828, 'parfarm', 'espenfort 250 ', 10, 252, 600, 312, 1, 1),
(829, 'parfarm', 'flunidol 250 ml', 10, 388.92, 926, 481.52, 1, 1),
(830, 'parfarm', 'ferlocina ', 10, 49.14, 117, 60.84, 1, 1),
(831, 'parfarm', 'forenzim ', 10, 70.14, 167, 86.84, 1, 1),
(832, 'parfarm', 'forestro', 10, 44.52, 106, 55.12, 1, 1),
(833, 'parfarm', 'formizina ', 10, 60.9, 145, 75.4, 1, 1),
(834, 'parfarm', 'gonaforte', 10, 132.72, 316, 164.32, 1, 1),
(835, 'parfarm', 'HISTAFORTE ', 10, 97.02, 231, 120.12, 1, 1),
(836, 'parfarm', 'histafin 100 ml', 10, 105.42, 251, 130.52, 1, 1),
(837, 'parfarm', 'histafin 30 ml', 10, 49.56, 118, 61.36, 1, 1),
(838, 'parfarm', 'mastobac', 10, 30.345, 72.25, 37.57, 1, 1),
(839, 'parfarm', 'mastofin', 10, 19.299, 45.95, 23.894, 1, 1),
(840, 'parfarm', 'mastosec', 10, 19.698, 46.9, 24.388, 1, 1),
(841, 'parfarm', 'PARFOSAL', 10, 179.76, 428, 222.56, 1, 1),
(842, 'parfarm', 'parmectin plus pasta', 10, 97.02, 231, 120.12, 1, 1),
(843, 'parfarm', 'parzen bovimos 19% jeringa', 10, 24.234, 57.7, 30.004, 1, 1),
(844, 'parfarm', 'parmisole ade + b 20 ml', 10, 39.6, 88, 48.4, 1, 1),
(845, 'parfarm', 'parmisole ade + b 100 ml', 10, 154.8, 344, 189.2, 1, 1),
(846, 'parfarm', 'parmisole ade + b 500 ml', 10, 652.05, 1449, 796.95, 1, 1),
(847, 'parfarm', 'parmisole 12% 100 ml', 10, 57.54, 137, 71.24, 1, 1),
(848, 'parfarm', 'parzen 200 ml', 10, 96.18, 229, 119.08, 1, 1),
(849, 'parfarm', 'pisan spray', 10, 64.26, 153, 79.56, 1, 1),
(850, 'parfarm', 'prontaformo oral', 10, 6.0312, 14.36, 7.4672, 1, 1),
(851, 'parfarm', 'prontaformo uterino', 10, 7.4088, 17.64, 9.1728, 1, 1),
(852, 'parfarm', 'rulaxton', 10, 24.276, 57.8, 30.056, 1, 1),
(853, 'parfarm', 'vitafor ade + b 10', 10, 31.05, 69, 37.95, 1, 1),
(854, 'parfarm', 'vitafor ade + b 100', 10, 127.8, 284, 156.2, 1, 1),
(855, 'parfarm', 'vitafor ade + b 500 ml', 10, 501.3, 1114, 612.7, 1, 1),
(856, 'parfarm', 'vitafor A 10 gr', 10, 5.0985, 11.33, 6.2315, 1, 1),
(857, 'parfarm', 'vitafor A  100 gr', 10, 30.33, 67.4, 37.07, 1, 1),
(858, 'parfarm', 'vitafor A 500 grms', 10, 81.3015, 180.67, 99.3685, 1, 1),
(859, 'parfarm', 'vitafor A kg ', 10, 160.65, 357, 196.35, 1, 1),
(860, 'parfarm', 'vitafor c kg', 10, 237.6, 528, 290.4, 1, 1),
(861, 'parfarm', 'vitafor pelecha 10 gr', 10, 38.43, 85.4, 46.97, 1, 1),
(862, 'parfarm', 'vitafor pelecha 100 gr', 10, 22.275, 49.5, 27.225, 1, 1),
(863, 'parfarm', 'vitafor pelecha 500 gr', 10, 70.4565, 156.57, 86.1135, 1, 1),
(864, 'parfarm', 'vitafor postura 10 gr', 10, 3.7755, 8.39, 4.6145, 1, 1),
(865, 'parfarm', 'vitafor postura 100 gr', 10, 19.4985, 43.33, 23.8315, 1, 1),
(866, 'parfarm', 'vitafor postura 500 gr', 10, 60.8265, 135.17, 74.3435, 1, 1),
(867, 'pier', 'bacterina triple 50 ml', 10, 38.13333333, 88, 44, 1, 1),
(868, 'pier', 'bacterina triple 100 ml', 10, 64.56666667, 149, 74.5, 1, 1),
(869, 'pier', 'bacterina triple 250 ml', 10, 89.05, 205.5, 102.75, 1, 1),
(870, 'pier', 'gt-300 20 ml', 10, 57.41666667, 132.5, 66.25, 1, 1),
(871, 'pier', 'gt-300 100 ml', 10, 238.55, 550.5, 275.25, 1, 1),
(872, 'pier', 'gt-300 250 ml', 10, 521.0833333, 1202.5, 601.25, 1, 1),
(873, 'pier', 'gt-300 500 ml', 10, 984.75, 2272.5, 1136.25, 1, 1),
(874, 'pier', 'gt-aves y lechones 50 ml', 10, 49.4, 114, 57, 1, 1),
(875, 'pier', 'gt-aves y lechones 100 ml', 10, 91.43333333, 211, 105.5, 1, 1),
(876, 'pier', 'gt-aves y lechones 250 ml', 10, 195.4333333, 451, 225.5, 1, 1),
(877, 'pier', 'cocci pier 100 ml', 10, 137.5833333, 317.5, 158.75, 1, 1),
(878, 'pier', 'cocci pier 250 ml', 10, 298.1333333, 688, 344, 1, 1),
(879, 'pier', 'neogen ganado 250 ml', 10, 156.65, 361.5, 180.75, 1, 1),
(880, 'pier', 'pirex 80 100 ml', 10, 125.45, 289.5, 144.75, 1, 1),
(881, 'pier', 'pirex 80 250 ml', 10, 241.8, 558, 279, 1, 1),
(882, 'pier', 's tiron oral 20 ml', 10, 34.01666667, 78.5, 39.25, 1, 1),
(883, 'pier', 'sulfato de cobre 250 g', 10, 95.55, 220.5, 110.25, 1, 1),
(884, 'pier', 'ivermectin pour on  7 ml', 10, 25.35, 58.5, 29.25, 1, 1),
(885, 'pisa', '3 sulfas 500 ml', 10, 180.96, 312, 212.16, 1, 1),
(886, 'pisa', '3 sulfas 100 ml', 10, 62.3, 178, 80.1, 1, 1),
(887, 'pisa', 'alnex 100 ml', 10, 80.85, 231, 103.95, 1, 1),
(888, 'pisa', 'alnex 250 ml', 10, 149.48, 404, 189.88, 1, 1),
(889, 'pisap', 'atropisa', 10, 49.72, 113, 61.02, 1, 1),
(890, 'pisap', 'antivon 20 ml', 10, 229.36, 488, 278.16, 1, 1),
(891, 'pisap', 'amoxiclav tabs', 10, 224.91, 459, 270.81, 1, 1),
(892, 'pisap', 'amoxiclav suspension', 10, 103.4, 220, 125.4, 1, 1),
(893, 'pisa', 'actynoxel 250 ml', 10, 233.92, 544, 288.32, 1, 1),
(894, 'pisa', 'amx 100 ml', 10, 220.35, 565, 276.85, 1, 1),
(895, 'pisa', 'basety 250 ml', 10, 413.1, 810, 494.1, 1, 1),
(896, 'pisa', 'basetyl max 100 ml', 10, 397.41, 1019, 499.31, 1, 1),
(897, 'pisa', 'basetyl max 250ml ', 10, 845.42, 2062, 1051.62, 1, 1),
(898, 'pisa', 'beplenovax', 10, 130.56, 384, 168.96, 1, 1),
(899, 'pisap', 'calciosol pastilla', 10, 126, 315, 157.5, 1, 1),
(900, 'pisa', 'calciosol 100', 10, 97.44, 203, 117.74, 1, 1),
(901, 'pisa', 'carosen sobre', 10, 74.568, 155.35, 90.103, 1, 1),
(902, 'pisap', 'clindapis 150mg 20tb', 10, 111.72, 294, 141.12, 1, 1),
(903, 'pisap', 'complenay elixir 120 ml', 10, 59.216, 148.04, 74.02, 1, 1),
(904, 'pisa', 'complenay elixir 3,5 lts', 10, 774.06, 1843, 958.36, 1, 1),
(905, 'pisa', 'coccitrak 250 ml', 10, 550.62, 1311, 681.72, 1, 1),
(906, 'pisap', 'darbazin jer', 10, 123.2, 280, 151.2, 1, 1),
(907, 'pisap', 'docarpina 25 mg', 10, 395.24, 964, 491.64, 1, 1),
(908, 'pisap', 'docarpina 50 mg', 10, 541.8, 1290, 670.8, 1, 1),
(909, 'pisap', 'docarpina 100 mg', 10, 824.8, 2062, 1031, 1, 1),
(910, 'pisap', 'donexet 100 tab', 10, 447.37, 913, 538.67, 1, 1),
(911, 'pisap', 'espiranide', 10, 104.682, 219, 126.582, 1, 1),
(912, 'pisap', 'ectosin equus simple', 10, 79.9, 170, 96.9, 1, 1),
(913, 'pisap', 'ectosin litro', 10, 867.6, 2410, 1108.6, 1, 1),
(914, 'pisap', 'electrodex dogs', 10, 18.9, 30, 21.9, 1, 1),
(915, 'pisa', 'electrodex pediatrico', 10, 53, 106, 63.6, 1, 1),
(916, 'pisa', 'electrodex pvo 10 kgs', 10, 192.654, 458.7, 238.524, 1, 1),
(917, 'pisap', 'equiprazol pasta ', 10, 1116.84, 2724, 1389.24, 1, 1),
(918, 'pisa', 'ectosin litro', 10, 891.7, 2410, 1132.7, 1, 1),
(919, 'pisa', 'ferriton 100 ml', 10, 85.602, 285.34, 114.136, 1, 1),
(920, 'pisa', 'floxacine 100 ', 10, 635.44, 1222, 757.64, 1, 1),
(921, 'pisa', 'fosfodica lt', 10, 466.48, 1372, 603.68, 1, 1),
(922, 'pisa', 'fureal ', 10, 791.95, 1685, 960.45, 1, 1),
(923, 'pisap', 'furacin 453 gr', 10, 265.66, 718, 337.46, 1, 1),
(924, 'pisap', 'furacin pom 85 g', 10, 102.4, 256, 128, 1, 1),
(925, 'pisa', 'furacin 500 ml', 10, 176, 400, 216, 1, 1),
(926, 'pisap', 'iron hourse', 10, 170.5, 341, 204.6, 1, 1),
(927, 'pisa', 'gentalex 250 ml', 10, 369.38, 803, 449.68, 1, 1),
(928, 'pisa', 'gentaerba 100 ml', 10, 178.15, 509, 229.05, 1, 1),
(929, 'pisa', 'gentalex 250 ml', 10, 369.38, 803, 449.68, 1, 1),
(930, 'pisa', 'gentaerba soluble sobre', 10, 332.29, 707, 402.99, 1, 1),
(931, 'pisa', 'fureal ', 10, 15.839, 33.7, 19.209, 1, 1),
(932, 'pisa', 'horprogest', 10, 69.66, 162, 85.86, 1, 1),
(933, 'pisa', 'indupar ', 10, 173.88, 414, 215.28, 1, 1),
(934, 'pisap', 'hialuvisc ', 10, 622.16, 1414, 763.56, 1, 1),
(935, 'pisap', 'mass performance eq', 10, 274.1275, 583.25, 332.4525, 1, 1),
(936, 'pisap', 'mass performance yeg', 10, 313.49, 667, 380.19, 1, 1),
(937, 'pisap', 'napzin 10 ml', 10, 54.56, 124, 66.96, 1, 1),
(938, 'pisap', 'napzin 50 ml', 10, 126.36, 324, 158.76, 1, 1),
(939, 'pisa', 'napzin 100 ml', 10, 178.71, 483, 227.01, 1, 1),
(940, 'pisa', 'napzin 250 ml', 10, 281.82, 854, 367.22, 1, 1),
(941, 'pisap ', 'imation ', 10, 108.78, 259, 134.68, 1, 1),
(942, 'pisa', 'nf 180 aves', 10, 22.3692, 53.26, 27.6952, 1, 1),
(943, 'pisa', 'nf 180 terneros ', 10, 36.0135, 67.95, 42.8085, 1, 1),
(944, 'pisa', 'nf 180 2 litros', 10, 972.8, 2432, 1216, 1, 1),
(945, 'pisa', 'oxitopisa  100 ml ', 10, 69.48, 193, 88.78, 1, 1),
(946, 'pisa', 'oxitopisa  250 ml', 10, 103.97, 281, 132.07, 1, 1),
(947, 'pisa', 'pendiben', 10, 291.84, 608, 352.64, 1, 1),
(948, 'pisap', 'otrozol 100 ml', 10, 41.04, 76, 48.64, 1, 1),
(949, 'pisap', 'pet shine barra jabon', 10, 43.99, 83, 52.29, 1, 1),
(950, 'pisap', 'pentren 10 ml', 10, 58.5, 150, 73.5, 1, 1),
(951, 'pisap', 'piroflox 150 mg tabs', 10, 154.56, 276, 182.16, 1, 1),
(952, 'pisap', 'piroflox 50 mg tabs', 10, 72.93, 187, 91.63, 1, 1),
(953, 'pisap', 'pisaliv ', 10, 65.66, 134, 79.06, 1, 1),
(954, 'pisap', 'pisacaina', 10, 58.31, 119, 70.21, 1, 1),
(955, 'pisap', 'pisacaina con epinefrina', 10, 65.33, 139, 79.23, 1, 1),
(956, 'pisap', 'pisadol oral 10 ml', 10, 125.02, 266, 151.62, 1, 1),
(957, 'pisap', 'pisadol iny 20 ml', 10, 114.4, 260, 140.4, 1, 1),
(958, 'pisap', 'pisadol iny 50 ml', 10, 248.4, 540, 302.4, 1, 1),
(959, 'pisap', 'pramotil', 10, 107.16, 282, 135.36, 1, 1),
(960, 'pisap', 'prantel toy 20 tabs', 10, 4.085, 10.75, 5.16, 1, 1),
(961, 'pisap', 'prantel plus 20 tabs', 10, 12.521, 32.95, 15.816, 1, 1),
(962, 'pisap', 'prantel plus perro gde 20 tabs', 10, 19.22, 48.05, 24.025, 1, 1),
(963, 'pisap', 'prantel susp 150 ml', 10, 162.38, 353, 197.68, 1, 1),
(964, 'pisap', 'prantel susp20 ml', 10, 106.33, 217, 128.03, 1, 1),
(965, 'pisa', 'piroflox 250 ml', 10, 191.78, 446, 236.38, 1, 1),
(966, 'pisa', 'procin 2 % 25 ml', 10, 196.18, 577, 253.88, 1, 1),
(967, 'pisap', 'procin equus  10 % 50 ml', 10, 341.88, 777, 419.58, 1, 1),
(968, 'pisa', 'racmina premix kg ', 10, 967.2, 2418, 1209, 1, 1),
(969, 'pisa', 'relina', 10, 591.6, 1479, 739.5, 1, 1),
(970, 'pisap', 'ranulin  iny 50 ml', 10, 88.04, 142, 102.24, 1, 1),
(971, 'pisap', 'reddy', 10, 92.02, 214, 113.42, 1, 1),
(972, 'pisap', 'otrozol 100 ml', 10, 40.28, 76, 47.88, 1, 1),
(973, 'pisa', 'selectur ', 10, 731.64, 1742, 905.84, 1, 1),
(974, 'pisa', 'sebaciclina 500 ml', 10, 236.5, 473, 283.8, 1, 1),
(975, 'pisa', 'sinataq 100 ml', 10, 101.25, 225, 123.75, 1, 1),
(976, 'pisa', 'sinataq litro', 10, 434.73, 1011, 535.83, 1, 1),
(977, 'pisap', 'soldrin clean 125 ml', 10, 84.77, 173, 102.07, 1, 1),
(978, 'pisap', 'soldrin oftalmico sol 10 ml', 10, 44.604, 126, 57.204, 1, 1),
(979, 'pisa', 'solucion salina', 10, 27.6, 60, 33.6, 1, 1),
(980, 'pisa', 'solucion dx', 10, 27.9, 62, 34.1, 1, 1),
(981, 'pisa', 'solucion ht litro', 10, 26.5, 53, 31.8, 1, 1),
(982, 'pisa', 'solucion ht 2.5 litro', 10, 110.7, 246, 135.3, 1, 1),
(983, 'pisap', 'stop on 60 ml', 10, 33.345, 74.1, 40.755, 1, 1),
(984, 'pisa', 'stop on 250 ml', 10, 76.4957, 181.7, 94.6657, 1, 1),
(985, 'pisa', 'tilmi', 10, 590.46, 1514, 741.86, 1, 1),
(986, 'pisa', 'th4 25 lt', 10, 7418.375, 17455, 9163.875, 1, 1),
(987, 'pisap', 'topazone 250 ml', 10, 92.943, 207, 113.643, 1, 1),
(988, 'pisa', 'topazone 400 ml', 10, 124.23, 303, 154.53, 1, 1),
(989, 'pisa', 'totenfli 1 kg', 10, 912.74, 1942, 1106.94, 1, 1),
(990, 'pisa', 'valsyn', 10, 11.5412, 26.84, 14.2252, 1, 1),
(991, 'pisa', 'valsyn kg ', 10, 624.68, 1358, 760.48, 1, 1),
(992, 'pisa', 'vitabecid 100 ml', 10, 229.775, 505, 280.275, 1, 1),
(993, 'pisa', 'vitabecid 250 ml', 10, 431.29, 1003, 531.59, 1, 1),
(994, 'pisa', 'vodexat 50 ml', 10, 87.2, 218, 109, 1, 1),
(995, 'pisa', 'enercol ', 10, 67.488, 152, 82.688, 1, 1),
(996, 'promo vet', 'ergopar', 10, 23.1, 70, 30.1, 1, 1),
(997, 'promo vet', 'suprim 100 ml', 10, 125.4, 380, 163.4, 1, 1),
(998, 'promo vet', 'probiorin', 10, 47.85, 145, 62.35, 1, 1),
(999, 'promovet', 'sincronol 250   2 ml', 10, 19.8, 33, 23.1, 1, 1),
(1000, 'prositter', 'dextrotier 50%', 10, 26.5, 53, 30.91666667, 1, 1),
(1001, 'quimica farvet', 'ade farvet 20 ml', 10, 45.6, 76, 53.2, 1, 1),
(1002, 'quimica farvet', 'oleovet enzimatico 100 ml', 10, 88.8, 148, 103.6, 1, 1),
(1003, 'riverfarma', 'bronquivet nf ', 10, 134.5, 269, 161.4, 1, 1),
(1004, 'riverfarma', 'dolo vet oftalmico ', 10, 48.248, 130.4, 61.288, 1, 1),
(1005, 'riverfarma', 'electrolictos 100 gt', 10, 34.408, 78.2, 42.228, 1, 1),
(1006, 'riverfarma', 'electrolictos 5 gr', 10, 4.664, 10.6, 5.724, 1, 1),
(1007, 'riverfarma', 'endovet ces int 10 ml', 10, 54.74, 161, 70.84, 1, 1),
(1008, 'riverfarma', 'endovet ces 100 ml', 10, 223.41, 677, 291.11, 1, 1),
(1009, 'riverfarma', 'endovet crema', 10, 73.63, 199, 93.53, 1, 1),
(1010, 'riverfarma', 'endovet gallos', 10, 11.952, 29.88, 14.94, 1, 1),
(1011, 'riverfarma', 'endovet iny 10 ml', 10, 25.2, 63, 31.5, 1, 1),
(1012, 'riverfarma', 'endovet polivitam 10 ml', 10, 74.8, 187, 93.5, 1, 1),
(1013, 'riverfarma', 'endovet polivitam 50 ml', 10, 317.03, 647, 381.73, 1, 1),
(1014, 'riverfarma', 'endovet polivitam 100 ml', 10, 516.12, 1122, 628.32, 1, 1),
(1015, 'riverfarma', 'endovet polivitam 250 ml', 10, 1136.2, 2470, 1383.2, 1, 1),
(1016, 'riverfarma', 'galliforte ', 10, 101.66, 221, 123.76, 1, 1),
(1017, 'riverfarma', 'imidofin 10 ml', 10, 77.55, 235, 101.05, 1, 1),
(1018, 'riverfarma', 'imidofin 100 ml', 10, 494.67, 1499, 644.57, 1, 1),
(1019, 'riverlab', 'vitamina b 12 5 500 codigo rojo 10 ml', 10, 105, 210, 126, 1, 1),
(1020, 'riverlab', 'vitamina b 12 5 500 codigo rojo 50 ml', 10, 210, 420, 252, 1, 1),
(1021, 'riverlab', 'vitamina b 12 5 500 codigo rojo 100 ml', 10, 345, 690, 414, 1, 1),
(1022, 'salud y bienestar', 'dianabol 100 ml', 10, 343.8, 573, 401.1, 1, 1),
(1023, 'sanfer', 'daimento b 20 100 ml', 10, 210, 420, 252, 1, 1),
(1024, 'sanfer', 'daimento b 20 25 ml', 10, 65, 130, 78, 1, 1),
(1025, 'sanfer', 'daimento b 20 T 100 ML', 10, 440, 880, 528, 1, 1),
(1026, 'sanfer', 'daimento b 20 T 25 ML', 10, 120, 240, 144, 1, 1),
(1027, 'sanfer', 'daimetropin sobres', 10, 13.2, 26.4, 15.84, 1, 1),
(1028, 'sanfer', 'daimetropin litro', 10, 302, 604, 362.4, 1, 1),
(1029, 'sanfer', 'diagmastin  litro', 10, 95, 190, 114, 1, 1),
(1030, 'sanfer', 'diarrefin  240 ml', 10, 130, 260, 156, 1, 1),
(1031, 'sanfer', 'diarrefin 60 ml', 10, 50, 100, 60, 1, 1),
(1032, 'sanfer', 'diarrefin120 ml', 10, 80, 160, 96, 1, 1),
(1033, 'sanfer', 'diarrefin litro', 10, 165, 330, 198, 1, 1),
(1034, 'sanfer', 'electroidi polvo', 10, 1390, 2780, 1668, 1, 1),
(1035, 'sanfer', 'flunixim iny 100', 10, 190, 380, 228, 1, 1),
(1036, 'sanfer', 'd  cloprostenol iny', 10, 155, 310, 186, 1, 1),
(1037, 'sanfer', 'enrofloxacina 10 % 100 ml sanfer', 10, 115, 230, 138, 1, 1),
(1038, 'sanfer', 'enrofloxacina 10 % 250 ml sanfer', 10, 165, 330, 198, 1, 1),
(1039, 'sanfer', 'gnrh iny 50 ml', 10, 335, 670, 402, 1, 1),
(1040, 'sanfer', 'ivermectina gel', 10, 71, 142, 85.2, 1, 1),
(1041, 'sanfer', 'ivermectina 1% 50 ml sanfer', 10, 70, 140, 84, 1, 1),
(1042, 'sanfer', 'ivermectina 1% 500 ml sanfer', 10, 300, 600, 360, 1, 1),
(1043, 'sanfer', 'inmunoidi', 10, 390, 780, 468, 1, 1),
(1044, 'sanfer', 'helmicin 12 100 ml', 10, 78, 156, 93.6, 1, 1),
(1045, 'sanfer', 'helmicin 12 500 ml', 10, 270, 540, 324, 1, 1),
(1046, 'sanfer', 'mastivac 100 ml', 10, 645, 1290, 774, 1, 1),
(1047, 'sanfer', 'mycogal 100 ml', 10, 560, 1120, 672, 1, 1),
(1048, 'sanfer', 'oxitetraciclina 100 ml sanfer', 10, 145, 290, 174, 1, 1),
(1049, 'sanfer', 'oxitetraciclina 500 ml sanfer', 10, 315, 630, 378, 1, 1),
(1050, 'sanfer', 'selenio + vitamina e 100 ml ', 10, 145, 290, 174, 1, 1),
(1051, 'sanfer', 'selenio + vitamina e 250 ml ', 10, 315, 630, 378, 1, 1),
(1052, 'schutze', 'fatroximin', 10, 134.55, 207, 155.25, 1, 1),
(1053, 'schutze', 'metabolase 500 ml', 10, 423.8, 652, 489, 1, 1),
(1054, 'schutze', 'hepagen 100 ml', 10, 382.2, 588, 441, 1, 1),
(1055, 'senosian', 'enroxil 10% 25 ml', 10, 45.36, 108, 56.16, 1, 1),
(1056, 'senosian', 'enroxil 10% 250 ml', 10, 187.272, 520.2, 239.292, 1, 1),
(1057, 'senosian', 'enroxil 5 % 50 ml', 10, 47.712, 113.6, 59.072, 1, 1),
(1058, 'senosian', 'enroxil 5% 20 ml', 10, 24.234, 57.7, 30.004, 1, 1),
(1059, 'senosian', 'enroxil 5% 250 ml', 10, 166.647, 427.3, 209.377, 1, 1),
(1060, 'senosian', 'enroxil l0 % litro', 10, 218, 436, 261.6, 1, 1),
(1061, 'senosian', 'enroxil 0.2 %', 10, 48.972, 116.6, 60.632, 1, 1),
(1062, 'senosian', 'respivet  2mll', 10, 43.512, 103.6, 53.872, 1, 1),
(1063, 'senosian', 'respivet  4 mll', 10, 61.572, 146.6, 76.232, 1, 1),
(1064, 'senosian', 'respivet 6 mlls', 10, 98.028, 233.4, 121.368, 1, 1),
(1065, 'senosian', 'respivet 800 ui', 10, 22.932, 54.6, 28.392, 1, 1),
(1066, 'senosian', 'reugol 100 ml', 10, 106.47, 253.5, 131.82, 1, 1),
(1067, 'senosian', 'reugol 250 ml', 10, 218.694, 520.7, 270.764, 1, 1),
(1068, 'senosian', 'reugol gel', 10, 51.996, 123.8, 64.376, 1, 1),
(1069, 'senosian', 'unirapix 20 ml', 10, 39.396, 93.8, 48.776, 1, 1),
(1070, 'senosian', 'unirapix 250 ml', 10, 256.536, 610.8, 317.616, 1, 1),
(1071, 'senosian', 'actuol LITRO', 10, 403.75, 807.5, 484.5, 1, 1),
(1072, 'senosian', 'actuol 4 %', 10, 11.92, 23.84, 14.304, 1, 1),
(1073, 'senosian', 'actuol 22 %', 10, 21.76, 43.52, 26.112, 1, 1),
(1074, 'tornel ', 'aceite germen ', 10, 45.08, 98, 54.88, 1, 1),
(1075, 'tornel ', 'antoplex 100 ml', 10, 178.48, 388, 217.28, 1, 1),
(1076, 'tornel ', 'antoplex 20 ml', 10, 81.42, 177, 99.12, 1, 1),
(1077, 'tornel ', 'antoplex 50 ml', 10, 113.16, 246, 137.76, 1, 1),
(1078, 'tornel ', 'antoplex gallos', 10, 132.94, 289, 161.84, 1, 1),
(1079, 'tornel ', 'avipen 10 ml', 10, 40.02, 87, 48.72, 1, 1),
(1080, 'tornel ', 'avipen 20 ml', 10, 54.74, 119, 66.64, 1, 1),
(1081, 'tornel ', 'avipen 50 ml', 10, 68.54, 149, 83.44, 1, 1),
(1082, 'tornel ', 'avipen 100 ml', 10, 89.7, 195, 109.2, 1, 1),
(1083, 'tornel ', 'aquavit 500', 10, 416.76, 906, 507.36, 1, 1),
(1084, 'tornel ', 'butafenil  100 ml', 10, 115.46, 251, 140.56, 1, 1),
(1085, 'tornel ', 'butafenil compuesto 100 ml', 10, 131.1, 285, 159.6, 1, 1),
(1086, 'tornel ', 'butafenil sobres', 10, 12.88, 28, 15.68, 1, 1),
(1087, 'tornel ', 'ca aminoplex  500.ml', 10, 93.84, 204, 114.24, 1, 1),
(1088, 'tornel ', 'ca aminoplex 250 ml', 10, 140.76, 306, 171.36, 1, 1),
(1089, 'tornel ', 'coccizuril 100 tab', 10, 336.26, 731, 409.36, 1, 1),
(1090, 'tornel ', 'coccizuril 50 tab', 10, 199.64, 434, 243.04, 1, 1),
(1091, 'tornel ', 'complejo b super 10 ml', 10, 43.24, 94, 52.64, 1, 1),
(1092, 'tornel ', 'complejo b super 20 ml', 10, 73.14, 159, 89.04, 1, 1),
(1093, 'tornel ', 'complejo b super 50 ml', 10, 92, 200, 112, 1, 1),
(1094, 'tornel ', 'complejo b super 100 ml', 10, 153.64, 334, 187.04, 1, 1),
(1095, 'tornel ', 'dipirona 50', 10, 97.98, 213, 119.28, 1, 1),
(1096, 'tornel ', 'endoseptine 50', 10, 65.78, 143, 80.08, 1, 1),
(1097, 'tornel ', 'equigan 10 ml', 10, 290.26, 631, 353.36, 1, 1),
(1098, 'tornel ', 'equigan 100  ml', 10, 1213.94, 2639, 1477.84, 1, 1),
(1099, 'tornel ', 'equigan 50 ml', 10, 841.34, 1829, 1024.24, 1, 1),
(1100, 'tornel ', 'equigan 250  ml', 10, 2600.38, 5653, 3165.68, 1, 1),
(1101, 'tornel ', 'espectodoyol sobre', 10, 40.94, 89, 49.84, 1, 1),
(1102, 'tornel ', 'ferronel 200 100 ml', 10, 161, 350, 196, 1, 1),
(1103, 'tornel ', 'ferronel 20 ml', 10, 59.8, 130, 72.8, 1, 1),
(1104, 'tornel ', 'galliver 50 tabletas', 10, 171.12, 372, 208.32, 1, 1),
(1105, 'tornel ', 'galliver 100 tabletas', 10, 268.64, 584, 327.04, 1, 1),
(1106, 'tornel ', 'gentomicyn super 10 ml', 10, 241.5, 86, 294, 1, 1),
(1107, 'tornel ', 'gentomicyn super 100 ml', 10, 158.7, 345, 193.2, 1, 1),
(1108, 'tornel ', 'hidropen 100 ml', 10, 325.22, 707, 395.92, 1, 1),
(1109, 'tornel ', 'hidropen 250 ml', 10, 499.56, 1086, 608.16, 1, 1),
(1110, 'tornel ', 'k ton 12 100 ml', 10, 242.88, 528, 295.68, 1, 1),
(1111, 'tornel ', 'korin tripe 10 gr', 10, 21.16, 46, 25.76, 1, 1),
(1112, 'tornel ', 'korin tripe 100 gr', 10, 108.1, 235, 131.6, 1, 1),
(1113, 'tornel ', 'leticina 100 ml', 10, 89.7, 195, 109.2, 1, 1),
(1114, 'tornel ', 'leptos 10 20 ml', 10, 172.96, 376, 210.56, 1, 1),
(1115, 'tornel ', 'leptos 10 100 ml', 10, 663.32, 1442, 807.52, 1, 1),
(1116, 'tornel ', 'ojosan', 10, 35.88, 78, 43.68, 1, 1),
(1117, 'tornel ', 'meta flusol 30 ml', 10, 138.46, 301, 168.56, 1, 1),
(1118, 'tornel ', 'meta flusol 50 ml', 10, 261.28, 568, 318.08, 1, 1),
(1119, 'tornel ', 'metrosulfa 100', 10, 344.08, 748, 418.88, 1, 1),
(1120, 'tornel ', 'pangamine 250 10 ml', 10, 70.38, 153, 85.68, 1, 1),
(1121, 'tornel ', 'pangamine 250 30 ml', 10, 112.7, 245, 137.2, 1, 1),
(1122, 'tornel ', 'penicilina g procainica 100 ml tornel', 10, 202.4, 440, 246.4, 1, 1),
(1123, 'tornel ', 'peristalti na', 10, 246.1, 535, 299.6, 1, 1),
(1124, 'tornel ', 'probioticos248', 10, 114.08, 248, 138.88, 1, 1),
(1125, 'tornel ', 'rb 51 10 ds becerraa', 10, 154.56, 336, 188.16, 1, 1),
(1126, 'tornel ', 'rb 51 10 ds vacas', 10, 146.74, 319, 178.64, 1, 1),
(1127, 'tornel ', 'sarna sana', 10, 57.5, 125, 70, 1, 1),
(1128, 'tornel ', 'super amin toplex', 10, 178.48, 388, 217.28, 1, 1),
(1129, 'tornel ', 'super flumi strep  6 mll', 10, 132.94, 289, 161.84, 1, 1),
(1130, 'tornel ', 'super flumi strep 1 mlls', 10, 69.92, 152, 85.12, 1, 1),
(1131, 'tornel ', 'super flumi strep 2 mlls', 10, 87.4, 190, 106.4, 1, 1),
(1132, 'tornel ', 'super flumi strep 4 mll', 10, 104.42, 227, 127.12, 1, 1),
(1133, 'tornel ', 'super perfomance l 10 ml', 10, 68.54, 149, 83.44, 1, 1),
(1134, 'tornel ', 'super perfomance l 50 ml', 10, 228.16, 496, 277.76, 1, 1),
(1135, 'tornel ', 'super perfomance l 100 ml', 10, 368, 800, 448, 1, 1),
(1136, 'tornel ', 'super vit. B 12 100 ml caba', 10, 655.04, 1424, 797.44, 1, 1),
(1137, 'tornel ', 'super vit. B 12 100 ml gallos', 10, 670.22, 1457, 815.92, 1, 1),
(1138, 'tornel ', 'super vit. B 12 30 ml gallo', 10, 284.28, 618, 346.08, 1, 1),
(1139, 'tornel ', 'super vit. B 12 30 mlcaba', 10, 293.48, 638, 357.28, 1, 1),
(1140, 'tornel ', 'super vit. B 12 5 ml gallos', 10, 119.6, 260, 145.6, 1, 1),
(1141, 'tornel ', 'sure shot gallos 20 tab', 10, 162.84, 354, 198.24, 1, 1),
(1142, 'tornel ', 'sure shot gallos 50 tab', 10, 325.68, 708, 396.48, 1, 1),
(1143, 'tornel ', 'top b 15 + 3 30 ml', 10, 372.14, 809, 453.04, 1, 1),
(1144, 'tornel ', 'top b 15 + 3 10 ml', 10, 155.48, 338, 189.28, 1, 1),
(1145, 'tornel ', 'urolix 10 ml', 10, 92.46, 201, 112.56, 1, 1),
(1146, 'tornel ', 'urolix 50 ml', 10, 180.32, 392, 219.52, 1, 1),
(1147, 'tornel ', 'urolix 100 ml', 10, 216.66, 471, 263.76, 1, 1),
(1148, 'varios', 'dagger 100 gms', 10, 26.55, 59, 32.45, 1, 1),
(1149, 'vedi', 'anamastil 100 ml', 10, 117.312, 282, 145.512, 1, 1),
(1150, 'vedi', 'anamastil jer ', 10, 882.336, 2121, 1094.436, 1, 1),
(1151, 'vedi', 'anamastil 500 ml', 10, 393.952, 947, 488.652, 1, 1),
(1152, 'vedi', 'antidiarreico vedi sobre', 10, 567.424, 1364, 703.824, 1, 1),
(1153, 'vedi', 'caballo poder ', 10, 88.192, 212, 109.392, 1, 1),
(1154, 'vedi', 'dexalong forte 10 ml', 10, 14.56, 35, 18.06, 1, 1),
(1155, 'vedi', 'dexalong forte 100 ml', 10, 116.896, 281, 144.996, 1, 1),
(1156, 'vedi', 'emasol lt', 10, 147.264, 354, 182.664, 1, 1),
(1157, 'vedi', 'ercanol 10 ml  gotero', 10, 20.384, 49, 25.284, 1, 1),
(1158, 'vedi', 'ercanol oral 120 ml', 10, 106.08, 255, 131.58, 1, 1),
(1159, 'vedi', 'ercanol 10 ml iny', 10, 24.0448, 57.8, 29.8248, 1, 1),
(1160, 'vedi', 'ercanol 100 ml', 10, 110.656, 266, 137.256, 1, 1),
(1161, 'vedi', 'ercanol 50 ml', 10, 66.976, 161, 83.076, 1, 1),
(1162, 'vedi', 'fosfovedi 100 ml', 10, 225.472, 542, 279.672, 1, 1),
(1163, 'vedi', 'fosfovedi 250 ml', 10, 422.656, 1016, 524.256, 1, 1),
(1164, 'vedi', 'maminthol 200 grms', 10, 80.288, 193, 99.588, 1, 1),
(1165, 'vedi', 'maminthol 30 grms', 10, 23.712, 57, 29.412, 1, 1),
(1166, 'vedi', 'megluxyn 100 ml', 10, 322.4, 775, 399.9, 1, 1),
(1167, 'vedi', 'megluxyn 250 ml', 10, 775.008, 1863, 961.308, 1, 1),
(1168, 'vedi', 'ruminolax ', 10, 26.208, 63, 32.508, 1, 1),
(1169, 'vedi', 'ru vio tic sobre 20 gms', 10, 597.376, 1436, 740.976, 1, 1),
(1170, 'vedi', 'ru vio tic 125 gms', 10, 48.672, 117, 60.372, 1, 1),
(1171, 'vedi', 'ru vio tic 500 grms', 10, 136.032, 327, 168.732, 1, 1),
(1172, 'vedi', 'ru vio tic kg', 10, 849.888, 2043, 1054.188, 1, 1),
(1173, 'vedi', 'scarlet gel 100 gr', 10, 85.28, 205, 105.78, 1, 1),
(1174, 'vedi', 'scarlet sol 120 gms', 10, 104.416, 251, 129.516, 1, 1),
(1175, 'vedi', 'tetracol dex 10 ml', 10, 24.1696, 58.1, 29.9796, 1, 1),
(1176, 'vedi', 'tetracol dex 20 ml', 10, 37.8144, 90.9, 46.9044, 1, 1),
(1177, 'vedi', 'tetracol dex 100 ml', 10, 98.176, 236, 121.776, 1, 1),
(1178, 'vedi', 'tetracol dex 250 ml', 10, 174.304, 419, 216.204, 1, 1),
(1179, 'vedi', 'vezooprim 25 ml ', 10, 65.312, 157, 81.012, 1, 1),
(1180, 'vedi', 'vedivit b 12 6000 10 ml', 10, 63.648, 153, 78.948, 1, 1),
(1181, 'vedi', 'vedivit b 12 6000 50 ml', 10, 235.872, 567, 292.572, 1, 1),
(1182, 'vedi', 'vedivit b 12 6000  100 ml', 10, 379.392, 912, 470.592, 1, 1),
(1183, 'vetinova', 'respirex 50 tab', 10, 109, 218, 130.8, 1, 1),
(1184, 'vetinova', 'respirex 100 tab', 10, 180, 360, 216, 1, 1),
(1185, 'vetinova', 'respirex sobre 10 gr', 10, 16.6, 33.2, 19.92, 1, 1),
(1186, 'vetinova', 'respirex sobre 100 grms', 10, 150, 300, 180, 1, 1),
(1187, 'vetinova', 'coxifflex 100 tab', 10, 165, 330, 198, 1, 1),
(1188, 'vetinova', 'coxifflex 50 tabs', 10, 95, 190, 114, 1, 1),
(1189, 'vetinova', 'coxifflex polvo 100 grms', 10, 300, 600, 360, 1, 1),
(1190, 'vetinova', 'coxifflex sobre', 10, 32, 64, 38.4, 1, 1),
(1191, 'vetinova', 'wormex 100 tab', 10, 165, 330, 198, 1, 1),
(1192, 'vetinova', 'wormex 50 tab', 10, 90, 180, 108, 1, 1),
(1193, 'vetinova', 'wormex 500 tab', 10, 750, 1500, 900, 1, 1),
(1194, 'vetinova', 'wormex 1000 tab', 10, 1375, 2750, 1650, 1, 1),
(1195, 'vetinova', 'wormex  sobre', 10, 20.6, 41.2, 24.72, 1, 1),
(1196, 'vetinova', 'super rooster 100 tb', 10, 310, 620, 372, 1, 1),
(1197, 'vetinova', 'super rooster 50 tb', 10, 170, 340, 204, 1, 1),
(1198, 'vetinova', 'super nux 100 tabs', 10, 160, 320, 192, 1, 1),
(1199, 'vetinova', 'super nux 50 tabs', 10, 86, 172, 103.2, 1, 1),
(1200, 'vetinova', 'veti k 50  tabs', 10, 75, 150, 90, 1, 1),
(1201, 'vetinova', 'veti k 100 tabs', 10, 130, 260, 156, 1, 1),
(1202, 'vetinova', 'bleed stop', 10, 70.5, 141, 84.6, 1, 1),
(1203, 'vetinova', 'oxypower 50 tabs', 10, 115, 230, 138, 1, 1),
(1204, 'vetinova', 'oxypower 100 tabs', 10, 205, 410, 246, 1, 1),
(1205, 'vetinova', 'spray cure', 10, 64, 128, 76.8, 1, 1),
(1206, 'vetinova', 'ultra b 12  5000  100 tabs', 10, 322.5, 645, 387, 1, 1),
(1207, 'vetinova', 'ultra b 12   5000   50 tabs', 10, 175, 350, 210, 1, 1),
(1208, 'vetinova', 'turbotonic 100 tabs', 10, 157.5, 315, 189, 1, 1),
(1209, 'vetinova', 'turbotonic 50 tabs', 10, 90, 180, 108, 1, 1),
(1210, 'vetinova', 'turbotonic sobres', 10, 25, 50, 30, 1, 1),
(1211, 'vetinova', 'coruflit', 10, 63.6, 127.2, 76.32, 1, 1),
(1212, 'vetoquinol', 'aluspray', 10, 166.05, 369, 202.95, 1, 1),
(1213, 'vetoquinol', 'azodyl iva', 10, 831.24, 2309, 1062.14, 1, 1),
(1214, 'vetoquinol', 'bioestrovet ', 10, 215.6, 440, 259.6, 1, 1),
(1215, 'vetoquinol', 'calf lyte ', 10, 1278.9, 2610, 1539.9, 1, 1),
(1216, 'vetoquinol', 'calmivet 50 ml', 10, 205.38, 489, 254.28, 1, 1),
(1217, 'vetoquinol', 'calmivet pastilla', 10, 156.48, 489, 205.38, 1, 1),
(1218, 'vetoquinol', 'cimalgex 80 mg', 10, 612.125, 1475, 759.625, 1, 1),
(1219, 'vetoquinol', 'cothivet 100', 10, 213.75, 475, 261.25, 1, 1),
(1220, 'vetoquinol', 'cothivet 30', 10, 130.05, 289, 158.95, 1, 1),
(1221, 'vetoquinol', 'diurezone 50 ml', 10, 199.8, 450, 244.8, 1, 1),
(1222, 'vetoquinol', 'dogalact', 10, 232.4, 581, 290.5, 1, 1),
(1223, 'vetoquinol', 'ear cleansing salucion IVA ', 10, 53.11, 113, 64.41, 1, 1),
(1224, 'vetoquinol', 'fercobsang', 10, 140.8, 320, 172.8, 1, 1),
(1225, 'vetoquinol', 'fertiline ', 10, 449.5, 899, 539.4, 1, 1),
(1226, 'vetoquinol', 'flexadin 30 tabs', 10, 247.8, 590, 306.8, 1, 1),
(1227, 'vetoquinol', 'flexadin 90 tabs', 10, 573.59, 1399, 713.49, 1, 1),
(1228, 'vetoquinol', 'frecardyl', 10, 197.55, 439, 241.45, 1, 1),
(1229, 'vetoquinol', 'heamolytan 400 litro', 10, 0.5, 1, 0.6, 1, 1),
(1230, 'vetoquinol', 'ipaketine 300 gr IVA', 10, 407.4, 970, 504.4, 1, 1),
(1231, 'vetoquinol', 'ipaketine 60 gr  iva', 10, 133.98, 319, 165.88, 1, 1),
(1232, 'vetoquinol', 'kynoselen', 10, 243.9, 542, 298.1, 1, 1),
(1233, 'vetoquinol', 'laxotone 120.5 VA', 10, 110.88, 264, 137.28, 1, 1),
(1234, 'vetoquinol', 'megecat', 10, 94.5, 225, 117, 1, 1),
(1235, 'vetoquinol', 'nutrical  IVA', 10, 110.88, 264, 137.28, 1, 1),
(1236, 'vetoquinol', 'oribiotic 10 gr', 10, 111, 222, 133.2, 1, 1),
(1237, 'vetoquinol', 'ornipural', 10, 145.35, 323, 177.65, 1, 1),
(1238, 'vetoquinol', 'paxon  IVA', 10, 267.54, 637, 331.24, 1, 1),
(1239, 'vetoquinol', 'pen hista strep 100', 10, 270.84, 610, 331.84, 1, 1),
(1240, 'vetoquinol', 'prifinial  iny', 10, 141.75, 315, 173.25, 1, 1),
(1241, 'vetoquinol', 'prifinial  tab 70 mg ', 10, 116.85, 285, 145.35, 1, 1),
(1242, 'vetoquinol', 'propalin  100 ml ', 10, 541.38, 1289, 670.28, 1, 1),
(1243, 'vetoquinol', 'selepherol 100 ml', 10, 0.5, 1, 0.6, 1, 1),
(1244, 'vetoquinol', 'septotryl 250 ml', 10, 367.5, 750, 442.5, 1, 1),
(1245, 'vetoquinol', 'serimmunpet jeringa oral 15 ml', 10, 0.5, 1, 0.6, 1, 1),
(1246, 'vetoquinol', 'suprestral ', 10, 205.97, 479, 253.87, 1, 1),
(1247, 'vetoquinol', 'surolan 15 ml', 10, 0.5, 1, 0.6, 1, 1),
(1248, 'vetoquinol', 'theracalcium  100 ml', 10, 121, 275, 148.5, 1, 1),
(1249, 'vetoquinol', 'tolfine 50 ml', 10, 0.5, 1, 0.6, 1, 1),
(1250, 'vetoquinol', 'universal medicated shampoo', 10, 0.5, 1, 0.6, 1, 1),
(1251, 'vetoquinol', 'vetacortyl 5 ml', 10, 232.26, 553, 287.56, 1, 1),
(1252, 'virbac', 'alizin ', 10, 626.94, 1161, 743.04, 1, 1),
(1253, 'virbac', 'allergroom', 10, 164.7, 305, 195.2, 1, 1),
(1254, 'virbac', 'allermyl glyco ', 10, 226.26, 419, 268.16, 1, 1),
(1255, 'virbac', 'allerderm 2 ml', 10, 388.8, 720, 460.8, 1, 1),
(1256, 'virbac', 'allerderm 4 ml', 10, 442.8, 820, 524.8, 1, 1),
(1257, 'virbac', 'anxitane s', 10, 321.3, 595, 380.8, 1, 1),
(1258, 'virbac', 'anxitane ml', 10, 367.2, 680, 435.2, 1, 1),
(1259, 'virbac', 'aquadent 250 ml', 10, 224.1, 415, 265.6, 1, 1),
(1260, 'virbac', 'canigen puppy ', 10, 90.72, 168, 107.52, 1, 1),
(1261, 'virbac', 'canigen puppy extra', 10, 93.96, 174, 111.36, 1, 1),
(1262, 'virbac', 'canigen quintuple', 10, 94.5, 175, 112, 1, 1),
(1263, 'virbac', 'canigen cuadruple ', 10, 93.15, 172.5, 110.4, 1, 1),
(1264, 'virbac', 'canigen triple', 10, 75.6, 140, 89.6, 1, 1),
(1265, 'virbac', 'parvo clon', 10, 91.8, 170, 108.8, 1, 1),
(1266, 'virbac', 'chondroflex 525 ', 10, 515.7, 955, 611.2, 1, 1),
(1267, 'virbac', 'chondroflex 375', 10, 413.1, 765, 489.6, 1, 1),
(1268, 'virbac', 'chondroflex 225', 10, 299.7, 555, 355.2, 1, 1),
(1269, 'virbac', 'cortavance 76 ml', 10, 302.4, 560, 358.4, 1, 1),
(1270, 'virbac', 'capstar 11.4 mh', 10, 111, 185, 129.5, 1, 1),
(1271, 'virbac', 'capstar 57 mh', 10, 120, 200, 140, 1, 1),
(1272, 'virbac', 'dexoryl 10 gr', 10, 156.6, 290, 185.6, 1, 1),
(1273, 'virbac', 'dexoryl 20 gr', 10, 226.8, 420, 268.8, 1, 1),
(1274, 'virbac', 'easiotic 10 ml', 10, 267.3, 495, 316.8, 1, 1),
(1275, 'virbac', 'endogard 10', 10, 23.382, 43.3, 27.712, 1, 1),
(1276, 'virbac', 'endogard 2.5', 10, 12.825, 23.75, 15.2, 1, 1),
(1277, 'virbac', 'endogard 30', 10, 54, 100, 64, 1, 1),
(1278, 'virbac', 'effitix 1.5-4', 10, 302.4, 560, 358.4, 1, 1),
(1279, 'virbac', 'effitix 4-10', 10, 310.5, 575, 368, 1, 1),
(1280, 'virbac', 'effitix 10-20', 10, 315.36, 584, 373.76, 1, 1),
(1281, 'virbac', 'effitix 20-40', 10, 337.5, 625, 400, 1, 1),
(1282, 'virbac', 'effitix 40-60', 10, 351, 650, 416, 1, 1),
(1283, 'virbac', 'effipro gato 1-6', 10, 264.6, 490, 313.6, 1, 1),
(1284, 'virbac', 'effipro gato 6-12', 10, 267.3, 495, 316.8, 1, 1),
(1285, 'virbac', 'effipro 2-10', 10, 286.2, 530, 339.2, 1, 1),
(1286, 'virbac', 'effipro 10-20', 10, 297, 550, 352, 1, 1),
(1287, 'virbac', 'effipro 20-40', 10, 313.2, 580, 371.2, 1, 1),
(1288, 'virbac', 'effipro 40-60', 10, 326.7, 605, 387.2, 1, 1),
(1289, 'virbac', 'epi sothe', 10, 174.96, 324, 207.36, 1, 1),
(1290, 'virbac', 'epiotic  ', 10, 100.44, 186, 119.04, 1, 1),
(1291, 'virbac', 'fisio antiolor', 10, 162, 300, 192, 1, 1),
(1292, 'virbac', 'feligen', 10, 81, 150, 96, 1, 1),
(1293, 'virbac', 'feligen /rabia', 10, 109.08, 202, 129.28, 1, 1),
(1294, 'virbac', 'hexadene spherulites', 10, 168.48, 312, 199.68, 1, 1),
(1295, 'virbac', 'leucogen ', 10, 130.68, 242, 154.88, 1, 1),
(1296, 'virbac', 'ketochlor ', 10, 197.1, 365, 233.6, 1, 1),
(1297, 'virbac', 'megaderm 28 sachets', 10, 255.42, 473, 302.72, 1, 1),
(1298, 'virbac', 'milpro 12.5', 10, 207.36, 384, 245.76, 1, 1),
(1299, 'virbac', 'nutri bond perros', 10, 194.4, 360, 230.4, 1, 1),
(1300, 'virbac', 'nutri bond gatos', 10, 194.4, 360, 230.4, 1, 1),
(1301, 'virbac', 'nutri plus gel', 10, 194.4, 360, 230.4, 1, 1),
(1302, 'virbac', 'nutri plus tabs 30 tabletas', 10, 140.4, 260, 166.4, 1, 1),
(1303, 'virbac', 'nutri plus tabs 60 tabletas', 10, 214.92, 398, 254.72, 1, 1),
(1304, 'virbac', 'parvo', 10, 63.18, 117, 74.88, 1, 1),
(1305, 'virbac', 'parvoclon', 10, 94.5, 175, 112, 1, 1),
(1306, 'virbac', 'preventik collar', 10, 1058.4, 1960, 1254.4, 1, 1),
(1307, 'virbac', 'pyoben ', 10, 160.92, 298, 190.72, 1, 1),
(1308, 'virbac', 'rabigen ', 10, 36.72, 68, 43.52, 1, 1),
(1309, 'virbac', 'rilexine 300', 10, 194.4, 360, 230.4, 1, 1),
(1310, 'virbac', 'rilexine 600 ', 10, 270, 500, 320, 1, 1),
(1311, 'virbac', 'rilexine 75 mg ', 10, 124.2, 230, 147.2, 1, 1),
(1312, 'virbac', 'sanix 120 ml', 10, 110.36, 178, 128.16, 1, 1),
(1313, 'virbac', 'sanix  gel 120 ml', 10, 210.8, 340, 244.8, 1, 1),
(1314, 'virbac', 'vitaminthe 10 ml', 10, 106.92, 198, 126.72, 1, 1),
(1315, 'virbac', 'vitaminthe 25 ml', 10, 163.08, 302, 193.28, 1, 1),
(1316, 'virbac', 'zoletil 100', 10, 364.5, 675, 432, 1, 1),
(1317, 'virbac', 'zoletil 50 ', 10, 259.2, 480, 307.2, 1, 1),
(1318, 'virbac', 'virbagen omega', 10, 1447.2, 2680, 1715.2, 1, 1),
(1319, 'virbac', 'arthridine 100 ml', 10, 182, 364, 218.4, 1, 1),
(1320, 'virbac', 'arthridine 250 ml', 10, 410, 820, 492, 1, 1),
(1321, 'virbac', 'cipioactive 50 ml', 10, 270, 540, 324, 1, 1),
(1322, 'virbac', 'citius 100 ml', 10, 307.5, 615, 369, 1, 1),
(1323, 'virbac', 'citius 250 ml', 10, 734.5, 1469, 881.4, 1, 1),
(1324, 'virbac', 'clostrigen t 250 ml', 10, 453.5, 907, 544.2, 1, 1),
(1325, 'virbac', 'clostrigen t 250 ml', 10, 472, 944, 566.4, 1, 1),
(1326, 'virbac', 'curacef 100', 10, 537, 1074, 644.4, 1, 1),
(1327, 'virbac', 'curacef 250', 10, 1121.5, 2243, 1345.8, 1, 1),
(1328, 'virbac', 'estroactive 50 ml', 10, 293, 586, 351.6, 1, 1),
(1329, 'virbac', 'equimax', 10, 194, 388, 232.8, 1, 1),
(1330, 'virbac', 'fortius la 250 ml', 10, 786, 1572, 943.2, 1, 1),
(1331, 'virbac', 'fosfosan 100  ml', 10, 491, 982, 589.2, 1, 1),
(1332, 'virbac', 'fosfosan 500  ml', 10, 1466, 2932, 1759.2, 1, 1),
(1333, 'virbac', 'gonactive ', 10, 1103, 2206, 1323.6, 1, 1),
(1334, 'virbac', 'grofactor 5 kg', 10, 9209, 18418, 11050.8, 1, 1),
(1335, 'virbac', 'hepatonic 100 ml', 10, 239.5, 479, 287.4, 1, 1),
(1336, 'virbac', 'inducel ', 10, 226, 452, 271.2, 1, 1),
(1337, 'virbac', 'maxicolli', 10, 205.5, 411, 246.6, 1, 1),
(1338, 'virbac', 'maxflor 250 ml ', 10, 918.5, 1837, 1102.2, 1, 1),
(1339, 'virbac', 'phospho 20 100 ml', 10, 332, 664, 398.4, 1, 1),
(1340, 'virbac', 'phospho 20 250 ml', 10, 675, 1350, 810, 1, 1),
(1341, 'virbac', 'proton 500 100 ml', 10, 170.5, 341, 204.6, 1, 1),
(1342, 'virbac', 'potencil 100 ml ', 10, 307, 614, 368.4, 1, 1),
(1343, 'virbac', 'potencil 250 ml ', 10, 639, 1278, 766.8, 1, 1),
(1344, 'virbac', 'rilexine 150 100 ml', 10, 433, 866, 519.6, 1, 1),
(1345, 'virbac', 'rilexine 200 np', 10, 39.67, 79.34, 47.604, 1, 1),
(1346, 'virbac', 'rilexine 500', 10, 37.5, 75, 45, 1, 1),
(1347, 'virbac', 'ruminal ', 10, 21.9, 43.8, 26.28, 1, 1),
(1348, 'virbac', 'shotapen la  250 ml', 10, 690.36, 1569, 847.26, 1, 1),
(1349, 'virbac', 'shotapen la 100 ml', 10, 392, 784, 470.4, 1, 1),
(1350, 'virbac', 'shotadex la 100 ml', 10, 416.5, 833, 499.8, 1, 1),
(1351, 'virbac', 'shotapen  clasic 250 ml', 10, 400.5, 801, 480.6, 1, 1),
(1352, 'virbac', 'tetrabiocil 2 mll ', 10, 74.5, 149, 89.4, 1, 1),
(1353, 'virbac', 'tetrabiocil 4 mll ', 10, 98, 196, 117.6, 1, 1),
(1354, 'virbac', 'tetrabiocil 6 mll ', 10, 119, 238, 142.8, 1, 1),
(1355, 'virbac', 'zeralon 250 ml', 10, 1469.5, 2939, 1763.4, 1, 1),
(1356, 'virbac', 'zeralon 50 ml', 10, 353.5, 707, 424.2, 1, 1),
(1357, 'virbac', 'zeramec 250 ml', 10, 1768.5, 3537, 2122.2, 1, 1),
(1358, 'virbac', 'zeramec 50 ml', 10, 447.5, 895, 537, 1, 1),
(1359, 'virbac', 'virbagest 900 ml', 10, 3017.5, 6035, 3621, 1, 1),
(1360, 'virbac', 'veterralent  250 ml', 10, 443.5, 887, 532.2, 1, 1),
(1361, 'wittney', 'adevite 100 ml', 10, 70, 140, 84, 1, 1),
(1362, 'wittney', 'adevite 500 ml', 10, 307.5, 615, 369, 1, 1),
(1363, 'wittney', 'amino com', 10, 71, 142, 85.2, 1, 1),
(1364, 'wittney', 'C.M.F.', 10, 79, 158, 94.8, 1, 1),
(1365, 'wittney', 'magmilax', 10, 66, 132, 79.2, 1, 1),
(1366, 'wittney', 'mastisul', 10, 86, 172, 103.2, 1, 1),
(1367, 'wittney', 'pasta descornadora', 10, 42.5, 85, 51, 1, 1),
(1368, 'wittney', 'polvo optico', 10, 41, 82, 49.2, 1, 1),
(1369, 'wittney', 'vitamina b complejo 100 ml', 10, 48.5, 97, 58.2, 1, 1),
(1370, 'wittney', 'vitamina b complejo 250 ml', 10, 109.5, 219, 131.4, 1, 1),
(1371, 'zirin', 'cardiobee 15 10 ml', 10, 57.64, 131, 70.74, 1, 1),
(1372, 'zirin', 'cardiobee 15 50 ml', 10, 146.52, 333, 179.82, 1, 1),
(1373, 'zirin', 'cardiobee 15 100 ml', 10, 265.76, 604, 326.16, 1, 1),
(1374, 'zirin', 'cardiobee 15 250 ml', 10, 521.4, 1185, 639.9, 1, 1),
(1375, 'zirin', 'super vit caballo', 10, 124.96, 284, 153.36, 1, 1),
(1376, 'zirin', 'super vit caballo carnitina', 10, 138.6, 315, 170.1, 1, 1),
(1377, 'zirin', 'hierronil 100 ml', 10, 114.84, 261, 140.94, 1, 1),
(1378, 'zirin', 'hierronil 500 ml', 10, 381.04, 866, 467.64, 1, 1),
(1379, 'zirin', 'complejo b 500 ml', 10, 298.32, 678, 366.12, 1, 1),
(1380, 'zirin', 'stamin atom 100 ml', 10, 61.16, 139, 75.06, 1, 1),
(1381, 'zirin', 'super ace okasome 50 ml', 10, 99.44, 226, 122.04, 1, 1),
(1382, 'zirin', 'super ace okasome 100 ml', 10, 142.12, 323, 174.42, 1, 1),
(1383, 'zirin', 'super ace okasome 250 ml', 10, 254.76, 579, 312.66, 1, 1),
(1384, 'zirin', 'super sorbin 250 ml', 10, 103.4, 235, 126.9, 1, 1),
(1385, 'zirin', 'super sorbin litro', 10, 361.24, 821, 443.34, 1, 1),
(1386, 'zirin', 'thiamina hcl 100 ml', 10, 155.76, 354, 191.16, 1, 1),
(1387, 'zirin', 'vitamina c iny 100 ml', 10, 84.48, 192, 103.68, 1, 1),
(1388, 'zirin', 'zirin relax 500 gr', 10, 139.48, 317, 171.18, 1, 1),
(1389, 'zirin', 'zirin relax 1 kg', 10, 243.32, 553, 298.62, 1, 1),
(1390, 'zirin', 'zirin relax 2 kg', 10, 417.56, 949, 512.46, 1, 1),
(1391, 'zirin', 'zirca negro 500 ml', 10, 108.68, 247, 133.38, 1, 1),
(1392, 'zoetis', 'calmafos 500 ml', 10, 146.49, 257, 172.19, 1, 1),
(1393, 'zoetis', 'benzoato de estradiol', 10, 250.8, 440, 294.8, 1, 1),
(1394, 'zoetis', 'ovalyse ', 10, 283.86, 498, 333.66, 1, 1),
(1395, 'zoetis', 'draxxin 20 ml', 10, 520.41, 913, 611.71, 1, 1),
(1396, 'zoetis', 'draxxin 100 ml', 10, 2444.16, 4288, 2872.96, 1, 1),
(1397, 'zoetis', 'excede cab 100', 10, 1356.6, 2380, 1594.6, 1, 1),
(1398, 'zoetis', 'duphafral e + sel 250 ml', 10, 384.18, 674, 451.58, 1, 1),
(1399, 'zoetis', 'fluvicina 4 ml', 10, 87.21, 153, 102.51, 1, 1),
(1400, 'zoetis', 'fluvet 10 ml', 10, 97.47, 171, 114.57, 1, 1),
(1401, 'zoetis', 'fluvet 50 ml', 10, 200.64, 352, 235.84, 1, 1),
(1402, 'zoetis', 'cidr bovinos', 10, 1637.04, 2872, 1924.24, 1, 1),
(1403, 'zoetis', 'masstex jeringa 10 ml', 10, 285.57, 501, 335.67, 1, 1),
(1404, 'zoetis', 'mastex 100 ml', 10, 186.39, 327, 219.09, 1, 1),
(1405, 'zoetis', 'progesterona 10 ml', 10, 111.207, 195.1, 130.717, 1, 1),
(1406, 'zoetis', 'ripercol 100 ml', 10, 79.23, 139, 93.13, 1, 1),
(1407, 'zoetis', 'ripercol 500 ml', 10, 328.89, 577, 386.59, 1, 1),
(1408, 'zoetis', 'bovi shield gold fps 10 ds', 10, 268.47, 471, 315.57, 1, 1),
(1409, 'zoetis', 'bovi shield gold fps 50 ds', 10, 1071.6, 1880, 1259.6, 1, 1),
(1410, 'zoetis', 'bovi shield gold fps L5 10 ds', 10, 444.03, 779, 521.93, 1, 1),
(1411, 'zoetis', 'bovi shield gold fps L5 50 ds', 10, 1846.8, 3240, 2170.8, 1, 1),
(1412, 'zoetis', 'cattle master 4 + l 5 10 ds', 10, 554.61, 973, 651.91, 1, 1),
(1413, 'zoetis', 'cattle master 4 + l 5 25 ds', 10, 1158.24, 2032, 1361.44, 1, 1),
(1414, 'zoetis', 'cattle master goldo fpd 10 ds', 10, 530.1, 930, 623.1, 1, 1),
(1415, 'zoetis', 'cattle master goldo fpd 25 ds', 10, 1102.95, 1935, 1296.45, 1, 1),
(1416, 'zoetis', 'dectomas 50 ml', 10, 210.33, 369, 247.23, 1, 1),
(1417, 'zoetis', 'dectomas 500 ml', 10, 1455.78, 2554, 1711.18, 1, 1),
(1418, 'zoetis', 'cydectin 500', 10, 1325.25, 2325, 1557.75, 1, 1),
(1419, 'zoetis', 'synovex plus ', 10, 4381.59, 7687, 5150.29, 1, 1),
(1420, 'zoetis', 'ecp ', 10, 106.02, 186, 124.62, 1, 1),
(1421, 'zoetis', 'emicina LA 100 ml', 10, 287.85, 505, 338.35, 1, 1),
(1422, 'zoetis', 'emicina LA 250 ml', 10, 603.63, 1059, 709.53, 1, 1),
(1423, 'zoetis', 'emicina liquida 100 ml', 10, 122.55, 215, 144.05, 1, 1),
(1424, 'zoetis', 'emicina liquida 20 ml', 10, 47.31, 83, 55.61, 1, 1),
(1425, 'zoetis', 'emicina liquida 500 ml', 10, 469.11, 823, 551.41, 1, 1),
(1426, 'zoetis', 'excenel rtu', 10, 290.7, 510, 341.7, 1, 1),
(1427, 'zoetis', 'leptoferm 5', 10, 672.6, 1180, 790.6, 1, 1),
(1428, 'zoetis', 'lutalyse 30 ml', 10, 170.43, 299, 200.33, 1, 1),
(1429, 'zoetis', 'lutalyse  100 ml', 10, 902.31, 1583, 1060.61, 1, 1),
(1430, 'zoetis', 'mamisan chico', 10, 83.22, 146, 97.82, 1, 1),
(1431, 'zoetis', 'mamisan grande 200 gr.', 10, 140.22, 246, 164.82, 1, 1),
(1432, 'zoetis', 'orbenin', 10, 36.0525, 63.25, 42.3775, 1, 1),
(1433, 'zoetis', 'rimadyl 50 ml', 10, 565.44, 992, 664.64, 1, 1),
(1434, 'zoetis', 'scourguard 4 kc', 10, 453.15, 795, 532.65, 1, 1),
(1435, 'zoetis', 'terramicina  F.A 50 GR', 10, 925.68, 1624, 1088.08, 1, 1),
(1436, 'zoetis', 'terramicina  F.A 200 GR', 10, 2849.43, 4999, 3349.33, 1, 1),
(1437, 'zoetis', 'teatseal jer', 10, 33.9663, 59.59, 39.9253, 1, 1),
(1438, 'zoetis', 'tsv-2  ds', 10, 425.22, 746, 499.82, 1, 1),
(1439, 'zoetis', 'tsv-3  ds', 10, 503.31, 883, 591.61, 1, 1),
(1440, 'zoetis', 'ultrabac 7 10 ds', 10, 91.2, 160, 107.2, 1, 1),
(1441, 'zoetis', 'ultrabac 7 50 ds', 10, 308.94, 542, 363.14, 1, 1),
(1442, 'zoetis p', 'vanguard plus 5', 10, 63.176, 119.2, 75.096, 1, 1),
(1443, 'zoetis p', 'vanguard plus 5 L /cv', 10, 64.1988, 125.88, 76.7868, 1, 1),
(1444, 'zoetis p', 'vanguard plus 5/L4 cv', 10, 79.8928, 153.64, 95.2568, 1, 1),
(1445, 'zoetis p', 'vanguard plus 5/cv', 10, 70.72, 136, 84.32, 1, 1),
(1446, 'zoetis p', 'vanguard plus cpv', 10, 42.7024, 82.12, 50.9144, 1, 1),
(1447, 'zoetis p', 'vanguard pluscpv/cv', 10, 47.5488, 91.44, 56.6928, 1, 1),
(1448, 'zoetis p', 'giardia', 10, 91.872, 167.04, 108.576, 1, 1),
(1449, 'zoetis p', 'bronchi shied', 10, 42.7176, 83.76, 51.0936, 1, 1),
(1450, 'zoetis p', 'bronchicine', 10, 43.4512, 83.56, 51.8072, 1, 1),
(1451, 'zoetis p', 'fellocel', 10, 50.1432, 98.32, 59.9752, 1, 1),
(1452, 'zoetis p', 'leukocell', 10, 156.4, 312.8, 187.68, 1, 1),
(1453, 'zoetis p', 'defensor', 10, 21.67, 43.34, 26.004, 1, 1),
(1454, 'zoetis p', 'zylexis', 10, 218.7, 405, 259.2, 1, 1),
(1455, 'zoetis p', 'apoquel 3.6 100 ta', 10, 1850.7, 2985, 2149.2, 1, 1),
(1456, 'zoetis p', 'apoquel 5.4 100 t', 10, 2263, 3650, 2628, 1, 1),
(1457, 'zoetis p', 'apoquel 16 100 t', 10, 2757.76, 4448, 3202.56, 1, 1),
(1458, 'zoetis p', 'cytopoint  10', 10, 526.4, 940, 620.4, 1, 1),
(1459, 'zoetis p', 'cytopoint 20 ', 10, 776.72, 1387, 915.42, 1, 1),
(1460, 'zoetis p', 'cytopoint 30', 10, 945.45, 1719, 1117.35, 1, 1),
(1461, 'zoetis p', 'cytopoint 30', 10, 1114.85, 2027, 1317.55, 1, 1),
(1462, 'zoetis p', 'simparica 2 5', 10, 370.44, 686, 439.04, 1, 1),
(1463, 'zoetis p', 'simparica 5 10', 10, 381.24, 706, 451.84, 1, 1),
(1464, 'zoetis p', 'simparica 10 20', 10, 402.3, 745, 476.8, 1, 1),
(1465, 'zoetis p', 'simparica 20 40', 10, 426.6, 790, 505.6, 1, 1),
(1466, 'zoetis p', 'convenia 10', 10, 2855.6, 4720, 3327.6, 1, 1),
(1467, 'zoetis p', 'convenia 4', 10, 1145.52, 2064, 1351.92, 1, 1),
(1468, 'zoetis p', 'cerenia', 10, 1201.7, 1970, 1398.7, 1, 1),
(1469, 'zoetis p', 'rimadyl 25', 10, 569.25, 1035, 672.75, 1, 1),
(1470, 'zoetis p', 'rimadyl 75', 10, 805.2, 1464, 951.6, 1, 1),
(1471, 'zoetis p', 'rimadyl 100', 10, 1014.75, 1845, 1199.25, 1, 1),
(1472, 'zoetis p', 'rimadyl af 50 ml', 10, 564.3, 990, 663.3, 1, 1),
(1473, 'zoetis p', 'cerenia', 10, 1205.64, 1970, 1402.64, 1, 1),
(1474, 'zoetis p', 'zelazol', 10, 286.2, 477, 333.9, 1, 1),
(1475, 'zoetis p', 'fluvet 10 ml', 10, 97.3, 139, 111.2, 1, 1),
(1476, 'zoetis p', 'fluvet 50 ml', 10, 200.64, 352, 235.84, 1, 1),
(1477, 'zoetis p', 'tetanos toxide', 10, 1176, 2240, 1400, 1, 1),
(1478, 'zoetis p', 'fluvac inovator ehv ', 10, 2585.1, 4924, 3077.5, 1, 1),
(1479, 'zoetis p', 'fluvac inovator ', 10, 1167.6, 2224, 1390, 1, 1),
(1480, 'zoetis p', 'pneumabortk', 10, 2701.125, 5145, 3215.625, 1, 1),
(1481, 'zoetis p', 'excede', 10, 1351.28, 2413, 1592.58, 1, 1),
(1482, 'zoetis p', 'fluvicina 4 mlls', 10, 87.21, 153, 102.51, 1, 1),
(1483, 'zoetis p', 'domoso 100 ml', 10, 335.225, 583, 393.525, 1, 1),
(1484, 'zoetis p', 'equest gel', 10, 125.82, 233, 149.12, 1, 1),
(1485, 'zoetis p', 'equest pramox', 10, 158.76, 294, 188.16, 1, 1),
(1486, 'zoetis p', 'clovite 5 ', 10, 484.3, 835, 567.8, 1, 1),
(1487, 'zoetis p', 'clovite 25  lb', 10, 1239.75, 2175, 1457.25, 1, 1),
(1488, 'zoetis p', 'hippiron', 10, 3100.2, 5167, 3616.9, 1, 1),
(1489, 'zoetis p', 'duphafral', 10, 384.75, 675, 452.25, 1, 1),
(1490, 'zoetis p', 'lutalyse ', 10, 171.195, 303, 201.495, 1, 1),
(1491, 'riverfarma', 'micofin ', 10, 66.23, 179, 84.13, 1, 1),
(1492, 'riverfarma', 'polivit b12+ade 10 ml', 10, 27.6496, 62.84, 33.9336, 1, 1),
(1493, 'riverfarma', 'polivit b12+ade 50 ml', 10, 94.08, 196, 113.68, 1, 1),
(1494, 'riverfarma', 'polivit b12 +ade 100 ml', 10, 162.84, 354, 198.24, 1, 1),
(1495, 'riverfarma', 'polivit b12 +ade 250ml', 10, 313.72, 682, 381.92, 1, 1),
(1496, 'riverfarma', 'polivit b12 +ade 500 ml', 10, 583.28, 1268, 710.08, 1, 1),
(1497, 'riverfarma', 'rafoxcur 500 ml', 10, 499.61, 1063, 605.91, 1, 1),
(1498, 'riverfarma', 'sana sana gel', 10, 80.37, 171, 97.47, 1, 1),
(1499, 'riverfarma', 'sulfatrim 25 ml', 10, 74.88, 192, 94.08, 1, 1),
(1500, 'riverfarma', 'sulfatrim 100 ml', 10, 192.66, 494, 242.06, 1, 1),
(1501, 'riverfarma', 'super polivit gallos  5 ml', 10, 64.37, 157, 80.07, 1, 1),
(1502, 'riverfarma', 'super polivit gallos  50 ml', 10, 229.6, 560, 285.6, 1, 1),
(1503, 'riverfarma', 'vitamina b12 5500 100 ml', 10, 196.8, 480, 244.8, 1, 1),
(1504, 'tornel ', 'vitamina b 12 3000 100 ml', 10, 326.14, 709, 397.04, 1, 1),
(1505, 'chinoin', 'vermi horse jeringa', 10, 107, 214, 128.4, 1, 1),
(1506, 'panavet', 'closantel 5% oral 500ml', 10, 324, 648, 388.8, 1, 1),
(1507, 'panavet', 'fluxymeg 100 ml', 10, 260.5, 521, 312.6, 1, 1);
INSERT INTO `producto` (`id_Producto`, `Laboratorio`, `Nombre`, `Cantidad`, `p_Compra`, `P_CostoLista`, `PVPublicoGeneral`, `PVMedioMayoreo`, `PVMayoreo`) VALUES
(1508, 'panavet', 'multivit b 50ml', 10, 85.5, 171, 102.6, 1, 1),
(1509, 'panavet', 'ceftiopan 250ml', 10, 577.5, 1155, 693, 1, 1),
(1510, 'diprofaq', 'clavam tab', 10, 53.11, 113, 64.41, 1, 1),
(1511, 'diprofaq', 'cefaxal 60 ml', 10, 63, 126, 75.6, 1, 1),
(1512, 'diprofaq', 'clavam 60 ml', 10, 84, 168, 100.8, 1, 1),
(1513, 'diprofaq', 'diprofenif 30 ml', 10, 44.5, 89, 53.4, 1, 1),
(1514, 'diprofaq', 'amprox la 100 ml', 10, 116, 232, 139.2, 1, 1),
(1515, 'diprofaq', 'gentakiny 10 ml', 10, 42.5, 85, 51, 1, 1),
(1516, 'diprofaq', 'petskrim 40 g ', 10, 62.5, 125, 75, 1, 1),
(1517, 'diprofaq', 'petskrim 120 g ', 10, 115, 230, 138, 1, 1),
(1518, 'diprofaq', 'cefaletas 200 mg', 10, 55, 110, 66, 1, 1),
(1519, 'diprofaq', 'cefaletas 400 mg', 10, 78, 156, 93.6, 1, 1),
(1520, 'diprofaq', 'cefaletas 600 mg ', 10, 94.5, 189, 113.4, 1, 1),
(1521, 'diprofaq', 'optivan 20 ml', 10, 55, 110, 66, 1, 1),
(1522, 'kiron', 'azitrokir 200  6 tab', 10, 99.5, 199, 119.4, 1, 1),
(1523, 'kiron ', 'lagrivet sc 10 ml', 10, 55, 110, 66, 1, 1),
(1524, 'petspharma', 'amoxipet 250 30 tab', 10, 197.5, 395, 237, 1, 1),
(1525, 'petspharma', 'amoxipet 500 14 tab', 10, 143.5, 287, 172.2, 1, 1),
(1526, 'petspharma', 'clorexivet jabon', 10, 52, 104, 62.4, 1, 1);

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
  `RFC` varchar(20) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
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
-- Indices de la tabla `creditoventa`
--
ALTER TABLE `creditoventa`
  ADD PRIMARY KEY (`id_Credito`),
  ADD KEY `IX_Relationship11` (`id_Venta`),
  ADD KEY `IX_Relationship8` (`id_creditoTotal`);

--
-- Indices de la tabla `lineacredito`
--
ALTER TABLE `lineacredito`
  ADD PRIMARY KEY (`id_creditoTotal`),
  ADD KEY `IX_Relationship5` (`id_Cliente`);

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
  ADD KEY `IX_Relationship7` (`id_Credito`);

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
  MODIFY `id_Caja` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `creditoventa`
--
ALTER TABLE `creditoventa`
  MODIFY `id_Credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lineacredito`
--
ALTER TABLE `lineacredito`
  MODIFY `id_creditoTotal` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_suspendida`
--
ALTER TABLE `venta_suspendida`
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
-- Filtros para la tabla `creditoventa`
--
ALTER TABLE `creditoventa`
  ADD CONSTRAINT `Pago` FOREIGN KEY (`id_Venta`) REFERENCES `venta` (`id_Venta`),
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`id_creditoTotal`) REFERENCES `lineacredito` (`id_creditoTotal`);

--
-- Filtros para la tabla `lineacredito`
--
ALTER TABLE `lineacredito`
  ADD CONSTRAINT `Relationship5` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);

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
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`id_Credito`) REFERENCES `lineacredito` (`id_creditoTotal`);

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
  ADD CONSTRAINT `paga` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`id_Cliente`);

--
-- Filtros para la tabla `venta_suspendida`
--
ALTER TABLE `venta_suspendida`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`id_User`) REFERENCES `usuario` (`id_User`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
