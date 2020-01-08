-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2020 a las 18:42:50
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fruta`
--
CREATE DATABASE IF NOT EXISTS `fruta` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `fruta`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actualizarfruta` (IN `pa_id_fruta` INT, IN `pa_nombre_fruta` VARCHAR(50), IN `pa_id_color` INT, IN `pa_id_sabor` INT)  BEGIN
UPDATE  fruta SET id_fruta = pa_id_fruta,
					nombre_fruta = pa_nombre_fruta,
                    id_color = pa_id_color,
                    id_sabor = pa_id_sabor
WHERE
id_fruta = pa_id_fruta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_consultarfruta` ()  BEGIN
SELECT f.id_fruta, f.nombre_fruta,c.nombre_color,s.nombre_sabor
from fruta f 
inner join color c on c.id_color = f.id_color
inner join sabor s on s.id_sabor = f.id_sabor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_consultarfrutaporid` (IN `pa_id_fruta` INT)  BEGIN
SELECT * FROM fruta
WHERE
id_fruta = pa_id_fruta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_eliminarfruta` (IN `pa_id_fruta` INT)  BEGIN
DELETE FROM fruta
WHERE
id_fruta = pa_id_fruta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insertarfruta` (IN `pa_nombre_fruta` VARCHAR(50), IN `pa_id_color` INT, IN `pa_id_sabor` INT)  BEGIN
INSERT INTO fruta (nombre_fruta,id_color,id_sabor) VALUES (pa_nombre_fruta,pa_id_color,pa_id_sabor);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_color` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `nombre_color`) VALUES
(1, 'Rojo'),
(2, 'Verde'),
(3, 'amarillo'),
(4, 'anaranjado'),
(5, 'morado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruta`
--

CREATE TABLE IF NOT EXISTS `fruta` (
  `id_fruta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_fruta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `id_color` int(11) NOT NULL,
  `id_sabor` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_fruta`),
  KEY `fruta_color` (`id_color`),
  KEY `fruta_sabor` (`id_sabor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fruta`
--

INSERT INTO `fruta` (`id_fruta`, `nombre_fruta`, `id_color`, `id_sabor`, `cantidad`) VALUES
(1, 'fresa', 1, 2, 0),
(2, 'banano', 3, 3, 0),
(3, 'naranjaaa', 1, 2, 0),
(7, 'guineo', 3, 2, 0),
(10, 'zanahori', 2, 1, 0);

--
-- Disparadores `fruta`
--
DELIMITER $$
CREATE TRIGGER `trigger_actualizarfruta` AFTER UPDATE ON `fruta` FOR EACH ROW BEGIN
INSERT INTO
trigger_fruta (id_fruta_trigger,nombre_fruta_trigger,color_trigger,sabor_trigger,accion,nombre_frutav_trigger,colorv_trigger,saborv_trigger,hora_modificacion)
VALUES (new.id_fruta,new.nombre_fruta,new.id_color,new.id_sabor,'Actualizar',old.nombre_fruta,old.id_color,old.id_sabor,now());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_eliminarfruta` AFTER DELETE ON `fruta` FOR EACH ROW BEGIN
INSERT INTO
trigger_fruta(id_fruta_trigger,nombre_fruta_trigger,color_trigger,sabor_trigger,accion,hora_modificacion)
VALUES (old.id_fruta,old.nombre_fruta,old.id_color,old.id_sabor,'Eliminar',now());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_insertarfruta` AFTER INSERT ON `fruta` FOR EACH ROW BEGIN
INSERT INTO 
trigger_fruta (id_fruta_trigger,nombre_fruta_trigger,color_trigger,sabor_trigger,hora_insercion,accion)
VALUES (new.id_fruta,new.nombre_fruta,new.id_color,new.id_sabor,now(),'Insertar');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sabor`
--

CREATE TABLE IF NOT EXISTS `sabor` (
  `id_sabor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sabor` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_sabor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sabor`
--

INSERT INTO `sabor` (`id_sabor`, `nombre_sabor`) VALUES
(1, 'acido'),
(2, 'dulce'),
(3, 'simple');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fruta`
--
ALTER TABLE `fruta`
  ADD CONSTRAINT `fruta_color` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`),
  ADD CONSTRAINT `fruta_sabor` FOREIGN KEY (`id_sabor`) REFERENCES `sabor` (`id_sabor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
