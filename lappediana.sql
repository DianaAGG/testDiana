-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 09:09:22
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lappediana`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codigo_de_clientes` int(26) NOT NULL,
  `nombre` varchar(36) NOT NULL,
  `hora_de_compra` varchar(10) NOT NULL,
  `crédito` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `num_telefono` varchar(15) NOT NULL,
  `nombre` varchar(38) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `sueldo` varchar(10000) NOT NULL,
  `codigo_de_productos` int(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosdepape`
--

CREATE TABLE `productosdepape` (
  `num_existencia` varchar(45) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `diseño` varchar(35) NOT NULL,
  `color` int(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_del_proveedor` varchar(60) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo_de_clientes`),
  ADD KEY `crédito` (`crédito`(767)),
  ADD KEY `crédito_2` (`crédito`(767));

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`num_telefono`),
  ADD KEY `codigo_de_productos` (`codigo_de_productos`);

--
-- Indices de la tabla `productosdepape`
--
ALTER TABLE `productosdepape`
  ADD PRIMARY KEY (`num_existencia`),
  ADD KEY `color` (`color`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_del_proveedor`),
  ADD KEY `marca` (`marca`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`codigo_de_productos`) REFERENCES `clientes` (`codigo_de_clientes`);

--
-- Filtros para la tabla `productosdepape`
--
ALTER TABLE `productosdepape`
  ADD CONSTRAINT `productosdepape_ibfk_1` FOREIGN KEY (`color`) REFERENCES `clientes` (`codigo_de_clientes`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`marca`) REFERENCES `productosdepape` (`num_existencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
