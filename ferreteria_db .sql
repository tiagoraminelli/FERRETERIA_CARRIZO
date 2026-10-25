-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2026 a las 14:55:45
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
-- Base de datos: `ferreteria_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-tiagoraminelli@gmail.com|127.0.0.1', 'i:2;', 1771195176),
('laravel-cache-tiagoraminelli@gmail.com|127.0.0.1:timer', 'i:1771195176;', 1771195176);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `icono` varchar(50) DEFAULT 'fa-box',
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `icono`, `activo`, `created_at`) VALUES
(1, 'Herramientas Manuales', 'Martillos, destornilladores, llaves, alicates', 'fa-wrench', 1, '2026-02-12 02:49:58'),
(2, 'Herramientas Eléctricas', 'Taladros, amoladoras, sierras eléctricas', 'fa-power-off', 1, '2026-02-12 02:49:58'),
(3, 'Electricidad', 'Cables, enchufes, llaves térmicas, cajas', 'fa-bolt', 1, '2026-02-12 02:49:58'),
(4, 'Plomería', 'Caños, conexiones, grifería, accesorios', 'fa-tint', 1, '2026-02-12 02:49:58'),
(5, 'Pinturería', 'Pinturas, pinceles, rodillos, diluyentes', 'fa-paint-brush', 1, '2026-02-12 02:49:58'),
(6, 'Construcción', 'Cemento, arena, ladrillos, bloques', 'fa-building', 1, '2026-02-12 02:49:58'),
(7, 'Tornillería y Bulonería', 'Tornillos, tuercas, arandelas, bulones', 'fa-cog', 1, '2026-02-12 02:49:58'),
(8, 'Ferretería General', 'Candados, bisagras, cerraduras, herrajes', 'fa-key', 1, '2026-02-12 02:49:58'),
(9, 'Jardín y Exterior', 'Mangueras, aspersores, herramientas de jardín', 'fa-leaf', 1, '2026-02-12 02:49:58'),
(10, 'Seguridad', 'Candados, alarmas, cámaras, elementos de protección', 'fa-shield-alt', 1, '2026-02-12 02:49:58'),
(11, 'Adhesivos y Selladores', 'Pegamentos, siliconas, cintas, selladores', 'fa-tape', 1, '2026-02-12 02:49:58'),
(12, 'Maderas y Tableros', 'Madera, MDF, melamina, terciados', 'fa-tree', 1, '2026-02-12 02:49:58'),
(13, 'Abrasivos', 'Lijas, discos de corte, piedras de amolar', 'fa-circle', 1, '2026-02-12 02:49:58'),
(14, 'Iluminación', 'Lámparas, tubos, focos, LED', 'fa-lightbulb', 1, '2026-02-12 02:49:58'),
(15, 'Climatización', 'Ventiladores, estufas, aires acondicionados', 'fa-fan', 1, '2026-02-12 02:49:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `tipo_documento` enum('DNI','CUIT','CUIL','Pasaporte') DEFAULT 'DNI',
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `saldo_cuenta_corriente` decimal(10,2) DEFAULT 0.00,
  `limite_credito` decimal(10,2) DEFAULT 0.00,
  `notas` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `tipo_documento`, `telefono`, `email`, `direccion`, `ciudad`, `provincia`, `codigo_postal`, `saldo_cuenta_corriente`, `limite_credito`, `notas`, `activo`, `created_at`, `updated_at`) VALUES
(2, 'JUANI QUIROGA', '', 'DNI', '3408672562', '', '', NULL, NULL, NULL, 0.00, 999999.00, NULL, 1, '2026-02-25 23:25:51', '2026-02-25 23:25:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_corriente_movimientos`
--

CREATE TABLE `cuenta_corriente_movimientos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo` enum('venta','pago','ajuste_debito','ajuste_credito') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `saldo_historico` decimal(10,2) NOT NULL DEFAULT 0.00,
  `referencia_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `attempted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `ip_address`, `user_agent`, `success`, `attempted_at`) VALUES
