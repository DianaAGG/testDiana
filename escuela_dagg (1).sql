-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 03:13:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_dagg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('3464', 'Construye BD', 17, 30),
('3478', 'Desarrolla AW', 17, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', NULL),
('electricidad', 'Mixto', NULL),
('logistica', 'Mixto', NULL),
('mecanica', 'Mixto', NULL),
('Programación', 'Mixto', 'Ricardo Méndez Rojas'),
('recursos humanos', 'Mixto', NULL),
('Soporte', 'Mixto', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(15) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` text NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `telefono`, `grupo`) VALUES
('20311050750497', 'Diana Alejandra', 'Godinez Garcia', 17, 'Loma bonita #2A ', '4181018940', '5PV'),
('20311050750525', 'Jose Saul', 'Rosas Garcia', 16, 'Carolina #40 ', '4181091980', '5PV'),
('20311050750650', 'Dulce Giovana', 'Caballero Hermosillo', 17, 'Tec de Monterrey #24 ', '4181084440', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`) VALUES
('20311050750497', '3464', '2025-10-22', 5, 10),
('20311050750497', '3478', '2025-10-22', 5, 9),
('20311050750525', '3464', '2025-10-22', 5, 2),
('20311050750525', '3478', '2025-10-22', 5, 3),
('20311050750650', '3464', '2025-10-22', 5, 8),
('20311050750650', '3478', '2025-10-22', 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `tutor` varchar(60) NOT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5CM', 'Matutino', 'Angel Camacho', 'Javier Torres', 'Contabilidad'),
('5CV', 'Vespertino', 'Dulce Mancilla', 'Maria Rosas', 'Contabilidad'),
('5EM', 'Matutino', 'Uriel Torres', 'Sandra Godinez', 'Electricidad'),
('5EV', 'Vespertino', 'Brayan Garcia', 'Raul Garnica', 'Electricidad'),
('5LM', 'Matutino', 'Paolo Hernandez', 'Mariano Godinez', 'Logistica'),
('5LV', 'Vespertino', 'Diana Garcia', 'Antonio Gonzalez', 'Logistica'),
('5MM', 'Matutino', 'Mayra Exiga', 'Renata Godinez', 'Mecanica'),
('5MV', 'Vespertino', 'Josue Olvera', 'Maria  Hernandez', 'Mecanica'),
('5PM', 'Matutino', 'Angel Mendez', 'Maria Godinez', 'Programacion'),
('5PV', 'vespertino', 'Dulce Alejandra', 'Silvia Carrillo', 'Programacion'),
('5RM', 'Matutino', 'Monserrat', 'Maria Torres', 'recursos humanos'),
('5RV', 'Vespertino', 'Rosa Rodriguez', 'Valeria Garcia', 'recursos humanos'),
('5SM', 'Matutino', 'Josue Lopez', 'Juan Olvera', 'Soporte'),
('5SV', 'Vespertino', 'Uriel Camacho', 'Diego Sanchez', 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `indice_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
