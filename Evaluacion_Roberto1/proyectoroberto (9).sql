-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2024 a las 01:36:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoroberto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenamientos`
--

CREATE TABLE `almacenamientos` (
  `idalmacenamiento` tinyint(3) UNSIGNED NOT NULL,
  `idalmacen` tinyint(3) UNSIGNED NOT NULL,
  `nomalmacenamiento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacenamientos`
--

INSERT INTO `almacenamientos` (`idalmacenamiento`, `idalmacen`, `nomalmacenamiento`) VALUES
(1, 1, 'Pasillo1A'),
(2, 1, 'Pasillo1B'),
(3, 1, 'Pasillo2A'),
(4, 1, 'Pasillo2B'),
(5, 2, 'Pasillo1A'),
(6, 2, 'Pasillo1B'),
(7, 2, 'Pasillo2A'),
(8, 2, 'Pasillo2B'),
(9, 3, 'Pasillo1A'),
(10, 3, 'Pasillo1B'),
(11, 3, 'Pasillo2A'),
(12, 3, 'Pasillo2B'),
(13, 3, 'Pasillo3A'),
(14, 3, 'Pasillo3B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `idalmacen` tinyint(3) UNSIGNED NOT NULL,
  `nomalmacen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`idalmacen`, `nomalmacen`) VALUES
(2, 'Barcelona'),
(1, 'Madrid'),
(3, 'Sevilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` tinyint(3) UNSIGNED NOT NULL,
  `nomcategoria` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nomcategoria`) VALUES
(8, 'Discos HDD'),
(7, 'Discos SSD'),
(5, 'Fuentes alimentacion'),
(3, 'Memorias Ram'),
(2, 'Placas Madre'),
(1, 'Procesadores'),
(4, 'Refrigeracion'),
(6, 'Targetas Gráficas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` mediumint(8) UNSIGNED NOT NULL,
  `nombrecliente` varchar(25) NOT NULL,
  `apellidocliente` varchar(25) NOT NULL,
  `direccion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombrecliente`, `apellidocliente`, `direccion`) VALUES
(1, 'Sofía', 'García', 'Calle Gran Vía, 123, 3ºA, Madrid'),
(2, 'Javier', 'Martínez', 'Avenida Diagonal, 456, 2ºB, Barcelona'),
(3, 'Lucía', 'Sánchez', 'Calle Mayor, 789, 1ºC, Valencia'),
(4, 'Sofía', 'López', 'Calle Recoletos, 210, 4ºB, Madrid'),
(5, 'Alejandro', 'Fernández', 'Paseo del Prado, 111, 5ºA, Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE `detallespedido` (
  `idpedido` mediumint(8) UNSIGNED NOT NULL,
  `idpieza` smallint(5) UNSIGNED NOT NULL,
  `numserie` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`idpedido`, `idpieza`, `numserie`) VALUES