(1, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-11 23:55:45'),
(2, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-11 23:56:45'),
(3, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-11 23:58:37'),
(4, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:01:56'),
(5, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 1, '2026-02-12 00:02:32'),
(6, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 1, '2026-02-12 00:02:45'),
(7, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:04:04'),
(8, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:04:22'),
(9, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 1, '2026-02-12 00:05:35'),
(10, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:13:38'),
(11, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:13:51'),
(12, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:14:23'),
(13, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 00:16:41'),
(14, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 21:06:54'),
(15, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 21:12:20'),
(16, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 1, '2026-02-12 21:36:15'),
(17, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 1, '2026-02-12 23:31:25'),
(18, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-13 18:50:52'),
(19, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-18 17:30:04'),
(20, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-18 17:49:36'),
(21, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-18 17:50:01'),
(22, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-18 21:32:12'),
(23, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-19 14:08:49'),
(24, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-19 15:01:08'),
(25, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-20 21:23:31'),
(26, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-20 22:16:09'),
(27, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-21 21:12:28'),
(28, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-23 14:44:57'),
(29, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-24 12:11:32'),
(30, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-24 14:39:42'),
(31, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-25 12:14:58'),
(32, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-25 19:46:23'),
(33, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-26 12:49:53'),
(34, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-26 14:58:14'),
(35, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-26 23:18:24'),
(36, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-27 19:40:01'),
(37, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-02-28 22:59:19'),
(38, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-02 21:11:17'),
(39, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-03 14:46:14'),
(40, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-04 12:17:39'),
(41, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-04 19:19:39'),
(42, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-05 12:36:20'),
(43, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-05 22:44:06'),
(44, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-05 23:20:38'),
(45, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-06 19:40:07'),
(46, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-07 12:35:30'),
(47, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-07 22:00:30'),
(48, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-09 12:58:01'),
(49, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-09 19:47:47'),
(50, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-10 12:19:27'),
(51, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-10 20:30:05'),
(52, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-11 12:12:47'),
(53, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 1, '2026-03-11 20:08:42'),
(54, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-12 12:17:29'),
(55, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-12 20:10:49'),
(56, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-13 12:21:31'),
(57, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-13 19:51:31'),
(58, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-13 19:52:03'),
(59, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-14 14:33:03'),
(60, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-14 19:17:52'),
(61, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-16 12:59:04'),
(62, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-16 19:47:36'),
(63, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-17 12:00:06'),
(64, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-17 20:39:49'),
(65, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-18 12:20:52'),
(66, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-18 12:21:57'),
(67, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-18 13:01:11'),
(68, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-18 20:10:55'),
(69, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-19 12:04:01'),
(70, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-19 15:01:01'),
(71, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-20 12:04:30'),
(72, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-20 20:14:37'),
(73, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-21 13:20:29'),
(74, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-21 19:16:20'),
(75, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-23 12:03:10'),
(76, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-23 22:54:12'),
(77, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-25 14:47:02'),
(78, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-25 19:10:01'),
(79, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-26 12:14:26'),
(80, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-26 19:23:14'),
(81, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-26 21:48:02'),
(82, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-27 12:16:30'),
(83, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-27 15:03:12'),
(84, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-28 11:58:10'),
(85, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-28 15:07:38'),
(86, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-30 13:00:29'),
(87, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-31 12:26:15'),
(88, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-03-31 20:07:42'),
(89, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-01 12:29:41'),
(90, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-01 20:47:40'),
(91, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-02 12:12:23'),
(92, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-02 19:41:02'),
(93, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-02 22:41:29'),
(94, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-04 12:20:44'),
(95, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-04 19:40:13'),
(96, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-04 22:24:35'),
(97, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-06 20:11:33'),
(98, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-07 20:20:59'),
(99, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-08 12:29:05'),
(100, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-08 19:38:30'),
(101, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-09 12:24:27'),
(102, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 1, '2026-04-09 18:47:44'),
(103, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-10 19:20:27'),
(104, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-11 12:25:46'),
(105, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-11 19:39:22'),
(106, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-13 12:39:40'),
(107, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-13 19:31:20'),
(108, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-13 23:03:47'),
(109, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-14 19:08:02'),
(110, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-15 12:11:16'),
(111, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-15 19:08:26'),
(112, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-16 12:11:51'),
(113, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-16 19:07:05'),
(114, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-17 12:12:31'),
(115, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-17 19:50:37'),
(116, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-18 12:11:58'),
(117, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-18 19:43:24'),
(118, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-20 12:19:41'),
(119, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-20 19:21:01'),
(120, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-21 12:22:26'),
(121, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-21 19:20:36'),
(122, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-22 12:17:04'),
(123, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-22 19:17:32'),
(124, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-23 11:58:41'),
(125, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-23 18:58:40'),
(126, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-24 12:02:43'),
(127, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-24 19:17:55'),
(128, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-24 19:26:54'),
(129, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-25 12:16:40'),
(130, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-25 19:15:23'),
(131, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-27 12:57:44'),
(132, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-27 19:06:10'),
(133, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-28 12:42:26'),
(134, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-28 19:12:47'),
(135, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-29 12:07:17'),
(136, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-29 19:23:36'),
(137, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-30 12:17:18'),
(138, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-04-30 19:06:56'),
(139, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-01 12:01:26'),
(140, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-02 12:01:32'),
(141, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-02 14:55:18'),
(142, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-04 12:21:22'),
(143, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-04 15:02:27'),
(144, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-05 12:21:33'),
(145, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-05 19:11:06'),
(146, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-06 13:17:43'),
(147, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-06 19:34:36'),
(148, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-07 12:25:47'),
(149, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-07 12:25:48'),
(150, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 1, '2026-05-07 14:51:52'),
(151, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-08 12:00:58'),
(152, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-08 19:05:35'),
(153, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-09 12:19:05'),
(154, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-09 15:00:41'),
(155, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-11 12:32:38'),
(156, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-11 19:09:17'),
(157, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-12 12:42:45'),
(158, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-12 19:16:03'),
(159, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-13 12:09:09'),
(160, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-13 19:03:02'),
(161, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-14 12:33:49'),
(162, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-14 14:14:55'),
(163, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-14 19:59:40'),
(164, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-15 12:24:51'),
(165, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-15 19:08:15'),
(166, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-16 12:35:57'),
(167, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-16 20:12:07'),
(168, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-18 12:56:45'),
(169, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-18 14:31:38'),
(170, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-18 18:29:12'),
(171, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-18 22:29:01'),
(172, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-19 18:42:55'),
(173, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-20 12:36:05'),
(174, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-20 19:03:18'),
(175, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-21 12:48:43'),
(176, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-21 18:45:45'),
(177, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-22 12:08:56'),
(178, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-22 18:27:16'),
(179, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-23 12:21:57'),
(180, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-23 14:58:21'),
(181, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-23 22:18:59'),
(182, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-26 15:00:43'),
(183, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-27 11:57:29'),
(184, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-27 12:01:29'),
(185, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-27 18:35:25'),
(186, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-28 12:02:23'),
(187, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-28 15:01:54'),
(188, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-29 12:30:23'),
(189, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-29 15:02:01'),
(190, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-30 12:13:30'),
(191, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-30 12:13:31'),
(192, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-05-30 21:34:13'),
(193, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-01 11:57:31'),
(194, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-01 18:38:32'),
(195, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-02 12:12:55'),
(196, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-02 19:01:01'),
(197, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-02 19:51:47'),
(198, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-02 22:01:55'),
(199, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-03 12:03:53'),
(200, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-03 18:41:26'),
(201, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-04 12:09:45'),
(202, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-04 14:57:15'),
(203, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 1, '2026-06-04 18:47:05'),
(204, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-05 12:07:15'),
(205, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-05 18:57:21'),
(206, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-05 19:38:40'),
(207, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-06 11:58:05'),
(208, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-06 12:13:13'),
(209, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-06 19:39:58'),
(210, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-06 21:25:00'),
(211, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-08 12:38:13'),
(212, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-08 19:28:08'),
(213, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-08 22:25:18'),
(214, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-09 18:28:41'),
(215, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 1, '2026-06-09 22:29:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais_origen` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `pais_origen`, `descripcion`, `activo`, `created_at`) VALUES
(1, 'Bahco', 'Suecia', 'Herramientas manuales profesionales', 1, '2026-02-12 02:49:58'),
(2, 'Stanley', 'Estados Unidos', 'Herramientas y accesorios', 1, '2026-02-12 02:49:58'),
(3, 'Bosch', 'Alemania', 'Herramientas eléctricas y accesorios', 1, '2026-02-12 02:49:58'),
(4, 'DeWalt', 'Estados Unidos', 'Herramientas eléctricas profesionales', 1, '2026-02-12 02:49:58'),
(5, 'Makita', 'Japón', 'Herramientas eléctricas de alta calidad', 1, '2026-02-12 02:49:58'),
(6, 'Black+Decker', 'Estados Unidos', 'Herramientas para hogar y jardín', 1, '2026-02-12 02:49:58'),
(7, 'Einhell', 'Alemania', 'Herramientas y equipos de bricolaje', 1, '2026-02-12 02:49:58'),
(8, 'Tramontina', 'Brasil', 'Herramientas y productos para el hogar', 1, '2026-02-12 02:49:58'),
(9, 'Philips', 'Países Bajos', 'Iluminación y productos electrónicos', 1, '2026-02-12 02:49:58'),
(10, 'Osram', 'Alemania', 'Iluminación profesional', 1, '2026-02-12 02:49:58'),
(11, '3M', 'Estados Unidos', 'Adhesivos, abrasivos y protección', 1, '2026-02-12 02:49:58'),
(12, 'Sika', 'Suiza', 'Selladores y productos químicos para construcción', 1, '2026-02-12 02:49:58'),
(13, 'Fischer', 'Alemania', 'Anclajes y fijaciones', 1, '2026-02-12 02:49:58'),
(14, 'Karcher', 'Alemania', 'Limpieza y equipos de alta presión', 1, '2026-02-12 02:49:58'),
(15, 'Total Tools', 'China', 'Herramientas accesibles para múltiples usos', 1, '2026-02-12 02:49:58'),
(16, 'Pretul', 'México', 'Herramientas económicas', 1, '2026-02-12 02:49:58'),
(17, 'Ema', 'Argentina', 'Accesorios y ferretería general', 1, '2026-02-12 02:49:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_caja`
--

CREATE TABLE `movimientos_caja` (
  `id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `tipo` enum('venta','ingreso','egreso','apertura','cierre','inicial') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_caja`
--

INSERT INTO `movimientos_caja` (`id`, `turno_id`, `tipo`, `monto`, `descripcion`, `venta_id`, `usuario_id`, `fecha`, `created_at`) VALUES
(4, 5, 'venta', 950.00, 'Venta #6', 6, 1, '2026-02-25 23:26:32', '2026-02-25 23:26:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `categoria_id` int(11) DEFAULT NULL,
  `proveedor` varchar(150) DEFAULT NULL,
  `estado` enum('pendiente','comprado') DEFAULT 'pendiente',
  `visible` tinyint(1) DEFAULT 1,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `nombre`, `descripcion`, `codigo`, `cantidad`, `categoria_id`, `proveedor`, `estado`, `visible`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 'Martillo carpintero', 'Mango de fibra, 500g', 'PED-001', 10, 1, 'Distribuidora Centro', 'pendiente', 1, 'Reposición de stock', '2026-02-25 14:19:01', NULL),
(2, 'Taladro inalámbrico 18V', 'Incluye 2 baterías', 'PED-002', 3, 2, 'Bosch Mayorista', 'pendiente', 1, NULL, '2026-02-25 14:19:01', NULL),
(3, 'Cable taller 2x4', 'Rollo de 100 metros', 'PED-003', 5, 3, 'Electro Norte', 'comprado', 1, 'Urgente', '2026-02-25 14:19:01', NULL),
(4, 'Grifería monocomando', 'Para cocina, acero inoxidable', 'PED-004', 4, 4, 'Sanitarios Sur', 'pendiente', 1, NULL, '2026-02-25 14:19:01', NULL),
(5, 'Pintura látex blanco 20L', 'Interior premium', 'PED-005', 6, 5, 'Pinturería ColorMix', 'comprado', 1, NULL, '2026-02-25 14:19:01', NULL),
(6, 'Discos de corte 115mm', 'Para amoladora', 'PED-006', 50, 13, 'Abrasivos del Litoral', 'pendiente', 1, 'Alta rotación', '2026-02-25 14:19:01', NULL),
(7, 'Reflector LED 50W', 'Luz fría exterior', 'PED-007', 8, 14, 'Iluminar SRL', 'pendiente', 1, NULL, '2026-02-25 14:19:01', NULL),
(9, 'Escalera aluminio 6 escalones', 'Reforzada', 'PED-009', 3, NULL, 'Proveedor Varios', 'pendiente', 1, 'Categoría futura', '2026-02-25 14:19:01', '2026-02-25 15:54:59'),
(10, 'Kit energía solar básico', 'Panel + controlador + batería', 'PED-010', 1, NULL, 'Energía Verde SA', 'comprado', 1, 'Producto nuevo línea sustentable', '2026-02-25 14:19:01', '2026-02-25 14:44:46'),
(14, 'KIT AMOLADORA 115mm + TALADRO 13mm', 'HERRAMIENTAS PARA EL NEGOCIO', 'a1239', 1, 1, 'LUSQTOFF', 'comprado', 1, 'CUANDO LLEGUE', '2026-02-25 15:55:13', '2026-03-02 21:25:29'),
(15, 'AGUA RRAS', '750 CC', 'AGUA', 5, 5, 'DE LA CASA', 'pendiente', 1, NULL, '2026-03-02 21:28:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `codigo_barra` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `unidad_medida_id` int(11) DEFAULT 1,
  `proveedor_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_costo` decimal(10,2) DEFAULT 0.00,
  `margen_ganancia` decimal(5,2) DEFAULT 30.00,
  `stock` decimal(10,3) NOT NULL DEFAULT 0.000,
  `unidad_medida` varchar(20) DEFAULT 'unid',
  `stock_minimo` decimal(10,3) NOT NULL DEFAULT 0.000,
  `ubicacion_deposito` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `codigo_barra`, `modelo`, `categoria_id`, `marca_id`, `unidad_medida_id`, `proveedor_id`, `precio`, `precio_costo`, `margen_ganancia`, `stock`, `unidad_medida`, `stock_minimo`, `ubicacion_deposito`, `imagen`, `activo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'pedazo de chapa', '', '123123123', '2sd3das', 6, NULL, 2, NULL, 520.00, 400.00, 30.00, 3.000, 'unid', 5.000, NULL, NULL, 1, '2026-02-13 19:36:03', '2026-02-12 00:18:09', '2026-02-15 00:23:53'),
(2, 'Cable 2.5mm', NULL, 'TEST-1770855977', NULL, NULL, 1, 1, NULL, 150.50, 0.00, 30.00, 98.500, 'mts', 0.000, NULL, NULL, 1, '2026-02-19 15:11:16', '2026-02-12 00:26:17', '2026-02-19 15:11:16'),
(3, 'prueba', 'articulo de prueba', '8473432', NULL, NULL, NULL, 2, NULL, 130.00, 100.00, 30.00, 20.300, 'unid', 20.100, NULL, NULL, 1, '2026-02-13 19:36:18', '2026-02-12 21:31:32', '2026-02-13 19:36:18'),
(4, 'ACOPLE RÁPIDO', '1/2', 'P0001', NULL, 4, 8, 1, NULL, 6262.34, 4000.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-08 14:26:58'),
(5, 'ACOPLE RÁPIDO', '3/3 Pulgadas', 'P0002', NULL, 4, 8, 1, NULL, 7186.30, 4000.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-08 14:27:10'),
(6, 'ACOPLE RÁPIDO', '1Pulgadas;', 'P0003', NULL, 4, 8, 1, NULL, 7904.92, 4000.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-08 14:27:26'),
(7, 'AEROSOL BLANCO', 'BRILLANTE - DOBLE AA X 250G', 'P0004', NULL, 5, 11, 1, NULL, 5163.86, 0.00, 30.00, 2.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-08 14:27:55'),
(8, 'AEROSOL BLANCO', 'SATINADO - DOBLE AA X 250G', 'P0005', NULL, 5, 11, 1, NULL, 5163.86, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(9, 'AEROSOL BLANCO', 'MATE - DOBLE AA X 250G', 'P0006', NULL, 5, 11, 1, NULL, 5163.86, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(10, 'AEROSOL NEGRO', 'BRILLANTE X250G', 'P0007', NULL, 5, 11, 1, NULL, 5163.86, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(11, 'AEROSOL NEGRO', 'SATINADO X 250G', 'P0008', NULL, 5, 11, 1, NULL, 5163.86, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(12, 'AEROSOL NEGRO', 'MATE X 250G', 'P0009', NULL, 5, 11, 1, NULL, 5163.86, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(13, 'ALICATE CORTE DIAG', 'CROSS 6½ Pulgadas', 'P0010', NULL, 1, 1, 1, NULL, 13859.28, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(14, 'ARGOLLA NIQUELADAS P/TOLDO', 'Nº 30 - PRECIO X KILO', 'P0011', NULL, 8, NULL, 1, NULL, 27170.83, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 18:46:39'),
(15, 'BARRAL', '22 MM X 2,00 MTS. CEDRO S/ARG.', 'P0012', NULL, 8, NULL, 1, NULL, 11391.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 18:47:15'),
(16, 'BARRAL', '22 MM X 1,40 MTS. CEDRO S/ARG.', 'P0013', NULL, 8, NULL, 1, NULL, 9733.40, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 18:48:29'),
(17, 'BARRAL', '22 MM X 1,80 MTS. CEDRO S/ARG.', 'P0014', NULL, 8, NULL, 1, NULL, 10851.38, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 18:48:49'),
(18, 'BARRAL', '22 MM X 2,20 MTS . CEDRO S/ARG.', 'P0015', NULL, 8, NULL, 1, NULL, 11954.02, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 18:49:18'),
(19, 'BASE PARA 1 MODULO JELUZ', 'JELUZ EXTERIOR', 'P0016', NULL, 3, 17, 1, NULL, 546.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(20, 'BASE PARA 2 MODULOS JELUZ', 'JELUZ EXTERIOR', 'P0017', NULL, 3, 17, 1, NULL, 915.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(21, 'BASE PARA 3 MODULOS JELUZ', 'JELUZ EXTERIOR', 'P0018', NULL, 3, 17, 1, NULL, 1585.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(22, 'BASE PARA 4 MODULOS JELUZ', 'JELUZ EXTERIOR', 'P0019', NULL, 3, 17, 1, NULL, 2436.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(23, 'BASE PARA 5 MODULOS JELUZ', 'JELUZ EXTERIOR', 'P0020', NULL, 3, 17, 1, NULL, 2932.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(24, 'BOMBA CENTRIFUGA BTA', '-', 'P0021', NULL, 2, 3, 1, NULL, 52000.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-03-27 19:36:56', '2026-02-13 19:35:12', '2026-03-27 19:36:56'),
(25, 'BOYA PILETA SATELITE CHICA', '- ', 'P0022', NULL, 4, 8, 1, NULL, 3079.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(26, 'BUJE M-H RED. ', '¾ Pulgadas X ½ Pulgadas', 'P0023', NULL, 4, 8, 1, NULL, 227.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(27, 'BUJE M-H RED 1 x 3/4', 'ROSCA', 'BMH1X34', NULL, 4, 8, 1, NULL, 502.19, 358.71, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-09 21:53:53'),
(28, 'BULON ZINCADO 1/4', '1/4 X 1/2', 'P0025', NULL, 7, 13, 1, NULL, 63.65, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(29, 'BULON ZINCADO 1/4', '1/4 X 5/8', 'P0026', NULL, 7, 13, 1, NULL, 69.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(30, 'BULON ZINCADO 1/4', '1/4 X 3/4', 'P0027', NULL, 7, 13, 1, NULL, 73.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(31, 'BULON ZINCADO 1/4', '1/4 X 7/8', 'P0028', NULL, 7, 13, 1, NULL, 77.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(32, 'BULON ZINCADO 1/4', '1/4 X 1', 'P0029', NULL, 7, 13, 1, NULL, 78.54, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(33, 'BULON ZINCADO 1/4', '1/4 X 1 1/4', 'P0030', NULL, 7, 13, 1, NULL, 101.95, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(34, 'BULON ZINCADO 1/4', '1/4 X 1 1/2', 'P0031', NULL, 7, 13, 1, NULL, 115.10, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(35, 'BULON ZINCADO 1/4', '1/4 X 1 3/4', 'P0032', NULL, 7, 13, 1, NULL, 137.20, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(36, 'BULON ZINCADO 1/4', '1/4 X 2', 'P0033', NULL, 7, 13, 1, NULL, 154.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(37, 'BULON ZINCADO 1/4', '1/4 X 2 1/4', 'P0034', NULL, 7, 13, 1, NULL, 164.53, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(38, 'BULON ZINCADO 1/4', '1/4 X 2 1/2', 'P0035', NULL, 7, 13, 1, NULL, 183.35, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(39, 'BULON ZINCADO 1/4', '1/4 X 2 3/4', 'P0036', NULL, 7, 13, 1, NULL, 199.25, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(40, 'BULON ZINCADO 1/4', '1/4 X 3', 'P0037', NULL, 7, 13, 1, NULL, 217.05, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(41, 'BULON ZINCADO 1/4', '1/4 X 3 1/4', 'P0038', NULL, 7, 13, 1, NULL, 240.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(42, 'BULON ZINCADO 1/4', '1/4 X 3 1/2', 'P0039', NULL, 7, 13, 1, NULL, 258.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(43, 'BULON ZINCADO 1/4', '1/4 X 4', 'P0040', NULL, 7, 13, 1, NULL, 291.29, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(44, 'BULON ZINCADO 1/4', '1/4 X 4 1/2', 'P0041', NULL, 7, 13, 1, NULL, 350.72, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-14 20:21:46'),
(45, 'BULON ZINCADO 1/4', '1/4 X 5', 'P0042', NULL, 7, 13, 1, NULL, 379.01, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-14 20:21:46'),
(46, 'BULON ZINCADO 1/4', '1/4 X 5 1/2', 'P0043', NULL, 7, 13, 1, NULL, 473.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(47, 'BULON ZINCADO 1/4', '1/4 X 6', 'P0044', NULL, 7, 13, 1, NULL, 514.10, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(48, 'BULON ZINCADO 3/8', '3/8 X 1/2', 'P0045', NULL, 7, 13, 1, NULL, 159.12, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(49, 'BULON ZINCADO 3/8', '3/8 X 5/8', 'P0046', NULL, 7, 13, 1, NULL, 149.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(50, 'BULON ZINCADO 3/8', '3/8 X 3/4', 'P0047', NULL, 7, 13, 1, NULL, 166.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(51, 'BULON ZINCADO 3/8', '3/8 X 7/8', 'P0048', NULL, 7, 13, 1, NULL, 176.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(52, 'BULON ZINCADO 3/8', '3/8 X 1', 'P0049', NULL, 7, 13, 1, NULL, 187.87, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(53, 'BULON ZINCADO 3/8', '3/8 X 1 1/4', 'P0050', NULL, 7, 13, 1, NULL, 225.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(54, 'BULON ZINCADO 3/8', '3/8 X 1 1/2', 'P0051', NULL, 7, 13, 1, NULL, 246.38, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(55, 'BULON ZINCADO 3/8', '3/8 X 1 3/4', 'P0052', NULL, 7, 13, 1, NULL, 301.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(56, 'BULON ZINCADO 3/8', '3/8 X 2', 'P0053', NULL, 7, 13, 1, NULL, 317.22, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(57, 'BULON ZINCADO 3/8', '3/8 X 2 1/4', 'P0054', NULL, 7, 13, 1, NULL, 372.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(58, 'BULON ZINCADO 3/8', '3/8 X 2 1/2', 'P0055', NULL, 7, 13, 1, NULL, 410.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(59, 'BULON ZINCADO 3/8', '3/8 X 2 3/4', 'P0056', NULL, 7, 13, 1, NULL, 464.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(60, 'BULON ZINCADO 3/8', '3/8 X 3', 'P0057', NULL, 7, 13, 1, NULL, 497.90, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(61, 'BULON ZINCADO 3/8', '3/8 X 3 1/4', 'P0058', NULL, 7, 13, 1, NULL, 546.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(62, 'BULON ZINCADO 3/8', '3/8 X 3 1/2', 'P0059', NULL, 7, 13, 1, NULL, 587.22, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(63, 'BULON ZINCADO 3/8', '3/8 X 4', 'P0060', NULL, 7, 13, 1, NULL, 638.56, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(64, 'BULON ZINCADO 5/16', '5/16 X 1/2', 'P0061', NULL, 7, 13, 1, NULL, 86.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(65, 'BULON ZINCADO 5/16', '5/16 X 5/8', 'P0062', NULL, 7, 13, 1, NULL, 105.05, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(66, 'BULON ZINCADO 5/16', '5/16 X 3/4', 'P0063', NULL, 7, 13, 1, NULL, 111.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(67, 'BULON ZINCADO 5/16', '5/16 X 7/8', 'P0064', NULL, 7, 13, 1, NULL, 119.36, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(68, 'BULON ZINCADO 5/16', '5/16  X 1', 'P0065', NULL, 7, 13, 1, NULL, 129.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(69, 'BULON ZINCADO 5/16', '5/16 X 1 1/4', 'P0066', NULL, 7, 13, 1, NULL, 149.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(70, 'BULON ZINCADO 5/16', '5/16 X 1 1/2', 'P0067', NULL, 7, 13, 1, NULL, 177.21, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(71, 'BULON ZINCADO 5/16', '5/16 X 1 3/4 ', 'P0068', NULL, 7, 13, 1, NULL, 200.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(72, 'BULON ZINCADO 5/16', '5/16 X 2', 'P0069', NULL, 7, 13, 1, NULL, 229.25, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(73, 'BULON ZINCADO 5/16', '5/16 X 2 1/4', 'P0070', NULL, 7, 13, 1, NULL, 253.05, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(74, 'BULON ZINCADO 5/16', '5/16 X 2 1/2', 'P0071', NULL, 7, 13, 1, NULL, 276.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(75, 'BULON ZINCADO 5/16', '5/16 X 2 3/4', 'P0072', NULL, 7, 13, 1, NULL, 319.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(76, 'BULON ZINCADO 5/16', '5/16 X 3', 'P0073', NULL, 7, 13, 1, NULL, 340.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(77, 'BULON ZINCADO 5/16', '5/16 X 3 1/4', 'P0074', NULL, 7, 13, 1, NULL, 374.42, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(78, 'BULON ZINCADO 5/16', '5/16 X 3 1/2', 'P0075', NULL, 7, 13, 1, NULL, 399.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(79, 'BULON ZINCADO 5/16', '5/16 X 4', 'P0076', NULL, 7, 13, 1, NULL, 430.43, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(80, 'BULON ZINCADO 5/16', '5/16 X 4 1/2', 'P0077', NULL, 7, 13, 1, NULL, 497.61, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(81, 'BULON ZINCADO 5/16', '5/16 X 5', 'P0078', NULL, 7, 13, 1, NULL, 538.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(82, 'BULON ZINCADO 5/16', '5/16 X 5 1/2', 'P0079', NULL, 7, 13, 1, NULL, 660.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(83, 'BULON ZINCADO 5/16', '5/16 X 6 ', 'P0080', NULL, 7, 13, 1, NULL, 766.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(84, 'BULON ZINCADO 5/16', '5/16 X 7', 'P0081', NULL, 7, 13, 1, NULL, 882.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(85, 'BULON ZINCADO 5/16', '5/16 X 8', 'P0082', NULL, 7, 13, 1, NULL, 1006.08, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(86, 'BUSCAPOLO CHICO ', '3 X 140 SICA', 'P0083', NULL, 2, 3, 1, NULL, 2566.53, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(87, 'CABLE CANAL', '20 X 10 C/ADH X 2MTS.', 'P0084', NULL, 3, NULL, 1, NULL, 7596.94, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(88, 'CABLE CANAL', '20 X 10 S/ADH X 2 MTS.', 'P0085', NULL, 3, NULL, 1, NULL, 5543.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(89, 'CABLE CANAL ACCESORIOS', '20 X 10', 'P0086', NULL, 3, NULL, 1, NULL, 965.01, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(90, 'CABLE COAXIL ', 'REG X MT', 'P0087', NULL, 3, NULL, 1, NULL, 667.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(91, 'CABLE COAXIL ', 'RG59 X MT', 'P0088', NULL, 3, NULL, 1, NULL, 1129.27, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(92, 'CABLE ENV. REDONDO', '2 X1.5 KALOP', 'P0090', NULL, 3, 15, 1, NULL, 1950.56, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(93, 'CABLE ENV. REDONDO', '2 X 2.5', 'P0091', NULL, 3, 15, 1, NULL, 2669.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(94, 'CABLE ENV. REDONDO', '2 X 4', 'P0092', NULL, 3, 15, 1, NULL, 3990.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(95, 'CABLE ENV. REDONDO', '3 X 1', 'P0093', NULL, 3, 15, 1, NULL, 2566.53, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(96, 'CABLE ENV. REDONDO', '3 X 1,5', 'P0094', NULL, 3, 15, 1, NULL, 3521.29, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(97, 'CABLE ENV. REDONDO', '3 X 2,5', 'P0095', NULL, 3, 15, 1, NULL, 3767.67, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(98, 'CABLE ENV. REDONDO', '4 X 1', 'P0096', NULL, 3, 15, 1, NULL, 2371.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(99, 'CABLE ENV. REDONDO', '4 X 1,5', 'P0097', NULL, 3, 15, 1, NULL, 3100.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(100, 'CABLE ENV. REDONDO', '4 X 2,5', 'P0098', NULL, 3, 15, 1, NULL, 4712.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(101, 'CABLE IMSA', '1 X 1', 'P0099', NULL, 3, 15, 1, NULL, 417.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(102, 'CABLE IMSA', '1 X 1.5', 'P0100', NULL, 3, 15, 1, NULL, 604.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(103, 'CABLE IMSA', '1 X 2.5', 'P0101', NULL, 3, 15, 1, NULL, 960.09, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(104, 'CABLE IMSA', '1 X 4', 'P0102', NULL, 3, 15, 1, NULL, 1421.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(105, 'CABLE IMSA', '1 X 6', 'P0103', NULL, 3, 15, 1, NULL, 2279.08, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(106, 'CABLE SUPERASTIC', '1 X 1', 'P0104', NULL, 3, 15, 1, NULL, 610.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(107, 'CABLE SUPERASTIC', '1 X 1.5', 'P0105', NULL, 3, 15, 1, NULL, 841.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(108, 'CABLE SUPERASTIC', '1 X 2.5', 'P0106', NULL, 3, 15, 1, NULL, 1342.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(109, 'CABLE SUPERASTIC', '1 X 4', 'P0107', NULL, 3, 15, 1, NULL, 2155.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(110, 'CABLE SUPERASTIC', '1 X 6', 'P0108', NULL, 3, 15, 1, NULL, 3182.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(111, 'CABOS MARTILLO CARPINTERO', '12 Pulgadas', 'P0109', NULL, 1, 2, 1, NULL, 1077.94, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(112, 'CABOS MARTILLO MACETA', '14 Pulgadas', 'P0110', NULL, 1, 2, 1, NULL, 1334.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(113, 'CABOS MARTILLO MACETA', '16 Pulgadas', 'P0111', NULL, 1, 2, 1, NULL, 1437.26, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(114, 'CAJA CAPSULADA MIG.', '-', 'P0112', NULL, 3, 17, 1, NULL, 4106.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(115, 'CAJA HIERRO CUADRADA', '10X10', 'P0113', NULL, 3, 17, 1, NULL, 1642.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(116, 'CAJA HIERRO OCTAGONAL ', 'CHICA', 'P0114', NULL, 3, 17, 1, NULL, 544.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(117, 'CAJA HIERRO OCTAGONAL ', 'GRANDE', 'P0115', NULL, 3, 17, 1, NULL, 1141.59, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(118, 'CAJA HIERRO RECTANGULAR', '5X10', 'P0116', NULL, 3, 17, 1, NULL, 544.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(119, 'CAJA PVC OCTAGONAL', 'CHICA', 'P0117', NULL, 3, 17, 1, NULL, 513.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(120, 'CAJA PVC RECTANGULAR', '5X10', 'P0118', NULL, 3, 17, 1, NULL, 446.35, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(121, 'CALEFON ELECTRICO', 'ACERO INOX 20LTS', 'P0119', NULL, 4, 12, 1, NULL, 73916.14, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(122, 'CALEFON ELECTRICO', 'ACERO INOX 10LTS', 'P0120', NULL, 4, 12, 1, NULL, 66729.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(123, 'CALEFON RESISTENCIA &quot;FOCO&quot;', '-', 'P0122', NULL, 4, 12, 1, NULL, 7818.19, 5212.13, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-06-09 22:09:06', '2026-02-13 19:35:12', '2026-06-09 22:09:06'),
(124, 'CALEFON RESISTENCIA &quot;PULMÓN&quot;', '-', 'P0123', NULL, 4, 12, 1, NULL, 9442.76, 6295.17, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-06-09 22:09:16', '2026-02-13 19:35:12', '2026-06-09 22:09:16'),
(125, 'CANILLA METÁLICA ESF', '1 Pulgadas', 'P0126', NULL, 4, 12, 1, NULL, 17965.73, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(126, 'CAÑERIA ROSCA CODO 1/2', '1/2 Pulgadas X 45° H-H', 'P0127', NULL, 4, NULL, 1, NULL, 834.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(127, 'CAÑERIA ROSCA CODO 1/2\"', 'H-H C/INS.', 'P0128', NULL, 4, NULL, 1, NULL, 3593.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(128, 'CAÑERIA ROSCA CODO 3', '3/4 Pulgadas X 45° H-H', 'P0129', NULL, 4, NULL, 1, NULL, 1098.48, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(129, 'CAÑERIA ROSCA CODO 3/4\"', '1 Pulgadas X 45° H-H', 'P0130', NULL, 4, NULL, 1, NULL, 1991.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(130, 'CAÑERIA ROSCA CODO 3/4\"', 'H-H C/INS.', 'P0131', NULL, 4, NULL, 1, NULL, 5338.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(131, 'CAÑERIA ROSCA CODO H-H', '1/2 Pulgadas', 'P0132', NULL, 4, NULL, 1, NULL, 385.28, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(132, 'CAÑERIA ROSCA CODO H-H', '3/4 Pulgadas', 'P0133', NULL, 4, NULL, 1, NULL, 613.91, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(133, 'CAÑERIA ROSCA CODO H-H 1´', '', 'P0134', NULL, 4, NULL, 1, NULL, 1047.58, 748.27, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-09 21:53:16'),
(134, 'CAÑERIA ROSCA CODO M-H', '1/2 Pulgadas', 'P0135', NULL, 4, NULL, 1, NULL, 404.48, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(135, 'CAÑERIA ROSCA CODO M-H', '3/4 Pulgadas', 'P0136', NULL, 4, NULL, 1, NULL, 641.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(136, 'CAÑERIA ROSCA CODO M-H', '1 Pulgadas', 'P0137', NULL, 4, NULL, 1, NULL, 923.95, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(137, 'CAÑERIA ROSCA CODO RED.', '3/4 Pulgadas X 1/2 Pulgadas', 'P0138', NULL, 4, NULL, 1, NULL, 1090.27, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(138, 'CAÑERIA ROSCA CODO RED.', '1 Pulgadas X 3/4 Pulgadas', 'P0139', NULL, 4, NULL, 1, NULL, 1447.53, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(139, 'CAÑERIA ROSCA CODO RED.', '1 X 1/2 Pulgadas', 'P0140', NULL, 4, NULL, 1, NULL, 1756.54, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(140, 'CAÑERIA ROSCA CURVA H-H', '1/2 Pulgadas', 'P0141', NULL, 4, NULL, 1, NULL, 900.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(141, 'CAÑERIA ROSCA CURVA H-H 3/4´', '', NULL, NULL, 4, NULL, 1, NULL, 1644.08, 1174.34, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-09 21:52:09'),
(142, 'CAÑERIA ROSCA CURVA H-H 1´', '', 'P0143', NULL, 4, NULL, 1, NULL, 2441.01, 1743.58, 40.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-09 21:50:58'),
(143, 'CAÑERIA ROSCA CURVA M-H', '1/2 Pulgadas', 'P0144', NULL, 4, NULL, 1, NULL, 1053.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(144, 'CAÑERIA ROSCA CURVA M-H', '3/4 Pulgadas', 'P0145', NULL, 4, NULL, 1, NULL, 1334.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(145, 'CAÑERIA ROSCA CURVA M-H', '1 Pulgadas', 'P0146', NULL, 4, NULL, 1, NULL, 2669.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(146, 'CAÑERIA ROSCA TE H-H', '1/2 Pulgadas', 'P0147', NULL, 4, NULL, 1, NULL, 528.70, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(147, 'CAÑERIA ROSCA TE H-H', '3/4 Pulgadas', 'P0148', NULL, 4, NULL, 1, NULL, 1649.07, 1147.37, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(148, 'CAÑERIA ROSCA TE H-H', '1 Pulgadas', 'P0149', NULL, 4, NULL, 1, NULL, 3391.60, 2359.77, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(149, 'CAÑERIA ROSCA TE RED.', '3/4 X 1/2 Pulgadas H-H', 'P0150', NULL, 4, NULL, 1, NULL, 1162.13, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(150, 'CAÑERIA ROSCA TE RED.', '1 Pulgadas X 1/2 H-H', 'P0151', NULL, 4, NULL, 1, NULL, 1940.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(151, 'CAÑERIA ROSCA TE RED.', '1 Pulgadas X 3/4 H-H', 'P0152', NULL, 4, NULL, 1, NULL, 1293.54, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(152, 'CAÑO CORRUGADO', 'NARANJA 1 PulgadasX25MTS.', 'P0153', NULL, 3, 3, 1, NULL, 13455.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-05-08 20:12:07', '2026-02-13 19:35:12', '2026-05-08 20:12:07'),
(153, 'CAÑO CORRUGADO BLANCO 3/4', 'PRECIO X METRO', 'P0154', NULL, 3, 3, 1, NULL, 465.32, 347.49, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(154, 'CAÑO CORRUGADO BLANCO 7/8', 'PRECIO X METRO', 'P0155', NULL, 3, 3, 1, NULL, 559.40, 417.75, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(155, 'CAÑO CORRUGADO BLANCO 1 Pulg.', 'PRECIO X METRO', 'P0156', NULL, 3, 3, 1, NULL, 662.97, 495.10, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(156, 'CAÑO CORRUGADO', 'IGNIFUGO BLANCO 1 Pulgadas1/4X25MTS.', 'P0157', NULL, 3, 3, 1, NULL, 28554.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-05-08 20:16:35', '2026-02-13 19:35:12', '2026-05-08 20:16:35'),
(157, 'CAÑO CORRUGADO', 'IGNIFUGO BLANCO 1 Pulgadas1/2X25MTS', 'P0158', NULL, 3, 3, 1, NULL, 24380.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-05-08 20:17:07', '2026-02-13 19:35:12', '2026-05-08 20:17:07'),
(158, 'CAÑO CORRUGADO GRIS 1 Pulg', 'SEMI PESADO - PRECIO X METRO', 'P0159', NULL, 3, 3, 1, NULL, 1190.19, 888.82, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(159, 'CAÑO CORRUGADO GRIS 7/8', 'SEMI PESADO - PRECIO X METRO', 'P0160', NULL, 3, 3, 1, NULL, 1013.67, 757.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(160, 'CAÑO RIGIDO 20mm TUBELECTRIC', '3MTS X 20MM', 'P0161', NULL, 3, 3, 1, NULL, 4337.52, 2725.86, 55.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(161, 'CAÑO RIGIDO 22mm TUBELECTRIC', '3MTS X 22MM', 'P0162', NULL, 3, 3, 1, NULL, 5588.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(162, 'CAÑO RIGIDO', '3 MTS X 5/8', 'P0163', NULL, 3, NULL, 1, NULL, 2463.87, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(163, 'CAÑO RIGIDO', '3/4 X 3MTS', 'P0164', NULL, 3, NULL, 1, NULL, 3059.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(164, 'CAÑO RIGIDO', '7/8 X 3MTS', 'P0165', NULL, 3, NULL, 1, NULL, 4476.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(165, 'CAÑO RIGIDO', '1 Pulgadas X 3MTS', 'P0166', NULL, 3, NULL, 1, NULL, 5338.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(166, 'CAPACITOR', '4 UF / 400V C/TERMINAL', 'P0167', NULL, 2, NULL, 1, NULL, 4521.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(167, 'CAPACITOR', '12,5 UF / 400V C/TERMINAL', 'P0168', NULL, 2, NULL, 1, NULL, 7678.28, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(168, 'CAPACITOR', '14 UF / 400V C/TERMINAL', 'P0169', NULL, 2, NULL, 1, NULL, 8446.12, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(169, 'CAPACITOR', '16 UF / 400V C/TERMINAL', 'P0170', NULL, 2, NULL, 1, NULL, 10379.91, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(170, 'CAPACITOR', '1,5 UF / 400V C/CABLE TIPO CARAMELO', 'P0171', NULL, 2, NULL, 1, NULL, 3583.20, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(171, 'CAPACITOR', '2,5 UF / 400V C/CABLE TIPO CARAMELO', 'P0172', NULL, 2, NULL, 1, NULL, 3952.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(172, 'CAPACITOR', '4 UF / 400V C/CABLE TIPO CARAMELO', 'P0173', NULL, 2, NULL, 1, NULL, 6512.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(173, 'CAPACITOR', '30 UF', 'P0174', NULL, 2, NULL, 1, NULL, 7802.26, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(174, 'CAPACITOR', '35 UF', 'P0175', NULL, 2, NULL, 1, NULL, 8212.90, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(175, 'CAPACITOR', '40 UF', 'P0176', NULL, 2, NULL, 1, NULL, 9444.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(176, 'CAPACITOR', '45 UF', 'P0177', NULL, 2, NULL, 1, NULL, 10060.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(177, 'CAPACITOR', '50 UF', 'P0178', NULL, 2, NULL, 1, NULL, 18771.62, 12190.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(178, 'CAPACITOR', '60 UF', 'P0179', NULL, 2, NULL, 1, NULL, 22544.42, 14640.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(179, 'CAPACITOR ELECTROLITICO', '140-170 220VCA', 'P0180', NULL, 2, NULL, 1, NULL, 12052.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(180, 'CAPACITOR ELECTROLITICO', '190-210 220VCA', 'P0181', NULL, 2, NULL, 1, NULL, 13922.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(181, 'CAPACITOR ELECTROLITICO', '240-270 220VCA', 'P0182', NULL, 2, NULL, 1, NULL, 15773.93, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(182, 'CAPACITOR ELECTROLITICO', '270- 310  220VCA', 'P0183', NULL, 2, NULL, 1, NULL, 16528.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(183, 'CAPACITOR ELECTROLITICO', '320-360 220VCA', 'P0184', NULL, 2, NULL, 1, NULL, 19245.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(184, 'CAPACITOR ELECTROLITICO', '350-400 220VCA', 'P0185', NULL, 2, NULL, 1, NULL, 20041.70, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(185, 'CARRETEL BORDEADORA', 'ABRA-SOL', 'P0186', NULL, 13, NULL, 1, NULL, 3901.13, 1900.00, 100.00, 3.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-06-09 14:30:44'),
(186, 'CERRADURA', 'PRIVE 101', 'P0187', NULL, 8, 2, 1, NULL, 7186.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(187, 'CERRADURA', 'PARA PUERTA PLACA', 'P0188', NULL, 8, 2, 1, NULL, 5133.07, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(188, 'CINTA AISLADORA', '15 PLUS TACSA', 'P0189', NULL, 11, 3, 1, NULL, 870.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-03-19 21:38:17', '2026-02-13 19:35:12', '2026-03-19 21:38:17'),
(189, 'CINTA ENMASCARAR', '24 X 40', 'P0190', NULL, 11, 11, 1, NULL, 5441.05, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(190, 'CINTA MÉTRICA IMP.', '5MS', 'P0191', NULL, 11, NULL, 1, NULL, 3336.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(191, 'CINTA MINISTERIO (VERDE)XMT', '-', 'P0192', NULL, 11, NULL, 1, NULL, 1026.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(192, 'CINTA PANAMÁ (AMERICANA) XMT', '-', 'P0193', NULL, 11, NULL, 1, NULL, 769.96, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(193, 'CINTA SILLÓN X MT', '-', 'P0194', NULL, 11, NULL, 1, NULL, 549.24, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(194, 'CLAVOS PUNTA PARIS  1.\"', 'KG', 'P0195', NULL, 6, NULL, 1, NULL, 10661.72, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(195, 'CLAVOS PUNTA PARIS  1.1/2&quot;', 'KG', 'P0196', NULL, 6, NULL, 1, NULL, 10353.50, 6723.40, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(196, 'CLAVOS PUNTA PARIS  2.&quot;', 'KG', 'P0197', NULL, 6, NULL, 1, NULL, 9406.05, 6108.15, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(197, 'CLAVOS PUNTA PARIS  2.1/2\"', 'KG', 'P0198', NULL, 6, NULL, 1, NULL, 8958.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(198, 'CLAVOS PUNTA PARIS  3.\"', 'KG', 'P0199', NULL, 6, NULL, 1, NULL, 8958.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(199, 'CLAVOS PUNTA PARIS  3.1/2\"', 'KG', 'P0200', NULL, 6, NULL, 1, NULL, 8958.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(200, 'CLAVOS PUNTA PARIS  4.\"', 'KG', 'P0201', NULL, 6, NULL, 1, NULL, 8958.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(201, 'CODO ESPIGA', '1/2 Pulgadas', 'P0202', NULL, 4, 8, 1, NULL, 249.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(202, 'CODO ESPIGA', '3/4 Pulgadas', 'P0203', NULL, 4, 8, 1, NULL, 338.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(203, 'CODO ESPIGA', '1 Pulgadas', 'P0204', NULL, 4, 8, 1, NULL, 530.02, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:12', '2026-05-29 12:51:02'),
(204, 'CODO ESPIGA ROSCA HEMBRA', '1/2 Pulgadas', 'P0205', NULL, 4, 8, 1, NULL, 369.17, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(205, 'CODO ESPIGA ROSCA HEMBRA', '3/4 Pulgadas', 'P0206', NULL, 4, 8, 1, NULL, 500.69, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(206, 'CODO ESPIGA ROSCA HEMBRA', '1 Pulgadas', 'P0207', NULL, 4, 8, 1, NULL, 707.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(207, 'COMANDO VENTILADOR ', ' ABON GARDEN', 'P0208', NULL, 15, NULL, 1, NULL, 12319.36, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(208, 'COMANDO VENTILADOR EVEREST', 'CHICO', 'P0209', NULL, 15, NULL, 1, NULL, 12422.02, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(209, 'COMANDO VENTILADOR EVEREST', 'GRANDE', 'P0210', NULL, 15, NULL, 1, NULL, 16477.14, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(210, 'CONECTOR CAÑO', '20MM', 'P0211', NULL, 3, 3, 1, NULL, 400.38, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(211, 'CONECTOR CAÑO', '22MM', 'P0212', NULL, 3, 3, 1, NULL, 549.24, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(212, 'CONEXIÓN TANQUE', '½ Pulgadas', 'P0213', NULL, 4, 8, 1, NULL, 3798.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(213, 'CONEXIÓN TANQUE', '¾ Pulgadas', 'P0214', NULL, 4, 8, 1, NULL, 4311.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(214, 'CONEXIÓN TANQUE', '1 Pulgadas', 'P0215', NULL, 4, 8, 1, NULL, 4876.41, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(215, 'CORTA HIERRO BIASSONI HEX.', '350 MM', 'P0216', NULL, 1, 1, 1, NULL, 12960.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(216, 'CORTA HIERRO BIASSONI PLANO', '350 X 35MM', 'P0217', NULL, 1, 1, 1, NULL, 11600.73, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(217, 'CORTINA BAÑO ', 'ALUMINIO BRONCEADO X MTS Ø½ ', 'P0218', NULL, 8, 2, 1, NULL, 2539.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(218, 'CORTINA BAÑO ', 'HIERRO X MT. Ø ½', 'P0219', NULL, 8, 2, 1, NULL, 2053.23, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(219, 'CUPLA', 'Ø40', 'P0220', NULL, NULL, NULL, 1, NULL, 487.65, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(220, 'CUPLA', 'Ø50', 'P0221', NULL, NULL, NULL, 1, NULL, 519.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(221, 'CUPLA', 'Ø60', 'P0222', NULL, NULL, NULL, 1, NULL, 657.04, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(222, 'CUPLA', 'Ø100', 'P0223', NULL, NULL, NULL, 1, NULL, 1539.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(223, 'CUPLA', 'Ø110', 'P0224', NULL, NULL, NULL, 1, NULL, 1565.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(224, 'CUPLA H - H', '½ Pulgadas', 'P0225', NULL, 4, 8, 1, NULL, 311.07, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(225, 'CUPLA H - H', '¾ Pulgadas', 'P0226', NULL, 4, 8, 1, NULL, 451.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(226, 'CUPLA H - H', '1 Pulgadas', 'P0227', NULL, 4, 8, 1, NULL, 662.17, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(227, 'CUPLA H-H C/INSERTO', '½ Pulgadas', 'P0228', NULL, 4, 8, 1, NULL, 3593.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(228, 'CUPLA H-H C/INSERTO', '¾ Pulgadas', 'P0229', NULL, 4, 8, 1, NULL, 4799.41, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(229, 'CUPLA RED.', '¾ Pulgadas X ½ Pulgadas', 'P0230', NULL, 4, 8, 1, NULL, 468.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(230, 'CUPLA RED.', '1 Pulgadas X ¾ Pulgadas', 'P0231', NULL, 4, 8, 1, NULL, 836.69, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(231, 'CUPLA RED. ', '1 Pulgadas X ½ Pulgadas', 'P0232', NULL, 4, 8, 1, NULL, 975.28, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(232, 'CUPLA REDUCCIÓN', 'Ø100 A Ø60', 'P0233', NULL, 6, 8, 1, NULL, 1283.27, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(233, 'CURVA PVC BLANCO', 'Ø60°-45°', 'P0234', NULL, 6, 8, 1, NULL, 1397.22, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(234, 'CURVA PVC BLANCO', 'Ø100°-45°', 'P0235', NULL, 6, 8, 1, NULL, 2258.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(235, 'CURVA RIGIDA', '5/8', 'P0236', NULL, 3, 3, 1, NULL, 266.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(236, 'CURVA RIGIDA', '3/4', 'P0237', NULL, 3, 3, 1, NULL, 287.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(237, 'CURVA RIGIDA', '7/8', 'P0238', NULL, 3, 3, 1, NULL, 423.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(238, 'CURVA RIGIDA', '1 Pulgadas', 'P0239', NULL, 3, 3, 1, NULL, 477.38, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(239, 'CURVAS PARA CAÑO', '20MM', 'P0240', NULL, 3, 3, 1, NULL, 687.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(240, 'CURVAS PARA CAÑO', '22MM', 'P0241', NULL, 3, 3, 1, NULL, 807.95, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(241, 'DESTORNILLADOR PHILLIPS', 'CR.VA 5 X 125 CROSS.', 'P0242', NULL, 1, 2, 1, NULL, 3182.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(242, 'DESTORNILLADOR PLANO', 'CR.VA 5 X 125 CROSS.', 'P0243', NULL, 1, 2, 1, NULL, 307.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(243, 'DISCO CORTE', '115 X 1,0 PLANO', 'P0244', NULL, 13, NULL, 1, NULL, 930.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(244, 'DISCO CORTE ', '180 X 1,2 PLANO', 'P0245', NULL, 13, NULL, 1, NULL, 1660.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(245, 'DISCO FLAP', 'G° 40', 'P0246', NULL, 13, NULL, 1, NULL, 2994.32, 1944.47, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(246, 'DISCO FLAP', 'G°60', 'P0247', NULL, 13, NULL, 1, NULL, 2463.87, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(247, 'ELECTRODO', '2.0MM', 'P0249', NULL, NULL, NULL, 1, NULL, 16836.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(248, 'ELECTRODO', '2.5MM', 'P0250', NULL, NULL, NULL, 1, NULL, 12637.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(249, 'ENTREROSCA', '½ Pulgadas', 'P0251', NULL, 4, 8, 1, NULL, 232.02, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(250, 'ENTREROSCA', '¾ Pulgadas', 'P0252', NULL, 4, 8, 1, NULL, 333.65, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(251, 'ENTREROSCA', '1 Pulgadas', 'P0253', NULL, 4, 8, 1, NULL, 1111.85, 773.59, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(252, 'ESCALERA FAMILIAR ', '8 ESCALONES', 'P0254', NULL, NULL, NULL, 1, NULL, 77919.93, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-06-02 22:04:44', '2026-02-13 19:35:13', '2026-06-02 22:04:44'),
(253, 'ESPIGA 1/2\" ROSCA H RED. ', '3/4 Pulgadas', 'P0255', NULL, 4, 8, 1, NULL, 528.01, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(254, 'ESPIGA 1/2\" ROSCA M RED.', '3/4 Pulgadas', 'P0257', NULL, 4, 8, 1, NULL, 281.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(255, 'ESPIGA 3/4\" ROSCA H RED.', '1 Pulgadas', 'P0258', NULL, 4, 8, 1, NULL, 684.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(256, 'ESPIGA 3/4\" ROSCA M RED.', '1 Pulgadas', 'P0259', NULL, 4, 8, 1, NULL, 365.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(257, 'ESPIGA 3/4\" ROSCA M RED.', '1/2 Pulgadas', 'P0260', NULL, 4, 8, 1, NULL, 281.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(258, 'ESPIGA DOBLE', '1/2 Pulgadas', 'P0261', NULL, 4, 8, 1, NULL, 176.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(259, 'ESPIGA DOBLE', '3/4 Pulgadas', 'P0262', NULL, 4, 8, 1, NULL, 231.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(260, 'ESPIGA DOBLE', '1 Pulgadas', 'P0263', NULL, 4, 8, 1, NULL, 344.93, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(261, 'ESPIGA DOBLE RED.', '3/4 Pulgadas X 1/2 Pulgadas', 'P0264', NULL, 4, 8, 1, NULL, 299.41, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(262, 'ESPIGA DOBLE RED.', '1 Pulgadas X 3/4 Pulgadas', 'P0265', NULL, 4, 8, 1, NULL, 366.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(263, 'ESPIGA DOBLE RED.', '1 Pulgadas X 1/2 Pulgadas', 'P0266', NULL, 4, 8, 1, NULL, 264.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(264, 'ESPIGA ROSCA HEMBRA', '1/2 Pulgadas', 'P0267', NULL, 4, 8, 1, NULL, 218.67, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(265, 'ESPIGA ROSCA HEMBRA', '3/4 Pulgadas', 'P0268', NULL, 4, 8, 1, NULL, 249.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(266, 'ESPIGA ROSCA HEMBRA', '1 Pulgadas', 'P0269', NULL, 4, 8, 1, NULL, 369.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(267, 'ESPIGA ROSCA MACHO', '1/2 Pulgadas', 'P0270', NULL, 4, 8, 1, NULL, 176.07, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(268, 'ESPIGA ROSCA MACHO', '3/4 Pulgadas', 'P0271', NULL, 4, 8, 1, NULL, 231.61, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(269, 'ESPIGA ROSCA MACHO', '1 Pulgadas', 'P0272', NULL, 4, 8, 1, NULL, 344.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02');
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `codigo_barra`, `modelo`, `categoria_id`, `marca_id`, `unidad_medida_id`, `proveedor_id`, `precio`, `precio_costo`, `margen_ganancia`, `stock`, `unidad_medida`, `stock_minimo`, `ubicacion_deposito`, `imagen`, `activo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(270, 'ESPUMA POLIURETANO', '300ML CROSS', 'P0273', NULL, 11, 11, 1, NULL, 6909.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(271, 'FICHA MACHO ', 'ALTO CONSUMO PERNO CHICO', 'P0274', NULL, 3, NULL, 1, NULL, 2800.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-03-21 20:17:03', '2026-02-13 19:35:13', '2026-03-21 20:17:03'),
(272, 'FICHA MACHO/HEMBRA', 'POLARIZADA C/U', 'P0275', NULL, 3, NULL, 1, NULL, 1642.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(273, 'GABINETE P/BOMBA FIBRA', NULL, 'P0276', NULL, 6, NULL, 1, NULL, 34904.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(274, 'GRAMPA OMEGA PPN', '½ Pulgadas', 'P0277', NULL, NULL, NULL, 1, NULL, 118.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(275, 'GRAMPA OMEGA PPN', '¾ Pulgadas', 'P0278', NULL, NULL, NULL, 1, NULL, 143.72, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(276, 'GRAMPA OMEGA PPN', '1 Pulgadas', 'P0279', NULL, NULL, NULL, 1, NULL, 175.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(277, 'GRAMPA OMEGA PPN', '1 1/4 Pulgadas', 'P0280', NULL, NULL, NULL, 1, NULL, 583.12, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(278, 'GRAMPA OMEGA PPN', '1 1/2 Pulgadas', 'P0281', NULL, NULL, NULL, 1, NULL, 718.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(279, 'GRAMPA OMEGA PPN', '2 Pulgadas', 'P0282', NULL, NULL, NULL, 1, NULL, 790.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(280, 'GRAMPA PVC', 'Ø40', 'P0283', NULL, NULL, NULL, 1, NULL, 800.76, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(281, 'GRAMPA PVC', 'Ø50', 'P0284', NULL, NULL, NULL, 1, NULL, 1194.98, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(282, 'GRAMPA PVC', 'Ø60', 'P0285', NULL, NULL, NULL, 1, NULL, 1334.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(283, 'GRAMPA PVC', 'Ø100 / 110', 'P0286', NULL, NULL, NULL, 1, NULL, 2116.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(284, 'GRAMPAS CAÑO', 'Ø20MM', 'P0287', NULL, 3, 3, 1, NULL, 282.32, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(285, 'GRAMPAS CAÑO', 'Ø22MM', 'P0288', NULL, 3, 3, 1, NULL, 359.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(286, 'GRAMPAS OMEGA CHAPA', '5/8', 'P0289', NULL, 3, NULL, 1, NULL, 84.70, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(287, 'GRAMPAS OMEGA CHAPA', '3/4', 'P0290', NULL, 3, NULL, 1, NULL, 100.40, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(288, 'GRAMPAS OMEGA CHAPA', '7/8', 'P0291', NULL, 3, NULL, 1, NULL, 156.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(289, 'GRAMPAS OMEGA CHAPA', '1  Pulgadas', 'P0292', NULL, 3, NULL, 1, NULL, 189.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(290, 'GRAMPAS OMEGA CHAPA', '1 1/4  Pulgadas', 'P0293', NULL, 3, NULL, 1, NULL, 313.74, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(291, 'GUANTES ALGODÓN PALMA MOTEADA', 'GRIS', 'P0294', NULL, 10, NULL, 1, NULL, 1436.39, 912.34, 53.36, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(292, 'GUANTE DESCARNE PUÑO CORTO', 'PAR', 'P0295', NULL, 10, NULL, 1, NULL, 6459.45, 4840.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(293, 'HOJA SIERRA', '18 DIENTES', 'P0297', NULL, 1, 2, 1, NULL, 3418.61, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:53:15'),
(294, 'HOJA SIERRA 24 D', '', 'P0298', NULL, 1, 2, 1, NULL, 2447.74, 1631.83, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-06-09 22:13:53'),
(295, 'HOJA SIERRA 32 D', '', 'P0299', NULL, 1, 2, 1, NULL, 2447.74, 1631.83, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-06-09 22:13:28'),
(296, 'JUEGO 9 LLAVES HEXAGONALES', '1.5 A 10MM LARGAS', 'P0300', NULL, 1, 2, 1, NULL, 14269.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(297, 'JUEGO 9 LLAVES HEXAGONALES', '1/16 Pulgadas  A 3/8 Pulgadas LARGAS', 'P0301', NULL, 1, 2, 1, NULL, 14269.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(298, 'LAMPARA INFRARROJA', '150W', 'P0302', NULL, 14, 9, 1, NULL, 24638.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(299, 'LAMPARA LED 9W', '9W-E27', 'P0303', NULL, 14, 9, 1, NULL, 1247.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(300, 'LAMPARA LED 12W', '12W-E27', 'P0304', NULL, 14, 9, 1, NULL, 1862.70, 1170.59, 55.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(301, 'LAMPARA LED 18W', '18W-E27', 'P0305', NULL, 14, 9, 1, NULL, 2677.10, 1738.47, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(302, 'LAMPARA LED 20W', '20W -E27', 'P0306', NULL, 14, 9, 1, NULL, 3224.45, 2093.91, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(303, 'LAMPARA LED', 'DICROICA GU1O-5W', 'P0307', NULL, 14, 9, 1, NULL, 1801.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(304, 'LAMPARA LED 100W', '100W-E40', 'P0308', NULL, 14, 9, 1, NULL, 37882.02, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(305, 'LAMPARA LED CON FOTOCELULA', '10W LUZ ', 'P0309', NULL, 14, 9, 1, NULL, 16015.17, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(306, 'LAMPARA LED AUTÓNOMA', '12W', 'P0310', NULL, 14, 9, 1, NULL, 14064.59, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(307, 'LAMPARA LED TUBULAR', '9W', 'P0311', NULL, 14, 9, 1, NULL, 5543.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(308, 'LAMPARA LED GOTA FILAMENTO', NULL, 'P0312', NULL, 14, 9, 1, NULL, 3593.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(309, 'LAMPARA LED GOTA', '4W', 'P0313', NULL, 14, 9, 1, NULL, 1247.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(310, 'LAMPARA FILAMENTO ALIC', '20W', 'P0314', NULL, 14, 9, 1, NULL, 8161.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(311, 'LAMPARA LED TUBULAR', '15W', 'P0315', NULL, 14, 9, 1, NULL, 6980.97, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(312, 'LIJA AL AGUA', '-', 'P0316', NULL, 13, 11, 1, NULL, 554.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(313, 'LIJA ANTIEMPASTE', '-', 'P0317', NULL, 13, 11, 1, NULL, 821.29, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(314, 'LIJA ESMERIL', '-', 'P0318', NULL, 13, 11, 1, NULL, 410.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(315, 'LIMPIA PILETA S/C', '-', 'P0319', NULL, 9, 12, 1, NULL, 8623.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(316, 'LLAVE AJUSTABLE', 'CROSS 8 Pulgadas- 203MM', 'P0320', NULL, 1, 2, 1, NULL, 19197.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(317, 'LLAVE COMBINADA GEDORE', '8MM', 'P0321', NULL, NULL, 5, 1, NULL, 3079.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(318, 'LLAVE COMBINADA GEDORE', '10MM', 'P0322', NULL, NULL, 5, 1, NULL, 3541.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(319, 'LLAVE COMBINADA GEDORE', '11MM', 'P0323', NULL, NULL, 5, 1, NULL, 4003.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(320, 'LLAVE COMBINADA GEDORE', '12MM', 'P0324', NULL, NULL, 5, 1, NULL, 4209.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(321, 'LLAVE COMBINADA GEDORE', '14MM', 'P0325', NULL, NULL, 5, 1, NULL, 5030.41, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(322, 'LLAVE COMBINADA GEDORE', '15MM', 'P0326', NULL, NULL, 5, 1, NULL, 5646.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(323, 'LLAVE COMBINADA RHEIN', '8 MM', 'P0327', NULL, NULL, 16, 1, NULL, 3775.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(324, 'LLAVE COMBINADA RHEIN', '9MM', 'P0328', NULL, NULL, 16, 1, NULL, 3901.13, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(325, 'LLAVE COMBINADA RHEIN', '10MM ', 'P0329', NULL, NULL, 16, 1, NULL, 3952.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(326, 'LLAVE COMBINADA RHEIN', '11MM', 'P0330', NULL, NULL, 16, 1, NULL, 4311.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(327, 'LLAVE COMBINADA RHEIN', '12MM', 'P0331', NULL, NULL, 16, 1, NULL, 4434.97, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(328, 'LLAVE COMBINADA RHEIN', '13MM', 'P0332', NULL, NULL, 16, 1, NULL, 4599.22, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(329, 'LLAVE COMBINADA RHEIN', '14MM', 'P0333', NULL, NULL, 16, 1, NULL, 5338.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(330, 'LLAVE DE PASO METÁLICA', '1 Pulgadas', 'P0336', NULL, 4, 12, 1, NULL, 11498.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(331, 'LLAVE DOBLE BOCA GEDORE', '6-7', 'P0337', NULL, NULL, 5, 1, NULL, 5589.90, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(332, 'LLAVE DOBLE BOCA GEDORE', '8-9', 'P0338', NULL, NULL, 5, 1, NULL, 6570.32, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(333, 'LLAVE DOBLE BOCA GEDORE', '8-10', 'P0339', NULL, NULL, 5, 1, NULL, 6775.65, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(334, 'LLAVE DOBLE BOCA GEDORE', '12-13', 'P0340', NULL, NULL, 5, 1, NULL, 9444.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(335, 'LLAVE DOBLE BOCA GEDORE', '13-15', 'P0341', NULL, NULL, 5, 1, NULL, 10368.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(336, 'LLAVE DOBLE BOCA GEDORE', '14-15', 'P0342', NULL, NULL, 5, 1, NULL, 11518.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(337, 'LLAVE DOBLE BOCA GEDORE', '16-17', 'P0343', NULL, NULL, 5, 1, NULL, 12114.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(338, 'LLAVE TÉRMICA SICA', '3 X 20', 'P0344', NULL, 3, 16, 1, NULL, 18992.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(339, 'LLAVE TÉRMICA SICA', '3 X 25', 'P0345', NULL, 3, 16, 1, NULL, 18992.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(340, 'LLAVE TÉRMICA SICA', '3 X 63', 'P0346', NULL, 3, 16, 1, NULL, 31003.72, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(341, 'LLAVE TÉRMICA SICA', '4 X 40', 'P0347', NULL, 3, 16, 1, NULL, 32440.98, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(342, 'LLAVE TÉRMICA SICA', '4 X 50', 'P0348', NULL, 3, 16, 1, NULL, 43528.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(343, 'LLAVE TÉRMICA SICA', '4 X 63', 'P0349', NULL, 3, 16, 1, NULL, 43528.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(344, 'LLAVE TÉRMICA SICA', '4 X 80', 'P0350', NULL, 3, 16, 1, NULL, 143725.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(345, 'LLAVE TÉRMICA SICA', '1X5', 'P0351', NULL, 3, 16, 1, NULL, 4486.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(346, 'LLAVE TÉRMICA SICA', '1X10', 'P0352', NULL, 3, 16, 1, NULL, 4486.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(347, 'LLAVE TÉRMICA SICA', '1X15', 'P0353', NULL, 3, 16, 1, NULL, 4486.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(348, 'LLAVE TÉRMICA SICA', '1X20', 'P0354', NULL, 3, 16, 1, NULL, 4486.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(349, 'LLAVE TÉRMICA SICA', '1X25', 'P0355', NULL, 3, 16, 1, NULL, 4486.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(350, 'LLAVE TÉRMICA SICA', '1X32', 'P0356', NULL, 3, 16, 1, NULL, 4486.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(351, 'LLAVE TÉRMICA SICA', '1X40', 'P0357', NULL, 3, 16, 1, NULL, 6518.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(352, 'LLAVE TÉRMICA SICA', '1X50', 'P0358', NULL, 3, 16, 1, NULL, 10368.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(353, 'LLAVE TÉRMICA SICA', '1X63', 'P0359', NULL, 3, 16, 1, NULL, 10368.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(354, 'LLAVE TÉRMICA SICA', '1X80', 'P0360', NULL, 3, 16, 1, NULL, 29258.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(355, 'LLAVE TÉRMICA SICA', '1X100', 'P0361', NULL, 3, 16, 1, NULL, 29258.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(356, 'LLAVE TÉRMICA SICA', '2X10', 'P0362', NULL, 3, 16, 1, NULL, 9855.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(357, 'LLAVE TÉRMICA SICA', '2X20', 'P0363', NULL, 3, 16, 1, NULL, 9855.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(358, 'LLAVE TÉRMICA SICA', '2X25', 'P0364', NULL, 3, 16, 1, NULL, 9855.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(359, 'LLAVE TÉRMICA SICA', '2X32', 'P0365', NULL, 3, 16, 1, NULL, 9855.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(360, 'LLAVE TÉRMICA SICA', '2X40', 'P0366', NULL, 3, 16, 1, NULL, 14064.59, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(361, 'LLAVE TÉRMICA SICA', '2X50', 'P0367', NULL, 3, 16, 1, NULL, 20429.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(362, 'LLAVE TÉRMICA SICA', '2X63', 'P0368', NULL, 3, 16, 1, NULL, 20429.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(363, 'LLAVE TÉRMICA SICA', '2X80', 'P0369', NULL, 3, 16, 1, NULL, 71965.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(364, 'LLAVE TÉRMICA SICA', '2X100', 'P0370', NULL, 3, 16, 1, NULL, 71965.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(365, 'LLAVE TÉRMICA SICA', '3X10', 'P0371', NULL, 3, 16, 1, NULL, 18992.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(366, 'LLAVE TÉRMICA SICA', '3X15', 'P0372', NULL, 3, 16, 1, NULL, 18992.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(367, 'MANGUERA REF. P/PILETA', '1 1/4 X MT.', 'P0373', NULL, 9, 14, 1, NULL, 2002.72, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(368, 'MANGUERA REF. P/PILETA', '1 1/2 X MT.', 'P0374', NULL, 9, 14, 1, NULL, 2612.73, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(369, 'MANGUERA RIEGO', '3/4 TRANSPARENTE X MT', 'P0375', NULL, 9, 14, 1, NULL, 1940.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(370, 'MANGUERA TRICOLOR', '1 Pulgadas X MT', 'P0376', NULL, 9, 14, 1, NULL, 2053.23, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(371, 'MANIJA BAUL ZINCADA', '80MM', 'P0377', NULL, 8, 17, 1, NULL, 2977.18, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(372, 'MANIJA BAUL ZINCADA', '91MM', 'P0378', NULL, 8, 17, 1, NULL, 3695.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(373, 'MANIJA BAUL ZINCADA', '103MM', 'P0379', NULL, 8, 17, 1, NULL, 4003.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(374, 'MANIJA BISELADA', 'BRONCE PLATIL', 'P0380', NULL, 8, 17, 1, NULL, 15091.21, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(375, 'MANIJA FALLEBA', 'EMB/EXT', 'P0381', NULL, 8, 17, 1, NULL, 4927.74, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(376, 'MANIJA PULIDA', 'BRONCE MINISTERIO', 'P0382', NULL, 8, 17, 1, NULL, 13756.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(377, 'MANIJA SANATORIO', 'BRONCE PULIDO', 'P0383', NULL, 8, 17, 1, NULL, 22585.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(378, 'MANIJA SANATORIO', 'PESADA', 'P0384', NULL, 8, 17, 1, NULL, 15399.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(379, 'MECHA ACERO RÁPIDO', 'Ø1,50', 'P0385', NULL, NULL, NULL, 1, NULL, 1519.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(380, 'MECHA ACERO RÁPIDO', 'Ø1,75', 'P0386', NULL, NULL, NULL, 1, NULL, 1334.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(381, 'MECHA ACERO RÁPIDO', 'Ø2', 'P0387', NULL, NULL, NULL, 1, NULL, 1334.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(382, 'MECHA ACERO RÁPIDO', 'Ø4,75', 'P0398', NULL, NULL, NULL, 1, NULL, 2669.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(383, 'MECHA ACERO RÁPIDO', 'Ø5', 'P0399', NULL, NULL, NULL, 1, NULL, 2823.18, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(384, 'MECHA ACERO RÁPIDO', 'Ø5,25', 'P0400', NULL, NULL, NULL, 1, NULL, 2987.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(385, 'MECHA ACERO RÁPIDO', 'Ø5,50', 'P0401', NULL, NULL, NULL, 1, NULL, 3285.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(386, 'MECHA ACERO RÁPIDO', 'Ø5,75', 'P0402', NULL, NULL, NULL, 1, NULL, 3346.76, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(387, 'MECHA ACERO RÁPIDO', 'Ø6', 'P0403', NULL, NULL, NULL, 1, NULL, 3439.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(388, 'MECHA ACERO RÁPIDO', 'Ø6,25', 'P0404', NULL, NULL, NULL, 1, NULL, 3901.13, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(389, 'MECHA ACERO RÁPIDO', 'Ø6,50', 'P0405', NULL, NULL, NULL, 1, NULL, 4003.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(390, 'MECHA ACERO RÁPIDO', 'Ø7,25', 'P0408', NULL, NULL, NULL, 1, NULL, 5112.54, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(391, 'MECHA ACERO RÁPIDO', 'Ø7,50', 'P0409', NULL, NULL, NULL, 1, NULL, 5338.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(392, 'MECHA ACERO RÁPIDO', 'Ø7,75', 'P0410', NULL, NULL, NULL, 1, NULL, 5923.56, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(393, 'MECHA ACERO RÁPIDO', 'Ø8,25', 'P0412', NULL, NULL, NULL, 1, NULL, 6775.65, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(394, 'MECHA ACERO RÁPIDO', 'Ø8,50', 'P0413', NULL, NULL, NULL, 1, NULL, 6878.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(395, 'MECHA ACERO RÁPIDO', 'Ø8,75', 'P0414', NULL, NULL, NULL, 1, NULL, 7391.61, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(396, 'MECHA ACERO RÁPIDO', 'Ø9', 'P0415', NULL, NULL, NULL, 1, NULL, 7802.26, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(397, 'MECHA ACERO RÁPIDO', 'Ø9,25', 'P0416', NULL, NULL, NULL, 1, NULL, 8315.57, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(398, 'MECHA ACERO RÁPIDO', 'Ø9,50', 'P0417', NULL, NULL, NULL, 1, NULL, 8674.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(399, 'MECHA ACERO RÁPIDO', 'Ø9,75', 'P0418', NULL, NULL, NULL, 1, NULL, 9444.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(400, 'MECHA ACERO RÁPIDO', 'Ø10', 'P0419', NULL, NULL, NULL, 1, NULL, 9855.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(401, 'MECHA ACERO RÁPIDO', 'Ø10,25', 'P0420', NULL, NULL, NULL, 1, NULL, 11703.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(402, 'MECHA ACERO RÁPIDO', 'Ø10,50', 'P0421', NULL, NULL, NULL, 1, NULL, 12124.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(403, 'MECHA ACERO RÁPIDO', 'Ø10,75', 'P0422', NULL, NULL, NULL, 1, NULL, 13212.51, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:13', '2026-05-29 12:51:02'),
(404, 'MECHA ACERO RÁPIDO', 'Ø11', 'P0423', NULL, NULL, NULL, 1, NULL, 13612.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(405, 'MECHA ACERO RÁPIDO', 'Ø11,25', 'P0424', NULL, NULL, NULL, 1, NULL, 14639.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(406, 'MECHA ACERO RÁPIDO', 'Ø11,50', 'P0425', NULL, NULL, NULL, 1, NULL, 14947.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(407, 'MECHA ACERO RÁPIDO', 'Ø11,75', 'P0426', NULL, NULL, NULL, 1, NULL, 15943.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(408, 'MECHA ACERO RÁPIDO', 'Ø12', 'P0427', NULL, NULL, NULL, 1, NULL, 16908.32, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(409, 'MECHA ACERO RÁPIDO', 'Ø12,25', 'P0428', NULL, NULL, NULL, 1, NULL, 18273.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(410, 'MECHA ACERO RÁPIDO', 'Ø12,50', 'P0429', NULL, NULL, NULL, 1, NULL, 18992.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(411, 'MECHA ACERO RÁPIDO', 'Ø12,75', 'P0430', NULL, NULL, NULL, 1, NULL, 20840.25, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(412, 'MECHA ACERO RÁPIDO', 'Ø13', 'P0431', NULL, NULL, NULL, 1, NULL, 21456.22, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(413, 'MECHA ACERO RÁPIDO ', 'Ø1', 'P0432', NULL, NULL, NULL, 1, NULL, 1519.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(414, 'MECHA ACERO RÁPIDO ', 'Ø1,25', 'P0433', NULL, NULL, NULL, 1, NULL, 1519.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(415, 'MECHA WIDIA', 'Ø10', 'P0436', NULL, NULL, NULL, 1, NULL, 3849.80, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(416, 'MECHA WIDIA LARGA', 'Ø6 X 200', 'P0437', NULL, NULL, NULL, 1, NULL, 8315.57, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(417, 'MECHA WIDIA LARGA', 'Ø6 X 400', 'P0438', NULL, NULL, NULL, 1, NULL, 12319.36, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(418, 'MECHA WIDIA LARGA', 'Ø14 X 400', 'P0439', NULL, NULL, NULL, 1, NULL, 33724.24, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(419, 'MEDIA SOMBRA VERDE', '2MTS ANCHO X 1MT', 'P0440', NULL, 9, NULL, 1, NULL, 8982.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(420, 'MODULO BIPOLAR JELUZ', 'JELUZ VERONA', 'P0441', NULL, 3, 17, 1, NULL, 4207.67, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(421, 'MODULO C/U', NULL, 'P0442', NULL, 3, 17, 1, NULL, 770.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-03-19 19:40:47', '2026-02-13 19:35:14', '2026-03-19 19:40:47'),
(422, 'MODULO CIEGO JELUZ', 'JELUZ VERONA', 'P0443', NULL, 3, 17, 1, NULL, 178.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(423, 'MODULO CIEGO', 'PLASNAVI', 'P0444', NULL, 3, 17, 1, NULL, 307.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(424, 'MODULO COMBINACIÓN JELUZ', 'JELUZ VERONA', 'P0445', NULL, 3, 17, 1, NULL, 1746.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(425, 'MODULO COMBINACIÓN', 'PLASNAVI', 'P0446', NULL, 3, 17, 1, NULL, 2258.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(426, 'MODULO PULSADOR JELUZ', 'JELUZ VERONA', 'P0447', NULL, 3, 17, 1, NULL, 1530.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(427, 'MODULO PUNTO JELUZ', 'JELUZ VERONA', 'P0448', NULL, 3, 17, 1, NULL, 1428.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(428, 'MODULO PUNTO JELUZ', '2 1/2 - JELUZ VERONA', 'P0449', NULL, 3, 17, 1, NULL, 2660.98, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(429, 'MODULO PUNTO', 'PLASNAVI', 'P0450', NULL, 3, 17, 1, NULL, 1847.90, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(430, 'MODULO TELEFONO', 'PLASNAVI', 'P0451', NULL, 3, 17, 1, NULL, 5749.04, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(431, 'MODULO TOMA TELEFONO JELUZ', 'JELUZ VERONA', 'P0452', NULL, 3, 17, 1, NULL, 5673.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(432, 'MODULO TOMACORRIENTE JELUZ', '10 AMP - JELUZ VERONA', 'P0453', NULL, 3, 17, 1, NULL, 1530.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(433, 'MODULO TOMACORRIENTE JELUZ', '20 AMP - JELUZ VERONA', 'P0454', NULL, 3, 17, 1, NULL, 1985.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(434, 'MODULO TOMACORRIENTE', 'PLASNAVI', 'P0455', NULL, 3, 17, 1, NULL, 2053.23, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(435, 'MODULO TOMACORRIENTE', '20 AMP - PLASNAVI', 'P0456', NULL, 3, 17, 1, NULL, 3285.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(436, 'MODULO VARIADOR VENTILADOR JELUZ', 'JELUZ VERONA', 'P0457', NULL, 15, 17, 1, NULL, 12878.04, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(437, 'MODULO VENTILADOR VELOC.', 'PLASNAVI', 'P0458', NULL, 15, 17, 1, NULL, 10368.79, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(438, 'NIPLE ', ' ½ Pulgadas X 6CM', 'P0459', NULL, 4, 8, 1, NULL, 307.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(439, 'NIPLE ', '¾ Pulgadas X 6CM', 'P0460', NULL, 4, 8, 1, NULL, 412.70, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(440, 'NIPLE ', '¾ Pulgadas X 10CM', 'P0461', NULL, 4, 8, 1, NULL, 615.97, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(441, 'NIPLE ', '1 Pulgadas X 6M', 'P0462', NULL, 4, 8, 1, NULL, 631.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(442, 'PALA ANCHA BIASSONI', 'MOD. 992100', 'P0463', NULL, 1, 1, 1, NULL, 66729.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(443, 'PALA CORAZÓN BIASSONI', 'MOD.992110', 'P0464', NULL, 1, 1, 1, NULL, 56463.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(444, 'PALA PUNTA BIASSONI', 'MOD.992130', 'P0465', NULL, 1, 1, 1, NULL, 66729.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(445, 'PINCEL', '1 Pulgadas', 'P0466', NULL, 5, 16, 1, NULL, 1437.26, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(446, 'PINCEL', '1 ½ Pulgadas', 'P0467', NULL, 5, 16, 1, NULL, 2053.23, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(447, 'PINCEL', '2 ½Pulgadas;', 'P0468', NULL, 5, 16, 1, NULL, 3285.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(448, 'PINZA PICO LORO', 'CROSSMASTER 6 Pulgadas', 'P0469', NULL, 1, 2, 1, NULL, 14885.89, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(449, 'PINZA PUNTA MEDIA CAÑA', 'CROSSMASTER 6½ Pulgadas', 'P0470', NULL, 1, 2, 1, NULL, 12216.69, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(450, 'PINZA UNIV.', 'CROSSMASTER 7 Pulgadas', 'P0471', NULL, 1, 2, 1, NULL, 15912.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(451, 'PINZA UNIV.', 'CROSSMASTER 8 Pulgadas', 'P0472', NULL, 1, 2, 1, NULL, 19095.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(452, 'PLAFON S17- LED 18W', 'REDONDO', 'P0473', NULL, 14, 9, 1, NULL, 8373.22, 5437.44, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(453, 'PLAFON S17- LED 18W', 'CUADRADO', 'P0474', NULL, 14, 9, 1, NULL, 9170.41, 5955.13, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(454, 'PORTA CUCHILLAS ', '18 MM ECONO. CROSS', 'P0475', NULL, 8, 2, 1, NULL, 3341.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(455, 'PORTALAMPARA', 'PORCELANA C/GRAMPA  PulgadasL Pulgadas', 'P0476', NULL, 3, NULL, 1, NULL, 2056.02, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(456, 'PORTALAMPARA', 'PORCELANA C/GRAMPA 3/8', 'P0477', NULL, 3, NULL, 1, NULL, 2018.32, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(457, 'PORTALAMPARA', 'PVC', 'P0478', NULL, 3, NULL, 1, NULL, 1581.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(458, 'PROYECTOR HALOGENO', '150 W', 'P0479', NULL, 14, 9, 1, NULL, 12797.14, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(459, 'PROYECTOR HALOGENO', '500W CON LAMPARA', 'P0480', NULL, 14, 9, 1, NULL, 16977.54, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(460, 'PROYECTOR LED ', '10W LUZ FRÍA', 'P0481', NULL, 14, 9, 1, NULL, 6262.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(461, 'PROYECTOR LED 20W', '20W - NOVA ELECTRIC', 'P0483', NULL, 14, 9, 1, NULL, 7342.13, 5244.38, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-06-06 20:12:37'),
(462, 'PROYECTOR LED ', '100W LUZ FRÍA', 'P0484', NULL, 14, 9, 1, NULL, 27821.21, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(463, 'PROYECTOR LED ', '30W LUZ FRÍA', 'P0485', NULL, 14, 9, 1, NULL, 7802.26, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(464, 'PROYECTOR LED ', '20W - CAPOBIANCO', 'P0486', NULL, 14, 9, 1, NULL, 12319.36, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(465, 'RAMAL T', 'Ø40', 'P0487', NULL, 6, 8, 1, NULL, 985.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(466, 'RAMAL Y', 'Ø60°-45°', 'P0491', NULL, 6, 8, 1, NULL, 2102.51, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(467, 'RAMAL Y', 'Ø110°-45°', 'P0492', NULL, 6, 8, 1, NULL, 3798.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(468, 'RECEPTACULO', 'CURVO PVC', 'P0493', NULL, 4, NULL, 1, NULL, 3079.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(469, 'RECEPTACULO', 'RECTO PVC', 'P0494', NULL, 4, NULL, 1, NULL, 4311.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(470, 'RECEPTACULO', 'CURVO PORCELANA', 'P0495', NULL, 4, NULL, 1, NULL, 3634.21, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(471, 'REGATONES GOMA', 'Ø16MM', 'P0496', NULL, NULL, NULL, 1, NULL, 341.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(472, 'REGATONES GOMA', 'Ø19MM', 'P0497', NULL, NULL, NULL, 1, NULL, 343.91, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(473, 'REGATONES GOMA', 'Ø22MM', 'P0498', NULL, NULL, NULL, 1, NULL, 357.26, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(474, 'REGATONES GOMA', 'Ø25MM', 'P0499', NULL, NULL, NULL, 1, NULL, 364.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(475, 'REMACHES RÁPIDOS POP', '3,5 X 10 C/U', 'P0500', NULL, 7, 13, 1, NULL, 18.48, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(476, 'REMACHES RÁPIDOS POP', '3,5 X 12 C/U', 'P0501', NULL, 7, 13, 1, NULL, 20.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(477, 'REMACHES RÁPIDOS POP', '3,5 X 14 C/U', 'P0502', NULL, 7, 13, 1, NULL, 21.25, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(478, 'REMACHES RÁPIDOS POP', '3,5 X 16 C/U', 'P0503', NULL, 7, 13, 1, NULL, 22.59, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(479, 'REMACHES RÁPIDOS POP', '4 X 12 C/U', 'P0504', NULL, 7, 13, 1, NULL, 24.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(480, 'REMACHES RÁPIDOS POP', '4 X 16 C/U', 'P0505', NULL, 7, 13, 1, NULL, 27.51, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(481, 'REMACHES RÁPIDOS POP', '4 X 19 C/U', 'P0506', NULL, 7, 13, 1, NULL, 30.09, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(482, 'REMACHES RÁPIDOS POP', '4X 25 C/U', 'P0507', NULL, 7, 13, 1, NULL, 41.07, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(483, 'REMACHES RÁPIDOS POP', '4,8 X 10  C/U', 'P0508', NULL, 7, 13, 1, NULL, 42.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(484, 'REMACHES RÁPIDOS POP', '4,8 X 12 C/U ', 'P0509', NULL, 7, 13, 1, NULL, 43.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(485, 'REMACHES RÁPIDOS POP', '4,8 X 14 C/U', 'P0510', NULL, 7, 13, 1, NULL, 45.20, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(486, 'REMACHES RÁPIDOS POP', '4,8 X 16 C/U', 'P0511', NULL, 7, 13, 1, NULL, 45.94, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(487, 'REMACHES RÁPIDOS POP', '4,8 X 20 C/U', 'P0512', NULL, 7, 13, 1, NULL, 46.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(488, 'REMACHES RÁPIDOS POP', '4,8 X 25 C/U ', 'P0513', NULL, 7, 13, 1, NULL, 47.53, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(489, 'REMACHES RÁPIDOS POP', '5 X 12 C/U ', 'P0514', NULL, 7, 13, 1, NULL, 43.32, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(490, 'REMACHES RÁPIDOS POP', '5 X 14 C/U', 'P0515', NULL, 7, 13, 1, NULL, 61.75, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(491, 'REMACHES RÁPIDOS POP', '5 X 16 C/U', 'P0516', NULL, 7, 13, 1, NULL, 49.95, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(492, 'RIEL  SOPORTE RAPI-STAND', 'X PAR', 'P0517', NULL, 8, 8, 1, NULL, 23509.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(493, 'RODAMIENTO', 'SKF 6201', 'P0518', NULL, NULL, 4, 1, NULL, 5133.07, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(494, 'RODAMIENTO', 'SKF 6203', 'P0519', NULL, NULL, 4, 1, NULL, 6672.98, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(495, 'RODAMIENTO', 'SKF 2Z 6204', 'P0520', NULL, NULL, 4, 1, NULL, 5646.37, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(496, 'RODAMIENTO', 'SKF 6204 2RSH/C3 (BLINDADO)', 'P0521', NULL, NULL, 4, 1, NULL, 8212.90, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(497, 'RODAMIENTO', 'SKF 6205 2RSH', 'P0522', NULL, NULL, 4, 1, NULL, 8726.21, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(498, 'RODAMIENTO', 'SKF 6205 2RS1/C3', 'P0523', NULL, NULL, 4, 1, NULL, 9547.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(499, 'RODAMIENTO', 'SKF 6200 2RSH/C3', 'P0524', NULL, NULL, 4, 1, NULL, 12319.36, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(500, 'RODAMIENTO', '609', 'P0525', NULL, NULL, 4, 1, NULL, 7186.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(501, 'RODAMIENTO', 'NTN 6200 Z NR', 'P0526', NULL, NULL, 4, 1, NULL, 15399.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(502, 'RODAMIENTO', 'NTN 6202 LLUC3/2AS', 'P0527', NULL, NULL, 4, 1, NULL, 9239.52, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(503, 'RODAMIENTO', 'NSK 6200', 'P0528', NULL, NULL, 4, 1, NULL, 4414.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(504, 'RODAMIENTO', 'NSK 6201', 'P0529', NULL, NULL, 4, 1, NULL, 4619.76, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(505, 'RODAMIENTO', 'GBC 6204', 'P0530', NULL, NULL, 4, 1, NULL, 6159.68, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(506, 'RODAMIENTO', 'KBS 6002', 'P0531', NULL, NULL, 4, 1, NULL, 3593.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(507, 'RODAMIENTO', 'KOYO 629', 'P0532', NULL, NULL, 4, 1, NULL, 5338.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(508, 'SELLADOR GRIETA POMO', NULL, 'P0533', NULL, 11, 12, 1, NULL, 9342.18, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(509, 'SELLADOR SILICONA SUPRABOND', '280ML', 'P0534', NULL, 11, 12, 1, NULL, 7383.86, 4595.17, 80.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(510, 'SOGA TRENZADA PP', '6MM X MT', 'P0536', NULL, NULL, NULL, 1, NULL, 326.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(511, 'SOGA TRENZADA PP', '8MM X MT', 'P0537', NULL, NULL, NULL, 1, NULL, 605.70, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(512, 'SOGA TRENZADA PP', '10MM X MT', 'P0538', NULL, NULL, NULL, 1, NULL, 944.48, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(513, 'SOGA TRENZADA PP', '12MM X MT', 'P0539', NULL, NULL, NULL, 1, NULL, 1396.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(514, 'SOPORTE CORTINA', 'ALUMINIO½ ABIERTO', 'P0540', NULL, 8, 2, 1, NULL, 1190.87, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(515, 'SOPORTE CORTINA', 'ALUMINIO½ CERRADO', 'P0541', NULL, 8, 2, 1, NULL, 1190.87, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(516, 'SOPORTE CORTINA', 'HIERRO½ ABIERTO', 'P0542', NULL, 8, 2, 1, NULL, 872.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(517, 'SOPORTE CORTINA', 'HIERRO½ CERRADO', 'P0543', NULL, 8, 2, 1, NULL, 872.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(518, 'SOPORTE CORTINA', '5/8 ABIERTO Y CERRADO', 'P0544', NULL, 8, 2, 1, NULL, 923.95, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(519, 'SOPORTE ESTANTERÍA', '100 X 125', 'P0545', NULL, 8, 2, 1, NULL, 805.27, 522.93, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(520, 'SOPORTE ESTANTERÍA', '250 X 300', 'P0546', NULL, 8, 2, 1, NULL, 2566.71, 1652.02, 51.34, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(521, 'SOPORTE RAPI-STAND', '17CM X PAR', 'P0547', NULL, 8, 8, 1, NULL, 6980.97, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(522, 'SOPORTE RAPI-STAND', '27 CM X PAR', 'P0548', NULL, 8, 8, 1, NULL, 14372.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(523, 'SOPORTE RAPI-STAND', '37 X PAR', 'P0549', NULL, 8, 8, 1, NULL, 17452.43, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(524, 'TAPA BASTIDOR JELUZ', 'JELUZ VERONA', 'P0550', NULL, 8, 17, 1, NULL, 1026.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(525, 'TAPA BASTIDOR', 'PLASNAVI', 'P0551', NULL, 8, 17, 1, NULL, 1026.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(526, 'TAPA INODORO', NULL, 'P0552', NULL, 8, NULL, 1, NULL, 16528.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(527, 'TAPA PORTA MODULO EXT. JELUZ', 'JELUZ EXTERIOR', 'P0553', NULL, 3, 17, 1, NULL, 804.29, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(528, 'TAPON ROSCA HEMBRA', '½ Pulgadas', 'P0554', NULL, 4, 8, 1, NULL, 216.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(529, 'TAPON ROSCA HEMBRA', '¾ Pulgadas', 'P0555', NULL, 4, 8, 1, NULL, 302.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(530, 'TAPON ROSCA HEMBRA', '1 Pulgadas', 'P0556', NULL, 4, 8, 1, NULL, 564.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(531, 'TAPON ROSCA MACHO', '½ Pulgadas', 'P0557', NULL, 4, 8, 1, NULL, 248.44, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(532, 'TAPON ROSCA MACHO', '¾ Pulgadas', 'P0558', NULL, 4, 8, 1, NULL, 270.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(533, 'TAPON ROSCA MACHO', '1 Pulgadas', 'P0559', NULL, 4, 8, 1, NULL, 1006.08, 700.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(534, 'TARUGO', 'Ø6', 'P0560', NULL, 7, NULL, 1, NULL, 28.66, 12.14, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(535, 'TARUGO', 'Ø8', 'P0561', NULL, 7, NULL, 1, NULL, 56.48, 25.18, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(536, 'TARUGO', 'Ø10', 'P0562', NULL, NULL, NULL, 1, NULL, 56.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(537, 'TARUGO', 'Ø12', 'P0563', NULL, NULL, NULL, 1, NULL, 130.38, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(538, 'TARUGO LADO HUECO ', 'Ø6', 'P0564', NULL, NULL, NULL, 1, NULL, 43.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(539, 'TARUGO LADO HUECO ', 'Ø8', 'P0565', NULL, NULL, NULL, 1, NULL, 65.70, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(540, 'TARUGO LADO HUECO ', 'Ø10', 'P0566', NULL, NULL, NULL, 1, NULL, 118.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(541, 'TEE ESPIGA', '1/2 Pulgadas', 'P0567', NULL, 4, 8, 1, NULL, 652.40, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(542, 'TEE ESPIGA', '3/4 Pulgadas', 'P0568', NULL, 4, 8, 1, NULL, 704.01, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02');
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `codigo_barra`, `modelo`, `categoria_id`, `marca_id`, `unidad_medida_id`, `proveedor_id`, `precio`, `precio_costo`, `margen_ganancia`, `stock`, `unidad_medida`, `stock_minimo`, `ubicacion_deposito`, `imagen`, `activo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(543, 'TEE ESPIGA', '1 Pulgadas', 'P0569', NULL, 4, 8, 1, NULL, 982.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(544, 'TENAZA CARPINTERO', 'PROF.CROSS. 7 Pulgadas', 'P0570', NULL, 1, 2, 1, NULL, 17072.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(545, 'TENDEDERO CALESITA', 'BASE DE CEMENTO', 'P0571', NULL, 9, 2, 1, NULL, 118060.51, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(546, 'TENDEDERO EXTENSIBLE', '7 VARILLAS', 'P0572', NULL, 9, 2, 1, NULL, 37984.68, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(547, 'TORNILLOS CABEZA FRESADA 1/8', '1/8 X 1 Pulgadas', 'P0574', NULL, 7, 13, 1, NULL, 23.33, 6.10, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(548, 'TORNILLOS CABEZA FRESADA 1/8', '1/8 X 2 Pulgadas', 'P0575', NULL, 7, 13, 1, NULL, 41.13, 6.10, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(549, 'TORNILLOS CABEZA FRESADA 1/8', '1/8 X 1/2 Pulgadas', 'P0576', NULL, 7, 13, 1, NULL, 14.18, 6.10, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(550, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 1/4', 'P0577', NULL, 7, 13, 1, NULL, 17.31, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(551, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 1/2', 'P0578', NULL, 7, 13, 1, NULL, 24.96, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(552, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 3/4', 'P0579', NULL, 7, 13, 1, NULL, 33.06, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(553, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 1', 'P0580', NULL, 7, 13, 1, NULL, 40.99, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(554, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 1 1/2', 'P0581', NULL, 7, 13, 1, NULL, 55.60, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(555, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 2', 'P0582', NULL, 7, 13, 1, NULL, 69.48, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(556, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 2 1/2', 'P0583', NULL, 7, 13, 1, NULL, 84.11, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(557, 'TORNILLOS CABEZA FRESADA 5/32', '5/32 X 3', 'P0584', NULL, 7, 13, 1, NULL, 97.53, 7.30, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(558, 'TORNILLOS CABEZA FRESADA 3/16', '3/16 X 1 Pulgadas', 'P0585', NULL, 7, 13, 1, NULL, 49.51, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(559, 'TORNILLOS CABEZA FRESADA 3/16', '3/16 X 1 1/2', 'P0586', NULL, 7, 13, 1, NULL, 67.35, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(560, 'TORNILLOS CABEZA FRESADA 3/16', '3/16 X 2 Pulgadas', 'P0587', NULL, 7, 13, 1, NULL, 86.18, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(561, 'TORNILLOS CABEZA FRESADA 3/16', '3/16 X 3 Pulgadas', 'P0588', NULL, 7, 13, 1, NULL, 120.57, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(562, 'TORNILLOS CABEZA FRESADA 1/4', '1/4 X 1/2Pulgadas;', 'P0589', NULL, 7, 13, 1, NULL, 66.61, 10.20, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(563, 'TORNILLOS CABEZA FRESADA 1/4', '1/4 X 3/4', 'P0590', NULL, 7, 13, 1, NULL, 86.11, 10.20, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(564, 'TORNILLOS CABEZA FRESADA 1/4', '1/4 X 1Pulgadas;', 'P0591', NULL, 7, 13, 1, NULL, 94.84, 10.20, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(565, 'TORNILLOS CABEZA FRESADA 1/4', '1/4 X 1 1/2 Pulgadas', 'P0592', NULL, 7, 13, 1, NULL, 126.09, 10.20, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(566, 'TORNILLOS CABEZA FRESADA 5/6', '5/6 X 1/2', 'P0593', NULL, 7, 13, 1, NULL, 99.79, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(567, 'TORNILLOS CABEZA FRESADA 5/6', '5/6 X 3/4', 'P0594', NULL, 7, 13, 1, NULL, 111.64, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(568, 'TORNILLOS CABEZA FRESADA 5/6', '5/6 X 1', 'P0595', NULL, 7, 13, 1, NULL, 97.12, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(569, 'TORNILLOS CABEZA REDONDA 1/4', '1/4 X 1/2', 'P0596', NULL, 7, 13, 1, NULL, 55.51, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(570, 'TORNILLOS CABEZA REDONDA 1/4', '1/4 X 3/4', 'P0597', NULL, 7, 13, 1, NULL, 71.45, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(571, 'TORNILLOS CABEZA REDONDA 1/4', '1/4 X 1', 'P0598', NULL, 7, 13, 1, NULL, 79.03, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(572, 'TORNILLOS CABEZA REDONDA 1/4', '1/4 X 1 1/2', 'P0599', NULL, 7, 13, 1, NULL, 105.07, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(573, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 1/2', 'P0600', NULL, 7, 13, 1, NULL, 99.79, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(574, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 3/4', 'P0601', NULL, 7, 13, 1, NULL, 111.64, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(575, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 1', 'P0602', NULL, 7, 13, 1, NULL, 97.12, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(576, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 1 1/4', 'P0603', NULL, 7, 13, 1, NULL, 149.89, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(577, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 1 1/2', 'P0604', NULL, 7, 13, 1, NULL, 174.72, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(578, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 1 3/4 ', 'P0605', NULL, 7, 13, 1, NULL, 192.95, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(579, 'TORNILLOS CABEZA REDONDA 5/16', '5/16 X 2', 'P0606', NULL, 7, 13, 1, NULL, 212.00, 12.80, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(580, 'TORNILLOS CABEZA TANQUE 3/16', ' 3/16 X 1/2 Pulgadas', 'P0607', NULL, 7, 13, 1, NULL, 30.50, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(581, 'TORNILLOS CABEZA TANQUE 3/16', '3/16 X 1 Pulgadas', 'P0608', NULL, 7, 13, 1, NULL, 49.51, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(582, 'TORNILLOS CABEZA TANQUE 3/16', '3/16 X 1 1/2 Pulgadas', 'P0609', NULL, 7, 13, 1, NULL, 67.35, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(583, 'TORNILLOS CABEZA TANQUE 3/16', '3/16 X 2 1/2 Pulgadas', 'P0610', NULL, 7, 13, 1, NULL, 98.43, 8.60, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(584, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 1/4', 'P0611', NULL, 7, 13, 1, NULL, 37.75, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(585, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 1/2', 'P0612', NULL, 7, 13, 1, NULL, 55.51, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(586, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 3/4', 'P0613', NULL, 7, 13, 1, NULL, 71.45, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(587, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 1', 'P0614', NULL, 7, 13, 1, NULL, 79.03, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(588, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 1 1/4 ', 'P0615', NULL, 7, 13, 1, NULL, 93.62, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(589, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 1 1/2', 'P0616', NULL, 7, 13, 1, NULL, 105.07, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(590, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 2 ', 'P0617', NULL, 7, 13, 1, NULL, 134.39, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(591, 'TORNILLOS CABEZA TANQUE 1/4', '1/4 X 2 1/2 Pulgadas', 'P0618', NULL, 7, 13, 1, NULL, 165.48, 10.20, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(592, 'TORNILLOS FIX DORADO', '5 X 40 ', 'P0619', NULL, 7, 13, 1, NULL, 32.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(593, 'TORNILLOS FIX DORADO', '5 X 50', 'P0620', NULL, 7, 13, 1, NULL, 37.88, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(594, 'TORNILLOS FIX DORADO', '6 X 40', 'P0621', NULL, 7, 13, 1, NULL, 53.13, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(595, 'TORNILLOS FIX DORADO', '6 X 50', 'P0622', NULL, 7, 13, 1, NULL, 60.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(596, 'TORNILLOS FIX NEGRO 6 x 3/4', '6X3/4 Pulgadas MADERA X500-PRF', 'P0623', NULL, 7, 13, 1, NULL, 37.73, 15.98, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(597, 'TORNILLOS FIX NEGRO 6 x 1', '6X1 Pulgadas MADERA X500-PRF', 'P0624', NULL, 7, 13, 1, NULL, 41.91, 17.75, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(598, 'TORNILLOS FIX NEGRO 6 x 5/8', '6X5/8 Pulgadas MADERA X500-PRF', 'P0625', NULL, 7, 13, 1, NULL, 35.89, 15.20, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(599, 'TORNILLOS FIX NEGRO 6 x 1 1/4', '6X1 Pulgadas1/4 MADERA X500-PRF', 'P0626', NULL, 7, 13, 1, NULL, 45.80, 19.40, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(600, 'TORNILLOS FIX NEGRO 6 x 1 1/2', '6X1 Pulgadas1/2 MADERA X500-PRF', 'P0627', NULL, 7, 13, 1, NULL, 54.85, 23.23, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(601, 'TORNILLOS FIX NEGRO 6 x 2', '6X2 Pulgadas MADERA X300-PRF', 'P0629', NULL, 7, 13, 1, NULL, 69.58, 29.47, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(602, 'TORNILLOS FIX NEGRO 8 x 3', '8X3 Pulgadas MADERA X300-PRF', 'P0636', NULL, 7, 13, 1, NULL, 74.94, 31.74, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(603, 'TORNILLOS INODORO', '22 X 70 MM C/U', 'P0637', NULL, 7, 13, 1, NULL, 1077.94, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:14', '2026-05-29 12:51:02'),
(604, 'TORNILLOS PARKER 10', '10 X 1/2', 'P0638', NULL, 7, 13, 1, NULL, 31.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(605, 'TORNILLOS PARKER 10', '10 X 3/4', 'P0639', NULL, 7, 13, 1, NULL, 38.03, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(606, 'TORNILLOS PARKER 10', '10 X 1', 'P0640', NULL, 7, 13, 1, NULL, 43.47, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(607, 'TORNILLOS PARKER 10', '10 X 1 1/4', 'P0641', NULL, 7, 13, 1, NULL, 57.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(608, 'TORNILLOS PARKER 10', '10 X 2 ', 'P0642', NULL, 7, 13, 1, NULL, 79.80, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(609, 'TORNILLOS PARKER 12', '12 X 1/2', 'P0643', NULL, 7, 13, 1, NULL, 39.01, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(610, 'TORNILLOS PARKER 12', '12 X 3/4', 'P0644', NULL, 7, 13, 1, NULL, 51.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(611, 'TORNILLOS PARKER 12', '12 X 1', 'P0645', NULL, 7, 13, 1, NULL, 62.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(612, 'TORNILLOS PARKER 14', '14 X 1/2 ', 'P0646', NULL, 7, 13, 1, NULL, 52.77, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(613, 'TORNILLOS PARKER 14', '14 X 3/4', 'P0647', NULL, 7, 13, 1, NULL, 68.10, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(614, 'TORNILLOS PARKER 14', '14 X 1', 'P0648', NULL, 7, 13, 1, NULL, 80.74, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(615, 'TORNILLOS PARKER 14', '14 X 1 1/2', 'P0649', NULL, 7, 13, 1, NULL, 112.67, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(616, 'TORNILLOS PARKER 4', '4 X 1/4', 'P0650', NULL, 7, 13, 1, NULL, 9.80, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(617, 'TORNILLOS PARKER 4', '4 X 1/2', 'P0651', NULL, 7, 13, 1, NULL, 12.56, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(618, 'TORNILLOS PARKER 4', '4 X 3/4', 'P0652', NULL, 7, 13, 1, NULL, 18.42, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(619, 'TORNILLOS PARKER 4', '4 X  1', 'P0653', NULL, 7, 13, 1, NULL, 22.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(620, 'TORNILLOS PARKER 6', '6 X 1/4', 'P0654', NULL, 7, 13, 1, NULL, 13.35, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(621, 'TORNILLOS PARKER 6', '6 X 3/8', 'P0655', NULL, 7, 13, 1, NULL, 16.96, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(622, 'TORNILLOS PARKER 6', '6 X 1/2', 'P0656', NULL, 7, 13, 1, NULL, 16.58, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(623, 'TORNILLOS PARKER 6', '6 X 3/4', 'P0657', NULL, 7, 13, 1, NULL, 21.74, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(624, 'TORNILLOS PARKER 6', '6 X 1 ', 'P0658', NULL, 7, 13, 1, NULL, 27.40, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(625, 'TORNILLOS PARKER 6', '6 X 1 1/2', 'P0659', NULL, 7, 13, 1, NULL, 40.54, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(626, 'TORNILLOS PARKER 7', '7 X 1/2', 'P0660', NULL, 7, 13, 1, NULL, 21.28, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(627, 'TORNILLOS PARKER 7', '7 X 1', 'P0661', NULL, 7, 13, 1, NULL, 32.35, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(628, 'TORNILLOS PARKER 7', '7 X 1 1/4', 'P0662', NULL, 7, 13, 1, NULL, 38.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(629, 'TORNILLOS PARKER 7', '7 X 1 1/2', 'P0663', NULL, 7, 13, 1, NULL, 47.74, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(630, 'TORNILLOS PARKER 7', '7 X 3/4', 'P0664', NULL, 7, 13, 1, NULL, 28.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-14 20:21:46'),
(631, 'TORNILLOS PARKER 8', '8 X 1/2', 'P0665', NULL, 7, 13, 1, NULL, 23.83, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(632, 'TORNILLOS PARKER 8', '8 X 3/4', 'P0666', NULL, 7, 13, 1, NULL, 29.87, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(633, 'TORNILLOS PARKER 8', '8 X 1', 'P0667', NULL, 7, 13, 1, NULL, 36.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(634, 'TORNILLOS PARKER 8', '8 X 1 1/2', 'P0668', NULL, 7, 13, 1, NULL, 55.05, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(635, 'TORNILLOS PARKER 8', '8 X 2 ', 'P0669', NULL, 7, 13, 1, NULL, 71.32, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(636, 'TUBO 18W LED', '288 LED 120CM', NULL, NULL, 14, 9, 1, NULL, 3300.00, 2200.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-06-01 19:36:26'),
(637, 'UNION DOBLE', '½ Pulgadas', 'P0671', NULL, 4, 8, 1, NULL, 1255.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(638, 'UNION DOBLE', '¾ Pulgadas', 'P0672', NULL, 4, 8, 1, NULL, 3263.91, 2270.93, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(639, 'UNION DOBLE', '1 Pulgadas', 'P0673', NULL, 4, 8, 1, NULL, 3285.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(640, 'UNION PARA CAÑO', '20MM', 'P0674', NULL, 4, 14, 1, NULL, 294.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(641, 'UNION PARA CAÑO', '22MM', 'P0675', NULL, 4, 14, 1, NULL, 400.38, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(642, 'VALVULA DE RETENCIÓN PVC', 'C/CANASTA 3/4', 'P0676', NULL, 4, NULL, 1, NULL, 6159.68, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(643, 'VALVULA ESFÉRICA PVC', '1 Pulgadas', 'P0679', NULL, 4, NULL, 1, NULL, 6510.92, 4530.10, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(644, 'VALVULA EXCLUSA BRONCE', '1 Pulgadas', 'P0680', NULL, 4, NULL, 1, NULL, 20326.94, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(645, 'VALVULA RETENCIÓN BRONCE', '3/4', 'P0681', NULL, 4, NULL, 1, NULL, 16939.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(646, 'VALVULA RETENCIÓN BRONCE', '1 Pulgadas', 'P0682', NULL, 4, NULL, 1, NULL, 25870.65, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(647, 'VENTILADOR DE TECHO', 'BENJAMIN- 4P', 'P0683', NULL, 15, NULL, 1, NULL, 92959.81, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(648, 'VENTILADOR DE TECHO', 'CODINI- 4P', 'P0684', NULL, 15, NULL, 1, NULL, 98421.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(649, 'VENTILADOR DE TECHO', 'EVEREST- 3P', 'P0685', NULL, 15, NULL, 1, NULL, 87570.09, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(650, 'VENTILADOR DE TECHO', 'SELENE- 4P MADERA C/APLIQUE', 'P0686', NULL, 15, NULL, 1, NULL, 109406.15, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(651, 'ZAPATILLA CON CABLE', '1.5 MT', 'P0687', NULL, 3, NULL, 1, NULL, 20686.25, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(652, 'ZOCALOS PUERTA ALUMINIO', '60CM', 'P0688', NULL, 8, 2, 1, NULL, 2771.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(653, 'ZOCALOS PUERTA ALUMINIO', '70CM', 'P0689', NULL, 8, 2, 1, NULL, 2771.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(654, 'ZOCALOS PUERTA ALUMINIO', '80CM', 'P0690', NULL, 8, 2, 1, NULL, 2936.11, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(655, 'ZOCALOS PUERTA ALUMINIO', '90CM', 'P0691', NULL, 8, 2, 1, NULL, 3326.23, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(656, 'ZOCALOS PUERTA ALUMINIO', '100CM', 'P0692', NULL, 8, 2, 1, NULL, 3654.74, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(657, 'w 40', '155 g', 'P0693', NULL, 8, 16, 1, NULL, 6929.63, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-05-29 12:51:02'),
(658, 'ACEITODO', '90 g', 'P0694', NULL, 11, 16, 1, NULL, 5133.07, 0.00, 30.00, 3.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-13 19:35:15', '2026-06-08 14:25:51'),
(659, 'prueba de la logica', 'A ver si funca', '2139290', NULL, 5, NULL, 12, NULL, 13000.00, 10000.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, '2026-02-15 00:30:23', '2026-02-15 00:30:14', '2026-02-15 00:30:23'),
(660, 'KIT AMOLADORA 115mm + TALADRO 13mm LUSQTOFF', '', 'KATL-8', NULL, 2, NULL, NULL, NULL, 195056.48, 0.00, 30.00, 1.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-18 21:35:06', '2026-05-29 12:51:02'),
(661, 'AMOLADORA ANGULAR 720W LUSQTOFF', '', 'L-820', NULL, 2, NULL, NULL, NULL, 64950.33, 42798.00, 70.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-18 22:02:05', '2026-06-08 14:24:52'),
(662, 'TALADRO PERCUTOR 710W', '', 'TPL710-8', NULL, 2, NULL, NULL, NULL, 89828.64, 0.00, 30.00, 1.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-18 22:02:52', '2026-05-29 12:51:02'),
(663, 'ATORNILLADOR C/TORQUE', 'TAL300-8', 'TAL300-8', NULL, 2, NULL, NULL, NULL, 74891.42, 0.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, '2026-06-05 19:42:52', '2026-02-18 22:05:26', '2026-06-05 19:42:52'),
(664, 'TALADRO ATORNILLADOR 12 V', '', 'TIL23-8KB', NULL, 2, NULL, NULL, NULL, 149782.84, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-06-05 19:35:21', '2026-02-18 22:08:51', '2026-06-05 19:35:21'),
(665, 'FUMIGADOR PULVERIZADOR 5LTS LUSQTOFF', '', 'FPL5', NULL, 1, NULL, NULL, NULL, 29370.06, 0.00, 30.00, 1.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-18 22:14:20', '2026-05-29 12:51:02'),
(666, 'CAJA HERRAMIENTAS 40CM (16&quot;)', '', NULL, NULL, 8, NULL, NULL, NULL, 30900.00, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, '2026-02-18 22:26:14', '2026-02-18 22:16:06', '2026-02-18 22:26:14'),
(667, 'CAJA HERRAMIENTAS 40CM (16&quot;)', '', 'CH40CM', NULL, 8, NULL, NULL, NULL, 33047.55, 0.00, 30.00, 1.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-18 22:27:18', '2026-05-29 12:51:02'),
(668, 'CAJA HERRAMIENTAS 48CM (19&quot;)', '', 'CH48CM', NULL, 8, NULL, NULL, NULL, 42138.30, 0.00, 30.00, 1.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-18 22:28:17', '2026-05-29 12:51:02'),
(669, 'CAJA HERRAMIENTAS 56CM (22&quot;)', '', 'CH56CM', NULL, 8, NULL, NULL, NULL, 60105.90, 0.00, 30.00, 1.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-18 22:28:53', '2026-05-29 12:51:02'),
(670, 'CABLE PARALELO', '2 x 0.75', 'CP2X075', NULL, 3, NULL, NULL, NULL, 975.28, 0.00, 30.00, 999998.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:12:52', '2026-05-29 12:51:02'),
(671, 'CABLE PARALELO', '2 x 1.5', 'CP2X1.5', NULL, 3, NULL, NULL, NULL, 1129.27, 0.00, 30.00, 9999999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:14:10', '2026-05-29 12:51:02'),
(672, 'CABLE VAINA CHATA', '2 X 1', 'CVC2X1', NULL, 3, NULL, NULL, NULL, 1016.35, 0.00, 30.00, 999999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:15:08', '2026-05-29 12:51:02'),
(673, 'CABLE VAINA CHATA', '2 x 1.5', 'CVC2X1.5', NULL, 3, NULL, NULL, NULL, 1406.46, 0.00, 30.00, 999999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:15:54', '2026-05-29 12:51:02'),
(674, 'CABLE VAINA CHATA', '2 x 2.5', 'CVC2X2.5', NULL, 3, NULL, NULL, NULL, 2258.55, 0.00, 30.00, 9999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:16:36', '2026-05-29 12:51:02'),
(675, 'CABLE VAINA CHATA', '2 x 4', 'CVC2x4', NULL, 3, NULL, NULL, NULL, 3387.82, 0.00, 30.00, 9999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:17:30', '2026-05-29 12:51:02'),
(676, 'CABLE VAINA CHATA', '3 x 1', 'CVC3x1', NULL, 3, NULL, NULL, NULL, 1303.79, 0.00, 30.00, 9999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-19 15:18:06', '2026-05-29 12:51:02'),
(677, 'CABLE VAINA CHATA', '3 x 1.5', 'CVC3x1.5', NULL, 3, NULL, NULL, NULL, 2022.42, 0.00, 30.00, 9999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-20 13:15:42', '2026-05-29 12:51:02'),
(678, 'CABLE VAINA CHATA', '3 x 2.5', 'CVC3x2.5', NULL, 3, NULL, NULL, NULL, 3182.50, 0.00, 30.00, 9999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-20 13:16:19', '2026-05-29 12:51:02'),
(679, 'Ficha Comun Macho Hembra', '', NULL, NULL, 3, NULL, NULL, NULL, 1500.00, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, '2026-03-21 20:16:23', '2026-02-24 12:46:52', '2026-03-21 20:16:23'),
(680, 'Modulo USV', '', NULL, NULL, 2, NULL, NULL, NULL, 3901.13, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-24 13:58:04', '2026-05-29 12:51:02'),
(681, 'Modulo USV', '', NULL, NULL, 3, NULL, NULL, NULL, 3901.13, 0.00, 30.00, 5.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-24 14:00:05', '2026-05-29 12:51:02'),
(682, 'MODULO USB', '', NULL, NULL, 3, NULL, NULL, NULL, 2243.15, 0.00, 30.00, 99999.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-25 12:39:04', '2026-05-29 12:51:02'),
(683, 'BUSCAPOLO', 'BUSCAPOLO 190 MM', 'BCPL', NULL, 1, NULL, NULL, NULL, 2566.53, 0.00, 30.00, 6.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-26 19:54:00', '2026-05-29 12:51:02'),
(684, 'PISTOLA APLICADORA', 'PARA CARTUCHO 280 ML', 'PIAP', NULL, 1, NULL, NULL, NULL, 9752.83, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-02-26 19:55:25', '2026-05-29 12:51:02'),
(685, 'CAJA HERRAMIENTAS BROCHES METÁLICOS', '43 CM (17Pulgadas;)', 'CH43CM', NULL, 1, NULL, NULL, NULL, 35293.50, 22000.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-26 19:57:13', '2026-05-29 12:51:02'),
(686, 'KIT 108 PIEZAS LÜSQTOFF', 'SET108LQ', 'SET108LQ', NULL, 1, NULL, NULL, NULL, 138592.77, 77.59, 74.00, 0.010, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-02-26 19:58:40', '2026-05-29 12:51:02'),
(687, 'AGUA RRAZ', 'x 900 CM3', 'AGRRZ900', NULL, 5, NULL, NULL, NULL, 4311.78, 0.00, 30.00, 2.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-03 21:46:27', '2026-06-08 14:28:41'),
(688, 'AGUA RRAZ', 'x 500 cm3', 'AGRRZ500', NULL, 5, NULL, NULL, NULL, 3079.83, 0.00, 30.00, 1.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-03 21:47:21', '2026-06-08 14:29:07'),
(689, 'RODILLO LANAR', 'LARGO', 'RODLAN', NULL, 5, NULL, NULL, NULL, 23612.10, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-03-03 21:50:01', '2026-05-29 12:51:02'),
(690, 'VALVULA RETENCIÓN 1&quot;', 'PVC', 'VRET1', NULL, 4, NULL, NULL, NULL, 10368.79, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-03-03 21:51:18', '2026-05-29 12:51:02'),
(691, 'ACEITE AEROSOL WD-40', 'CHICO', 'AWD40C', NULL, 11, NULL, NULL, NULL, 8726.21, 0.00, 30.00, 1.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-03 21:53:49', '2026-06-08 14:26:09'),
(692, 'PINCEL', '2Pulgadas;', 'PIN2&quot;', NULL, 5, NULL, NULL, NULL, 2771.86, 0.00, 30.00, 0.000, 'unid', 5.000, NULL, NULL, 1, NULL, '2026-03-03 21:56:14', '2026-05-29 12:51:02'),
(693, 'TORNILLOS AUTOPERF HEXAGONAL', '14 X 1 1/2Pulgadas;', 'TAUPM14X1.5', NULL, 7, NULL, NULL, NULL, 271.03, 160.00, 50.00, 100.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-09 20:03:38', '2026-05-29 12:51:02'),
(694, 'TORNILLOS AUTOPERF HEXAGONAL', '14 X 2 Pulgadas;', 'TAUPM14X2', NULL, 7, NULL, NULL, NULL, 197.62, 116.67, 50.00, 100.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-09 20:05:32', '2026-05-29 12:51:02'),
(695, 'TORNILLOS AUTOPERF HEXAGONAL', '14 X 2 1/2 Pulgadas', 'TAUPM14X2.5', NULL, 7, NULL, NULL, NULL, 237.15, 140.00, 50.00, 100.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-09 20:05:55', '2026-05-29 12:51:02'),
(696, 'BOMBA PERIFERICA LÜSQTOFF 1/2 HP', '', 'BPLUSQ', NULL, 2, NULL, NULL, NULL, 59985.00, 43000.00, 50.00, 2.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-09 22:47:35', '2026-05-29 18:51:40'),
(697, 'TORNILLOS AUTOPERF PRUEBA 1', '3 X 14', 'TORUPF1', NULL, 7, NULL, NULL, NULL, 1560.00, 1200.00, 30.00, 10.000, 'unid', 0.000, NULL, NULL, 1, '2026-03-10 22:01:55', '2026-03-10 21:52:45', '2026-03-10 22:01:55'),
(698, 'HIDROLAVADORA A BATERIA LÜSQTOFF', 'LAPL3.6-8BK', 'HLUS', NULL, 2, NULL, NULL, NULL, 243110.00, 151.00, 40.00, 1.000, 'unid', 0.000, NULL, NULL, 1, '2026-05-08 20:54:23', '2026-03-11 20:15:41', '2026-05-08 20:54:23'),
(699, 'HIDROLAVADORA ELECTRICA LÜSQTOFF', 'HL100-7', 'HELUSQ', NULL, 2, NULL, NULL, NULL, 154.10, 0.00, 30.00, 0.010, 'unid', 0.000, NULL, NULL, 1, '2026-05-08 20:54:42', '2026-03-12 20:12:23', '2026-05-08 20:54:42'),
(700, 'ASPIRADORA ELECTRICA LÜSQTOFF', 'LA-1500MM', 'AELUS', NULL, 2, NULL, NULL, NULL, 142699.21, 0.00, 30.00, 0.010, 'unid', 0.000, NULL, NULL, 1, '2026-06-05 19:37:45', '2026-03-12 20:14:08', '2026-06-05 19:37:45'),
(701, 'KIT BOCALLAVES 216 PIEZAS', 'MARCA: OMAHA', 'KIT216', NULL, 13, NULL, NULL, NULL, 307983.92, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-12 20:59:01', '2026-05-29 12:51:02'),
(702, 'KIT AMOLADORA + TALADRO IMPACTO', 'MARCA: BEVVOLT BV-2K20B', NULL, NULL, 2, NULL, NULL, NULL, 333649.25, 0.00, 30.00, 1.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-12 21:55:59', '2026-05-29 12:51:02'),
(703, 'CINTA AISLADORA TACSA X 10MTS', '', 'CINAISLAX10', NULL, 3, NULL, NULL, NULL, 2125.70, 1479.00, 40.00, 10.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-19 21:37:21', '2026-05-29 12:51:02'),
(704, 'CINTA AISLADORA VINI TAPE X 20MTS', '', NULL, NULL, 3, NULL, NULL, NULL, 1950.56, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-19 21:38:06', '2026-05-29 12:51:02'),
(705, 'FICHA MACHO BI USO EXXULT 3P', '10 Amp', 'FM3P', NULL, 3, NULL, NULL, NULL, 1683.05, 1216.34, 55.00, 25.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 20:15:21', '2026-05-29 12:51:02'),
(706, 'FICHA HEMBRA BI USO EXXULT 3P', '10 Amp', 'FH3P', NULL, 3, NULL, NULL, NULL, 1935.51, 1216.34, 55.00, 25.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 20:16:06', '2026-05-29 12:51:02'),
(707, 'LAMPARA LED 15W', '15W - E27', 'PO309', NULL, 3, NULL, NULL, NULL, 2043.21, 1362.14, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 20:24:35', '2026-06-05 20:11:53'),
(708, 'CAÑO HIERRO SEMI PESADO 5/8', 'PRECIO X CAÑO', NULL, NULL, 3, NULL, NULL, NULL, 7699.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 21:17:07', '2026-05-29 12:51:02'),
(709, 'CAÑO HIERRO SEMI PESADO 7/8', 'PRECIO X CAÑO', NULL, NULL, 13, NULL, NULL, NULL, 9650.16, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 21:17:51', '2026-05-29 12:51:02'),
(710, 'CAÑO HIERRO SEMI PESADO 1&quot;', 'PRECIO X CAÑO', NULL, NULL, 3, NULL, NULL, NULL, 11200.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-03-21 21:19:11', '2026-03-21 21:18:57', '2026-03-21 21:19:11'),
(711, 'CAÑO HIERRO SEMI PESADO 1 Pulgada', 'PRECIO X CAÑO', NULL, NULL, 3, NULL, NULL, NULL, 11498.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 21:19:39', '2026-05-29 12:51:02'),
(712, 'CAÑO HIERRO SEMI PESADO 1 1/4', 'PRECIO X CAÑO', NULL, NULL, 3, NULL, NULL, NULL, 15501.85, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 21:20:16', '2026-05-29 12:51:02'),
(713, 'SPAGUETTI TERMOCONTRAIBLE 1/8', 'PRECIO X MT', NULL, NULL, 3, NULL, NULL, NULL, 1231.93, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 21:21:47', '2026-05-29 12:51:02'),
(714, 'SPAGUETTI TERMOCONTRAIBLE 6mm', 'PRECIO X MT', NULL, NULL, 13, NULL, NULL, NULL, 1026.62, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-21 21:22:22', '2026-05-29 12:51:02'),
(715, 'TUBO 9 W LED', '60 CM', 'TL9W', NULL, 14, NULL, NULL, NULL, 3807.86, 2060.64, 80.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 19:18:21', '2026-05-29 12:51:02'),
(716, 'TUBO 8W LED', '45 CM', 'TL8W', NULL, 14, NULL, NULL, NULL, 6541.79, 3540.11, 80.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 19:20:26', '2026-05-29 12:51:02'),
(717, 'TUBO 12 W LED', '90 CM VIDRIO', 'TL12W', NULL, 14, NULL, NULL, NULL, 5292.46, 2864.04, 80.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 19:21:40', '2026-05-29 12:51:02'),
(718, 'TUBO 25W LED', '150 CM', 'TL25W', NULL, 14, NULL, NULL, NULL, 9333.62, 5050.92, 80.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 19:22:49', '2026-05-29 12:51:02'),
(719, 'AUTOMATICO TANQUE C-500', 'C-500', 'AUTC-500', NULL, 4, NULL, NULL, NULL, 7038.71, 4381.83, 56.47, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:04:58', '2026-05-29 12:51:02'),
(720, 'TUERCA 1/8', '', 'T1.8', NULL, 7, NULL, NULL, NULL, 30.80, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:14:11', '2026-05-29 12:51:02'),
(721, 'TUERCA 5/32', '', 'T5.32', NULL, 7, NULL, NULL, NULL, 25.67, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:14:54', '2026-05-29 12:51:02'),
(722, 'TUERCA 3/16', '', 'T3.16', NULL, 7, NULL, NULL, NULL, 26.69, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:15:27', '2026-05-29 12:51:02'),
(723, 'TUERCA 1/4', '', 'T1.4', NULL, 7, NULL, NULL, NULL, 51.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:16:40', '2026-05-29 12:51:02'),
(724, 'TUERCA 5/16', '', 'T5.16', NULL, 7, NULL, NULL, NULL, 56.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:19:23', '2026-05-29 12:51:02'),
(725, 'TUERCA 3/8', '', 'T3.8', NULL, 7, NULL, NULL, NULL, 71.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:20:09', '2026-05-29 12:51:02'),
(726, 'ARANDELA PLANA 1/8', '', 'AP1.8', NULL, 7, NULL, NULL, NULL, 51.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:22:00', '2026-05-29 12:51:02'),
(727, 'ARANDELA PLANA 5/32', '', 'AP5.32', NULL, 7, NULL, NULL, NULL, 56.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:22:28', '2026-05-29 12:51:02'),
(728, 'ARANDELA PLANA 3/16', '', 'AP3.16', NULL, 7, NULL, NULL, NULL, 61.59, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:22:56', '2026-05-29 12:51:02'),
(729, 'ARANDELA PLANA 1/4', '', 'AP1.4', NULL, 7, NULL, NULL, NULL, 66.73, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:23:24', '2026-05-29 12:51:02'),
(730, 'ARANDELA PLANA 5/16', '', 'AP5.16', NULL, 7, NULL, NULL, NULL, 71.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:23:51', '2026-05-29 12:51:02'),
(731, 'ARANDELA PLANA 3/8', '', 'AP3.8', NULL, 7, NULL, NULL, NULL, 76.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:24:18', '2026-05-29 12:51:02'),
(732, 'ARANDELA CHAPISTA 3/16', '', 'AC3.16', NULL, 7, NULL, NULL, NULL, 61.59, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:25:34', '2026-05-29 12:51:02'),
(733, 'ARANDELA CHAPISTA 5/16', '', 'AC5.16', NULL, 7, NULL, NULL, NULL, 82.13, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:25:57', '2026-05-29 12:51:02'),
(734, 'ARANDELA GROWER 5/32', '', 'AGR5.32', NULL, 7, NULL, NULL, NULL, 153.99, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:28:10', '2026-05-29 12:51:02'),
(735, 'ARANDELA GROWER 3/16', '', 'AG3.16', NULL, 7, NULL, NULL, NULL, 102.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:28:44', '2026-05-29 12:51:02'),
(736, 'ARANDELA GROWER 1/4', '', 'AGR1.4', NULL, 7, NULL, NULL, NULL, 102.66, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:29:14', '2026-05-29 12:51:02'),
(737, 'ARANDELA GROWER 5/16', '', 'AGR5.16', NULL, 7, NULL, NULL, NULL, 123.20, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-25 22:29:39', '2026-05-29 12:51:02'),
(738, 'BALDE VOS 2000 10LT', 'COLOR ROJO', NULL, NULL, 8, NULL, NULL, NULL, 9136.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 19:53:07', '2026-05-29 12:51:02'),
(739, 'BALDE ALBAÑIL', '', NULL, NULL, 8, NULL, NULL, NULL, 3901.13, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 19:53:23', '2026-05-29 12:51:02'),
(740, 'BORDEADORA SEVERBON 600W', 'BP 620', 'BOR600W', NULL, 2, NULL, NULL, NULL, 139035.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 19:54:46', '2026-05-29 12:51:02'),
(741, 'BORDEADORA SEVERBON 350W', 'BP 400', NULL, NULL, 2, NULL, NULL, NULL, 88768.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 19:55:42', '2026-05-29 12:51:02'),
(742, 'BOMBA CENTRIFUGA MEC 1Hp', 'CPM 158-A', NULL, NULL, 2, NULL, NULL, NULL, 234220.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 21:19:15', '2026-05-29 18:51:27'),
(743, 'BOMBEADOR N°1 ZORZUT', '', NULL, NULL, 8, NULL, NULL, NULL, 374325.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 21:23:21', '2026-05-29 18:52:35'),
(744, 'CAÑO CRISTAL 9x12', 'PRECIO X METRO', NULL, NULL, 13, NULL, NULL, NULL, 359.31, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-03-27 21:35:32', '2026-05-29 12:51:02'),
(745, 'DISYUNTOR MONOFÁSICO', 'INTERRUPTOR DIFERENCIAL MONOFÁSICO NOVALUCCE 40 Amp', 'CM2X40', NULL, 3, NULL, NULL, NULL, 43746.04, 26800.00, 59.00, 2.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-02 20:25:58', '2026-05-29 12:51:02'),
(746, 'APLIQUE FAROLA EXT. CHAPA', 'FAROLA EXT. CHAPA BLANCA O NEGRA', NULL, NULL, 14, NULL, NULL, NULL, 35931.46, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-04 20:44:26', '2026-05-29 12:51:02'),
(747, 'APLIQUE FAROLA EXT. PVC', 'FAROLA EXT. PVC BLANCA O NEGRA', NULL, NULL, 14, NULL, NULL, NULL, 27718.56, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-04 20:45:10', '2026-05-29 12:51:02'),
(748, 'GUANTE NITRILO NEGRO', '', NULL, NULL, 8, NULL, NULL, NULL, 4106.47, 2956.63, 35.29, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-07 22:33:30', '2026-05-29 12:51:02'),
(749, 'TEFLON 1/2 x 10 Mts.', '', NULL, NULL, 4, NULL, NULL, NULL, 513.30, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-08 12:44:16', '2026-05-29 12:51:02'),
(750, 'TEFLON 3/4 x 10 Mts.', '', NULL, NULL, 4, NULL, NULL, NULL, 692.96, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-08 12:44:51', '2026-05-29 12:51:02'),
(751, 'AUTOMATICO TANQUE BLINDADO F2000', '15 A x 1.5 MTS', 'AUTBLI', NULL, 4, NULL, NULL, NULL, 13319.64, 8316.89, 56.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-08 22:15:03', '2026-05-29 12:51:02'),
(752, 'LAMPARA LED 10W', '10W - E27', 'LAM10W', NULL, 14, NULL, NULL, NULL, 1232.01, 769.72, 55.91, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-08 22:22:32', '2026-05-29 12:51:02'),
(753, 'LAMPARA LED 50W', '50W - E27', NULL, NULL, 13, NULL, NULL, NULL, 10836.09, 5767.86, 83.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-08 22:24:35', '2026-05-29 12:51:02'),
(754, 'MECHA WIDIA', '6mm', NULL, NULL, 6, NULL, NULL, NULL, 2566.61, 1650.00, 51.52, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-13 20:12:03', '2026-05-29 12:51:02'),
(755, 'CANILLA METALICA ESFÉRICA', '3/4', 'CMESF34', NULL, 13, NULL, NULL, NULL, 15326.44, 9952.75, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:27:47', '2026-05-29 12:51:02'),
(756, 'FRATACHO PVC C/FIELTRO', '25 CM', 'FPVC25', NULL, 6, NULL, NULL, NULL, 3798.37, 2440.57, 51.60, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:31:53', '2026-05-29 12:51:02'),
(757, 'LLANA DENTADA METALICA 6 X 6', '', 'LLMET6X6', NULL, 6, NULL, NULL, NULL, 18595.19, 12075.43, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:35:20', '2026-05-29 12:51:02'),
(758, 'LLANA DENTADA METALICA 10 X 10', '', 'LLMET10X10', NULL, 6, NULL, NULL, NULL, 18595.19, 12075.43, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:36:43', '2026-05-29 12:51:02'),
(759, 'LLANA PVC DENTADA', 'VOSS 2000', 'LLPVC', NULL, 6, NULL, NULL, NULL, 5962.56, 3872.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:39:15', '2026-05-29 12:51:02'),
(760, 'MEMBRANA ASFALTICA 10 CM', 'AUTOADHESIVA X MT', 'MA10', NULL, 13, NULL, NULL, NULL, 2463.73, 1579.17, 51.97, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:42:12', '2026-05-29 12:51:02'),
(761, 'MEMBRANA ASFALTICA X 25 CM', 'AUTOADHESIVA X MT', 'MA25', NULL, 13, NULL, NULL, NULL, 6063.16, 3937.32, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:43:52', '2026-05-29 12:51:02'),
(762, 'ACEITE AEROSOL MULTIFUNCION', '50 MECANIC X 250 ML', NULL, NULL, 8, NULL, NULL, NULL, 5727.01, 3719.03, 50.00, 1.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:47:49', '2026-06-09 14:26:58'),
(763, 'GRASA MULTIUSO', '250 GR', NULL, NULL, 11, NULL, NULL, NULL, 5130.88, 3321.51, 50.47, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:57:17', '2026-05-29 12:51:02'),
(764, 'ANTIPARRAS TRANSPARENTE', 'POLICARBONATO', 'ANTITRANSPA', NULL, 8, NULL, NULL, NULL, 3603.63, 2340.14, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 21:58:54', '2026-05-29 12:51:02'),
(765, 'TORNILLOS AUTOPERF. PUNTA MECHA 6 X 1/2', 'CABEZA TANQUE PUNTA MECHA', 'TPM6X1/2', NULL, 13, NULL, NULL, NULL, 58.78, 24.89, 130.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-15 22:03:50', '2026-05-29 12:51:02'),
(766, 'ESTUFA VERTICAL EVEREST', '2 VELAS', NULL, NULL, 15, NULL, NULL, NULL, 29771.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-21 19:43:13', '2026-05-29 12:51:02'),
(767, 'ESTUFA HORIZONTAL EVEREST', '2 VELAS', NULL, NULL, 15, NULL, NULL, NULL, 29771.78, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-21 19:43:58', '2026-05-29 12:51:02'),
(768, 'ESTUFA ECONOMICA', '2 VELAS', NULL, NULL, 13, NULL, NULL, NULL, 25665.33, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-21 19:44:29', '2026-05-29 12:51:02'),
(769, 'LATEX INT-EXT 10LT LUSQTOFF', 'BLANCO', NULL, NULL, 5, NULL, NULL, NULL, 61113.15, 35017.00, 70.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-22 20:23:10', '2026-05-29 12:51:02'),
(770, 'ENDUIDO INT-EXT 4LT LUSQTOFF', '', NULL, NULL, 13, NULL, NULL, NULL, 19403.45, 11187.00, 68.95, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-22 20:27:33', '2026-05-29 12:51:02'),
(771, 'SELLADOR INT-EXT 1LT LUSQTOFF', '', NULL, NULL, 5, NULL, NULL, NULL, 6878.63, 4377.00, 53.08, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-22 20:35:25', '2026-05-29 12:51:02'),
(772, 'TIRAFONDO 3/16 X 1', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 162.60, 0.00, 30.10, 999999.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:10:28', '2026-05-29 12:51:02'),
(773, 'TIRAFONDO 3/16 X 1 1/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 177.24, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:11:26', '2026-05-29 12:51:02'),
(774, 'TIRAFONDO 3/16 X 1 1/2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 207.52, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:12:13', '2026-05-29 12:51:02'),
(775, 'TIRAFONDO 3/16 X 1 3/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 226.90, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:13:03', '2026-05-29 12:51:02'),
(776, 'TIRAFONDO 3/16 X 2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 247.89, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:14:42', '2026-05-29 12:51:02'),
(777, 'TIRAFONDO 3/16 X 2 1/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 289.99, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:15:25', '2026-05-29 12:51:02'),
(778, 'TIRAFONDO 3/16 X 3', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 403.19, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:16:00', '2026-05-29 12:51:02'),
(779, 'TIRAFONDO 1/4 X 1', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 251.72, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:17:19', '2026-05-29 12:51:02'),
(780, 'TIRAFONDO 1/4 X 1 1/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 253.29, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:18:21', '2026-05-29 12:51:02'),
(781, 'TIRAFONDO 1/4 X 1 1/2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 267.94, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:19:01', '2026-05-29 12:51:02'),
(782, 'TIRAFONDO 1/4 X 1 3/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 322.50, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:19:36', '2026-05-29 12:51:02'),
(783, 'TIRAFONDO 1/4 X 2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 329.55, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:20:14', '2026-05-29 12:51:02'),
(784, 'TIRAFONDO 1/4 X 2 1/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 381.21, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:20:58', '2026-05-29 12:51:02'),
(785, 'TIRAFONDO 1/4 X 2 1/2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 415.38, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:21:35', '2026-05-29 12:51:02'),
(786, 'TIRAFONDO 1/4 X 2 3/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 445.78, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:22:08', '2026-05-29 12:51:02'),
(787, 'TIRAFONDO 1/4 X 3', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 490.97, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:22:52', '2026-05-29 12:51:02'),
(788, 'TIRAFONDO 1/4 X 3 1/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 554.37, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:23:23', '2026-05-29 12:51:02'),
(789, 'TIRAFONDO 1/4 X 3 1/2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 557.45, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:23:52', '2026-05-29 12:51:02'),
(790, 'TIRAFONDO 1/4 X 4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 628.29, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:24:33', '2026-05-29 12:51:02'),
(791, 'TIRAFONDO 5/16 X 1 1/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 391.14, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:25:15', '2026-05-29 12:51:02'),
(792, 'TIRAFONDO 5/16 X 1 1/2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 461.98, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:25:56', '2026-05-29 12:51:02'),
(793, 'TIRAFONDO 5/16 X 1 3/4', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 421.94, 0.00, 30.00, 9999999.999, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:26:29', '2026-05-29 12:51:02'),
(794, 'TIRAFONDO 5/16 X 2', 'CABEZA HEXAGONAL', NULL, NULL, 7, NULL, NULL, NULL, 538.97, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-24 20:26:51', '2026-05-29 12:51:02'),
(795, 'CAÑO BICAPA 1/2 x 6 MT', 'PRECIO X CAÑO', NULL, NULL, 4, NULL, NULL, NULL, 7699.60, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-27 22:16:27', '2026-05-29 12:51:02'),
(796, 'CAÑO BICAPA 3/4 x 6 MT', 'PRECIO X CAÑO', NULL, NULL, 13, NULL, NULL, NULL, 8623.55, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-27 22:17:06', '2026-05-29 12:51:02'),
(797, 'CAÑO BICAPA 1 x 6 MT', 'PRECIO X CAÑO', NULL, NULL, 4, NULL, NULL, NULL, 9855.49, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-27 22:17:37', '2026-05-29 12:51:02'),
(798, 'CANILLA PVC 1/2', 'TG PLAST', NULL, NULL, 4, NULL, NULL, NULL, 2874.52, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-28 21:37:12', '2026-05-29 12:51:02'),
(799, 'CANILLA PVC 3/4', 'TG PLAST', NULL, NULL, 4, NULL, NULL, NULL, 3387.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-28 21:37:55', '2026-05-29 12:51:02'),
(800, 'MEDIA GRAMPA OMEGA CHAPA 1/2 X 1/4', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 410.64, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-28 22:20:46', '2026-05-29 12:51:02'),
(801, 'ADAPTADOR PERNO REDONDO KALOP', '', NULL, NULL, 13, NULL, NULL, NULL, 2667.03, 1731.93, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-30 19:42:38', '2026-05-29 12:51:02'),
(802, 'PROYECTOR LED 30W', '30 W - NOVA ELECTRIC', NULL, NULL, 14, NULL, NULL, NULL, 9112.86, 5917.75, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-30 19:51:30', '2026-05-29 12:51:02');
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `codigo_barra`, `modelo`, `categoria_id`, `marca_id`, `unidad_medida_id`, `proveedor_id`, `precio`, `precio_costo`, `margen_ganancia`, `stock`, `unidad_medida`, `stock_minimo`, `ubicacion_deposito`, `imagen`, `activo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(803, 'HIDROLAVADORA ELECTRICA LUSQTOFF 1200W', 'HL -120', NULL, NULL, 13, NULL, NULL, NULL, 142988.51, 99487.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-04-30 19:56:10', '2026-05-29 12:51:02'),
(804, 'SELLA ROSCAS GALI', '25CC', NULL, NULL, 11, NULL, NULL, NULL, 2771.86, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-07 13:17:01', '2026-05-29 12:51:02'),
(805, 'CAÑO CORRUGADO GRIS 3/4', 'SEMI PESADO - PRECIO X METRO', NULL, NULL, 3, NULL, NULL, NULL, 955.97, 713.91, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:18:50', '2026-05-29 12:51:02'),
(806, 'CAÑO CORRUGADO NARANJA 3/4', 'PRECIO POR METRO', NULL, NULL, 3, NULL, NULL, NULL, 464.66, 347.00, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:22:28', '2026-05-29 12:51:02'),
(807, 'CAÑO CORRUGADO NARANJA 7/8', 'PRECIO POR METRO', NULL, NULL, 3, NULL, NULL, NULL, 559.33, 417.71, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:23:38', '2026-05-29 12:51:02'),
(808, 'CAÑO CORRUGADO NARANJA 1 Pulg.', 'PRECIO X METRO', NULL, NULL, 3, NULL, NULL, NULL, 703.68, 525.50, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:24:36', '2026-05-29 12:51:02'),
(809, 'CONECTOR CHAPA 3/4', '', NULL, NULL, 3, NULL, NULL, NULL, 582.78, 417.77, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:25:57', '2026-05-29 12:51:02'),
(810, 'CONECTOR CHAPA 7/8', '', NULL, NULL, 3, NULL, NULL, NULL, 1233.51, 884.23, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:27:06', '2026-05-29 12:51:02'),
(811, 'FAROL SOL DE NOCHE VALI GAS', '', NULL, NULL, 15, NULL, NULL, NULL, 44546.08, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:57:30', '2026-05-29 12:51:02'),
(812, 'CALENTADOR VALI GAS GRANDE', '', NULL, NULL, 15, NULL, NULL, NULL, 13381.68, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 20:59:29', '2026-05-29 12:51:02'),
(813, 'CALENTADOR VALI GAS CHICO', '', NULL, NULL, 15, NULL, NULL, NULL, 8837.80, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-08 21:00:08', '2026-05-29 12:51:02'),
(814, 'GABINETE CAPOT CHAPA BOMBEADOR', '', NULL, NULL, 13, NULL, NULL, NULL, 45528.06, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-13 19:26:41', '2026-05-29 12:51:02'),
(815, 'PROYECTOR 150W C/SENSOR MOV.', '', NULL, NULL, 14, NULL, NULL, NULL, 29992.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 13:28:54', '2026-05-29 12:51:02'),
(816, 'SENSOR MOVIMIENTO 1200W', '', NULL, NULL, 13, NULL, NULL, NULL, 11253.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 13:33:01', '2026-05-29 12:51:02'),
(817, 'CABLE ENV. REDONDO 2 X 1', '', NULL, NULL, 3, NULL, NULL, NULL, 1259.32, 902.74, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 20:07:06', '2026-05-29 12:51:02'),
(818, 'GRAMPA KALOP N° 8', 'PRECIO X UNIDAD', NULL, NULL, 13, NULL, NULL, NULL, 80.18, 57.27, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 20:14:27', '2026-06-05 20:13:10'),
(819, 'GRAMPA KALOP N° 10', 'PRECIO X UNIDAD', NULL, NULL, 3, NULL, NULL, NULL, 111.83, 79.88, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 20:15:20', '2026-06-05 20:13:49'),
(820, 'GRAMPA KALOP N° 5', 'PRECIO X UNIDAD', NULL, NULL, 3, NULL, NULL, NULL, 38.91, 27.89, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 20:34:24', '2026-05-29 12:51:02'),
(821, 'LAMPARA DICROICA LED GU10 7W', 'LUZ FRIA - LUZ CALIDA', NULL, NULL, 14, NULL, NULL, NULL, 1197.61, 858.50, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-15 21:40:35', '2026-05-29 12:51:02'),
(822, 'CALEFÓN LAVARMIN', '', NULL, NULL, 4, NULL, NULL, NULL, 27900.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-18 21:30:04', '2026-05-29 12:51:02'),
(823, 'PITON ABIERTO N°5', '', NULL, NULL, 8, NULL, NULL, NULL, 136.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:54:33', '2026-05-29 12:51:02'),
(824, 'PITON CERRADO N°5', '', NULL, NULL, 8, NULL, NULL, NULL, 136.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:55:06', '2026-05-29 12:51:02'),
(825, 'PITON ESCUADRA N°5', '', NULL, NULL, 8, NULL, NULL, NULL, 136.71, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:55:47', '2026-05-29 12:51:02'),
(826, 'PITON ABIERTO N°6', '', NULL, NULL, 8, NULL, NULL, NULL, 153.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:57:17', '2026-05-29 12:51:02'),
(827, 'PITON CERRADO N°6', '', NULL, NULL, 8, NULL, NULL, NULL, 153.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:57:44', '2026-05-29 12:51:02'),
(828, 'PITON ESCUADRA N°6', '', NULL, NULL, 8, NULL, NULL, NULL, 153.34, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:58:09', '2026-05-29 12:51:02'),
(829, 'PITON ABIERTO N°8', '', NULL, NULL, 8, NULL, NULL, NULL, 162.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:58:54', '2026-05-29 12:51:02'),
(830, 'PITON CERRADO N°8', '', NULL, NULL, 8, NULL, NULL, NULL, 162.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:59:13', '2026-05-29 12:51:02'),
(831, 'PITON ESCUADRA N°8', '', NULL, NULL, 8, NULL, NULL, NULL, 162.82, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 19:59:33', '2026-05-29 12:51:02'),
(832, 'PITON ABIERTO N°10', '', NULL, NULL, 8, NULL, NULL, NULL, 300.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 20:00:01', '2026-05-29 12:51:02'),
(833, 'PITON CERRADO N°10', '', NULL, NULL, 8, NULL, NULL, NULL, 300.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 20:00:21', '2026-05-29 12:51:02'),
(834, 'PITON ESCUADRA N°10', '', NULL, NULL, 8, NULL, NULL, NULL, 300.39, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-19 20:00:44', '2026-05-29 12:51:02'),
(835, 'BARRAL VENTILADOR HASTA 40 CM', '', NULL, NULL, 8, NULL, NULL, NULL, 7254.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-20 20:20:13', '2026-05-29 18:50:02'),
(836, 'BARRAL VENTILADOR + 40 CM', '', NULL, NULL, 8, NULL, NULL, NULL, 14880.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-20 20:23:42', '2026-05-29 12:51:02'),
(837, 'GANCHO P/VENTILADOR TECHO', '', NULL, NULL, 13, NULL, NULL, NULL, 5394.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-20 20:29:00', '2026-05-29 12:51:02'),
(838, 'PANTALLA VELADOR CHICA', '', NULL, NULL, 14, NULL, NULL, NULL, 4185.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-21 21:16:46', '2026-05-29 12:51:02'),
(839, 'LAMPARA LED 14W MAIZ', '', NULL, NULL, 14, NULL, NULL, NULL, 9579.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-21 21:22:27', '2026-05-29 12:51:02'),
(840, 'LAMPARA BI PIN G9 LED', 'LUZ DIA - LUZ CALIDA', NULL, NULL, 14, NULL, NULL, NULL, 3487.50, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-05-21 21:24:53', '2026-05-29 12:51:02'),
(841, 'CANDADO SEKUR N°31 STANDARD', 'DOBLE TRABA', 'CSK31ST', NULL, 8, NULL, NULL, NULL, 16199.40, 11571.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 20:18:41', '2026-06-02 20:18:41'),
(842, 'CANDADO SEKUR N°40 STANDARD', 'DOBLE TRABA', NULL, NULL, 8, NULL, NULL, NULL, 21565.60, 15404.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 20:20:44', '2026-06-02 20:20:44'),
(843, 'CANDADO SEKUR N° 50 STANDARD', 'DOBLE TRABA', 'CSK50ST', NULL, 8, NULL, NULL, NULL, 29045.80, 20747.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 20:39:27', '2026-06-02 20:39:27'),
(844, 'CANDADO SEKUR N°62 STANDARD', 'DOBLE TRABA', 'CSK62ST', NULL, 8, NULL, NULL, NULL, 41465.20, 29618.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 20:41:17', '2026-06-02 20:41:17'),
(845, 'CANDADO SEKUR N°31 ARCO LARGO', 'DOBLE TRABA', 'CSK31AL', NULL, 8, NULL, NULL, NULL, 23994.60, 17139.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 20:43:39', '2026-06-02 20:43:39'),
(846, 'ESCALERA FAMILIAR 8 ESCALONES', 'ALPINA', 'EF8E', NULL, 8, NULL, NULL, NULL, 73151.40, 52251.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 22:03:32', '2026-06-02 22:03:32'),
(847, 'ESCALERA FAMILIAR 5 ESCALONES', 'ALPINA', 'EF5E', NULL, 8, NULL, NULL, NULL, 45698.80, 32642.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-02 22:04:25', '2026-06-02 22:04:25'),
(848, 'CAÑO CORRUGADO GRIS 5/8', 'PRECIO X METRO', NULL, NULL, 3, NULL, NULL, NULL, 900.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-03 19:41:13', '2026-06-03 19:41:13'),
(849, 'CAÑO CORRUGADO NARANJA 5/8', 'PRECIO X METRO', NULL, NULL, 3, NULL, NULL, NULL, 375.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-03 19:42:17', '2026-06-03 19:42:17'),
(850, 'AAAAAAAAAA', '', NULL, NULL, 13, NULL, NULL, NULL, 345345.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, '2026-06-05 19:41:54', '2026-06-05 19:41:48', '2026-06-05 19:41:54'),
(851, 'TALADRO ATORNILLADOR LÜSQTOFF', '220 V - 300 W - 1350 RPM', 'TAL 300-8', NULL, 2, NULL, NULL, NULL, 69337.80, 49527.00, 40.00, 1.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-05 19:44:30', '2026-06-05 19:44:30'),
(852, 'LAMPARA LED SENSOR DE MOVIMIENTO', '10W - LUZ DIA', 'LSMOV', NULL, 14, NULL, NULL, NULL, 15211.00, 10865.00, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-05 20:15:50', '2026-06-05 20:15:50'),
(853, 'MORSA N°1', 'BARBERO', NULL, NULL, 1, NULL, NULL, NULL, 129000.00, 0.00, 30.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-05 20:44:49', '2026-06-05 20:44:49'),
(854, 'CARRETEL BORDEADORA SEVERBON', '', NULL, NULL, 13, NULL, NULL, NULL, 4200.00, 0.00, 30.00, 3.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 14:32:15', '2026-06-09 14:35:49'),
(855, 'ENTRE ROSCA RED 3/4 X 1/2', '', NULL, NULL, 4, NULL, NULL, NULL, 315.69, 225.49, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 21:54:56', '2026-06-09 21:54:56'),
(856, 'ABRAZADERA CIERRE RAP. 58 - 72', '', 'ABR58-72', NULL, 8, NULL, NULL, NULL, 1261.31, 840.87, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 21:57:01', '2026-06-09 21:57:01'),
(857, 'ABRAZADERA CIERRE RAP. 48 - 62', '', 'ABR48-62', NULL, 8, NULL, NULL, NULL, 1167.05, 778.03, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 21:58:29', '2026-06-09 21:58:29'),
(858, 'ABRAZADERA CIERRE RAP. 40 - 52', '', 'ABR40-52', NULL, 8, NULL, NULL, NULL, 1109.60, 739.73, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 21:59:19', '2026-06-09 21:59:19'),
(859, 'ABRAZADERA CIERRE RAP. 32 - 44', '', 'ABR32-44', NULL, 8, NULL, NULL, NULL, 1029.40, 686.27, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:00:27', '2026-06-09 22:00:27'),
(860, 'ABRAZADERA CIERRE RAP. 25 - 35', '', 'ABR25-35', NULL, 8, NULL, NULL, NULL, 941.65, 627.77, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:01:09', '2026-06-09 22:01:09'),
(861, 'ABRAZADERA CIERRE RAP. 17 - 28', '', NULL, NULL, 8, NULL, NULL, NULL, 919.98, 613.32, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:02:11', '2026-06-09 22:02:11'),
(862, 'ABRAZADERA CIERRE RAP. 10 - 20', '', 'ABR10-20', NULL, 8, NULL, NULL, NULL, 909.12, 606.08, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:02:58', '2026-06-10 12:47:23'),
(863, 'BISAGRA LIBRO BRONC. 2 1/2´', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 501.27, 200.51, 150.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:05:35', '2026-06-09 22:05:35'),
(864, 'BISAGRA LIBRO BRONC. 2´', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 400.30, 160.12, 150.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:06:38', '2026-06-09 22:06:38'),
(865, 'BISAGRA LIBRO BRONC. 1 1/2´', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 288.52, 115.41, 150.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:07:35', '2026-06-09 22:07:35'),
(866, 'BISAGRA LIBRO BRONC. 1´', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 201.02, 80.41, 150.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:08:17', '2026-06-09 22:08:17'),
(867, 'RESISTENCIA CALEFON FOCO', 'BRONCE', NULL, NULL, 8, NULL, NULL, NULL, 9460.01, 6306.67, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:10:03', '2026-06-09 22:11:19'),
(868, 'RESISTENCIA CALEFON PULMON', 'BRONCE', NULL, NULL, 8, NULL, NULL, NULL, 11360.39, 7573.59, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:11:07', '2026-06-09 22:11:07'),
(869, 'CANDADO EKRON 40mm', 'TRABA SIMPLE', NULL, NULL, 8, NULL, NULL, NULL, 6406.09, 4575.78, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:15:46', '2026-06-09 22:15:46'),
(870, 'CANDADO EKRON 30mm', 'TRABA SIMPLE', NULL, NULL, 8, NULL, NULL, NULL, 4582.07, 3272.91, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:16:29', '2026-06-09 22:16:29'),
(871, 'CANDADO EKRON 25mm', 'TRABA SIMPLE', NULL, NULL, 8, NULL, NULL, NULL, 4022.97, 2873.55, 40.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:17:23', '2026-06-09 22:17:23'),
(872, 'LIMA MOTOSIERRA 7/32', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 2661.09, 1774.06, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:19:19', '2026-06-09 22:19:19'),
(873, 'LIMA MOTOSIERRA 3/16', 'PRECIO X UNIDAD', NULL, NULL, 8, NULL, NULL, NULL, 2991.30, 1994.20, 50.00, 0.000, 'unid', 0.000, NULL, NULL, 1, NULL, '2026-06-09 22:21:56', '2026-06-09 22:22:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `permisos` text DEFAULT NULL COMMENT 'JSON con permisos del rol',
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `permisos`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrador del sistema', '{\"all\": true}', 1, '2026-02-11 23:53:19', '2026-02-11 23:53:19'),
(2, 'vendedor', 'Vendedor - Acceso a ventas y productos', '{\"sales\": true, \"products\": true, \"customers\": true}', 1, '2026-02-11 23:53:19', '2026-02-11 23:53:19'),
(3, 'cajero', 'Cajero - Acceso a caja y reportes', '{\"cash\": true, \"reports\": true, \"sales\": true}', 1, '2026-02-11 23:53:19', '2026-02-11 23:53:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vfv7mppYsIoIAGGuxXtVnFp7xqzGxuBdLszlBydv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTEFhaTg3NEhHYVZSRWYyalYxVFZNR0hiZ3ZSQ05JN01WZ3M1d01qaCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3Byb2R1Y3RvcyI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcHJvZHVjdG9zL2NyZWF0ZSI7czo1OiJyb3V0ZSI7czoxNjoicHJvZHVjdG9zLmNyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1771202750);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos_caja`
--

CREATE TABLE `turnos_caja` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_nombre` varchar(100) DEFAULT NULL,
  `monto_inicial` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto_final` decimal(10,2) DEFAULT NULL,
  `monto_esperado` decimal(10,2) DEFAULT NULL,
  `diferencia` decimal(10,2) DEFAULT NULL,
  `estado` enum('abierto','cerrado') DEFAULT 'abierto',
  `fecha_apertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_cierre` timestamp NULL DEFAULT NULL,
  `notas_apertura` text DEFAULT NULL,
  `notas_cierre` text DEFAULT NULL,
  `cerrado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turnos_caja`
--

INSERT INTO `turnos_caja` (`id`, `user_id`, `usuario_id`, `usuario_nombre`, `monto_inicial`, `monto_final`, `monto_esperado`, `diferencia`, `estado`, `fecha_apertura`, `fecha_cierre`, `notas_apertura`, `notas_cierre`, `cerrado_por`) VALUES
(5, 1, 1, 'admin', 0.00, NULL, NULL, NULL, 'abierto', '2026-02-19 15:01:31', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  `tipo` enum('unidad','longitud','peso','volumen','area','otro') DEFAULT 'unidad',
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`id`, `nombre`, `abreviatura`, `tipo`, `activo`) VALUES
(1, 'Unidad', 'ud', 'unidad', 1),
(2, 'Metro', 'm', 'longitud', 1),
(3, 'Centímetro', 'cm', 'longitud', 1),
(4, 'Kilogramo', 'kg', 'peso', 1),
(5, 'Gramo', 'g', 'peso', 1),
(6, 'Litro', 'L', 'volumen', 1),
(7, 'Mililitro', 'ml', 'volumen', 1),
(8, 'Metro cuadrado', 'm²', 'area', 1),
(9, 'Caja', 'caja', 'unidad', 1),
(10, 'Paquete', 'paq', 'unidad', 1),
(11, 'Bolsa', 'bolsa', 'unidad', 1),
(12, 'Rollo', 'rollo', 'unidad', 1),
(13, 'Par', 'par', 'unidad', 1),
(14, 'Juego', 'juego', 'unidad', 1),
(15, 'Set', 'set', 'unidad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tiago Raminelli', 'tiagoraminelli@gmail.com', NULL, '$2y$12$HJrQLna8l6fbd0N//psp8O1pvfDf9PSBbLZBhV8egWEpiD/V4FBvK', NULL, '2026-02-16 01:39:21', '2026-02-16 01:39:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rol` enum('admin','vendedor','cajero') NOT NULL DEFAULT 'vendedor',
  `role_id` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `last_failed_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre`, `email`, `rol`, `role_id`, `activo`, `is_active`, `last_login`, `failed_attempts`, `last_failed_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$argon2id$v=19$m=65536,t=4,p=3$Rjc4Um1QUHFhRUFxM2JrMw$Nr4/NcuLJpZoTLj8O+3ydbGyxn9z/q0jAeLWzfocfgA', 'Carrizo', 'admin@ferreteria.com', 'admin', 1, 1, 1, '2026-06-09 22:29:53', 0, NULL, '2026-02-11 23:49:57', '2026-06-09 22:29:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `descuento_porcentaje` decimal(5,2) DEFAULT 0.00,
  `descuento_monto` decimal(10,2) DEFAULT 0.00,
  `monto_pagado` decimal(10,2) DEFAULT 0.00,
  `cambio` decimal(10,2) DEFAULT 0.00,
  `metodo_pago` enum('efectivo','tarjeta_debito','tarjeta_credito','transferencia','cuenta_corriente','otro') DEFAULT 'efectivo',
  `metodo_pago_secundario` varchar(50) DEFAULT NULL,
  `monto_pago_secundario` decimal(10,2) DEFAULT 0.00,
  `estado` enum('completada','pendiente','cancelada') DEFAULT 'completada',
  `notas` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `usuario_id`, `cliente_id`, `total`, `subtotal`, `descuento_porcentaje`, `descuento_monto`, `monto_pagado`, `cambio`, `metodo_pago`, `metodo_pago_secundario`, `monto_pago_secundario`, `estado`, `notas`, `fecha`, `created_at`, `updated_at`) VALUES
(6, 1, NULL, 950.00, 0.00, 0.00, 0.00, 950.00, 0.00, 'transferencia', 'Nombre: JUANI QUIROGA - Tel:', 0.00, 'completada', NULL, '2026-02-25 23:26:32', '2026-02-25 23:26:32', '2026-02-25 23:26:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_pendientes`
--

CREATE TABLE `ventas_pendientes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `items` longtext NOT NULL,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) DEFAULT 0.00,
  `notas` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalles`
--

CREATE TABLE `venta_detalles` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precio_costo` decimal(10,2) DEFAULT 0.00,
  `descuento_porcentaje` decimal(5,2) DEFAULT 0.00,
  `descuento_monto` decimal(10,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL,
  `subtotal_sin_descuento` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_detalles`
--

INSERT INTO `venta_detalles` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio`, `precio_costo`, `descuento_porcentaje`, `descuento_monto`, `subtotal`, `subtotal_sin_descuento`) VALUES
(6, 6, 670, 1.000, 950.00, 0.00, 0.00, 0.00, 950.00, 0.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nombre` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nombre` (`nombre`),
  ADD KEY `idx_documento` (`documento`);

--
-- Indices de la tabla `cuenta_corriente_movimientos`
--
ALTER TABLE `cuenta_corriente_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cliente` (`cliente_id`),
  ADD KEY `idx_fecha` (`fecha`),
  ADD KEY `fk_cc_usuario` (`usuario_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_attempted_at` (`attempted_at`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nombre` (`nombre`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_turno` (`turno_id`),
  ADD KEY `idx_tipo` (`tipo`),
  ADD KEY `idx_venta` (`venta_id`),
  ADD KEY `idx_fecha` (`fecha`),
  ADD KEY `fk_movimiento_usuario` (`usuario_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nombre` (`nombre`),
  ADD KEY `idx_codigo_barra` (`codigo_barra`),
  ADD KEY `idx_categoria` (`categoria_id`),
  ADD KEY `idx_marca` (`marca_id`),
  ADD KEY `idx_proveedor` (`proveedor_id`),
  ADD KEY `idx_stock` (`stock`),
  ADD KEY `idx_deleted` (`deleted_at`),
  ADD KEY `fk_producto_unidad` (`unidad_medida_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nombre` (`nombre`),
  ADD KEY `idx_cuit` (`cuit`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `idx_nombre` (`nombre`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `turnos_caja`
--
ALTER TABLE `turnos_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha_apertura` (`fecha_apertura`),
  ADD KEY `fk_turno_cerrado_por` (`cerrado_por`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nombre` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_rol` (`rol`),
  ADD KEY `fk_usuario_role` (`role_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_cliente` (`cliente_id`),
  ADD KEY `idx_fecha` (`fecha`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_metodo_pago` (`metodo_pago`);

--
-- Indices de la tabla `ventas_pendientes`
--
ALTER TABLE `ventas_pendientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_cliente` (`cliente_id`);

--
-- Indices de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_venta` (`venta_id`),
  ADD KEY `idx_producto` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuenta_corriente_movimientos`
--
ALTER TABLE `cuenta_corriente_movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=874;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `turnos_caja`
--
ALTER TABLE `turnos_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas_pendientes`
--
ALTER TABLE `ventas_pendientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta_corriente_movimientos`
--
ALTER TABLE `cuenta_corriente_movimientos`
  ADD CONSTRAINT `fk_cc_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cc_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD CONSTRAINT `fk_movimiento_turno` FOREIGN KEY (`turno_id`) REFERENCES `turnos_caja` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_movimiento_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_movimiento_venta` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_producto_unidad` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidades_medida` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `turnos_caja`
--
ALTER TABLE `turnos_caja`
  ADD CONSTRAINT `fk_turno_cerrado_por` FOREIGN KEY (`cerrado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_turno_usuario` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ventas_pendientes`
--
ALTER TABLE `ventas_pendientes`
  ADD CONSTRAINT `fk_pendiente_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pendiente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
