-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2025 a las 05:53:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `techlogistics_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_cliente` int(11) NOT NULL,
  `Nombre_cliente` varchar(50) NOT NULL,
  `Apellido_cliente` varchar(50) NOT NULL,
  `Direccion_cliente` varchar(120) NOT NULL,
  `Telefono_cliente` varchar(15) NOT NULL,
  `Email_cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id_cliente`, `Nombre_cliente`, `Apellido_cliente`, `Direccion_cliente`, `Telefono_cliente`, `Email_cliente`) VALUES
(1, 'Juan', 'Pérez', 'Calle 123, Ciudad', '123456789', 'juan@example.com'),
(2, 'Ana', 'Gómez', 'Avenida 456, Ciudad', '987654321', 'ana@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleenvio`
--

CREATE TABLE `detalleenvio` (
  `Id_envio` int(11) NOT NULL,
  `Id_pedido` int(11) NOT NULL,
  `Id_ruta` int(11) NOT NULL,
  `Fecha_envio` date NOT NULL,
  `Estado_envio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalleenvio`
--

INSERT INTO `detalleenvio` (`Id_envio`, `Id_pedido`, `Id_ruta`, `Fecha_envio`, `Estado_envio`) VALUES
(1, 1, 1, '2025-03-28', 'En tránsito'),
(2, 2, 2, '2025-03-29', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `Id_detalle` int(11) NOT NULL,
  `Id_pedido` int(11) NOT NULL,
  `Id_producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_unidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`Id_detalle`, `Id_pedido`, `Id_producto`, `Cantidad`, `Precio_unidad`) VALUES
(1, 1, 1, 2, 15.99),
(2, 1, 2, 1, 25.50),
(3, 2, 1, 5, 15.99),
(4, 2, 3, 3, 10.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Id_pedido` int(11) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `Id_transportista` int(11) NOT NULL,
  `Fecha_pedido` date NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Id_pedido`, `Id_cliente`, `Id_transportista`, `Fecha_pedido`, `Estado`) VALUES
(1, 1, 1, '2025-03-27', 'En proceso'),
(2, 2, 2, '2025-03-28', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` int(11) NOT NULL,
  `Nombre_producto` varchar(50) NOT NULL,
  `Descripcion` varchar(1024) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_producto`, `Nombre_producto`, `Descripcion`, `Precio`, `Stock`) VALUES
(1, 'Laptop Dell XPS 13', 'Ultrabook con pantalla táctil y procesador Intel Core i7.', 1200.50, 10),
(2, 'Mouse Logitech MX Master 3', 'Mouse inalámbrico ergonómico con múltiples botones programables.', 99.99, 25),
(3, 'Monitor LG UltraGear 27\"', 'Monitor gaming de 144Hz con resolución 2K.', 350.75, 15),
(4, 'Teclado Mecánico Redragon K552', 'Teclado mecánico compacto con switches Red.', 45.50, 30),
(5, 'Disco SSD Samsung 1TB', 'Unidad de almacenamiento SSD NVMe de alto rendimiento.', 130.00, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `Id_ruta` int(11) NOT NULL,
  `Origen` varchar(50) NOT NULL,
  `Destino` varchar(50) NOT NULL,
  `Distancia` decimal(10,2) NOT NULL,
  `Tiempo_estimado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`Id_ruta`, `Origen`, `Destino`, `Distancia`, `Tiempo_estimado`) VALUES
(1, 'Lima', 'Arequipa', 1010.50, '15 horas'),
(2, 'Bogotá', 'Medellín', 416.00, '8 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientopedido`
--

CREATE TABLE `seguimientopedido` (
  `Id_seguimiento` int(11) NOT NULL,
  `Id_pedido` int(11) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Fecha_actualizacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `seguimientopedido`
--

INSERT INTO `seguimientopedido` (`Id_seguimiento`, `Id_pedido`, `Estado`, `Fecha_actualizacion`) VALUES
(1, 1, 'En tránsito', '2025-03-27 10:30:00'),
(2, 2, 'Entregado', '2025-03-28 14:45:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportista`
--

CREATE TABLE `transportista` (
  `Id_transportista` int(11) NOT NULL,
  `Nombre_transportista` varchar(45) NOT NULL,
  `Apellido_transportista` varchar(45) NOT NULL,
  `Telefono_transportista` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `transportista`
--

INSERT INTO `transportista` (`Id_transportista`, `Nombre_transportista`, `Apellido_transportista`, `Telefono_transportista`) VALUES
(1, 'Carlos', 'López', '321654987'),
(2, 'María', 'Fernández', '789123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_cliente`),
  ADD UNIQUE KEY `Unique_Email` (`Email_cliente`);

--
-- Indices de la tabla `detalleenvio`
--
ALTER TABLE `detalleenvio`
  ADD PRIMARY KEY (`Id_envio`),
  ADD KEY `fk_detalleenvio_pedido` (`Id_pedido`),
  ADD KEY `fk_detalleenvio_ruta` (`Id_ruta`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`Id_detalle`),
  ADD KEY `fk_detalle_pedido` (`Id_pedido`),
  ADD KEY `fk_detalle_producto` (`Id_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_pedido`),
  ADD KEY `fk_pedido_cliente` (`Id_cliente`),
  ADD KEY `fk_pedido_transportista` (`Id_transportista`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`Id_ruta`);

--
-- Indices de la tabla `seguimientopedido`
--
ALTER TABLE `seguimientopedido`
  ADD PRIMARY KEY (`Id_seguimiento`),
  ADD KEY `Id_pedido` (`Id_pedido`);

--
-- Indices de la tabla `transportista`
--
ALTER TABLE `transportista`
  ADD PRIMARY KEY (`Id_transportista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalleenvio`
--
ALTER TABLE `detalleenvio`
  MODIFY `Id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `Id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seguimientopedido`
--
ALTER TABLE `seguimientopedido`
  MODIFY `Id_seguimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleenvio`
--
ALTER TABLE `detalleenvio`
  ADD CONSTRAINT `fk_detalleenvio_pedido` FOREIGN KEY (`Id_pedido`) REFERENCES `pedidos` (`Id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalleenvio_ruta` FOREIGN KEY (`Id_ruta`) REFERENCES `ruta` (`Id_ruta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`Id_pedido`) REFERENCES `pedidos` (`Id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`Id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_transportista` FOREIGN KEY (`Id_transportista`) REFERENCES `transportista` (`Id_transportista`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguimientopedido`
--
ALTER TABLE `seguimientopedido`
  ADD CONSTRAINT `seguimientopedido_ibfk_1` FOREIGN KEY (`Id_pedido`) REFERENCES `pedidos` (`Id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
