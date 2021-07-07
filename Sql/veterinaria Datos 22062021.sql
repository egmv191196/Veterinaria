-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2021 a las 08:08:05
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

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_Cliente`, `Nombre`, `Direccion`, `Telefono`, `Email`, `RFC`, `Descuento`) VALUES
(1, 'Cliente general', '', 0, '', '', 0),
(2, 'Luis', '', 48949, '', '', 1),
(3, 'Juan', '', 25461, '', '', 2),
(4, 'Edgar', '', 2147483647, '', '', 2);

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

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_Proveedor`, `Nombre`, `Direccion`, `Telefono`, `Email`, `RFC`) VALUES
(1, 'Bodega del perro', 'sdadasd12312fsd asadasd dasd a', 2147483647, 'editedlook@hotmail.com', 'sadasdasdas12312'),
(2, 'sadasfa', '312312assd', 12312231, 'ssdfsdsd@dfad123.com', '312312ssdfdd');

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_User`, `Usuario`, `Password`, `Nombre`, `Puesto`, `Telefono`, `Email`) VALUES
(1, 'Edgar', '123456', 'Edgar Gabriel', 'Admin', 265189, 'saasfsaf@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
