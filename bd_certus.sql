-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-12-2023 a las 12:21:43
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_certus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-18 02:02:46.068846'),
(2, 'auth', '0001_initial', '2023-10-18 02:02:46.430309'),
(3, 'admin', '0001_initial', '2023-10-18 02:02:46.524902'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-18 02:02:46.533416'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-18 02:02:46.541005'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-18 02:02:46.606560'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-10-18 02:02:46.647147'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-10-18 02:02:46.668853'),
(9, 'auth', '0004_alter_user_username_opts', '2023-10-18 02:02:46.677409'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-10-18 02:02:46.725157'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-10-18 02:02:46.728300'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-18 02:02:46.736301'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-10-18 02:02:46.791553'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-18 02:02:46.842709'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-10-18 02:02:46.862691'),
(16, 'auth', '0011_update_proxy_permissions', '2023-10-18 02:02:46.871300'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-18 02:02:46.919443'),
(18, 'sessions', '0001_initial', '2023-10-18 02:02:46.949192');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3zn012dl0zltiqxtmne2e7sb5horjwb2', '.eJxtyTEOgDAIAMC_MOvg2s8YFGJIKhigU9O_6-Bi4q3XoQX7HBwhplA67EZy2MqRjQQ1GQosL5hA7dycv410ij6HF9cqZD8rkY5pDmPcJMMpEA:1rDOCI:SWoVqQybNvpia1sOk0z7o8VpHGMvIRJyNEzRtrhVVX4', '2023-12-27 12:18:42.905755'),
('582q8eql1jjomqvlnzs31nsgtaefluqp', '.eJxtyTEOgDAIAMC_MOvg2s8YFGJIKhigU9O_6-Bi4q3XoQX7HBwhplA67EZy2MqRjQQ1GQosL5hA7dycv410ij6HF9cqZD8rkY5pDmPcJMMpEA:1r8QcL:MxIVOgPGZol77Oqzgwqk4yLg0BYR2Zv8_DDXmnFJOAs', '2023-12-13 19:53:05.528104'),
('dj15jn5y3w7bf33j0clc8rntmengyk0v', '.eJxtyTEOgDAIAMC_MOvg2s8YFGJIKhigU9O_6-Bi4q3XoQX7HBwhplA67EZy2MqRjQQ1GQosL5hA7dycv410ij6HF9cqZD8rkY5pDmPcJMMpEA:1qvf0f:-lvQtSEOn6s2N_fUeOthGA-4VSMlnq3V4yrb9qpptdE', '2023-11-08 14:37:25.503346'),
('ur6vptzl2jjmy6mc5wykpw7srf4ulpdr', '.eJxtyTEOgDAIAMC_MOvg2s8YFGJIKhigU9O_6-Bi4q3XoQX7HBwhplA67EZy2MqRjQQ1GQosL5hA7dycv410ij6HF9cqZD8rkY5pDmPcJMMpEA:1qtgjl:vE6DDgNwbZ8ndYuoljwdjzb9ybmyKL6CkjuAmWXm7X4', '2023-11-03 04:03:49.372816'),
('yt6f5pjs48oimpet6y5217xgsd8q2cut', '.eJxtyTEOgDAIAMC_MOvg2s8YFGJIKhigU9O_6-Bi4q3XoQX7HBwhplA67EZy2MqRjQQ1GQosL5hA7dycv410ij6HF9cqZD8rkY5pDmPcJMMpEA:1r5pE2:pLAPz6pFAD4Rfds4yMIxFEdzHPaT-8H1sNUoR4NFxww', '2023-12-06 15:33:14.300888');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_estudiantes`
--

CREATE TABLE `t_estudiantes` (
  `cod_estudiante` varchar(8) NOT NULL,
  `con_estudiante` varchar(100) DEFAULT NULL,
  `nom_estudiante` varchar(100) DEFAULT NULL,
  `ape_estudiante` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `t_estudiantes`
--

INSERT INTO `t_estudiantes` (`cod_estudiante`, `con_estudiante`, `nom_estudiante`, `ape_estudiante`) VALUES
('11111111', '1313', 'admin', 'administrator'),
('12345678', 'contraseña1abc', 'Juan', 'Perez'),
('22222222', '222', 'prueba', 'probando'),
('23456789', 'contraseña2xyz', 'María', 'González'),
('34567890', 'contraseña3123', 'Carlos', 'Rodríguez'),
('45678901', 'contraseña4def', 'Laura', 'Martínez'),
('56789012', 'contraseña5abc123', 'Pedro', 'López'),
('66666666', '4444', 'Rich', 'Fer'),
('67890123', 'contraseña6xyz789', 'Ana', 'Hernández'),
('72260926', 'contraseña10jkl789', 'Ricardo Fernando', 'Rodriguez Gutierrez'),
('75686275', 'contraseña9ghi456', 'Axl Martin', 'Rubio Tavara'),
('78901234', 'contraseña7abcxyz', 'David', 'Sánchez'),
('89012345', 'contraseña8abcdef', 'Sofía', 'Díaz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_historial`
--

CREATE TABLE `t_historial` (
  `id_historial` int NOT NULL,
  `titulo_conversacion` varchar(200) NOT NULL,
  `id_usuario` int NOT NULL,
  `solicitud` text,
  `respuesta` text,
  `fecha_conversacion` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `t_historial`
--

INSERT INTO `t_historial` (`id_historial`, `titulo_conversacion`, `id_usuario`, `solicitud`, `respuesta`, `fecha_conversacion`, `activo`) VALUES
(1, 'Conversacion #1 - 22/11/2023 10:07:36', 11111111, 'Hola', 'Hola soy <strong>certusBot</strong>', '2023-11-22', 1),
(2, 'Conversacion #1 - 22/11/2023 10:07:36', 11111111, '¿Dónde puedo ver mis notas?', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-11-22', 1),
(3, 'Conversacion #2 - 22/11/2023 10:11:30', 11111111, 'Hola', 'Hola soy <strong>certusBot</strong>', '2023-11-22', 1),
(4, 'Conversacion #2 - 22/11/2023 10:11:30', 11111111, '¿Cuáles son las semanas de entrega de las evidencias del curso?', '\n	Las evidencias se deben entregar siguiendo el enlace de los lineamientos AA1 - AA4.\n	<br>\n	<a href=\"https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start\">\n		https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start\n	</a>\n', '2023-11-22', 1),
(5, 'Conversacion #2 - 22/11/2023 10:11:30', 11111111, '¿Cómo puedo mejorar mis notas en el curso?', '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n ', '2023-11-22', 1),
(6, 'Conversacion #3 - 29/11/2023 00:10:38', 11111111, 'Hola', 'Hola soy <strong>certusBot</strong>', '2023-11-29', 1),
(7, 'Conversacion #3 - 29/11/2023 00:10:38', 11111111, '¿Cuáles son las semanas de entrega de las evidencias del curso?', '\n	Las evidencias se deben entregar siguiendo el enlace de los lineamientos AA1 - AA4.\n	<br>\n	<a href=\"https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start\">\n		https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start\n	</a>\n', '2023-11-29', 1),
(8, 'Conversacion #4 - 29/11/2023 01:09:02', 11111111, 'Hola', 'Hola soy <strong>certusBot</strong>', '2023-11-29', 1),
(9, 'Conversacion #2 - 22/11/2023 10:11:30', 11111111, 'Hola', 'Hola soy <strong>certusBot</strong>', '2023-11-22', 1),
(10, 'Conversacion #2 - 22/11/2023 10:11:30', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-11-22', 1),
(11, 'Conversacion #2 - 22/11/2023 10:11:30', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-12-12', 1),
(12, 'Conversacion #3 - 29/11/2023 00:10:38', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-12-12', 1),
(13, 'Conversacion #5 - 12/12/2023 22:53:14', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-12-12', 1),
(14, 'Conversacion #1 - 22/11/2023 10:07:36', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-12-12', 1),
(15, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-12-13', 1),
(16, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Puede proporcionarme una explicación más detallada sobre el curso de AWS?', '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n ', '2023-12-13', 1),
(17, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Puede proporcionarme una explicación más detallada sobre el curso de aws?', '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n ', '2023-12-13', 1),
(18, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Puede proporcionarme una explicacion más detallada sobre el curso de AWS?', '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n ', '2023-12-13', 1),
(19, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Puede proporcionarme una explicación más detallada sobre el curso de aws?', '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n ', '2023-12-13', 1),
(20, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'proporcionarme una explicación más detallada sobre el curso de AWS', '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n ', '2023-12-13', 1),
(21, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Donde puedo encontrar ejemplos practicos relacionados con springboot?', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(22, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Donde puedo encontrar ejemplos practicos relacionados con springboot?', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(23, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'proporcioname', 'Disculpa, puedes intentarlo de nuevo?', '2023-12-13', 1),
(24, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'proporcioname aws', 'no entendi tu consulta', '2023-12-13', 1),
(25, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Donde puedo encontrar ejemplos practicos relacionados con springboot?', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(26, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'donde encuentro presentacion semana 13', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(27, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, '¿Donde puedo encontrar ejemplos practicos relacionados con springbo', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(28, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'Donde puedo encontrar ejemplos practicos relacionados con springboot', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(29, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'Donde encuentro ejemplos practicos relacionados con springboot', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(30, 'Conversacion #7 - 13/12/2023 01:21:52', 11111111, 'donde puedo encontrar ejemplos practicos de springboot', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(31, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'hola', 'Hola soy <strong>certusBot</strong>', '2023-12-13', 1),
(32, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'Puede proporcionarme una explicacion mas detallada sobre el curso de AWS', 'La explicación a detallada el curso de AWS lo encuentras en el siguiente video: https://www.youtube.com/watch?v=x2vrg7HuM6g', '2023-12-13', 1),
(33, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'Donde puedo encontrar ejemplos practicos relacionados con springboot', 'Puede consultar ejemplos prácticos relacionados al tema mediante el siguiente video: https://www.youtube.com/watch?v=3vN2R00YUq4', '2023-12-13', 1),
(34, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'Donde encuentro la presentacion de la semana 13', 'Puede consultar ejemplos prácticos relacionados al tema mediante el siguiente video: https://www.youtube.com/watch?v=3vN2R00YUq4', '2023-12-13', 1),
(35, 'Conversacion #6 - 13/12/2023 01:01:43', 11111111, 'Donde encuentro la presentacion de la semana 13', 'La presentación de la semana 13 se encuentra en el siguiente archivo: https://campusdigital.certus.edu.pe/pluginfile.php/746261/mod_resource/content/0/Semana%20%2013_PPT.pdf', '2023-12-13', 1),
(36, 'Conversacion #1 - 22/11/2023 10:07:36', 11111111, 'donde puedo ver mis notas?', '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n', '2023-12-13', 1),
(37, 'Conversacion #7 - 13/12/2023 01:21:52', 11111111, 'donde puedo encontrar ejemplos practicos de springboot', 'Puede consultar ejemplos prácticos relacionados al tema mediante el siguiente video: https://www.youtube.com/watch?v=3vN2R00YUq4', '2023-12-13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_palabras_clave`
--

CREATE TABLE `t_palabras_clave` (
  `id_palabra_clave` int NOT NULL,
  `id_respuesta` int NOT NULL,
  `palabra` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `t_palabras_clave`
--

INSERT INTO `t_palabras_clave` (`id_palabra_clave`, `id_respuesta`, `palabra`) VALUES
(1, 1, 'evidencias'),
(2, 1, 'semanas'),
(3, 1, 'entrega'),
(4, 1, 'plazos'),
(5, 1, 'fechas'),
(6, 1, 'fecha'),
(7, 1, 'deadline'),
(8, 2, 'rubrica'),
(9, 2, 'rúbrica'),
(10, 2, 'enlace'),
(11, 2, 'aa1'),
(12, 2, 'instrucciones'),
(13, 3, 'criterios'),
(14, 3, 'evaluacion'),
(15, 3, 'evaluación'),
(16, 3, 'enlace'),
(17, 3, 'puntos'),
(18, 3, 'pautas'),
(19, 3, 'puntuacion'),
(20, 3, 'primera'),
(21, 3, 'evidencia 1'),
(22, 4, 'evaluacion'),
(23, 4, 'grupal'),
(24, 4, 'individual'),
(25, 4, 'segunda'),
(26, 4, 'evidencia 2'),
(27, 4, 'enlace'),
(28, 5, 'lineamientos'),
(29, 5, 'evaluacion'),
(30, 5, 'evaluación'),
(31, 5, 'ruta'),
(32, 5, 'video'),
(33, 5, 'curso'),
(34, 5, 'pautas'),
(35, 5, 'indicaciones'),
(36, 5, 'guia'),
(37, 6, 'notas'),
(38, 6, 'visualizar'),
(39, 6, 'campus'),
(40, 6, 'video'),
(41, 6, 'donde'),
(42, 6, 'ver'),
(43, 6, 'puntajes'),
(44, 6, 'puedo'),
(45, 7, 'mejoras'),
(46, 7, 'notas'),
(47, 7, 'curso'),
(48, 7, 'video'),
(49, 7, 'tips'),
(50, 7, 'consejos'),
(51, 7, 'estrategias'),
(52, 8, 'semanas'),
(53, 8, 'visualizar'),
(54, 8, 'notas'),
(55, 8, 'cuando'),
(56, 8, 'disponibles'),
(57, 8, 'puntajes'),
(58, 11, 'proporcionarme'),
(59, 11, 'explicacion'),
(60, 11, 'detallada'),
(61, 11, 'aws'),
(62, 12, 'donde'),
(63, 12, 'encontrar'),
(64, 12, 'ejemplos'),
(65, 12, 'springboot'),
(66, 13, 'donde'),
(67, 13, 'encuentro'),
(68, 13, 'presentacion'),
(69, 13, 'semana 13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_preguntas`
--

CREATE TABLE `t_preguntas` (
  `id_pregunta` int NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `t_preguntas`
--

INSERT INTO `t_preguntas` (`id_pregunta`, `descripcion`) VALUES
(1, '¿Cuáles son las semanas de entrega de las evidencias del curso?'),
(2, '¿Dónde encuentro la rúbrica de la evidencia AA1?'),
(3, '¿Cuáles son los criterios de evaluación de la evidencia 1?'),
(4, '¿La evaluación de la evidencia 2 es grupal o individual?'),
(5, '¿Dónde puedo encontrar los lineamientos de evaluación del curso?'),
(6, '¿Dónde puedo visualizar mis notas?'),
(7, '¿Cómo puedo mejorar mis notas en el curso?'),
(8, '¿En qué semanas puedo visualizar las notas del curso?'),
(9, '¿Puede proporcionarme una explicación más detallada sobre el curso de AWS?'),
(10, '¿Dónde puedo encontrar ejemplos prácticos relacionados con springboot?'),
(11, '¿Dónde encuentro la presentación de la semana 13?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_respuestas`
--

CREATE TABLE `t_respuestas` (
  `id_respuesta` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `t_respuestas`
--

INSERT INTO `t_respuestas` (`id_respuesta`, `id_pregunta`, `descripcion`) VALUES
(1, 1, '\n	Las evidencias se deben entregar siguiendo el enlace de los lineamientos AA1 - AA4.\n	<br>\n	<a href=\"https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start\">\n		https://campusdigital.certus.edu.pe/course/view.php?id=11654&section=2#tabs-tree-start\n	</a>\n'),
(2, 2, '\n	Para encontrar la rúbrica de la evidencia AA1, simplemente sigue este enlace.\n	<br>     \n	<a href=\"https://campusdigital.certus.edu.pe/pluginfile.php/746234/mod_resource/content/0/R%C3%BAbrica%20AA1.pdf\" target=\"_blank\">\n		https://campusdigital.certus.edu.pe/pluginfile.php/746234/mod_resource/content/0/R%C3%BAbrica%20AA1.pdf\n	</a>\n'),
(3, 3, '\n	Los criterios de evaluación de la evidencia 1 se encuentran en este enlace.\n	<br>\n	<a href=\"https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf\" target=\"_blank\">\n		https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf\n	</a>\n'),
(4, 4, '\n	La evaluación de la evidencia 2 puede ser grupal o individual. Para más detalles, consulta este enlace.\n	<br>\n	<a href=\"https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf\" target=\"_blank\">\n		https://campusdigital.certus.edu.pe/pluginfile.php/746230/mod_resource/content/0/Lineamientos%20de%20evaluaci%C3%B3n%20AA1.pdf\n	</a>\n'),
(5, 5, '\n	Los lineamientos de evaluación del curso se encuentran en el siguiente video. \n	<br><br>\n	<div class=\"mp-3\">\n		<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/e7UiyEaXm-Y?si=5fWv1hbtRscv1jLB\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n	</div>\n'),
(6, 6, '\n	Para ver tus notas, accede al sigueinte enlace del campus del estudiante\n	<a href=\"https://intranet.certus.edu.pe/Login/\">\n		 https://intranet.certus.edu.pe/Login/\n	</a>\n	 y mira este video que te muestra cómo hacerlo.  \n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/dnPcNlb89vA?si=U4ShMjRukLWRCAKR\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n'),
(7, 7, '\n 	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n 	<br><br>\n 	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n '),
(8, 8, '\n 	Puedes ver tus notas una semana después de presentar tus evidencias. ¡No te preocupes, es rápido! Una semana después de la presentación de cada una de tus evidencias!\n '),
(9, 7, '\n	Para mejorar tus notas en el curso, mira este video con algunos consejos útiles.\n	<br><br>\n	<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/ZhzMRMJXA90?si=xGnmfJ56lVxQvu8R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\n'),
(10, 8, '\n	Puedes ver tus notas una semana después de presentar tus evidencias. ¡No te preocupes, es rápido! Una semana después de la presentación de cada una de tus evidencias!\n'),
(11, 9, 'La explicación a detallada el curso de AWS lo encuentras en el siguiente video: https://www.youtube.com/watch?v=x2vrg7HuM6g'),
(12, 10, 'Puede consultar ejemplos prácticos relacionados al tema mediante el siguiente video: https://www.youtube.com/watch?v=3vN2R00YUq4'),
(13, 11, 'La presentación de la semana 13 se encuentra en el siguiente archivo: https://campusdigital.certus.edu.pe/pluginfile.php/746261/mod_resource/content/0/Semana%20%2013_PPT.pdf');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `t_estudiantes`
--
ALTER TABLE `t_estudiantes`
  ADD PRIMARY KEY (`cod_estudiante`);

--
-- Indices de la tabla `t_historial`
--
ALTER TABLE `t_historial`
  ADD PRIMARY KEY (`id_historial`);

--
-- Indices de la tabla `t_palabras_clave`
--
ALTER TABLE `t_palabras_clave`
  ADD PRIMARY KEY (`id_palabra_clave`);

--
-- Indices de la tabla `t_preguntas`
--
ALTER TABLE `t_preguntas`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `t_respuestas`
--
ALTER TABLE `t_respuestas`
  ADD PRIMARY KEY (`id_respuesta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `t_historial`
--
ALTER TABLE `t_historial`
  MODIFY `id_historial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `t_palabras_clave`
--
ALTER TABLE `t_palabras_clave`
  MODIFY `id_palabra_clave` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `t_preguntas`
--
ALTER TABLE `t_preguntas`
  MODIFY `id_pregunta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `t_respuestas`
--
ALTER TABLE `t_respuestas`
  MODIFY `id_respuesta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
