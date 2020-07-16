-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2020 a las 04:06:02
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ev_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`) VALUES
(1, 'Santiago'),
(2, 'Lautaro'),
(3, 'Valparaiso'),
(4, '5555'),
(5, 'temuco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `division`
--

INSERT INTO `division` (`id`, `nombre`) VALUES
(1, 'Primera'),
(2, 'segunda'),
(3, 'tercera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `procedencia` varchar(100) NOT NULL,
  `id_estadio` int(11) NOT NULL,
  `id_division` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`, `procedencia`, `id_estadio`, `id_division`) VALUES
(1, 'Colo-Colo', 'Sur', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE `estadio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estadio`
--

INSERT INTO `estadio` (`id`, `nombre`, `id_ciudad`, `capacidad`) VALUES
(1, 'MUMENTAL', 1, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Sin Stock'),
(8, 'valparaiso'),
(9, 'rrrr'),
(10, 'rrrrr'),
(11, 'tttt'),
(12, 'jooo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `id_posiciom` int(11) NOT NULL,
  `s_anual` int(12) NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `nombre`, `apellido`, `f_nacimiento`, `id_posiciom`, `s_anual`, `id_equipo`) VALUES
(1, 'Ivan', 'Zamorano', '1970-01-01', 1, 500000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion`
--

CREATE TABLE `posicion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posicion`
--

INSERT INTO `posicion` (`id`, `nombre`) VALUES
(1, 'Arquero'),
(2, 'Defensa'),
(3, 'Lateraral H'),
(4, 'Lateral D'),
(5, 'Medio Campista'),
(6, '666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `descripcion`, `cantidad`, `precio`, `id_estado`) VALUES
(65734396, 'mouse', 'the best mouse ever with ruedita', 200, 6990, 1),
(6798655378, 'smartphone', 'una pera', 500, 29990, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `password`) VALUES
('1', 'edgard', 'mendez', '123456'),
('2', 'amaru', 'vergara', '654321'),
('3', 'jonas', 'pena', '1234'),
('4', 'flo', 'pena', '1234'),
('6', 'rrrr', 'rrrr', '1');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_productos` (
`codigo` bigint(20)
,`nombre` varchar(100)
,`descripcion` text
,`cantidad` int(11)
,`precio` int(11)
,`id` int(11)
,`e_nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_productos`
--
DROP TABLE IF EXISTS `v_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_productos`  AS  (select `producto`.`codigo` AS `codigo`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`cantidad` AS `cantidad`,`producto`.`precio` AS `precio`,`estado`.`id` AS `id`,`estado`.`nombre` AS `e_nombre` from (`producto` join `estado` on(`producto`.`id_estado` = `estado`.`id`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estadio` (`id_estadio`),
  ADD KEY `id_division` (`id_division`);

--
-- Indices de la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FkCiudadEstadio` (`id_ciudad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_posiciom` (`id_posiciom`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `posicion`
--
ALTER TABLE `posicion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estadio`
--
ALTER TABLE `estadio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `posicion`
--
ALTER TABLE `posicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `fkdivicion` FOREIGN KEY (`id_division`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD CONSTRAINT `FkCiudadEstadio` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `jugadror_psiocision` FOREIGN KEY (`id_posiciom`) REFERENCES `division` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