(1, 1, 'MSI256985MPG'),
(2, 2, 'MSI256990MPG'),
(3, 10, 'CRS159236CX70'),
(4, 3, 'MSI256999MPG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaspago`
--

CREATE TABLE `formaspago` (
  `idformapago` tinyint(3) UNSIGNED NOT NULL,
  `nombreformapago` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formaspago`
--

INSERT INTO `formaspago` (`idformapago`, `nombreformapago`) VALUES
(1, 'Tarjeta de crédito - Visa'),
(2, 'Transferencia bancaria'),
(3, 'PayPal'),
(4, 'Bizum'),
(5, 'Bitcoin - Dirección BTC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `idimagen` int(11) NOT NULL,
  `idproducto` smallint(5) UNSIGNED NOT NULL,
  `nomimagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`idimagen`, `idproducto`, `nomimagen`) VALUES
(1, 16, 'ASUSDualGeForceRTX4060.webp'),
(12, 16, 'asusdualgeforcertx4060_1.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizaciones`
--

CREATE TABLE `localizaciones` (
  `idlocalizacion` tinyint(3) UNSIGNED NOT NULL,
  `nombrelocalizacion` varchar(30) NOT NULL,
  `idalmacenamiento` tinyint(3) UNSIGNED NOT NULL,
  `idalmacen` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `localizaciones`
--

INSERT INTO `localizaciones` (`idlocalizacion`, `nombrelocalizacion`, `idalmacenamiento`, `idalmacen`) VALUES
(1, 'Altura1', 1, 1),
(2, 'Altura2', 1, 1),
(3, 'Altura3', 1, 1),
(4, 'Altura1', 2, 1),
(5, 'Altura2', 2, 1),
(6, 'Altura3', 2, 1),
(7, 'Altura1', 3, 1),
(8, 'Altura2', 3, 1),
(9, 'Altura3', 3, 1),
(10, 'Altura1', 4, 1),
(11, 'Altura2', 4, 1),
(12, 'Altura3', 4, 1),
(13, 'Altura1', 5, 2),
(14, 'Altura2', 5, 2),
(15, 'Altura3', 5, 2),
(16, 'Altura1', 6, 2),
(17, 'Altura2', 6, 2),
(18, 'Altura3', 6, 2),
(19, 'Altura1', 7, 2),
(20, 'Altura2', 7, 2),
(21, 'Altura3', 7, 2),
(22, 'Altura1', 8, 2),
(23, 'Altura2', 8, 2),
(24, 'Altura3', 8, 2),
(25, 'Altura1', 9, 3),
(26, 'Altura2', 9, 3),
(27, 'Altura3', 9, 3),
(28, 'Altura1', 10, 3),
(29, 'Altura2', 10, 3),
(30, 'Altura3', 10, 3),
(31, 'Altura1', 11, 3),
(32, 'Altura2', 11, 3),
(33, 'Altura3', 11, 3),
(34, 'Altura1', 12, 3),
(35, 'Altura2', 12, 3),
(36, 'Altura3', 12, 3),
(37, 'Altura1', 13, 3),
(38, 'Altura2', 13, 3),
(39, 'Altura3', 13, 3),
(40, 'Altura1', 14, 3),
(41, 'Altura2', 14, 3),
(42, 'Altura3', 14, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logos`
--

CREATE TABLE `logos` (
  `idlogo` smallint(5) UNSIGNED NOT NULL,
  `nomlogo` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logos`
--

INSERT INTO `logos` (`idlogo`, `nomlogo`) VALUES
(4, 'kigston.png'),
(6, 'logoamd.png'),
(1, 'logoasus.png'),
(3, 'logocorsair.png'),
(5, 'logointel.png'),
(2, 'logomsi.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL,
  `nommarca` varchar(255) DEFAULT NULL,
  `idlogo` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idmarca`, `nommarca`, `idlogo`) VALUES
(1, 'Asus', 1),
(2, 'MSI', 2),
(3, 'Corsair', 3),
(4, 'Kigston', 4),
(5, 'Intel', 5),
(6, 'Amd', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operarios`
--

CREATE TABLE `operarios` (
  `idoperario` tinyint(3) UNSIGNED NOT NULL,
  `nombreoperario` varchar(25) NOT NULL,
  `apellidooperario` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `operarios`
--

INSERT INTO `operarios` (`idoperario`, `nombreoperario`, `apellidooperario`) VALUES
(1, 'Alberto', 'Muñoz'),
(2, 'Juan', 'Carmona'),
(3, 'Jose', 'Muñoz'),
(4, 'Juan', 'Martin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` mediumint(8) UNSIGNED NOT NULL,
  `idcliente` mediumint(8) UNSIGNED NOT NULL,
  `fechapedido` datetime NOT NULL,
  `idformapago` tinyint(3) UNSIGNED NOT NULL,
  `idpieza` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idpedido`, `idcliente`, `fechapedido`, `idformapago`, `idpieza`) VALUES
(1, 1, '2024-02-04 12:00:00', 1, 1),
(2, 1, '2024-02-04 02:00:00', 1, 2),
(3, 1, '2024-02-04 03:00:00', 1, 10),
(4, 2, '2024-02-04 03:00:00', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas`
--

CREATE TABLE `piezas` (
  `idpieza` smallint(5) UNSIGNED NOT NULL,
  `numserie` varchar(25) NOT NULL,
  `idlocalizacion` tinyint(3) UNSIGNED NOT NULL,
  `idalmacenamiento` tinyint(3) UNSIGNED NOT NULL,
  `idalmacen` tinyint(3) UNSIGNED NOT NULL,
  `idproducto` smallint(5) UNSIGNED NOT NULL,
  `preciopieza` float(7,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `piezas`
--

INSERT INTO `piezas` (`idpieza`, `numserie`, `idlocalizacion`, `idalmacenamiento`, `idalmacen`, `idproducto`, `preciopieza`) VALUES
(1, 'MSI256985MPG', 1, 1, 1, 2, 494.99),
(2, 'MSI256990MPG', 13, 5, 2, 2, 494.99),
(3, 'MSI256999MPG', 37, 13, 3, 2, 494.99),
(4, 'ASU1245789630TUF', 5, 2, 1, 3, 199.90),
(5, 'ASU3265987410TUF', 17, 6, 2, 3, 199.90),
(6, 'ASU31346798520TUF', 17, 6, 2, 3, 199.90),
(7, 'KNG1594826DDR5', 8, 3, 1, 5, 199.90),
(8, 'KNG1594249DDR5', 8, 3, 1, 5, 199.90),
(9, 'KNG1594243DDR5', 32, 11, 3, 5, 199.90),
(10, 'CRS159236CX70', 9, 3, 1, 7, 199.90),
(11, 'CRS152336CX70', 9, 3, 1, 7, 199.90),
(12, 'INT1473692580GLD', 9, 3, 1, 11, 3849.59),
(13, 'INT1473675580GLD', 9, 3, 1, 11, 3849.59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preparacionpedidos`
--

CREATE TABLE `preparacionpedidos` (
  `idpreparacionpedido` mediumint(8) UNSIGNED NOT NULL,
  `idpedido` mediumint(8) UNSIGNED NOT NULL,
  `idpieza` smallint(5) UNSIGNED NOT NULL,
  `idoperario` tinyint(3) UNSIGNED NOT NULL,
  `fechoraperparacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preparacionpedidos`
--

INSERT INTO `preparacionpedidos` (`idpreparacionpedido`, `idpedido`, `idpieza`, `idoperario`, `fechoraperparacion`) VALUES
(1, 3, 10, 4, '2024-02-04 13:30:00'),
(2, 4, 3, 4, '2024-02-04 12:10:00'),
(3, 1, 1, 2, '2024-02-04 13:45:00'),
(4, 2, 2, 1, '2024-02-04 14:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` smallint(5) UNSIGNED NOT NULL,
  `nomproducto` varchar(80) NOT NULL,
  `idcategoria` tinyint(3) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precioproducto` float(7,2) UNSIGNED NOT NULL,
  `idMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `nomproducto`, `idcategoria`, `descripcion`, `precioproducto`, `idMarca`) VALUES
(1, 'Intel Core i9-10900K 3.70 GHz', 1, 'Los nuevos procesadores Intel® Core™ de 10 generación ofrecen mejoras de rendimiento notables para conseguir una productividad mejorada y un entretenimiento impresionante, incluyendo hasta 5,3 GHz, Intel® Wi-Fi 6 (Gig+), tecnología Thunderbolt™ 3, HDR 4K,', 678.66, 5),
(2, 'MSI MPG X670E CARBON WIFI', 2, 'La serie MPG presenta un estilo único que expresa una actitud gaming con un rendimiento y estilo extraordinarios.', 494.99, 2),
(3, 'ASUS TUF GAMING B650-PLUS WIFI', 2, 'ASUS TUF GAMING B650-PLUS WIFI toma todos los elementos esenciales de los últimos procesadores de la serie AMD Ryzen 7000 y los combina con funciones listas para jugar y durabilidad comprobada.', 199.90, 1),
(4, 'Corsair Vengeance RGB DDR5 6000MHz PC5-48000 32GB 2x16GB CL36 Negra', 3, 'La memoria CORSAIR VENGEANCE RGB DDR5 ofrece rendimiento DDR5, frecuencias más altas y mayores capacidades optimizadas para placas base Intel®, mientras ilumina su PC con iluminación RGB de diez zonas dinámica y direccionable individualmente.', 107.20, 3),
(5, 'Kingston FURY Beast DDR5 5200MHz 32GB 2x16GB CL40', 3, 'La memoria FURY Beast DDR5 de Kingston aporta la última tecnología a las plataformas de juego de última generación. Al impulsar aún más la velocidad, la capacidad y la fiabilidad, la DDR5 viene con un arsenal de características mejoradas.', 114.99, 4),
(6, 'MSI MAG A650GL 650W 80 Plus Gold Modular', 5, 'La serie MAG lucha junto a los jugadores en busca del honor. Con elementos añadidos de inspiración militar en estos productos de juego, renacieron como símbolo de robustez y durabilidad.', 103.99, 2),
(7, 'Corsair CX750 750 W 80 Plus Bronze', 5, 'Las fuentes de alimentación CORSAIR CX Series cuentan con la certificación 80 PLUS Bronze y ofrecen hasta un 88 % de eficiencia operativa para reducir el calor y el consumo de energía.', 74.90, 3),
(8, 'MSI MAG CoreLiquid 240R V2 Kit de Refrigeración Líquida ARGB', 4, 'La nueva refrigeración líquida MAG CORELIQUID Series tiene todo lo que buscas, materiales de alta calidad que facilitan la disipación del calor de forma extremadamente efectiva.', 114.99, 2),
(9, 'Corsair iCUE H150i ELITE CAPELLIX XT Kit de Refrigeración Líquida 360mm Negro', 4, 'El refrigerador líquido de CPU CORSAIR iCUE H150i ELITE CAPELLIX XT ofrece una refrigeración potente y de alto rendimiento para su procesador, con ventiladores CORSAIR AF RGB ELITE, un radiador de 360 mm y LED CAPELLIX ultrabrillantes.', 213.99, 3),
(10, 'AMD Ryzen 5 5500 3.6GHz Box', 1, 'Los procesadores para juegos mejor valorados del mundo se llaman AMD Ryzen™ Serie 5000. Cuando cuentas con la arquitectura de procesadores de escritorio más avanzada del mundo para jugadores y creadores de contenido, las posibilidades son infinitas.', 97.99, 6),
(11, 'Intel Xeon Gold 6248R 3GHz/4GHz', 1, 'Con una escalabilidad de hasta 4 zócalos, los procesadores Intel Xeon Gold 6400 están optimizados para las exigentes cargas de trabajo del centro de datos principal, de la informática multinube, de las redes y del almacenamiento.', 3849.59, 5),
(12, 'ASUS ROG STRIX Z790-E GAMING WIFI II', 2, 'Desde su vibrante cubierta de E/S multicapa hasta sus pilas de refrigeración VRM, es un tema de conversación que también ofrece un rendimiento DDR5 mejorado, amplias ranuras PCIe 5.0 y el conjunto de características Q-Design.', 799.00, 1),
(13, 'ASUS TUF GAMING B650M-PLUS', 2, 'ASUS TUF GAMING B650M-PLUS toma todos los elementos esenciales de los últimos procesadores de la serie AMD Ryzen 7000 y los combina con funciones listas para jugar y durabilidad comprobada.', 191.99, 1),
(14, 'Asus TUF GAMING B550M-PLUS WIFI II', 2, 'TUF Gaming B550M-Plus WIFI II destila elementos esenciales de la última plataforma AMD y los combina con características listas para jugar y durabilidad comprobada. Diseñada con componentes de grado militar.', 140.99, 1),
(15, 'ASUS ROG MAXIMUS Z790 HERO EVA-02', 2, 'ROG continúa el proyecto EVANGELION para jugadores con un nuevo diseño de máquina centrado en EVA-02 y Asuka. La segunda colección debutó con placas base, tarjetas gráficas, estuches para juegos con portatarjetas.', 1479.20, 1),
(16, 'ASUS Dual GeForce RTX 4060 Ti OC Edition 16GB GDDR6 DLSS3', 6, 'ASUS Dual GeForce RTX™ 4060 Ti fusiona un rendimiento térmico dinámico con una amplia compatibilidad. Las soluciones de refrigeración avanzadas de las tarjetas gráficas emblemáticas, incluidos dos ventiladores Axial-tech para maximizar el flujo de aire.', 509.00, 1),
(17, 'MSI GeForce RTX 4060 VENTUS 2X BLACK OC 8GB GDDR6 DLSS3', 6, 'VENTUS brinda una experiencia fundamentalmente sólida a los usuarios que buscan una tarjeta gráfica de alto rendimiento. Un diseño actualizado de aspecto nítido con TORX FAN 4.0 permite que VENTUS realice cualquier tarea.', 319.90, 2),
(18, 'MSI MPG B550 GAMING PLUS ', 2, 'La serie MPG saca lo mejor de los jugadores al permitir una expresión completa en color con control avanzado de iluminación RGB y sincronización. Experimente en otro nivel de personalización con una tira de LED frontal que proporciona notificaciones conve', 132.90, 2),
(21, 'MSI PRO Z790-A MAX WIFI', 2, 'PRO Z790-A MAX WIFI ofrece un diseño simple con una armoniosa combinación de colores plateados que combina perfectamente con las PC blancas y negras. Está diseñado con muchas características exclusivas de MSI.', 272.99, 2),
(22, 'MSI GeForce RTX 4080 SUPER VENTUS 3X OC 16GB GDDR6X DLSS3', 6, 'Para juegos ultrarrealistas, ultrafluidos y ultrainmersivos, la tarjeta gráfica MSI GeForce RTX 4080 SUPER 16G VENTUS 3X OC pone a tu disposición las tecnologías más avanzadas para que puedas jugar en las mejores condiciones posibles.', 1149.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisionpedido`
--

CREATE TABLE `revisionpedido` (
  `idpedido` mediumint(8) UNSIGNED NOT NULL,
  `idrevisor` tinyint(3) UNSIGNED NOT NULL,
  `fecrevision` datetime NOT NULL,
  `satisfactorio` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revisionpedido`
--

INSERT INTO `revisionpedido` (`idpedido`, `idrevisor`, `fecrevision`, `satisfactorio`) VALUES
(1, 1, '2024-02-04 12:25:00', 0),
(2, 1, '2024-02-04 02:45:00', 0),
(3, 3, '2024-02-04 13:30:00', 1),
(4, 2, '2024-02-04 12:25:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisores`
--

CREATE TABLE `revisores` (
  `idrevisor` tinyint(3) UNSIGNED NOT NULL,
  `nombrerevisor` varchar(25) NOT NULL,
  `apellidorevisor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revisores`
--

INSERT INTO `revisores` (`idrevisor`, `nombrerevisor`, `apellidorevisor`) VALUES
(1, 'Carlos', 'Aranda'),
(2, 'Luis', 'Gomez'),
(3, 'Fernando', 'Muñoz'),
(4, 'Alberto', 'Muñoz');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenamientos`
--
ALTER TABLE `almacenamientos`
  ADD PRIMARY KEY (`idalmacenamiento`),
  ADD KEY `idalmacen` (`idalmacen`);

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`idalmacen`),
  ADD UNIQUE KEY `nomalmacen` (`nomalmacen`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nomcategoria` (`nomcategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`idpedido`,`idpieza`),
  ADD KEY `idpieza` (`idpieza`);

--
-- Indices de la tabla `formaspago`
--
ALTER TABLE `formaspago`
  ADD PRIMARY KEY (`idformapago`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`idimagen`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `localizaciones`
--
ALTER TABLE `localizaciones`
  ADD PRIMARY KEY (`idlocalizacion`),
  ADD UNIQUE KEY `idlocalizacion` (`idlocalizacion`),
  ADD KEY `idalmacenamiento` (`idalmacenamiento`);

--
-- Indices de la tabla `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`idlogo`),
  ADD UNIQUE KEY `nomlogo` (`nomlogo`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`idmarca`),
  ADD KEY `idlogo` (`idlogo`);

--
-- Indices de la tabla `operarios`
--
ALTER TABLE `operarios`
  ADD PRIMARY KEY (`idoperario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`),
  ADD UNIQUE KEY `idpedido` (`idpedido`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idformapago` (`idformapago`);

--
-- Indices de la tabla `piezas`
--
ALTER TABLE `piezas`
  ADD PRIMARY KEY (`idpieza`),
  ADD KEY `localizaciones` (`idlocalizacion`),
  ADD KEY `productos` (`idproducto`);

--
-- Indices de la tabla `preparacionpedidos`
--
ALTER TABLE `preparacionpedidos`
  ADD PRIMARY KEY (`idpreparacionpedido`),
  ADD KEY `idpedido` (`idpedido`),
  ADD KEY `idpieza` (`idpieza`,`idpedido`),
  ADD KEY `idoperario` (`idoperario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD UNIQUE KEY `nomproducto` (`nomproducto`),
  ADD KEY `idcategoria` (`idcategoria`),
  ADD KEY `FK_nommarca` (`idMarca`);

--
-- Indices de la tabla `revisionpedido`
--
ALTER TABLE `revisionpedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `idrevisor` (`idrevisor`);

--
-- Indices de la tabla `revisores`
--
ALTER TABLE `revisores`
  ADD PRIMARY KEY (`idrevisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenamientos`
--
ALTER TABLE `almacenamientos`
  MODIFY `idalmacenamiento` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `idalmacen` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `formaspago`
--
ALTER TABLE `formaspago`
  MODIFY `idformapago` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `idimagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `localizaciones`
--
ALTER TABLE `localizaciones`
  MODIFY `idlocalizacion` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `logos`
--
ALTER TABLE `logos`
  MODIFY `idlogo` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `operarios`
--
ALTER TABLE `operarios`
  MODIFY `idoperario` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedido` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `piezas`
--
ALTER TABLE `piezas`
  MODIFY `idpieza` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `preparacionpedidos`
--
ALTER TABLE `preparacionpedidos`
  MODIFY `idpreparacionpedido` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `revisionpedido`
--
ALTER TABLE `revisionpedido`
  MODIFY `idpedido` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `revisores`
--
ALTER TABLE `revisores`
  MODIFY `idrevisor` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenamientos`
--
ALTER TABLE `almacenamientos`
  ADD CONSTRAINT `almacenamientos_ibfk_1` FOREIGN KEY (`idalmacen`) REFERENCES `almacenes` (`idalmacen`);

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`idpieza`) REFERENCES `piezas` (`idpieza`),
  ADD CONSTRAINT `detallespedido_ibfk_2` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`idpedido`);

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `localizaciones`
--
ALTER TABLE `localizaciones`
  ADD CONSTRAINT `localizaciones_ibfk_1` FOREIGN KEY (`idalmacenamiento`) REFERENCES `almacenamientos` (`idalmacenamiento`);

--
-- Filtros para la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`idlogo`) REFERENCES `logos` (`idlogo`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idformapago`) REFERENCES `formaspago` (`idformapago`);

--
-- Filtros para la tabla `piezas`
--
ALTER TABLE `piezas`
  ADD CONSTRAINT `localizaciones` FOREIGN KEY (`idlocalizacion`) REFERENCES `localizaciones` (`idlocalizacion`),
  ADD CONSTRAINT `productos` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `preparacionpedidos`
--
ALTER TABLE `preparacionpedidos`
  ADD CONSTRAINT `preparacionpedidos_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `revisionpedido` (`idpedido`),
  ADD CONSTRAINT `preparacionpedidos_ibfk_2` FOREIGN KEY (`idpieza`,`idpedido`) REFERENCES `detallespedido` (`idpieza`, `idpedido`),
  ADD CONSTRAINT `preparacionpedidos_ibfk_3` FOREIGN KEY (`idoperario`) REFERENCES `operarios` (`idoperario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_nommarca` FOREIGN KEY (`idMarca`) REFERENCES `marcas` (`idMarca`),
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`);

--
-- Filtros para la tabla `revisionpedido`
--
ALTER TABLE `revisionpedido`
  ADD CONSTRAINT `revisionpedido_ibfk_1` FOREIGN KEY (`idrevisor`) REFERENCES `revisores` (`idrevisor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
