-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-08-2016 a las 01:04:37
-- Versión del servidor: 5.5.49-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `serviciosaereospsa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1435D52D2265B05D` (`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=95 ;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `usuario`, `nombre`, `apellido`, `telefono`, `direccion`, `email`) VALUES
(2, NULL, 'PABLO', 'ARRASTIA', NULL, NULL, '-'),
(3, 39, 'MAX', 'ANDERSON', NULL, NULL, 'max_arias@hotmail.com'),
(4, NULL, 'YONATHAN', 'ARCE', NULL, NULL, '-'),
(5, 40, 'NICOLAS', 'ALAIS', NULL, NULL, 'nico.alais@hotmail.com'),
(6, 41, 'MAXIMILIANO', 'ABBRUZZESE', NULL, NULL, 'maxabbruzzese@gmail.com'),
(7, 42, 'JUAN PABLO', 'BARNECH', NULL, NULL, 'pablobarnech@hotmail.com'),
(8, 43, 'CESAR AUGUSTO', 'BRITEZ', NULL, NULL, 'cesarbritezz@gmail.com'),
(9, 44, 'MARTIN', 'BASSOLI', NULL, NULL, 'martinbassoli@hotmail.com'),
(10, 45, 'NICOLAS', 'BERTALAN', NULL, NULL, 'nico.bertalan@hotmail.com'),
(11, 46, 'EMMANUEL', 'BORELLI', NULL, NULL, 'emmanuelborelli@yahoo.com'),
(12, 47, 'NAHUEL', 'BOLI', NULL, NULL, 'nahuelboli@hotmail.com'),
(13, 48, 'DANIEL AGUSTIN ', 'BASILE', NULL, NULL, 'agusbasile17@hotmail.com'),
(14, 49, 'LEONARDO', 'BADARIOTTI', NULL, NULL, 'l.badariotti@gmail.com'),
(15, 50, 'PEDRO', 'BUSSO', NULL, NULL, 'pedrobusso@hotmail.com'),
(16, NULL, 'ANDRES', 'BLAIOTTA', NULL, NULL, '-'),
(17, 51, 'HORACIO', 'BENITEZ', NULL, NULL, 'hb@inti.gob.ar'),
(18, 52, 'FRANCISCO', 'CABALLERO', NULL, NULL, 'pancho.caballero@hotmail.com'),
(19, 53, 'FEDERICO', 'CAZENAVE', NULL, NULL, 'espaciopalermo@gmail.com'),
(20, 54, 'DANIELA NICOLE', 'CAMPOS PAREJA', NULL, NULL, 'daninicolecampos@gmail.com'),
(21, 55, 'JESSICA', 'CARLANDO', NULL, NULL, 'carlando.jessica@gmail.com'),
(22, 56, 'ESTEBAN MIGUEL', 'CARCAGNO', NULL, NULL, 'estebancarcagno@gmail.com'),
(23, 57, 'LUCIANO NICOLAS', 'CARUSO', NULL, NULL, 'lucianocaruso95@hotmail.com'),
(24, 58, 'CARLOS ALBERTO', 'COLLADO', NULL, NULL, 'albert-39@hotmail.com'),
(25, 59, 'SEBASTIAN', 'CASAL', NULL, NULL, 'sebastian.casal@hotmail.com'),
(26, 60, 'ZAIRA PATRICIA', 'CABEZA', NULL, NULL, 'zairapatriciacabezas@gmail.com'),
(27, 61, 'VALENTIN', 'DE SANTIS', NULL, NULL, 'valentin245@ciudad.com.ar'),
(28, 62, 'HECTOR EDUARO', 'DIAZ ZUÑIGA', NULL, NULL, 'eduardo5416@hotmail.com'),
(29, 63, 'TOMAS', 'DE DOMINICIS', NULL, NULL, 'tomas.dedominicis@gmail.com'),
(30, 64, 'JAVIER ELIAS', 'ESCANDARANI', NULL, NULL, 'javoescan@gmail.com'),
(31, NULL, 'JORGE JAVIER', 'ESTEVEZ', NULL, NULL, '-'),
(32, 65, 'JOAQUIN', 'FAGONE', NULL, NULL, 'joaco.fagone@gmail.com'),
(33, 66, 'NICOLAS RAFAEL', 'FONT', NULL, NULL, 'nicorfont@gmail.com'),
(34, 67, 'IVAN ARIEL', 'FERNANDEZ', NULL, NULL, 'ivanpfa@outlook.com.ar'),
(35, 68, 'MARCOS', 'FERNANDEZ FORMIGO', NULL, NULL, 'marcos.fernandez.formigo@gmail.com'),
(36, 69, 'CHRISTIAN', 'FREIGA', NULL, NULL, 'christianf.freiga@hotmail.com'),
(37, NULL, 'HERNAN ARIEL', 'FIORANI', NULL, NULL, '-'),
(38, 70, 'TOMAS', 'FERRARI', NULL, NULL, 'tferrari.92@hotmail.com'),
(39, NULL, 'JUAN', 'FLEITAS GONZALEZ', NULL, NULL, '-'),
(40, 71, 'LEANDRO MARCELO', 'FEU', NULL, NULL, 'leandro.m.feu@gmail.com'),
(41, 72, 'LAUTARO', 'FIGUEROA', NULL, NULL, 'lauta1996@hotmail.com'),
(42, 73, 'DIEGO', 'GIMENEZ', NULL, NULL, 'diegimenez@live.com.ar'),
(43, 74, 'HERNAN', 'GIMENEZ', NULL, NULL, 'hergimenez@gmail.com'),
(44, 75, 'OSVALDO PABLO', 'GUDESBLAT', NULL, NULL, 'zeep@mli.com.ar'),
(45, 76, 'MARTIN ', 'GARDELLA', NULL, NULL, 'gmartinleonardo@yahoo.com.ar'),
(46, 77, 'JOSE ALBERTO', 'GARCIA', NULL, NULL, 'joseagarcia87@yahoo.com.ar'),
(47, NULL, 'OSCAR ENRIQUE', 'GOMEZ', NULL, NULL, '-'),
(48, NULL, 'LEANDRO JESUS', 'GARAY', NULL, NULL, '-'),
(49, 78, 'SEBASTIAN', 'GARCIA ROJAS', NULL, NULL, 'sebagr@gmail.com'),
(50, 79, 'LEON', 'HALFON', NULL, NULL, 'leonhalfon@gmail.com'),
(51, 80, 'GONZALO', 'IMENDE', NULL, NULL, 'gonzaloimende226@hotmail.com'),
(52, NULL, 'NORA', 'JUAREZ', NULL, NULL, '-'),
(53, 81, 'ALEJANDRO GABRIEL', 'JOAQUIM', NULL, NULL, 'alejoaquim@hotmail.com'),
(54, 82, 'AGUSTINA', 'LISA', NULL, NULL, 'agustinalisa@gmail.com'),
(55, 83, 'MATIAS HERNAN', 'LANCI', NULL, NULL, 'matias.lanci@vidtcm.com.ar'),
(56, 84, 'JUAN IGNACIO', 'LUNARDI', NULL, NULL, 'juanilunardi@gmail.com'),
(57, 85, 'CARLOS ALI', 'LOPEZ', NULL, NULL, 'alilopez_21@hotmail.com'),
(58, 86, 'LUCAS JOAQUIN', 'LLANOS', NULL, NULL, 'lucasjllanos@hotmail.com'),
(59, 87, 'AGUSTIN EDUARDO', 'LEARDI', NULL, NULL, 'leardi.agustin@gmail.com'),
(60, 88, 'SANTIAGO EMILIANO', 'MISTA', NULL, NULL, 'santiagomista96@GMAIL.COM'),
(61, 89, 'GONZALO', 'MASOTTO', NULL, NULL, 'gonzam.92@hotmail.com'),
(62, 90, 'JUAN MANUEL', 'MERA', NULL, NULL, 'juanmera@gmail.com'),
(63, 91, 'DIEGO SEBASTIAN', 'MELGAREJO', NULL, NULL, 'dsmel_87@hotmail.com'),
(64, NULL, 'FEDERICO', 'MEDEL IMAS', NULL, NULL, '-'),
(65, 92, 'NICOLAS', 'CORREA MORALES', NULL, NULL, 'nicolas96.cm@gmail.com'),
(66, 93, 'EZEQUIEL', 'MORENO', NULL, NULL, 'ezequielmoreno22@hotmail.com'),
(67, 94, 'TOMAS ', 'MARTINEZ JORFEN', NULL, NULL, 'tomigenio30@hotmail.com'),
(68, 95, 'DARIO JOSE', 'MUÑOZ', NULL, NULL, 'murdok1983@hotmail.com'),
(69, 96, 'MAXIMILIANO', 'MARANZANA', NULL, NULL, 'maximaranzana@fibertel.com.ar'),
(70, 97, 'ARIAN AGUSTIN ', 'MOLINA', NULL, NULL, 'arian-mo3@hotmail.com'),
(71, 98, 'ROBERTO CARLOS', 'NOVELLO', NULL, NULL, 'robertonovello76@hotmail.com'),
(72, 99, 'BRUNO', 'VENNING NIELSEN', NULL, NULL, 'brunovn@gmail.com'),
(73, 100, 'MYKYTA', 'PAUCHEK', NULL, NULL, 'pauchek7@gmail.com'),
(74, 101, 'MIGUEL', 'PEIRANO', NULL, NULL, 'miguelpeirano91@gmail.com'),
(75, 102, 'JONATAN', 'PAEZ', NULL, NULL, 'jonatan_0023@hotmail.com'),
(76, 103, 'TOMAS', 'PRATTO', NULL, NULL, 'tomemapratt@gmail.com'),
(77, 104, 'JUAN MARTIN', 'OCHOA', NULL, NULL, 'ochoa.juanmartin@gmail.com'),
(78, 105, 'SEBASTIAN NAHUEL', 'PORTESI', NULL, NULL, 'sebastian.portesi@outlook.com'),
(79, 106, 'ALAN GABRIEL ', 'PROKOPOWICZ', NULL, NULL, 'alan.proko97@gmail.com'),
(80, 107, 'NICOLAS PABLO', 'PLANTAMUZA', NULL, NULL, 'npplanta@gmail.com'),
(81, 108, 'LUCIA', 'ROMEO', NULL, NULL, 'romeolucia93@gmail.com'),
(82, 109, 'LAUTARO', 'SOSA', NULL, NULL, 'lautaroesosa@hotmail.com'),
(83, 110, 'SEBASTIAN ALEJANDRO', 'SCIUTTI', NULL, NULL, 'sebas_sci@hotmail.com'),
(84, 111, 'MAGALI', 'SANTANGELO', NULL, NULL, 'magali9906@hotmail.com'),
(85, 112, 'LEANDRO PABLO', 'SAN', NULL, NULL, 'psanleandro@bancopatagonia.com.ar'),
(86, 113, 'NICOLAS', 'SACCANI', NULL, NULL, 'ulmerlino@hotmail.com'),
(87, NULL, 'JUAN FRANCISCO', 'SYKORA', NULL, NULL, '-'),
(88, 114, 'MANUEL', 'TERRONES GODOY', NULL, NULL, 'manuelterrones88@yahoo.com.ar'),
(89, 115, 'FEDERICO', 'VILLARINO', NULL, NULL, 'fede.villarino@gmail.com'),
(90, 116, 'DANIEL EZEQUIEL', 'VARELA', NULL, NULL, 'danielvarela@gmail.com'),
(91, 117, 'EZEQUIEL', 'VAZQUEZ RECAREDO', NULL, NULL, 'revazquez@gmail.com'),
(92, 118, 'PAULA', 'VEGA', NULL, NULL, 'agenciapaulavega@yahoo.com.ar'),
(93, 119, 'JUAN MANUEL ', 'VILCHES', NULL, NULL, 'juani.vilches6@speedy.com.ar'),
(94, NULL, 'JORGE ALEJANDRO', 'WEGELIN', NULL, NULL, '-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE IF NOT EXISTS `avion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `servicio` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_234D9D3815DF1885` (`matricula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `avion`
--

INSERT INTO `avion` (`id`, `matricula`, `servicio`) VALUES
(1, 'LV-MMM', 1),
(2, 'LV-AOL', 1),
(3, 'LV-OLD', 1),
(4, 'LV-AOM', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE IF NOT EXISTS `dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3E153BCE3A909126` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `dia`
--

INSERT INTO `dia` (`id`, `nombre`) VALUES
(7, 'Domingo'),
(4, 'Jueves'),
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miércoles'),
(6, 'Sábado'),
(5, 'Viernes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=284 ;

--
-- Volcado de datos para la tabla `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'admin', 'admin', 'sebastian@proyectiva.com', 'sebastian@proyectiva.com', 1, 'l7q895l85ts04s040gsoc8gocsg0g8g', '$2y$13$Q7fgWMJ6IhVxwwI7LqeYpOzASJdDMIBSudV7lo3xooVEFV7R4WAFm', '2016-08-09 00:42:22', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL),
(39, 'andersonmax', 'andersonmax', 'max_arias@hotmail.com', 'max_arias@hotmail.com', 0, 'd8n16xzek1wgowswko0w8c8sssw8wkk', '$2y$13$i1Ogta6GMgn3NN3/3CfFHOY57k53G4Y7DOOoUQfYAHvDVxMdSINoq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(40, 'alaisnicolas', 'alaisnicolas', 'nico.alais@hotmail.com', 'nico.alais@hotmail.com', 0, 'a7kfe8jbr54o488wo80wcskk4gksgw4', '$2y$13$./o5BiRupKEgZZaaL6q77u21PKdJ4Qr.bhDGrebXPDabn16N5pu6u', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(41, 'abbruzzesemaximiliano', 'abbruzzesemaximiliano', 'maxabbruzzese@gmail.com', 'maxabbruzzese@gmail.com', 0, 'lbpi8laj6f44woc804o4ggkw048o4so', '$2y$13$yZmm1h5ythm7BjC5KzvdoOG7a2aetXiUW2y1PEYbFyBRl/ogCIggK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(42, 'barnechjuanpablo', 'barnechjuanpablo', 'pablobarnech@hotmail.com', 'pablobarnech@hotmail.com', 0, '1v54pt14fj34c8w8cswosks0sw8ogks', '$2y$13$tAjLz2DtPPM/uVTcc0EFZ.8OSfGe9KAjBhrog2G3GF59Pd7wC4Hl2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(43, 'britezcesaraugusto', 'britezcesaraugusto', 'cesarbritezz@gmail.com', 'cesarbritezz@gmail.com', 0, 'nj0n7he6rdw0g8g88og4ggcccksokgw', '$2y$13$HF4Tsl6Yjdv2YGTM8H/f5Oh1RrUbh5wXfpYQAtCi/97fN3l42HBpq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(44, 'bassolimartin', 'bassolimartin', 'martinbassoli@hotmail.com', 'martinbassoli@hotmail.com', 0, 'l8hwqupq8b48gwkgwkcoo044okwk8wo', '$2y$13$1NVmwAu0Pi4sZgf4zmucsO1a1NqJGFfE.4qD9V7a5YOYUeeqnVr02', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(45, 'bertalannicolas', 'bertalannicolas', 'nico.bertalan@hotmail.com', 'nico.bertalan@hotmail.com', 0, '2gwt6smg9hog484owks8ggs8kc0ckw4', '$2y$13$9hqOu3/ENUGk.CbddKvzMuk/PTdenf9BHCctjn8vyaV3shnS7TftC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(46, 'borelliemmanuel', 'borelliemmanuel', 'emmanuelborelli@yahoo.com', 'emmanuelborelli@yahoo.com', 0, 'hqkvvygeb4ocoow88o0sw00w0kcwww8', '$2y$13$LnkB4d12/rlsPgvG3fCnhOuZhVaKgz8HLYUC67rwOhsib7HhEpc46', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(47, 'bolinahuel', 'bolinahuel', 'nahuelboli@hotmail.com', 'nahuelboli@hotmail.com', 0, '6jylx7tsm7gogsc0ck8o4440gwc44c4', '$2y$13$0/8X.T8PP60lpdg44T6L6Ozp5M3Y.Hu/JTsMFgs8oMO3PkzGVKEmO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(48, 'basiledanielagustin', 'basiledanielagustin', 'agusbasile17@hotmail.com', 'agusbasile17@hotmail.com', 0, 'iucplcfzfdsg444gws0ockow44kssks', '$2y$13$.EjodePiyOp/w.d96JC41.RsrzAax0yysAhCcLqvY5Osh8F9mwY2G', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(49, 'badariottileonardo', 'badariottileonardo', 'l.badariotti@gmail.com', 'l.badariotti@gmail.com', 0, 'no1o3sy7dqso40gk8gkck4g04c0kw8o', '$2y$13$Wvuy68N7HQEG0drVLL4n1OVHOCzOpd3GqSJnlQ5TDxE/papbByXFO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(50, 'bussopedro', 'bussopedro', 'pedrobusso@hotmail.com', 'pedrobusso@hotmail.com', 0, '27p57hizgow0gccs484so4w480kkk8k', '$2y$13$Dz5baUq5822YNFHPLCYA2OuNxjsyXHszJj7dO9z7alcl2kT5Wzgw2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(51, 'benitezhoracio', 'benitezhoracio', 'hb@inti.gob.ar', 'hb@inti.gob.ar', 0, 'fw4d2io21sockc8w440k0c8okgckkcc', '$2y$13$XjX53PdM7SH4oJKxwjJiK.s2fxK0dLIWhVVUdW9Sf2dIX6vturpFy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(52, 'caballerofrancisco', 'caballerofrancisco', 'pancho.caballero@hotmail.com', 'pancho.caballero@hotmail.com', 0, '1za0szxn47escwog400o0044wgocck0', '$2y$13$L9HojefO2irH3uhIBwWhLujPjwtoaLWCxMaGaZiv4vZcvIvJ8JWDO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(53, 'cazenavefederico', 'cazenavefederico', 'espaciopalermo@gmail.com', 'espaciopalermo@gmail.com', 0, 'n74t1g34200gs0kc8c80k84cwc4k0w4', '$2y$13$3LF1yl3uX./LLYNEUvT7aOV0/EVfKrvW9RbbjgocT9ml3s/Hv.avi', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(54, 'camposparejadanielanicole', 'camposparejadanielanicole', 'daninicolecampos@gmail.com', 'daninicolecampos@gmail.com', 0, 'p8i8df28g408gowcsocgg0scc4s88oo', '$2y$13$OCzlcye8W857yJwzZbOhde4jtfbSDuymxsSr4.YmoIwo9.7IWtICe', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(55, 'carlandojessica', 'carlandojessica', 'carlando.jessica@gmail.com', 'carlando.jessica@gmail.com', 0, 'sz1kyoztsu8w0ock88g8c00gos88k40', '$2y$13$mCKtN2jSRhSMZefsPoaG6.b6VrLJ6cLsS7dMr9g66uU3RJWBjTjEa', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(56, 'carcagnoestebanmiguel', 'carcagnoestebanmiguel', 'estebancarcagno@gmail.com', 'estebancarcagno@gmail.com', 0, 'av0gtanq8v4gcgg8ck0kwk84cg8w8cc', '$2y$13$Gkt0kUn5Z30KnQ1k0GPptu5eR3FnCd997PnMM5sLYHzZtPSEunYgu', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(57, 'carusolucianonicolas', 'carusolucianonicolas', 'lucianocaruso95@hotmail.com', 'lucianocaruso95@hotmail.com', 0, 'l4agdt0zt9sso8k444so0k88k44k884', '$2y$13$T350SBW8fBK9eS52hiTmtev28CsJlz35f.ie6XQyxIOXt8qdRF0CO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(58, 'colladocarlosalberto', 'colladocarlosalberto', 'albert-39@hotmail.com', 'albert-39@hotmail.com', 0, 'e68ehcolw000cso88o800kwws80g0w0', '$2y$13$x9Ia.61p0ywZivc5JanGgOSjf9WvQruGPDAhNqiERtCsmVF1k.sQ.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(59, 'casalsebastian', 'casalsebastian', 'sebastian.casal@hotmail.com', 'sebastian.casal@hotmail.com', 0, 'mld0hmfknrkcs4c80gcowgkwk0s84co', '$2y$13$10i/RyK3q4PysdeqMcyosut.H3bzwyMnBrvGZdTquoJrQRZID0XJe', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(60, 'cabezazairapatricia', 'cabezazairapatricia', 'zairapatriciacabezas@gmail.com', 'zairapatriciacabezas@gmail.com', 0, 'g3dr1r32ljscc4gcsks0c8ocg4ck0ko', '$2y$13$MYNaeln8aCaeHEipj3EPROk14yr7BBjsIVDBbuz3O5A00WWm1kapy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(61, 'desantisvalentin', 'desantisvalentin', 'valentin245@ciudad.com.ar', 'valentin245@ciudad.com.ar', 0, 'eeoqfizajrc4gww88o8ks0gokkgwo0c', '$2y$13$96dOJE53HoYMh1Cks352ceTTrEauB41t3e1LHzBnUxNgfwbj0d/q2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(62, 'diazzuÑigahectoreduaro', 'diazzuñigahectoreduaro', 'eduardo5416@hotmail.com', 'eduardo5416@hotmail.com', 0, 'ba37q2d1ajso0csock0wck4ssc4ogw0', '$2y$13$lQlwxPP2HGcBFZFg8KLWuO8P0cAvTquIAnkfVA7OVY5K9nEFYy2zG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(63, 'dedominicistomas', 'dedominicistomas', 'tomas.dedominicis@gmail.com', 'tomas.dedominicis@gmail.com', 0, 'a0526dv6y0ow48wogkksko44kw48w8s', '$2y$13$sY3Xq7jpDuntpDNfIdOdUe2ahLGBdTBnABNtLB0NLHYM33iYqPVvm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(64, 'escandaranijavierelias', 'escandaranijavierelias', 'javoescan@gmail.com', 'javoescan@gmail.com', 0, '6qp4kr1pwko4csc4wk84ckg4ckoswgw', '$2y$13$YvuOsgelWGrTfcrvEEOIcuPflecUSHhZjaxj7DtAUITRLTxAzLSGO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(65, 'fagonejoaquin', 'fagonejoaquin', 'joaco.fagone@gmail.com', 'joaco.fagone@gmail.com', 0, 'b1fm2z9qpb4koo4ow48o0kcgww8440k', '$2y$13$GfuVK4heg8f6hSq1YtCxaesDHRh29DXUPXBRlon/MGbslS8E9xhVK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(66, 'fontnicolasrafael', 'fontnicolasrafael', 'nicorfont@gmail.com', 'nicorfont@gmail.com', 0, 'tdnbtvj30y88sckw448gg8gg4s0s8so', '$2y$13$KbUs3ZL75SBsOlp04ktb1uyZxcCF5Smfu8zTedIt3XHdLbeqNuC.6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(67, 'fernandezivanariel', 'fernandezivanariel', 'ivanpfa@outlook.com.ar', 'ivanpfa@outlook.com.ar', 0, 'c8soh93y21sks8ggcwgoo80kco44ow8', '$2y$13$68Yy.0TpaQvtQcKpD9rYMOJlJ1ozvrXckyCoCDawKoEGh1PFBvite', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(68, 'fernandezformigomarcos', 'fernandezformigomarcos', 'marcos.fernandez.formigo@gmail.com', 'marcos.fernandez.formigo@gmail.com', 0, 'i7eup73idxs8oog8w0g0gkc8c840g00', '$2y$13$kXXvif/a1zuTRL7N0xDvg.ZlZO0BXjEqvUB36KFyEEPhDgJHi42dK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(69, 'freigachristian', 'freigachristian', 'christianf.freiga@hotmail.com', 'christianf.freiga@hotmail.com', 0, '3k2i5rvzq6gwwwggso0sg0ok4sos4oc', '$2y$13$lIjO6ZgdWuq5DbY84FpI.uths8iZMyfro1dcmAmloLDI0Bj4InE6a', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(70, 'ferraritomas', 'ferraritomas', 'tferrari.92@hotmail.com', 'tferrari.92@hotmail.com', 0, 'htmq8c2kjfcc0g8oowk4co4kgk8s0ws', '$2y$13$ok26G3yHjsSzt.GaY.hny.1kKmlkqriLGO8CuQXcxAtuPZv40KpV6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(71, 'feuleandromarcelo', 'feuleandromarcelo', 'leandro.m.feu@gmail.com', 'leandro.m.feu@gmail.com', 0, 'e63ra4j4cu80s8woswwoco44ccsco0', '$2y$13$.uu5ke5dCOSfQIM521aTe.6f5RBtqS7xxcocmHa0u2EVKYPCeTFtG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(72, 'figueroalautaro', 'figueroalautaro', 'lauta1996@hotmail.com', 'lauta1996@hotmail.com', 0, '1rp4r5y7cvb4s48w0o4wk0ws8s0csk8', '$2y$13$gWAe24aGiWHuGsPxBT1/POciRLtYli6gTxjKVdSdZVDIvnEWgbUee', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(73, 'gimenezdiego', 'gimenezdiego', 'diegimenez@live.com.ar', 'diegimenez@live.com.ar', 0, '4q9auh9rtd6oggsso4o08g8oosos4ss', '$2y$13$mIUo.JFgXFj4X8o5dWZVIe/on8XUtdNKmyOErusoTRp3I9tHWpR1a', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(74, 'gimenezhernan', 'gimenezhernan', 'hergimenez@gmail.com', 'hergimenez@gmail.com', 0, 'qbpugbniydc0cwg4ckgc8ws8k4ocog4', '$2y$13$Eb6sUms.O78qBEKFS/9m1.3/JC3xGKdmTUWTGH9HJIoX3ewwvUKim', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(75, 'gudesblatosvaldopablo', 'gudesblatosvaldopablo', 'zeep@mli.com.ar', 'zeep@mli.com.ar', 0, '4oa14oilwg84ggocgo088kc088g4kgc', '$2y$13$ENZQjv9UgWOkJzcj0TIcsOv6.p4PwaU5zSDHbzIjm.bPS7ZzgOr3i', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(76, 'gardellamartin', 'gardellamartin', 'gmartinleonardo@yahoo.com.ar', 'gmartinleonardo@yahoo.com.ar', 0, '2o0fnqaifpk4ggg80swo0wg8okc48ss', '$2y$13$PGu1nFF6PsjAO3EBzxPk7OHiPFu0bIUp.CGpI2iS43FfB1PJbVz86', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(77, 'garciajosealberto', 'garciajosealberto', 'joseagarcia87@yahoo.com.ar', 'joseagarcia87@yahoo.com.ar', 0, '7ow4qezhnhgkk4o84o8s0g8gwcc00gg', '$2y$13$zKnvLqpwhIkzbv7mSITIyel.S1fyGgjmfFHPmnipGZ3lryfQBFocW', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(78, 'garciarojassebastian', 'garciarojassebastian', 'sebagr@gmail.com', 'sebagr@gmail.com', 0, 'dqbuz94oba8kkswgk4gowcgc00kwcso', '$2y$13$75XmlP1VxR9.wuEXNi5E4e4lxpmSbUrMGLWfy9lWk7ZwavJNxO3O.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(79, 'halfonleon', 'halfonleon', 'leonhalfon@gmail.com', 'leonhalfon@gmail.com', 0, 'bccgrdxzlk0ggsokk8k4o8gksw48gwc', '$2y$13$xz7dbEKEfF7EKI8CayWeg.3FWUxNYbL64MpOtUhK3XriLwrj3hAZi', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(80, 'imendegonzalo', 'imendegonzalo', 'gonzaloimende226@hotmail.com', 'gonzaloimende226@hotmail.com', 0, 'eltrdi4jcbccgwwswkkgw44gwgg4kw0', '$2y$13$vYEkcALj4AbacAmpnRxRF.h.yg11oOB7ZpV4Ng.csbsPQC15UcIjq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(81, 'joaquimalejandrogabriel', 'joaquimalejandrogabriel', 'alejoaquim@hotmail.com', 'alejoaquim@hotmail.com', 0, 'aqkl11nkbawwsk8gs4kwkc8c440888c', '$2y$13$tsYbete0NriNMpsYJChmsO1n4n3qdDrH/ybxUzD/S8N/HOFl9/qSW', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(82, 'lisaagustina', 'lisaagustina', 'agustinalisa@gmail.com', 'agustinalisa@gmail.com', 0, 'rixrokjo2j4c4wgosw4w80k0s0gooco', '$2y$13$8Oj6YV96IRrIdecF.dfZWOmKxv1lBvf4s41p9TRO7yYYjSiABsRWS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(83, 'lancimatiashernan', 'lancimatiashernan', 'matias.lanci@vidtcm.com.ar', 'matias.lanci@vidtcm.com.ar', 0, 's8pmxwpkqv40ksw04c8sgoco048sw80', '$2y$13$NFKjBtTYvxcj4LpqfRNv5OSgVnZkrg.hzgwp7K6XgvsPw1bd1Xwru', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(84, 'lunardijuanignacio', 'lunardijuanignacio', 'juanilunardi@gmail.com', 'juanilunardi@gmail.com', 0, 'tis9qb8hyjkggc4wsw8wscw80kgwww4', '$2y$13$42e3Ms/rmVOBRKkTSGwjCeRoY0crHAPSysX6dm.FZL/viWc7Tccki', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(85, 'lopezcarlosali', 'lopezcarlosali', 'alilopez_21@hotmail.com', 'alilopez_21@hotmail.com', 0, 'l7qifbhbcfkokwkogwogws8owko4004', '$2y$13$cI55olCi5mX8k8EaZLc5i.YWiMnhe3FYBYJ5p474JBOB9hlDxsGLm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(86, 'llanoslucasjoaquin', 'llanoslucasjoaquin', 'lucasjllanos@hotmail.com', 'lucasjllanos@hotmail.com', 0, 'hjhtclj6begw0wo8ok44k8sg0k08gks', '$2y$13$P8X4RJ.hj5dcatJczMmoCOmESk0jxXpEUjrhhINlBLNdHaKbhBjwm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(87, 'leardiagustineduardo', 'leardiagustineduardo', 'leardi.agustin@gmail.com', 'leardi.agustin@gmail.com', 0, 'tp7t10d3f74okk04084w0gkk8swwkgo', '$2y$13$bEIKQ4LsGRk4.9Z4IKvt/ulrBDz2fAZQfrOO7I8nSywi2sSu.i/.e', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(88, 'mistasantiagoemiliano', 'mistasantiagoemiliano', 'santiagomista96@GMAIL.COM', 'santiagomista96@gmail.com', 0, '3cwwwt11m7i8sswgo4kw4k4k8oo8okc', '$2y$13$U39n02J26RFSgmZwbetwU.3GmzQtPmVwUNKA7qENyFWepI7FYsQdK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(89, 'masottogonzalo', 'masottogonzalo', 'gonzam.92@hotmail.com', 'gonzam.92@hotmail.com', 0, 'bxbdd5msk204o4ow8wc00sc8o0kosok', '$2y$13$SJjer/FcXw3xeZs7mtevuOx6f2y02Ll9M.qWXqIYtytycw9gjPG72', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(90, 'merajuanmanuel', 'merajuanmanuel', 'juanmera@gmail.com', 'juanmera@gmail.com', 0, 'e19ts54p2cgkcgwkgwwsw004o8g8gck', '$2y$13$cNer9BWHygtfbPiHFZ7DlOEwPYHtohkkCi55EeBjiLqyb3weUKxzK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(91, 'melgarejodiegosebastian', 'melgarejodiegosebastian', 'dsmel_87@hotmail.com', 'dsmel_87@hotmail.com', 0, '64d7z7bfi48wk8kkc8008ko8osgw0ko', '$2y$13$nz/Q5WFRGLFe2kosMhcy4u4Wr2m7RdHqu6WRsE2EiCMIU.ERlcrxC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(92, 'correamoralesnicolas', 'correamoralesnicolas', 'nicolas96.cm@gmail.com', 'nicolas96.cm@gmail.com', 0, 't23cy855ib4s4gwoc40wcww0osgoks8', '$2y$13$t9Ae2.eLgiOKSa9rU3FhNOUHCdXgOlhFWvTUaKc8b/WbwZV6rW7/S', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(93, 'morenoezequiel', 'morenoezequiel', 'ezequielmoreno22@hotmail.com', 'ezequielmoreno22@hotmail.com', 0, 'mx4lj6ewy74g0ksgkcsokkgk8kg00oo', '$2y$13$6zXph1GtcMXMs3ErPvBpAe25ZbfZh4stVOIracqQlzhN5XMK8A/eS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(94, 'martinezjorfentomas', 'martinezjorfentomas', 'tomigenio30@hotmail.com', 'tomigenio30@hotmail.com', 0, 'dz116copeu0c0oo800go4oswc4so8o0', '$2y$13$lJBz5Yyk7NcljX31SBjy5eJTWirl3MDJx3W8N3ASlpJ97sU0Y6i5S', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(95, 'muÑozdariojose', 'muñozdariojose', 'murdok1983@hotmail.com', 'murdok1983@hotmail.com', 0, '133tpvxyb4ogskoos088w40wsg4kkk0', '$2y$13$Uty/N6.1j5HuvS2N.htLVuljP9s3IY79tX.zNrr77MEN53y2q6Y8m', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(96, 'maranzanamaximiliano', 'maranzanamaximiliano', 'maximaranzana@fibertel.com.ar', 'maximaranzana@fibertel.com.ar', 0, 'h7pa52syfvccwg8o4csccso0ocko80o', '$2y$13$O5WD4X/D2QTxCRmzXXw38urWT4IUexNltSqVg2bsvwEmft7wFiq32', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(97, 'molinaarianagustin', 'molinaarianagustin', 'arian-mo3@hotmail.com', 'arian-mo3@hotmail.com', 0, 'syb04k4pug0kcws88w88ok0c0ko400c', '$2y$13$/uRc4jG1rcHi4jlVsT56N.0yTrKA3AEcLntcx8paastSu6Ur4LdFO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(98, 'novellorobertocarlos', 'novellorobertocarlos', 'robertonovello76@hotmail.com', 'robertonovello76@hotmail.com', 0, 'mha1evufry84wgo480cogw8cscwgc80', '$2y$13$/J.14ofQKWC2BvI0M3y5ceLhwAb02EzxHSMLMVB8AQn3U3UWBkEpC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(99, 'venningnielsenbruno', 'venningnielsenbruno', 'brunovn@gmail.com', 'brunovn@gmail.com', 0, 'fsn6n9lan74s44gskckcc44gcw0kk8', '$2y$13$sqZNhjpbDSLmBC1Sr4B5yOLQ0I0/e5dvyP.uy2PuQM3hOuva.GJ0i', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(100, 'pauchekmykyta', 'pauchekmykyta', 'pauchek7@gmail.com', 'pauchek7@gmail.com', 0, '6ftvgxfglfwo84k8wgsg04c0s0ww4k0', '$2y$13$fmbhK7tGZH9MjOHixJSI.O7c5nmkLJPEgVSxLYP0xIyqW/.2dOuNy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(101, 'peiranomiguel', 'peiranomiguel', 'miguelpeirano91@gmail.com', 'miguelpeirano91@gmail.com', 0, '8k24u9kowhs04ow4wok8c088gc48wo4', '$2y$13$26d//5l51gUq7Vb3VeDzlO6cJXR.jnUThZCTJtmrvHjoOfeeRjOi.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(102, 'paezjonatan', 'paezjonatan', 'jonatan_0023@hotmail.com', 'jonatan_0023@hotmail.com', 0, '9m1vc9lqf2sc4owwso8004k00k0kwk4', '$2y$13$9O.LCNZYTDRyDrjs8xJWsukAuyAgToV1Ib6p5bDxwCG4gccJtAxXO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(103, 'prattotomas', 'prattotomas', 'tomemapratt@gmail.com', 'tomemapratt@gmail.com', 0, '4nmdkp2x01wko8sw0gksokg8g840448', '$2y$13$dEMgB8zmYIZ6mApo4FEEN.9S18T9kNPRtoSEY2oFBxgzjIe1vJCra', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(104, 'ochoajuanmartin', 'ochoajuanmartin', 'ochoa.juanmartin@gmail.com', 'ochoa.juanmartin@gmail.com', 0, 'cjx5aac8cu80s4oscgoo0w8wgcw8c4s', '$2y$13$5SbNZ1H7bpqaroTLa0eM9OQB2ij2LjsSp7Pz7tsIJ6P22OxYiqb3m', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(105, 'portesisebastiannahuel', 'portesisebastiannahuel', 'sebastian.portesi@outlook.com', 'sebastian.portesi@outlook.com', 0, 'iuyr4f2g6l4cks00gc884kko408g8gc', '$2y$13$rkxz1yq2hzePf5gyfwbSAuuwLx/HFcU8PCe0BrRWD61PGDnzi2bsK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(106, 'prokopowiczalangabriel', 'prokopowiczalangabriel', 'alan.proko97@gmail.com', 'alan.proko97@gmail.com', 0, 'kpym4l503eow0gw8sckcwgko4www0s0', '$2y$13$6dbvEHw75GuaSfYB9ryEW.k0WziIYrVr0dLRhBIKnX2KYiq8bTspy', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(107, 'plantamuzanicolaspablo', 'plantamuzanicolaspablo', 'npplanta@gmail.com', 'npplanta@gmail.com', 0, 'tatl96af874wso8cgkswc44socwgsoc', '$2y$13$yVVWKVP/Z9kZjc8lRPKPxu5ZOOVPRoMEA2BCJzB9qCdW5RHZtBOwq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(108, 'romeolucia', 'romeolucia', 'romeolucia93@gmail.com', 'romeolucia93@gmail.com', 0, 'ewpnmgdg4j4swkoo8okc400ssow80g8', '$2y$13$v2vmG7ENJyjXdbil6Wr42u.UANnQb3yuCglrtVjtJy.6QYQqQiLme', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(109, 'sosalautaro', 'sosalautaro', 'lautaroesosa@hotmail.com', 'lautaroesosa@hotmail.com', 0, 'i7dhgp3y3hw8c04cw4wg0wssgg8oo0k', '$2y$13$oQt95smsa4cFCioL1LzG3uMzPsm8aydmT2YPR4zavW3/rPNpCujP2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(110, 'sciuttisebastianalejandro', 'sciuttisebastianalejandro', 'sebas_sci@hotmail.com', 'sebas_sci@hotmail.com', 0, 'sd1ey92pwe8w04cg4koowkwk8w0w8k8', '$2y$13$BUQWaS1sEX3UqBnCrAX.z.LTjQNCBZRF3.ZcojjMzOj4DCf6DuMCG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(111, 'santangelomagali', 'santangelomagali', 'magali9906@hotmail.com', 'magali9906@hotmail.com', 0, 'pzk19kgi2wgo4ooc0ooocogcogcsc0o', '$2y$13$A0GtDzbqh3H4bQ4HweaQXOlEssNc6fPFEkv7l5hBOcSMVGbPTOGrm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(112, 'sanleandropablo', 'sanleandropablo', 'psanleandro@bancopatagonia.com.ar', 'psanleandro@bancopatagonia.com.ar', 0, 'a3vzm7b61wwsgc4ok0gc8kkwwggoswc', '$2y$13$/OCF/WT0FEPDQXvyIvwYee6TKpzZA3IapJ5EVG/JOVjLBVwqDhn/O', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(113, 'saccaninicolas', 'saccaninicolas', 'ulmerlino@hotmail.com', 'ulmerlino@hotmail.com', 0, 'q3zlxx28deoksk4wcw44oc0ksksoog8', '$2y$13$7Dmi0pUftDSduybuc0EVJuqbim0Nw1UsYgHsGLfhliIewbvjJ4r/O', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(114, 'terronesgodoymanuel', 'terronesgodoymanuel', 'manuelterrones88@yahoo.com.ar', 'manuelterrones88@yahoo.com.ar', 0, 'r68tm53dm6o88cgg8cgskokgc0okswc', '$2y$13$P4qUuqBUB6Bel/lLZlrfyeJkezoNAmcm6fTyEqzkEF7Sa.hSUjWlS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(115, 'villarinofederico', 'villarinofederico', 'fede.villarino@gmail.com', 'fede.villarino@gmail.com', 0, 'tw3hms5ludwscggkogwkc04sc0owkgc', '$2y$13$/ihW.bC8HWtToNiX8uMI1uQbT8xhYNZ3TeKnR.xyUWMz3PmMLBWea', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(116, 'vareladanielezequiel', 'vareladanielezequiel', 'danielvarela@gmail.com', 'danielvarela@gmail.com', 0, '7vvsnm9pfvgg4800o8ck8ogs40sgg4g', '$2y$13$jrL/a64bsDnZ5nHZMOwQde2YnhG8OkkspQfIylggtv6AUkVrYLR/C', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(117, 'vazquezrecaredoezequiel', 'vazquezrecaredoezequiel', 'revazquez@gmail.com', 'revazquez@gmail.com', 0, 'ivlottqo0x4ok80koosogowgo48gccc', '$2y$13$tNilKLrl24.c8tayYE.xquZ1WHnzi4n1csX5wXr1MiSM6ajY2NaVq', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(118, 'vegapaula', 'vegapaula', 'agenciapaulavega@yahoo.com.ar', 'agenciapaulavega@yahoo.com.ar', 0, 'j7qaae85jjsw0k8k0okoo8cco4gc8w8', '$2y$13$w5/D6QFidab3xGupTpU7c.os9rgnJ5M90ezx5LxhcDsz0aa1LYKpm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(119, 'vilchesjuanmanuel', 'vilchesjuanmanuel', 'juani.vilches6@speedy.com.ar', 'juani.vilches6@speedy.com.ar', 0, 'h92vn1s5jp4wos84ksckwwkwck04gw4', '$2y$13$yPMIj51j8sOK4LQkv0OZrOrUL7FDRGLUzMoN3C7jjgGsR5bKCwFzC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_PILOT";}', 0, NULL),
(120, 'acostamagariÑosgabrielalejandro', 'acostamagariñosgabrielalejandro', 'gacostamagariños@gmail.com', 'gacostamagariños@gmail.com', 0, 'mwty1eyrumoc48404kgwks8s0c8kw8w', '$2y$13$fifcHKqwH4trJ2G8zgjYi.MFvKTsE6FKFAsEQoVj5c49nzTN/bNsK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(121, 'acostajavier', 'acostajavier', 'caceresacosta@hotmail.com', 'caceresacosta@hotmail.com', 0, 'ff38yf6mwrcc0gs4gsw00kckowgs8oc', '$2y$13$hQmCz6vxQaD6pJA/dvk74OCrKvqnNcJPBENYD9blBu1OGNqTn50Xa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(122, 'alassiajuan', 'alassiajuan', 'jcalassia@hotmail.com', 'jcalassia@hotmail.com', 0, 'bk2q2xgh8xcs88s48sow8444k0ksc04', '$2y$13$szyM5xWCCbJsCnN6HFlr0ueBX0pyu1uD8wwNx57LZfcd94WPZWHCq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(123, 'antoninifranco', 'antoninifranco', 'faneko@gmail.com', 'faneko@gmail.com', 0, '1676qxhmi7esksw80sggk088ksco8g8', '$2y$13$an25tVkSro7qQIuvwAexU.AYBrrH/p9X6XUxAQC.Kunmp.KKVJuKi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(124, 'acostasantiago', 'acostasantiago', 's.acosta@live.com.ar', 's.acosta@live.com.ar', 0, 'ahv538zj4408sgsggokw00sgw00okos', '$2y$13$qQp4qFQBXYjhhY0KMDtbXuZRSrnS9jE9ffSkFFDTjbrbWP.mRydmi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(125, 'anayarossellrobertolucio', 'anayarossellrobertolucio', 'lucioar318@hotmail.com', 'lucioar318@hotmail.com', 0, 'sf3uz4i2ak0swss4cc0w08so044osc4', '$2y$13$bcrKO/gSxEhhovTbDRIVkufebXWm6zq97VGDxSkbXAxXye7Dl2tBG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(126, 'aversasantiagoluis', 'aversasantiagoluis', 'santiagoaversa@gmail.com', 'santiagoaversa@gmail.com', 0, 'rumu7pmzxvkwgs0g44ww44csco4w0w', '$2y$13$bbFguWzXVicSd6bqUv2lDOmBgFNFyRBjgJvydCMQdzZvbKMRAeXYm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(127, 'alvarezmatias', 'alvarezmatias', 'matiasalvarez.84@hotmail.com', 'matiasalvarez.84@hotmail.com', 0, 'j0z2evoao34s0sc8gcokkokkg48c484', '$2y$13$O2/cr7IYoQGG/DqwpkT5s.tPWg3PipRsZ6/qEP6ijZLl0A8hNZvhG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(128, 'avilaezequielmartin', 'avilaezequielmartin', 'eazurdo85@hotmail.com', 'eazurdo85@hotmail.com', 0, '5pdgrng9a8coco4w0gc8owswo0c0g8s', '$2y$13$ufO09E0hVj69iERa1ofvsOQrkbU9EWxGbqRkQmvRsW2HyfPboBFwm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(129, 'argentohernandenis', 'argentohernandenis', 'phantom_f41954@hotmail.com', 'phantom_f41954@hotmail.com', 0, 'm28azls007k8ccg80sww40s8cows4so', '$2y$13$ScfZLeUlXpkK7FQ9s0LLyOZuHQpEl3VSuSBc37PCsBFDyhUhPaXBe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(130, 'altamiranoezequielmartin', 'altamiranoezequielmartin', 'eche_caballito@hotmail.com', 'eche_caballito@hotmail.com', 0, 'f868v6hvpjscoscskkoo848s0c4wwg4', '$2y$13$pCQtA2.LtTmJbRi2N6wCxet5jC.eL1TfMb/EcpSUDY/QUV7VIG8a.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(131, 'boechatariel', 'boechatariel', 'ary_boe@live.com', 'ary_boe@live.com', 0, 'qj0oge3knuowoos0gg0cgkcw8scsoko', '$2y$13$.nH5Gk9it0oNYvariYiw5e6nmzJdbezwPJoefE/nzWsMHwBVl9iGK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(132, 'briatoreluis', 'briatoreluis', 'luchobriatore@hotmail.com', 'luchobriatore@hotmail.com', 0, '17p5btwbnhj4ss400g848gwc0kokogg', '$2y$13$fHalWTQV1b1Ap3TBGYBkAuv3/NxjzUaE6EfC0Klc1ek7U2YdMuhye', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(133, 'bruguerahettigjaime', 'bruguerahettigjaime', 'mateobrugue@gmail.com', 'mateobrugue@gmail.com', 0, 'j0rq4ptjrpc00c0sc8s4wcgkccwoo4o', '$2y$13$Bb3QopVAbdhFigi2JyFpIuUPwcBVPbw.FRSxPZ92r/jiAAaci3QX.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(134, 'buranifedericoemiliano', 'buranifedericoemiliano', 'feburani@gmail.com', 'feburani@gmail.com', 0, '3p1fsuegwveogs0c4g08cs0w88w80s', '$2y$13$v5UsN7cexMSRmgrMtxA7TuaharutFwtctXS9dh.qpS/CyxVJJmaza', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(135, 'bonfininorberto', 'bonfininorberto', 'norbertobonfini@gmail.com', 'norbertobonfini@gmail.com', 0, 'nkukd5ed9rkokgoc4kg8k8s4scw8w8c', '$2y$13$0PZRxJtdj1SxZfzFQfW9De/e82a4Q.r9.m5qjmbzBQdDkPFYWNQAW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(136, 'boninibernardo', 'boninibernardo', 'bonov8@hotmail.com', 'bonov8@hotmail.com', 0, '9gqxdp4sxkw0800g80080skogckccc0', '$2y$13$THsqFVA9gFpcAg1QmMEBQORPWsdxbZXDq/0XeDInaiVVkYXiXiK7G', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(137, 'bleuergerman', 'bleuergerman', 'gbleuer@gmail.com', 'gbleuer@gmail.com', 0, 'i863e8m7k34ssoo40g80sooko0oggoo', '$2y$13$eu.HuxWyTgEDQ6VC.2fQfe3wMhy/UMOv22nx35Wprr1gyhAIFRN4C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(138, 'berongabriel', 'berongabriel', 'gabriel-beron@hotmail.com', 'gabriel-beron@hotmail.com', 0, 'rv9h98krd9ckswgc8ggskwg8gskko48', '$2y$13$gtR2HvOP9bxyLo9e4C5IXuy75lsnTg9fyxlVkWu4J6Cxc0PwFVUYm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(139, 'brunilucasoctavio', 'brunilucasoctavio', 'lucas_bruni@hotmail.com', 'lucas_bruni@hotmail.com', 0, '890v7t0rak8w0k08kwogkgo4kw0ccc8', '$2y$13$x8xKjKlHroHbzsM4r/ZjVuAlLYMtJum9tc5q3cDmlsfuJTRaevTvS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(140, 'briellidante', 'briellidante', 'aguablu@gmail.com', 'aguablu@gmail.com', 0, '74q8okpvpqww8c8kk4kscoscog4osw0', '$2y$13$vWRbyApRES/elwJ3lxl7Du1.XdrS8N15Kb78JrLHfylTHBZQepR9q', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(141, 'bourlotnicolas', 'bourlotnicolas', 'nicobourlot@hotmail.com', 'nicobourlot@hotmail.com', 0, 'lv6ydvhidds4wwsg4co808sgsw8408s', '$2y$13$PeiEcDZkzh1C//f3nNVky./IoER7.xn5A0QAO5FM30AUkcSdaaRyC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(142, 'balducciesteban', 'balducciesteban', 'esteban.a.balducci@gmail.com', 'esteban.a.balducci@gmail.com', 0, '5d53wly295gcwkwkw4c8ks84ogoksk8', '$2y$13$hrs3C5HayIpCaGE8WxWNMOzP326uMTpnZZlBKK1mDNAtfT70T0qQ6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(143, 'corvinicolas', 'corvinicolas', 'nicoc_21@hotmail.com', 'nicoc_21@hotmail.com', 0, '6v8jnf1w63ok0o84o4oo4cwkskkcwgo', '$2y$13$W5SkuF1FUmYoM71L5XWNB.yTuj7PoAUuNd6C11lA8vR2I6K0ak9nK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(144, 'calderonsebastiannahuel', 'calderonsebastiannahuel', 'seba-calderon@live.com', 'seba-calderon@live.com', 0, 'gn856ucuuzkkwgs84wk04gg84840wok', '$2y$13$hm586iSDtXOF7ao1CDhqKOG.q5Xy1kUvTHosP1bP.nIAHyUM58pvi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(145, 'corridoniguido', 'corridoniguido', 'guido_sut@hotmail.com', 'guido_sut@hotmail.com', 0, 'l99nqbtv7oggok4gckkgws4044ssk4o', '$2y$13$GrJGvtYV2I9p1bBjPpZN1.5qXwsLmPhHC5HkVaGubjqPaQ1oLrEW6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(146, 'cravchikgabriel', 'cravchikgabriel', 'galecra@gmail.com', 'galecra@gmail.com', 0, 'ru5cxupjl6skkggwgsk04o4okk4004c', '$2y$13$45fPyzVIHZlB.EM0FMs4qeKW3.eWwF9Ym5Nl3mnvAI9PjSzeVuyoS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(147, 'corvettocristian', 'corvettocristian', 'cristiancorvetto@hotmail.com', 'cristiancorvetto@hotmail.com', 0, 'jwamvcoh41sw40wsso84gossosk44kk', '$2y$13$Pzs1HwmitUkDY4p3bgQi5ONRqyQ15SP7njzGSmC5h/SYWTHopz12.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(148, 'cerrezuelahernan', 'cerrezuelahernan', 'hcerrezuela@yahoo.com.ar', 'hcerrezuela@yahoo.com.ar', 0, 'o2diocm43eowkkos08wks00k0ssc4o0', '$2y$13$em6AH.OsI2v.euYad/XHs.HXqlh0A.r5Y3y5ST/uUkV2oJPYfosYm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(149, 'cogliandrocarlos', 'cogliandrocarlos', 'cogliandro_129@hotmail.com', 'cogliandro_129@hotmail.com', 0, 'kt6epfmi9tswgc48oogco8w4o8s0gws', '$2y$13$drhjwSotLV.lTfz6Udbi.u0MxCej7NdG5PtO8LlBbs.0lD99p4/RC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(150, 'caceresenzo', 'caceresenzo', 'enzojgcaceres@gmail.com', 'enzojgcaceres@gmail.com', 0, 'ieucylu8mo848cc4ogsw8s8scog0kww', '$2y$13$e7MAowFePdY.nTA8QHrC1Oep5QS5cquxC.nwb7T6prWYZso2PrRQi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(151, 'caprajorgeeduardo', 'caprajorgeeduardo', 'caprajorge@hotmail.com', 'caprajorge@hotmail.com', 0, '1e0muiow876sw0ok8o8k4cggs0s0gk8', '$2y$13$e7jvfmPSJgDr3yBVeGtp9O4NTzDlK6Ac2HNsXzcZ5RtysRublzvEK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(152, 'constantinoluis', 'constantinoluis', 'luisconstantino41@hotmail.com', 'luisconstantino41@hotmail.com', 0, 'iwbhwsuo4oowck0cwkg4skcoos84gow', '$2y$13$0pyxwXXdEVH3skbhX.YV1.e3A7JxTIHGI6.vEH.sEm8RqJLb.kC0e', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(153, 'cauciandres', 'cauciandres', 'andres.cauci@gmail.com', 'andres.cauci@gmail.com', 0, '5qy43aqnyiccscws0cgckgog48ss8o4', '$2y$13$gzWpaG5IsfKMgCWygIRdMugBf0aqzkCea1hR1RArZjOl.w7Dcj5Qi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(154, 'clusmanmartin', 'clusmanmartin', 'clusmanm@hotmail.com', 'clusmanm@hotmail.com', 0, 'psb86xr1fxck8gksow0ksogcgc4wows', '$2y$13$9MyietLl2Hsit2MyHgZQk..w8Osw26.kTIzz92Gt2AHjh8Pl0GXUi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(155, 'chiarellinicolas', 'chiarellinicolas', 'nicolas_chiarelli@hotmail.com', 'nicolas_chiarelli@hotmail.com', 0, 'e92wedkd52os484k0kgkckog80w4k4w', '$2y$13$iCA3fHb68LmLSaBYoxRAbeybIqTIJD2UiqrwJhm9i1Y0BtVccL9aO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(156, 'camposignacio', 'camposignacio', 'ignacio.melli.campos@gmail.com', 'ignacio.melli.campos@gmail.com', 0, '4fc0ibvjvz0g4kw4scgok0kgoksgkwk', '$2y$13$a8PNY9Ee9ZocYCOzRJ/dBut4iahH.LA9QMiRqFabvGSGaLDbVqlSW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(157, 'dinanileonel', 'dinanileonel', 'leodignani@yahoo.com', 'leodignani@yahoo.com', 0, '37ubh2327qqsgoscw4gk8oook4oc4gg', '$2y$13$DVBycb5.P/CoTjYCu4HTDOjxQizOsX7EvO66E9gcDgkh7NuXnTFTG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(158, 'dolinotomas', 'dolinotomas', 'tomy_d94@hotmail.com', 'tomy_d94@hotmail.com', 0, 'bet0iharki04owgccckco4g4w4gsgkc', '$2y$13$WkJjQJz70q7YHNvSP9.3Re/mCBrPcjT/FtEAoWfbK/Zm3fSX8UIES', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(159, 'dionisimarioariel', 'dionisimarioariel', 'arieldioni@hotmail.com', 'arieldioni@hotmail.com', 0, 'r5ya9k8q7r4400s4osgsks4cogwwkc4', '$2y$13$Ebg1OxZpxF3Sv5WtmulBdu4PMdTzeDOqs2ISJn5F9c/gUJeQwsq2K', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(160, 'esquerrafausto', 'esquerrafausto', 'faustoesquerra@gmail.com', 'faustoesquerra@gmail.com', 0, '3adof1zy0juosc44004ssssco0840o8', '$2y$13$Gwmxk7mouHJHLCatOgZA5Op4AIiBTtbRItqLI6wRRxkmPLctAGTDi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(161, 'fleitasjuanadrian', 'fleitasjuanadrian', 'juanfleitas49@gmail.com', 'juanfleitas49@gmail.com', 0, '1ku233t459dwowcc08www00gs8ggc0g', '$2y$13$hYBXGGXnDqNZ/ZPujJBrse4eJ2MBW2eWJLMYAmuptKb1LK6Gp0nd2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(162, 'garcialozaroberto', 'garcialozaroberto', 'robertogarcialoza@yahoo.com.ar', 'robertogarcialoza@yahoo.com.ar', 0, 'msppeut7yo04owsgok0w484gscwgsc4', '$2y$13$X.lYOn75.7L7L45aCOXyyeOR6qf6rrZHxkdZFvuUlvh2lg2mLA6Qi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(163, 'gimenezcristian', 'gimenezcristian', 'cristiangrabrielg@gmail.com', 'cristiangrabrielg@gmail.com', 0, 'sszuibphem84wskc4k44o4o0ccko0ss', '$2y$13$SaJUeP7mEo4PLXRq6cP3IeKPtr8ZFgRwRU3jKyHYHCoejyP0FdKAG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(164, 'guerraalvearnicoly', 'guerraalvearnicoly', 'nickygueral@gmail.com', 'nickygueral@gmail.com', 0, '8mr0l7hhgrwowow8wskg4c8k4s08gs0', '$2y$13$xB2B7hDYNDUhxBGmce/wnOjB2igPEm4y4ZEpcR3bcZCF/YULk6uC2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(165, 'garobbiogabrielalejandro', 'garobbiogabrielalejandro', 'gabriel.garobbio@gmail.com', 'gabriel.garobbio@gmail.com', 0, '5vr2ypdq33gowwoo0k0440c88gs8k4o', '$2y$13$wDoh98H1IqOtO4Y4AoeU5eraGQhp3emKOKhZ58Ym0QSK.wzcu.P/O', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(166, 'gonzalezdiazfacundo', 'gonzalezdiazfacundo', 'variableazul@yahoo.com.ar', 'variableazul@yahoo.com.ar', 0, 'axvrc6zp8i0444k4w0kcko8wggswsog', '$2y$13$z5aJp1QwnsDm24oc9lNvWeBhoCUPob7VuSmHbR94aIee6rEj05ygi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(167, 'gonzalezdamian', 'gonzalezdamian', 'damigonzal@yahoo.com.ar', 'damigonzal@yahoo.com.ar', 0, 'ih3d6ejw78080c4c084kkgscsk0csw8', '$2y$13$.SCo4ufsofT.uSuA83vSkuQ3zSisVjrT4Q/cFb3kWmm6cXA8.Cgo.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(168, 'iannonefrancoesteban', 'iannonefrancoesteban', 'esteban.iannone@hotmail.com', 'esteban.iannone@hotmail.com', 0, '9lpde9bac6ko4480skwoc4gw08okow', '$2y$13$asQVPnx/V7LcA6nYZhltz.qK7mFqFvPfTbJPOiJpLmr7qky4OuI.y', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(169, 'isaacgermanignacio', 'isaacgermanignacio', 'ger_isaac@hotmail.com', 'ger_isaac@hotmail.com', 0, '3wexx60zx2ckkcwg8sg8o4o0kw8csok', '$2y$13$3/GOHNTRj6m/1ZVI/R9hoe1.JfSOdx0V2qeGHIwv.wPBCgoF2P8uW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(170, 'hiemerrobin', 'hiemerrobin', 'robinhiemer@hotmail.com', 'robinhiemer@hotmail.com', 0, '5mekj0r5evc4g00osko0wcok444wooc', '$2y$13$xW1wLHaTgTJ/OrJZj0IoHOrj4EhX4oYVhqBeqm381plcCUiiRLc9e', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(171, 'hellersebastiangabriel', 'hellersebastiangabriel', 'preguntar', 'preguntar', 0, 'ey656hev67sw8kogowswwsc08ksso0c', '$2y$13$Q77FK8N7ZBBWUGPrxzs0QuNUb0KSa0CafqwB6onPtABNHNmPARhYO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(172, 'herreroconstanza', 'herreroconstanza', 'coniherrero@hotmail.com', 'coniherrero@hotmail.com', 0, 'iqb4b06wfps8g40cgg48kcg0c8gogo0', '$2y$13$TMfToVG0GXMuxxGIFVJILOKVtuuxadpIiBhc4Eb5CEil5aWW4GGaS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(173, 'habibomatias', 'habibomatias', 'matihabibo@hotmail.com', 'matihabibo@hotmail.com', 0, 'pm8gkpb2bu8ssow4kw44wg8cgg0w8ok', '$2y$13$U7KEOp4nSGxunLfli4PyQutQ1GTIa1jVPhZn2c.NKjsh/334QWZHe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(174, 'hillcoatandres', 'hillcoatandres', 'andreshillcoat@yahoo.com.ar', 'andreshillcoat@yahoo.com.ar', 0, '9mptfh0h6a884sgcogs0wcgkgck0gc0', '$2y$13$MARQFTct3LsoL5M8v9eDnuReBbHbYdc7IyQLtggeCiZn5JdPj6c5y', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(175, 'helouandres', 'helouandres', 'andreshelou@gmail.com', 'andreshelou@gmail.com', 0, 'kb6kwubrbeo0cookw884go4c088ckg4', '$2y$13$TB/LMsasjEsJmJtOoLjGpuufh5gU3bc7PNRldcSiTKUER7nnU2VoC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(176, 'insuaagustin', 'insuaagustin', 'pochoinsua@gmail.com', 'pochoinsua@gmail.com', 0, 'e2r5u905nqoss0wk0gw888408ckgk44', '$2y$13$AiTeII9kslVapvbuMSwoWuJNj/ovCAD.pbie1AmCva/KWHcEkRbRK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(177, 'iglesiasjuanmartin', 'iglesiasjuanmartin', 'jlesias@yahoo.com', 'jlesias@yahoo.com', 0, 'aj5sylrtohcsg0kkk08848kccc040ko', '$2y$13$3Okf46LSnxwn8BeE9ZArI.D3kyxS2YDCjy/VyBxN9YHpAK0By4loi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(178, 'insuajuanfrancisco', 'insuajuanfrancisco', 'pancho_riv@hotmail.com', 'pancho_riv@hotmail.com', 0, 'jd71zgxn6nwc8o0s8o4gk04so0gg8gs', '$2y$13$eXgeAKAqSEvwHQa5Gi5DFuMX8eiFkBvaAT8Tq64Axy927.k3HGVvC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(179, 'kuhnpaulo', 'kuhnpaulo', 'paulokuhn@yahoo.com.ar', 'paulokuhn@yahoo.com.ar', 0, 'a2jhzc04v8wsoc0cos4go4wows4ko4s', '$2y$13$WheLgCLy63Unn1gxZ/f4tuZOMLAhAVBHE1CaeqXcd3y7cl4fVTxWG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(180, 'jacobgabrieladolfo', 'jacobgabrieladolfo', 'gabrieljac@hotmail.com', 'gabrieljac@hotmail.com', 0, 'tvcniujqc2ogwg008ggckwcccwgo0kg', '$2y$13$GZjd1fLr75cWSgV.clLKr.oUqjBafKyG0ObW4Stvgpb9VosJQJ8eS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(181, 'laroccahernan', 'laroccahernan', 'bonvivant69@live.com', 'bonvivant69@live.com', 0, 'j9oupop6fpc0gg0wwkk4o8wk4448goo', '$2y$13$5tyH3K1xOEvg9ygDtBVl5O7OXMUnTZ0b5SpAjP7jGSwPAG40UKoOm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(182, 'leonigermanjorge', 'leonigermanjorge', 'golfjulietlima@gmail.com', 'golfjulietlima@gmail.com', 0, 'swypa54amzkkkckgogkg0owsk4k4wc8', '$2y$13$1Hsvkn9mqSsgJdKu17FIcOgWuwOWAT.Z/iaaaZy1e6KyEE2VAMZFi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(183, 'lewisfacundonicolas', 'lewisfacundonicolas', 'facu.lewis@gmail.com', 'facu.lewis@gmail.com', 0, 'uyxl0g8066so4k8c00c0wso4g0kkow', '$2y$13$VH1j4th/aD2Wnx54HrmYSejs2V1vWpl8D1lf7.yyCO39Z3lo7xNrK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(184, 'lunamariamacarena', 'lunamariamacarena', 'macarenaluna.ml@gmail.com', 'macarenaluna.ml@gmail.com', 0, '8v0fjprims4cwckco8kc8go4sgc0ggs', '$2y$13$8xGg90yF4YgLoaPlMBbwhOcxseRsSbW45MoKsIPh/gdydOanLpEr2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(185, 'leonijorgehector', 'leonijorgehector', 'aeroleoni@yahoo.com.ar', 'aeroleoni@yahoo.com.ar', 0, 'myqhcxyjl1wo4ccok4oos0kg04o40w8', '$2y$13$67SUjUoJBbIiD4/4URjbau/Z.L1P98MrkF85jJSpNmA4ZqwRaFw.y', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(186, 'landinojavier', 'landinojavier', 'landinoj@hotmail.com', 'landinoj@hotmail.com', 0, '7cynjxmq50g08gk08wo0oksckoow8w4', '$2y$13$PF7lKgZ5SE4kLV3PzYUXwOVwLBt6LZ26U50SbqBiDl3xgLc3T0cuW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(187, 'litrenivannicolas', 'litrenivannicolas', 'nicolaslitren@hotmail.com', 'nicolaslitren@hotmail.com', 0, '4j49e8owry804cwgg0g488wgk8o4g0k', '$2y$13$wojL6tyvcohpEBlWvFLziOR8bQx05WHn9IPkstyqdRo5QaseP2o42', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(188, 'leivaosmarmartin', 'leivaosmarmartin', 'leivamartin46@yahoo.com.ar', 'leivamartin46@yahoo.com.ar', 0, 'kzu6hldvsj4o4sc8c4s04w088gws8co', '$2y$13$nJtbzgRQ.TBXKfQSmyz.ru7DM9uIJWZEmj8NN.piu70octUogNfgO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(189, 'lobdaniel', 'lobdaniel', 'daniel.lob@logiciel.com.ar', 'daniel.lob@logiciel.com.ar', 0, 'pbwf6htt9v4ockg4kgwc8404wcwc440', '$2y$13$Yd5xDs1zNSJc73OgH8CWg.UvpHsjd1gnDSHtIfnGHPx0kH2NWFqBu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(190, 'lauriajuanmanuel', 'lauriajuanmanuel', 'juanchi_cs@hotmail.com', 'juanchi_cs@hotmail.com', 0, '9libiqmiv6skwgwcg00kk0ocwggoss4', '$2y$13$F/9ZqrEZzGT9lPuvALSEsOvOvjqjipmacEb3du8fdbq7cPdfE0Z/C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(191, 'lucchesiluciano', 'lucchesiluciano', 'luciano_lucchesi@hotmail.com', 'luciano_lucchesi@hotmail.com', 0, 'mugvl1fetxc0g8gkowckoo8skowgwcg', '$2y$13$/lNtrTUiF7qOip01e5UMauW8B5GiakSNdxq6OuYA4Gj3S2QcAYGJK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(192, 'magliolalucas', 'magliolalucas', 'lucasmagliola@gmail.com', 'lucasmagliola@gmail.com', 0, 'jcgxyx4d1mo0c40cgosgc08g4koww8g', '$2y$13$K1gaDKVeR59YL9vJ4zar/OK6bCxZhZbQLvlCmUoiKILgxw7YvIR4u', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(193, 'marcellobruno', 'marcellobruno', 'brunomarcello@hotmail.com', 'brunomarcello@hotmail.com', 0, 'tph64o8ldjkcocsg4w0kwsws040o84o', '$2y$13$Xvz12pi2rfkvlrsiVcZNHu16kczvGLm6DJyP8UpxGGWxkzaou7AL2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(194, 'montesdiegomartin', 'montesdiegomartin', 'montes_diego@hotmail.com', 'montes_diego@hotmail.com', 0, 'c4ircdo5izkk4okocs84kksskwksks4', '$2y$13$mIiDdKpyIRP2MWqeyduvLeN.b8VexetGqQdFRSFOklUqSZoo64gdq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(195, 'mariÑojuan', 'mariñojuan', 'juanmarinopuentes@me.com', 'juanmarinopuentes@me.com', 0, '6girt2bz2680gcs800oc48oogw4sg4w', '$2y$13$mkF7P1KvCv1VWnFldM6Nu.go1Ab.Wo5Ax3ApAD8fKYo1SVV8YJble', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(196, 'mendezirispaola', 'mendezirispaola', 'sparky.mendez92@gmail.com', 'sparky.mendez92@gmail.com', 0, '56k4hax25aos8sowccs0w04w00w0oc0', '$2y$13$UspUqjyRWJ6NneiOTlmSWO.RNp8J3b.QxGA1Tvq17In/BrXdZ1YUy', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(197, 'omelusikmarzucoleandrooscar', 'omelusikmarzucoleandrooscar', 'leanscrush_88@hotmail.com', 'leanscrush_88@hotmail.com', 0, 'rkxgjn1syz48c0kww88g0ogokok8swg', '$2y$13$xbi7FHQclKTV/DoNF4WU4eF1isouhMkjHPVHUd0OHv3QoAHl7jMIW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(198, 'martinezluis', 'martinezluis', 'luis85@live.com.ar', 'luis85@live.com.ar', 0, 'oz6wx59lw9w0wg40kso8csswksgcwg8', '$2y$13$ODP5UjrjELJ/4ATT6phfIeNHumdHt1FFvGYpZSJ0xwRhdSfDzcTNW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(199, 'miettajuansebastian', 'miettajuansebastian', 'sebamietta@gmail.com', 'sebamietta@gmail.com', 0, 'hcsfxpusj6ogso00ooowokowo8cs4kc', '$2y$13$RS1qygclepKhAU1PP9Pzy.tLqXitYMSGAe7OW7TsdXKJSdlcpW4l6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(200, 'morisettimartinjesus', 'morisettimartinjesus', 'mmorisetti@hotmail.com', 'mmorisetti@hotmail.com', 0, '8cnm0sqizngg884ow44sso8cwo4g4gg', '$2y$13$OoT9kT7pHLci/Yc28eFSX.zCH0JtEQOkpzUMcHW8OtIJFmsKMRjzm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(201, 'marquezjuancarlos', 'marquezjuancarlos', 'atp010110@hotmail.com', 'atp010110@hotmail.com', 0, '4qzaxpdy8uckc4w0gsss4gwgooso8wg', '$2y$13$1q85J8sE6wPjEcoJmt8V4ezcRPz4C.iQOyI0u60Hep2To7S1bgEf6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(202, 'martinezjulianignacio', 'martinezjulianignacio', 'julian.m90@hotmail.com', 'julian.m90@hotmail.com', 0, 'qmwx1i5jyv4wk4gc4kwsgko4wwgw08w', '$2y$13$6xTyUxWoU9VpXC7z4NPldefcBOomDl0la2sb8nTXWBDtcVDDB9Pmq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(203, 'manriqueagudelojuan', 'manriqueagudelojuan', 'juanko_anarko@hotmail.com', 'juanko_anarko@hotmail.com', 0, 'd1us0fxxhwgk8g4ows80k0o8okcks0w', '$2y$13$0wyGwwe5E.35qr/ffXg4tuoNhBFXPXRDqSw/K8PlZw67fqJBaX6oW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(204, 'martiarenajulianpablo', 'martiarenajulianpablo', 'jpmartiarena@hotmail.com', 'jpmartiarena@hotmail.com', 0, 's7o5ycvdnqscsks8008c8gcckcc4kgc', '$2y$13$p9uDgQomkduGy1t1.ZKbI.4R3vEtyV8mELRUFKJfs2F5RkR/RoDWi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(205, 'caballerorodrigomeza', 'caballerorodrigomeza', 'rodrigomezacaballero@hotmail.com', 'rodrigomezacaballero@hotmail.com', 0, '9n4yg25o3ww8c44gk8so040k48kwo40', '$2y$13$bOyuKHUERG4E295FrmKuNOoDU2BBArHJQnS5WTk0.Po8ig8kh5deW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(206, 'minassianjorgegabriel', 'minassianjorgegabriel', 'gabriel@minassian.net', 'gabriel@minassian.net', 0, 'odyvisvn49wwkw8wogw00w40ocg80ok', '$2y$13$5iZwMisNbQ2vprFqeH/Q3eNXK3bAvq0Ips.0RmDG2ejnPLBtho4/O', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(207, 'moizocristianezequiel', 'moizocristianezequiel', 'crismoi@hotmail.com', 'crismoi@hotmail.com', 0, 'au865lm3e5ss04s0kckskss04swgko4', '$2y$13$4xcR9ZKsX5fP7VgdM14z4.AaAlGSvbgrLDs77ovbvBqpKrAF8dgPe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(208, 'mugicajorgemariano', 'mugicajorgemariano', 'cotonetes@hotmail.com', 'cotonetes@hotmail.com', 0, 'h4oc2ptks7scw8o808wk88skggs8c8c', '$2y$13$3eJUikhxxb8I4wAdcGxyduMEZQKoLEz2rzKXWw1yBhJK/fuMjSq76', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(209, 'vladimirelias', 'vladimirelias', 'vlad@salaparabateristas.com.ar', 'vlad@salaparabateristas.com.ar', 0, 'itlo7kanbugwwsw8kcck4s0gc4g0ww8', '$2y$13$62tSOn7Snjpa3xX7sv9GkeQdzJR4oLiJA99.bSGFKdSHtHuiqMtmS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(210, 'nigliatomasmartin', 'nigliatomasmartin', 'tmniglia@gmail.com', 'tmniglia@gmail.com', 0, 'gg0do9svcao00s0co0ooss44k84ook0', '$2y$13$Z/Kie5y7mk9FeO6vKJ9PT.gH/rkSSDI6eDsABNpGrdX8icfU8YxAa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(211, 'nagasakicesar', 'nagasakicesar', 'cesarnagasaki@gmail.com', 'cesarnagasaki@gmail.com', 0, 'jbydcfxwktssg8ws8w8co4gsww0sk08', '$2y$13$LUM6J/pWXuhbzsF6gEIZy.Do7Sc3rSTFf/6CHgra9l1.VGZEN2jOa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(212, 'napolirenzo', 'napolirenzo', 'renzonapoli@yahoo.com', 'renzonapoli@yahoo.com', 0, 'ms6wirc592oooc04cw4g8w4kg8w4gkg', '$2y$13$/yeJV/E9ADfCkkodUzJtd.UkWUaZbGprh90j3uvJDGYqIQv65n1Kq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(213, 'monnicolasezequiel', 'monnicolasezequiel', 'niico.mon@hotmail.com', 'niico.mon@hotmail.com', 0, 'cskgptl3ir4sksg8og04wc0ock0088s', '$2y$13$kDFsJ3xoDARZQzUwP2clNuIOQYor7cqCP4QKvzxcR16bIEwTU9Nta', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(214, 'oteroorianamicaela', 'oteroorianamicaela', 'orianamicaelaotero@hotmail.com', 'orianamicaelaotero@hotmail.com', 0, 'f31ww9jk00g84w0sg44oww88k84ckgo', '$2y$13$1XVfHd6e.T6j6PUEKueOv.8T0GPD1hxo35jsuyZJaOraJn6Vd0iUS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(215, 'ponsivanfernando', 'ponsivanfernando', 'ivanfernandopons@gmail.com', 'ivanfernandopons@gmail.com', 0, 'opa3gcp979c0gckw84k0g40g8w40cks', '$2y$13$3HP.BOljqcjj06kwZq6Vze1AUAYabH0X9MKX3nq/Whbc9gbqJpc3O', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(216, 'pachecopabloandres', 'pachecopabloandres', 'iceman9514@hotmail.com', 'iceman9514@hotmail.com', 0, 'f3xg823o4dckkso8o8o0wc88kg0k48g', '$2y$13$PfCPc8v7NN2ckxJIM5MExucvKxl6gFhiXdFBy6AUOpJ2VxPsWCv6a', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(217, 'petelepengerman', 'petelepengerman', 'german_piloto@hotmail.com', 'german_piloto@hotmail.com', 0, '8kqp4yrvm944ocswksskscs4gwkkok0', '$2y$13$elGErxHXGbqWk.5HRFxkO.6WNTb9xo/Ke5awiOII/C0bPINhlVtSG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(218, 'oteropablojoaquin', 'oteropablojoaquin', 'pabliotero@gmail.com', 'pabliotero@gmail.com', 0, '8iekwmlh6xs0cwwks40osc0oo8g4skk', '$2y$13$8V72NWkDrbjofZt9FWQgzeFRwWPuk6cCppm.8fbnseO59RIer28ni', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(219, 'ortizaxelgiuliano', 'ortizaxelgiuliano', 'ortizaxelgiuliano@hotmail.com', 'ortizaxelgiuliano@hotmail.com', 0, 'f51zmd8tq9wg88004k88soo0oc8k4s4', '$2y$13$ASdq1IY8u5GF3zzGGQlQ7u9qwYz9K5j0FdtcJQ5uhfawkC.ZYInk2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(220, 'origonefacundofelix', 'origonefacundofelix', 'facudechaca@hotmail.com', 'facudechaca@hotmail.com', 0, 'fvzi0jyiudwsg4k8kk0g0g00808k0wg', '$2y$13$u2jwaZutgM24O2VN9SGjSeIiLpF59yDxfvi2jp36caNaRiRqs1pqi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(221, 'oliveraanibalalfredo', 'oliveraanibalalfredo', 'alfredoanibal_olivera@hotmail.com', 'alfredoanibal_olivera@hotmail.com', 0, 'f599nt1fco0ggw4kg80co8oso084gcg', '$2y$13$rSB/TI6TzwNucV15BtE1fuDixC1mdA5KV/2fVvwGc.ZyzASsRESdK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(222, 'palmisanomatiasezequiel', 'palmisanomatiasezequiel', 'matias_palmisano@hotmail.com', 'matias_palmisano@hotmail.com', 0, '7n59dtstn48440wcw0008k8ckg8sccw', '$2y$13$JtOjYmGNNxBo1HHSeISSf.0PslciAQxUsKvuRVGe5ZY9qqHg4nLfi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(223, 'penanicolasagustin', 'penanicolasagustin', 'penanicolas91@gmail.com', 'penanicolas91@gmail.com', 0, 'ojhu5j3b4sg00o88o4k04soo0s4swwo', '$2y$13$JmmyEucKrWSPRq6VCGcghODYpjGMTMXAktRDrPiVhA5gCY5gpGJkC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(224, 'pulveralejandro', 'pulveralejandro', 'alepulver@gmail.com', 'alepulver@gmail.com', 0, '4nxeffbf6t2c80gkk8wwcogskgow4cs', '$2y$13$hf2haXTxsrpsWW6jQQqu3uJPN8odUBhEJfahvmJu2FFSQoBYR5ZJ.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(225, 'policastrosergiofabrizio', 'policastrosergiofabrizio', 'sergiopolicastro73@hotmail.com', 'sergiopolicastro73@hotmail.com', 0, 'pumf7rz8his8gko4cgkwgkk408k8k8k', '$2y$13$V7x.hNLUSmqRoe668Hv21uDa666K5aJItwfTlAGCLZ5NOQXy78p52', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(226, 'pastorjose', 'pastorjose', 'jlopez.mail@gmail.com', 'jlopez.mail@gmail.com', 0, 'bzqj2325f4840wgwgkoko0kc8sokwok', '$2y$13$c.OCn3CAe9.AxOItyTC68u1FDeePSvQX5ZzB7DVMOXO.1d5qJI0De', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(227, 'palaciosjoaquin', 'palaciosjoaquin', 'j.palaciosnegri@gmail.com', 'j.palaciosnegri@gmail.com', 0, '1l9l9bg5k0lc0cowcccww04oc8w0c0c', '$2y$13$abedF751vfc00fwreUpnkOg/Abcrxv1AAUiLeDwaHP7.W03PsKjSe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);
INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(228, 'paredijoseignacio', 'paredijoseignacio', 'jiparedi@hotmail.com', 'jiparedi@hotmail.com', 0, 'b89n8g2w73swgg40gw4ggkoocgsg0wg', '$2y$13$mEPROictpYYo5HP9e2n/q.hynyERHxFATp.44.4s3EHgvFQp9wj1a', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(229, 'pastorerenzoignacio', 'pastorerenzoignacio', 'i.pastore@yahoo.com.ar', 'i.pastore@yahoo.com.ar', 0, 'a9cstsqn8jk0sc8w84c0ockk8g4wgwo', '$2y$13$Ibo09ggvImlR8CAUEP5CCOJ7b/ZV63EDgnkXKfXeYuEJBbJtldoWS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(230, 'pastorizapablo', 'pastorizapablo', 'pablo_callejero_rnr@hotmail.com', 'pablo_callejero_rnr@hotmail.com', 0, 'q6a7cvsf8sgw0ko48co04ggg8wcs4ck', '$2y$13$UpnPogi0STuxRRCX4.2gJeCvcXTMxCHvZsB/AW/yeSC.wJh0tlIOC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(231, 'pintoleandroenrique', 'pintoleandroenrique', 'leandrop26@yahoo.com', 'leandrop26@yahoo.com', 0, 'awwkqvoid7kk4cskw88sks8kcowswkc', '$2y$13$Qadfgp86YT83t0iJg6IRgetaLXPAU03O7VRtNThGN5Zk5Fzy7c4f6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(232, 'perezfacundoariel', 'perezfacundoariel', 'facundo.ariel.perez@gmail.com', 'facundo.ariel.perez@gmail.com', 0, 'dgmryg51vbk8ko00gsookc0g0w0ww4g', '$2y$13$HcWZhAOrD6dWkauU5c807ejs2RiCcVRpKtdVAElLl6sUtOcUkWU7m', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(233, 'renaudtomas', 'renaudtomas', 'tomasrenaud@hotmail.com', 'tomasrenaud@hotmail.com', 0, 'kppvfjzhbr4wosk0gsw8c4s8cowkkcw', '$2y$13$BBcB9Pd366W5AmwZ.JPSLuWZEtvCZnWxySCMZwn5A.tpaE33R.mne', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(234, 'ramosgabriel', 'ramosgabriel', 'gabiram_map@hotmail.com', 'gabiram_map@hotmail.com', 0, 'qg2q9v4v9z44ooc8so88wssosso4g80', '$2y$13$37a02XanOW6poYc0NP.bUesUDNjIte8t8pckMxren9eXE5agmoCdK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(237, 'rimalisandrojoaquin', 'rimalisandrojoaquin', 'lisandrorima@hotmail.com', 'lisandrorima@hotmail.com', 0, 'ea6w53o25v4sg8g0o4cgsskgckkoks4', '$2y$13$flcmM97l8GgU8ndw/ct.E.sGSd1F/PoPR98Pfi2sRUT78Vauz7/py', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(238, 'rodriguezjuliodaniel', 'rodriguezjuliodaniel', 'juliod.rodriguez@hotmail.com', 'juliod.rodriguez@hotmail.com', 0, '8nof6dbg1bswwk4wow0gcwoks4g8ko4', '$2y$13$ZHWwvh1X/QQzAWDE5CbvG.cvia6C85qAsXAYfC.mdBv8XhT1cqPzC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(239, 'roncelnicolasagusto', 'roncelnicolasagusto', 'nicolasroncel2011@gmail.com', 'nicolasroncel2011@gmail.com', 0, '1mdnjpibrrq8g88o04o4wkgwskwwg0c', '$2y$13$xrR.zuQ6jwiqwtoXwCwXP.A407CPgU699qAwWZvdeyK44QWOBnaOu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(240, 'rodrigueztomas', 'rodrigueztomas', 'tomi.rodriguezv@gmail.com', 'tomi.rodriguezv@gmail.com', 0, 'eigbviwvzo08ocksos808g4oog8w484', '$2y$13$L.yERPLZR9bbQw7.ptP1XOpuikhLZlPa95XGWZBiWsz/1u6g/4w6K', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(241, 'roitmanmatiasnicolas', 'roitmanmatiasnicolas', 'matmanr@gmail.com', 'matmanr@gmail.com', 0, 'pagrnjqv2twscsk4wgcgcc8ccs048gk', '$2y$13$77M42fSae0KP.8qFfMpAROR136vWe9ndY/sw.i1B/RGXRiN1IErbG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(242, 'rampellofederico', 'rampellofederico', 'rampellof@gmail.com', 'rampellof@gmail.com', 0, 'hbq09ab5fmgc0o44g84k8kksgwkgkcg', '$2y$13$wAcowcDdPpQBQ7Wx/GAfiu.LpudwP3KGp27VmfvrC.0DeJeMnLVt.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(243, 'raffaellenicolas', 'raffaellenicolas', 'nicolas.raffaelle@hotmail.com', 'nicolas.raffaelle@hotmail.com', 0, '6uycskdte2kgc0sgs80440cw4w8ogc', '$2y$13$oLIOPsaIPNN9JCN5iJrvuucf086SUkm53415gNbUKX3I6BoiQu9dG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(244, 'ricartdario', 'ricartdario', 'darioo.rt@hotmail.com', 'darioo.rt@hotmail.com', 0, '1gqdlpmm7oqskkk4gwcs00ccwgwo440', '$2y$13$jlR6lvpoAz5l/Lj.eYRbCOygLJOGftxVP3TJTVu2xGJi6PZE7mBzm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(245, 'rojasclaudioluis', 'rojasclaudioluis', 'claudioluisrojas@gmail.com', 'claudioluisrojas@gmail.com', 0, 'o3ljbzmej40w0gs8cwcockk84wk480w', '$2y$13$KK1/KAm8Yq3dtOffmdvGQ.O2blTOAEQ3f9xBN8/L2Km6Lb9JXVcPe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(246, 'rivollierjanet', 'rivollierjanet', 'janetrivollier@yahoo.com.ar', 'janetrivollier@yahoo.com.ar', 0, '7z0t7xmc1ts0ksgccwksc4occwoo8oc', '$2y$13$Sob54aWZNXkdqmoU9AkwSuIzRALGDZrtROiQkYHVPib/4HhbU0qNG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(247, 'russogabriel', 'russogabriel', 'g.russo1985@gmail.com', 'g.russo1985@gmail.com', 0, 'qjzodfurfxwcgggkskwwk0gcs48g4cg', '$2y$13$NcrxXIoRr5dZV1MRW9ARGelMA3FijUfplDzIu8Ec.Rvtwx8fCKNDq', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(248, 'quintanamatias', 'quintanamatias', 'matiasq79@hotmail.com', 'matiasq79@hotmail.com', 0, 'nbkeny5z7pwo0kowoggg44cc8sw0w0o', '$2y$13$kIaD6QyVqI.HRIoIaLrFOO1j9axCwhMRhuC3D2LdPTs.Kolj4p2nm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(249, 'sanchezjoaquin', 'sanchezjoaquin', 'joasancaff@hotmail.com', 'joasancaff@hotmail.com', 0, 'orm5f03ndq8wg4444coko80k0s8sg4w', '$2y$13$M5.RZZr7seclXW6F4orTOu1KaHAkL/LsQs4d6Bv7Wo/6SFX69VHW.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(250, 'spiritosamateo', 'spiritosamateo', 'mateospiri14@hotmail.com', 'mateospiri14@hotmail.com', 0, 'f79vajrx128gwgkoswc0444okg8g4k8', '$2y$13$JWWlChViQSSul8AmI1JXCeqU6mpROBt/k5q9VDsa8oCcuBZulaHWu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(251, 'solsonamanuel', 'solsonamanuel', 'manu_solsona@hotmail.com', 'manu_solsona@hotmail.com', 0, 'hw2rem8rgagw8os4soo4oockwogcswk', '$2y$13$GkbTkO5I1qnNTKKWPVvoY.kP1RSm3a7jFMnShSfUN3j6Ds0hV83vu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(252, 'sagrerasmiguelangel', 'sagrerasmiguelangel', 'msagre@gmail.com', 'msagre@gmail.com', 0, 'bh0dgq3jzf48wo40skw8ssw840k0880', '$2y$13$IV86oaLG/KvIII9.er8O2Or9ucLDTQGpQrye1sn6SdcAzFJYHxWVW', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(253, 'silvarossileopoldo', 'silvarossileopoldo', 'lsilva2@hotmail.com', 'lsilva2@hotmail.com', 0, '4vjsaemgzv280ggcco444s0s84skco0', '$2y$13$eDwgDkWFDjWUYcxENdwOfeILMtOGSboMILmlKzHyxMbFm.t6IpwXi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(254, 'soengasmartin', 'soengasmartin', 'martin.fs@gmail.com', 'martin.fs@gmail.com', 0, 'gfgvyn35vxcgokg8c44k0ws0484s4ws', '$2y$13$Vrg5Kg5OwK9rjcyUqs41UeT76b2tKLe3CpyOrLAvIl6S2NTsiSjwe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(255, 'santillanandres', 'santillanandres', 'andres.santillan@live.com.ar', 'andres.santillan@live.com.ar', 0, '607iziohxckcgsc4scg48ogk4w40k8w', '$2y$13$XPn6f6TI0bkOqvfDhVEWTutLAr6Svv0GwIxUos5ikP6/Db4ponJ1C', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(256, 'solajavieralfredo', 'solajavieralfredo', 'javiersola@hotmail.com', 'javiersola@hotmail.com', 0, 'h26kq256ffcccsc044k08g0848goc4k', '$2y$13$IV7VBrsKztOq5J0iu.ROv.4VDs3HX6YiCVMqBj05MfzAZZsXhGH6i', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(257, 'sensabattianocastaÑoluisleonardo', 'sensabattianocastañoluisleonardo', 'leosensabattiano@hotmail.com', 'leosensabattiano@hotmail.com', 0, 'ixadjc7yh0ooswc8o8c8wgw84okg400', '$2y$13$mAC4yW6AcfDdp.0ZIMbXl.XVZNMuqaMdeDCiHLy8rCjJ6YgZH02pG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(258, 'sotoandres', 'sotoandres', 'soto_andres@live.com', 'soto_andres@live.com', 0, '54c1uyyaqv0gc4wc8wc8gkosksk8swk', '$2y$13$TWUz6JLFkNnTUc4A.aNBj.HSXaAbCduiPNKhLCYkSsagyqABAtyUO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(259, 'sanchezcristianalberto', 'sanchezcristianalberto', '1976.cristian@gmail.com', '1976.cristian@gmail.com', 0, '3jpyekhwbvuo0oc8woks0c08o8oo808', '$2y$13$m36Q1RopiTQJr8EFVzrpkO8FX2ZCzZyHrfeZWQIhdRgIpYc3mUb2O', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(260, 'soriaignacio', 'soriaignacio', 'soria.ign@gmail.com', 'soria.ign@gmail.com', 0, 'ck46n0gqrxcks4k0c8gw8o80k8kkkoc', '$2y$13$g.q29jp7YqkI0iY0R1C5MOGH2Gp9GyIU01xHDyxcCm0sEFZCMMLk2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(261, 'suarezgermandiego', 'suarezgermandiego', 'gdsuarez@gmail.com', 'gdsuarez@gmail.com', 0, 'mmzfg99w77k0c84o0w0ggcc44w080cg', '$2y$13$H7PwBJb5uNQTk.SA5euVUOQxCYqwHR8npz4BXQTP6gqRYTidtR48i', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(262, 'silvafontfrancisco', 'silvafontfrancisco', 'fsilvafont@hotmail.com', 'fsilvafont@hotmail.com', 0, 'sl41k2je8y8coc4sgo0kkw8w044c0ok', '$2y$13$35bYBA.LyE.olk1AkZDCTOPsBfllkpFk5rhFMPzPEVfAY0ODdxrq6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(263, 'spimtosomateo', 'spimtosomateo', 'mateospim14@hotmail.com', 'mateospim14@hotmail.com', 0, '88ey4pewjnggckw84k8s8cko8cokc4s', '$2y$13$Q2yX3wTOySANviN9orEE5uoX5heqbGKze3h0nPjyfrKt40gKwx/j.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(264, 'santarellifranco', 'santarellifranco', 'franco_santarelli@hotmail.com', 'franco_santarelli@hotmail.com', 0, 'qc1tydrwfs0kksw80s4w8ow0owsc44o', '$2y$13$h6Rg2la1UMwLL.lbLFNAEuhm3aAfiG4kStVqOaCXs5woV96T0sBfO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(265, 'soriasergiodaniel', 'soriasergiodaniel', 'danielsoria_105@hotmail.com', 'danielsoria_105@hotmail.com', 0, '545tu9mf2xcssksgcgocwwog4kcc8ks', '$2y$13$VwjXYZ2rWLpvo2yHwb/tDe3XZQSWn.SN5RgnKKSRlYmcgERftQm/2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(266, 'sugasttijuanignacio', 'sugasttijuanignacio', 'juansugastti_97@hotmail.com', 'juansugastti_97@hotmail.com', 0, 'hpeby7ph1y8gkcg4gwow4g0csgkkock', '$2y$13$QfDHgVJ5UQmpeHYXnzNTCuoL3/EM0OQBjruRFvjc.np6stkOgSn/i', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(267, 'taugabriel', 'taugabriel', 'gtau65@yahoo.com.ar', 'gtau65@yahoo.com.ar', 0, 'ckywr8qtz34k040gwkgskogocwww040', '$2y$13$ECZANXOdld2VyzY.2HVHuODgi6PuxAuGsQxR2XET8ByLTLDOxrdXu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(268, 'thomasluismartin', 'thomasluismartin', 'lucho4678@hotmail.com', 'lucho4678@hotmail.com', 0, 'p6vqxsp3kyok8g4cg0wcowkkc4sgocg', '$2y$13$9njzERx7p81xPFlU9GpXnev.OFRpPkgb/ARFK6DxqjO7lqRJS24zm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(269, 'trisanoezequielclaudio', 'trisanoezequielclaudio', 'malconeze@hotmail.com', 'malconeze@hotmail.com', 0, '5h6zetp3rscog84004sksogs4c0kkso', '$2y$13$Gl0M8n5yozwtodBp00DITutb05eCzo3Vn8Pp4DiA9/i5EF9MJreKi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(270, 'tejerinamariano', 'tejerinamariano', 'mtejerina7@hotmail.com', 'mtejerina7@hotmail.com', 0, 'am41ojbpdy8go84og440o0gss0g08kc', '$2y$13$Vz7vEZ5qdex2KsnwKjvwQ.NJzpLA9sj7e2j5nA0udqFomQ4b1iit.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(271, 'telleriasebastian', 'telleriasebastian', 'sebastian_846@hotmail.com', 'sebastian_846@hotmail.com', 0, '3lthm6ig5go4880os0gook00skgw0gc', '$2y$13$iOo5u1tyLPQpZSQIizSqTeEYzSldnM6hXn82Rg8MrVOdq89NrNvtK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(272, 'soninjavieralejandro', 'soninjavieralejandro', 'jsonin96@gmail.com', 'jsonin96@gmail.com', 0, '7umwcqpzv38kkkskc8gc8gc8gk40go0', '$2y$13$xLS94L7WG/LZiSdaeH41r.n5HUfYs87uAarYEEdCh1k.wBl7QZ9Ju', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(273, 'uribejose', 'uribejose', 'joseuriberoman@hotmail.com', 'joseuriberoman@hotmail.com', 0, 'izw82t05iko4w4kwwkg8ckcskg4s4g0', '$2y$13$N5ZMAVLgse8bY9keKZCcpu0uU4I7/USLZxCPm975YOPpIA3GK62q2', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(274, 'villarcanomarianodario', 'villarcanomarianodario', 'villarcanom@hotmail.com', 'villarcanom@hotmail.com', 0, 'bapdywtykm8kss8os088cwk8gs8oo8s', '$2y$13$IsfFJOgLslpCzh/BErCLqeJcPYN/UJfyKMSFN8g9Ixn.02jqPWOFu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(275, 'villarmarianobernabe', 'villarmarianobernabe', 'mariano_villar@hotmail.com', 'mariano_villar@hotmail.com', 0, 'gsu3bmuj108c4kogwgcgc4oogo0k440', '$2y$13$UXxrI0R.uvIl2fkPN/4.vevJGqTnbD9GNObhzx2m5anKq.MrWEZFu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(276, 'vicentinmarcosrenato', 'vicentinmarcosrenato', 'mascosvicentin@hotmail.com', 'mascosvicentin@hotmail.com', 0, 'm0ebakreun4go000kswwcc4sg00kcwo', '$2y$13$llhWtmULUp.vPkfh5kGAOePRkSnaTKXh1doNiar6EIMo1VNPmh5Ya', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(277, 'villarflorencio', 'villarflorencio', 'florovillar_20@hotmail.com', 'florovillar_20@hotmail.com', 0, '5hubh10vrao8csc0kcoo88k4o4g8ogw', '$2y$13$YAQq/JmJvMnm5IwJupydeOZquNYvZPZWruRePE1oT9UpIGGleCPJ.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(278, 'waldmannjuanignacio', 'waldmannjuanignacio', 'juani_nachito@hotmail.com', 'juani_nachito@hotmail.com', 0, 'gid7cfftezkkc444owc448sk0cgss40', '$2y$13$Wa4Cv7nMdjwfWxSq6/8BweeMZDqrO7Q2DN21cHDejpIDrcsMZWcoy', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(279, 'yagcigonzalosroberto', 'yagcigonzalosroberto', 'gonzaloy84@msn.com', 'gonzaloy84@msn.com', 0, 'n2fcefmbvyo88csk8sg04ws048okog4', '$2y$13$9sBN4cuz4TS6SASJmaxbleLbOXHkYyrgxUOdXymLZ.APGl7SwLPHO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(280, 'yepeserikfernando', 'yepeserikfernando', 'erick_ypp93@hotmail.com', 'erick_ypp93@hotmail.com', 0, 'rhzgrzzt9q80co08skcs808g4sg0kos', '$2y$13$n/6gW2WhPDsY7HJ67/GuW.SJIEjFQotXRj17Mm..usGVzBXsRNdXK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(281, 'zamboninienriqueta', 'zamboninienriqueta', 'enriqueta.zambonini@hotmail.com', 'enriqueta.zambonini@hotmail.com', 0, 'oidfltepen4kw4co0k0ogoo448o0k8g', '$2y$13$0RMdLZXMmAnqsQcaW.DT/OgJeRglKXz3yI0RmVRCNZdZf1MT07T7.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(282, 'zuninoromanosergioguillermo', 'zuninoromanosergioguillermo', 'zunino.romano@gmail.com', 'zunino.romano@gmail.com', 0, 'n4lxq7714tw8gocsws4wo0co40w4kg8', '$2y$13$ep8JtZlS3lgA3.KJ7nw7Med5PMQj4nNZcqw97l11sxkbmhkYeUNQi', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(283, 'zandonaadriano', 'zandonaadriano', 'adri_468@hotmail.com', 'adri_468@hotmail.com', 0, 'afxwq51986ww40s8wsks4o8c0k80c04', '$2y$13$4fleyNZ.2vUzQzmt0t0Y8uQzFGkY3Wx288yFL5IlKityJi9bTt65q', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `hora`) VALUES
(1, '0800'),
(2, '0900'),
(3, '1000'),
(4, '1100'),
(5, '1200'),
(6, '1300'),
(7, '1400'),
(8, '1500'),
(9, '1600'),
(10, '1700'),
(11, '1800'),
(12, '1900'),
(13, '2000'),
(14, '2100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_deshabilitado`
--

CREATE TABLE IF NOT EXISTS `horario_deshabilitado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dia` int(11) DEFAULT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E54FA77CA0B1D394` (`id_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piloto`
--

CREATE TABLE IF NOT EXISTS `piloto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8AE7BDC32265B05D` (`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=179 ;

--
-- Volcado de datos para la tabla `piloto`
--

INSERT INTO `piloto` (`id`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `usuario`) VALUES
(1, 'GABRIEL ALEJANDRO', 'ACOSTA MAGARIÑOS', NULL, NULL, 'gacostamagariños@gmail.com', 120),
(2, 'JAVIER', 'ACOSTA', NULL, NULL, 'caceresacosta@hotmail.com', 121),
(3, 'JUAN', 'ALASSIA', NULL, NULL, 'jcalassia@hotmail.com', 122),
(4, 'FRANCO', 'ANTONINI', NULL, NULL, 'faneko@gmail.com', 123),
(5, 'SANTIAGO', 'ACOSTA', NULL, NULL, 's.acosta@live.com.ar', 124),
(6, 'ROBERTO LUCIO ', 'ANAYA ROSSELL', NULL, NULL, 'lucioar318@hotmail.com', 125),
(7, 'SANTIAGO LUIS ', 'AVERSA', NULL, NULL, 'santiagoaversa@gmail.com', 126),
(8, 'MATIAS ', 'ALVAREZ', NULL, NULL, 'matiasalvarez.84@hotmail.com', 127),
(9, 'EZEQUIEL MARTIN ', 'AVILA', NULL, NULL, 'eazurdo85@hotmail.com', 128),
(10, 'HERNAN DENIS', 'ARGENTO', NULL, NULL, 'phantom_f41954@hotmail.com', 129),
(11, 'EZEQUIEL MARTIN', 'ALTAMIRANO', NULL, NULL, 'eche_caballito@hotmail.com', 130),
(12, 'ARIEL', 'BOECHAT', NULL, NULL, 'ary_boe@live.com', 131),
(13, 'LUIS', 'BRIATORE', NULL, NULL, 'luchobriatore@hotmail.com', 132),
(14, 'HETTIG JAIME', 'BRUGUERA', NULL, NULL, 'mateobrugue@gmail.com', 133),
(15, 'FEDERICO EMILIANO', 'BURANI', NULL, NULL, 'feburani@gmail.com', 134),
(16, 'NORBERTO', 'BONFINI', NULL, NULL, 'norbertobonfini@gmail.com', 135),
(17, 'SANTIAGO PATRICIO', 'BUEZAS', NULL, NULL, '-', NULL),
(18, 'BERNARDO', 'BONINI', NULL, NULL, 'bonov8@hotmail.com', 136),
(19, 'FRANCISCO', 'BRINGAS', NULL, NULL, '-', NULL),
(20, 'GERMAN ', 'BLEUER', NULL, NULL, 'gbleuer@gmail.com', 137),
(21, 'GABRIEL', 'BERON', NULL, NULL, 'gabriel-beron@hotmail.com', 138),
(22, 'LUCAS OCTAVIO', 'BRUNI', NULL, NULL, 'lucas_bruni@hotmail.com', 139),
(23, 'DANTE', 'BRIELLI', NULL, NULL, 'aguablu@gmail.com', 140),
(24, 'NICOLAS', 'BOURLOT', NULL, NULL, 'nicobourlot@hotmail.com', 141),
(25, 'ESTEBAN', 'BALDUCCI', NULL, NULL, 'esteban.a.balducci@gmail.com', 142),
(26, 'NICOLAS', 'CORVI', NULL, NULL, 'nicoc_21@hotmail.com', 143),
(27, 'SEBASTIAN NAHUEL', 'CALDERON', NULL, NULL, 'seba-calderon@live.com', 144),
(28, 'GUIDO', 'CORRIDONI', NULL, NULL, 'guido_sut@hotmail.com', 145),
(29, 'GABRIEL', 'CRAVCHIK', NULL, NULL, 'galecra@gmail.com', 146),
(30, 'CRISTIAN', 'CORVETTO', NULL, NULL, 'cristiancorvetto@hotmail.com', 147),
(31, 'HERNAN', 'CERREZUELA', NULL, NULL, 'hcerrezuela@yahoo.com.ar', 148),
(32, 'CARLOS', 'COGLIANDRO', NULL, NULL, 'cogliandro_129@hotmail.com', 149),
(33, 'ENZO', 'CACERES', NULL, NULL, 'enzojgcaceres@gmail.com', 150),
(34, 'JORGE EDUARDO', 'CAPRA', NULL, NULL, 'caprajorge@hotmail.com', 151),
(35, 'LUIS', 'CONSTANTINO', NULL, NULL, 'luisconstantino41@hotmail.com', 152),
(36, 'ANDRES', 'CAUCI', NULL, NULL, 'andres.cauci@gmail.com', 153),
(37, 'MARTIN', 'CLUSMAN', NULL, NULL, 'clusmanm@hotmail.com', 154),
(38, 'NICOLAS', 'CHIARELLI', NULL, NULL, 'nicolas_chiarelli@hotmail.com', 155),
(39, 'IGNACIO', 'CAMPOS', NULL, NULL, 'ignacio.melli.campos@gmail.com', 156),
(40, 'LEONEL', 'DINANI', NULL, NULL, 'leodignani@yahoo.com', 157),
(41, 'TOMAS', 'DOLINO', NULL, NULL, 'tomy_d94@hotmail.com', 158),
(42, 'MARIO ARIEL', 'DIONISI', NULL, NULL, 'arieldioni@hotmail.com', 159),
(43, 'FAUSTO', 'ESQUERRA', NULL, NULL, 'faustoesquerra@gmail.com', 160),
(44, 'LUCIA', 'FONTANA', NULL, NULL, '-', NULL),
(45, 'JUAN ADRIAN', 'FLEITAS', NULL, NULL, 'juanfleitas49@gmail.com', 161),
(46, 'ROBERTO', 'GARCIA LOZA', NULL, NULL, 'robertogarcialoza@yahoo.com.ar', 162),
(47, 'CRISTIAN', 'GIMENEZ', NULL, NULL, 'cristiangrabrielg@gmail.com', 163),
(48, 'ALVEAR NICOLY', 'GUERRA', NULL, NULL, 'nickygueral@gmail.com', 164),
(49, 'GABRIEL ALEJANDRO', 'GAROBBIO', NULL, NULL, 'gabriel.garobbio@gmail.com', 165),
(50, 'FACUNDO', 'GONZALEZ DIAZ', NULL, NULL, 'variableazul@yahoo.com.ar', 166),
(51, 'FRANCO', 'GARABENTO', NULL, NULL, '-', NULL),
(52, 'NICOLAS GABRIEL', 'GUILLEN', NULL, NULL, '-', NULL),
(53, 'DAMIAN', 'GONZALEZ', NULL, NULL, 'damigonzal@yahoo.com.ar', 167),
(54, 'FRANCO ESTEBAN', 'IANNONE', NULL, NULL, 'esteban.iannone@hotmail.com', 168),
(55, 'GERMAN IGNACIO', 'ISAAC', NULL, NULL, 'ger_isaac@hotmail.com', 169),
(56, 'ROBIN', 'HIEMER', NULL, NULL, 'robinhiemer@hotmail.com', 170),
(57, 'SEBASTIAN GABRIEL', 'HELLER', NULL, NULL, 'preguntar', 171),
(58, 'CONSTANZA', 'HERRERO', NULL, NULL, 'coniherrero@hotmail.com', 172),
(59, 'MATIAS', 'HABIBO', NULL, NULL, 'matihabibo@hotmail.com', 173),
(60, 'ANDRES', 'HILLCOAT', NULL, NULL, 'andreshillcoat@yahoo.com.ar', 174),
(61, 'ANDRES', 'HELOU', NULL, NULL, 'andreshelou@gmail.com', 175),
(62, 'ANDRES', 'HEDDERWICK', NULL, NULL, '-', NULL),
(63, 'AGUSTIN', 'INSUA', NULL, NULL, 'pochoinsua@gmail.com', 176),
(64, 'JUAN MARTIN', 'IGLESIAS', NULL, NULL, 'jlesias@yahoo.com', 177),
(65, 'JUAN FRANCISCO', 'INSUA', NULL, NULL, 'pancho_riv@hotmail.com', 178),
(66, 'PAULO', 'KUHN', NULL, NULL, 'paulokuhn@yahoo.com.ar', 179),
(67, 'GABRIEL ADOLFO', 'JACOB', NULL, NULL, 'gabrieljac@hotmail.com', 180),
(68, 'HERNAN', 'LAROCCA', NULL, NULL, 'bonvivant69@live.com', 181),
(69, 'GERMAN JORGE', 'LEONI', NULL, NULL, 'golfjulietlima@gmail.com', 182),
(70, 'FACUNDO NICOLAS', 'LEWIS', NULL, NULL, 'facu.lewis@gmail.com', 183),
(71, 'MARIA MACARENA', 'LUNA', NULL, NULL, 'macarenaluna.ml@gmail.com', 184),
(72, 'JORGE HECTOR', 'LEONI', NULL, NULL, 'aeroleoni@yahoo.com.ar', 185),
(73, 'JAVIER', 'LANDINO', NULL, NULL, 'landinoj@hotmail.com', 186),
(74, 'IVAN NICOLAS', 'LITREN', NULL, NULL, 'nicolaslitren@hotmail.com', 187),
(75, 'OSMAR MARTIN', 'LEIVA', NULL, NULL, 'leivamartin46@yahoo.com.ar', 188),
(76, 'DANIEL', 'LOB', NULL, NULL, 'daniel.lob@logiciel.com.ar', 189),
(77, 'JUAN MANUEL', 'LAURIA', NULL, NULL, 'juanchi_cs@hotmail.com', 190),
(78, 'LUCIANO', 'LUCCHESI', NULL, NULL, 'luciano_lucchesi@hotmail.com', 191),
(79, 'LUCAS', 'MAGLIOLA', NULL, NULL, 'lucasmagliola@gmail.com', 192),
(80, 'BRUNO', 'MARCELLO', NULL, NULL, 'brunomarcello@hotmail.com', 193),
(81, 'DIEGO MARTIN', 'MONTES', NULL, NULL, 'montes_diego@hotmail.com', 194),
(82, 'JUAN', 'MARIÑO', NULL, NULL, 'juanmarinopuentes@me.com', 195),
(83, 'IRIS PAOLA', 'MENDEZ', NULL, NULL, 'sparky.mendez92@gmail.com', 196),
(84, 'LEANDRO OSCAR', 'OMELUSIK MARZUCO', NULL, NULL, 'leanscrush_88@hotmail.com', 197),
(85, 'LUIS', 'MARTINEZ', NULL, NULL, 'luis85@live.com.ar', 198),
(86, 'JUAN SEBASTIAN', 'MIETTA', NULL, NULL, 'sebamietta@gmail.com', 199),
(87, 'ALEJANDRO MARCELO', 'MIGUEL', NULL, NULL, '-', NULL),
(88, 'MARTIN JESUS', 'MORISETTI', NULL, NULL, 'mmorisetti@hotmail.com', 200),
(89, 'JUAN CARLOS', 'MARQUEZ', NULL, NULL, 'atp010110@hotmail.com', 201),
(90, 'JULIAN IGNACIO', 'MARTINEZ', NULL, NULL, 'julian.m90@hotmail.com', 202),
(91, 'JUAN', 'MANRIQUE AGUDELO', NULL, NULL, 'juanko_anarko@hotmail.com', 203),
(92, 'JULIAN PABLO', 'MARTIARENA', NULL, NULL, 'jpmartiarena@hotmail.com', 204),
(93, 'RODRIGO MEZA', 'CABALLERO', NULL, NULL, 'rodrigomezacaballero@hotmail.com', 205),
(94, 'JORGE GABRIEL ', 'MINASSIAN', NULL, NULL, 'gabriel@minassian.net', 206),
(95, 'CRISTIAN EZEQUIEL', 'MOIZO', NULL, NULL, 'crismoi@hotmail.com', 207),
(96, 'JORGE MARIANO', 'MUGICA', NULL, NULL, 'cotonetes@hotmail.com', 208),
(97, 'ELIAS ', 'VLADIMIR', NULL, NULL, 'vlad@salaparabateristas.com.ar', 209),
(98, 'TOMAS MARTIN ', 'NIGLIA', NULL, NULL, 'tmniglia@gmail.com', 210),
(99, 'CESAR', 'NAGASAKI', NULL, NULL, 'cesarnagasaki@gmail.com', 211),
(101, 'NICOLAS EZEQUIEL', 'MON', NULL, NULL, 'niico.mon@hotmail.com', 213),
(102, 'ORIANA MICAELA', 'OTERO', NULL, NULL, 'orianamicaelaotero@hotmail.com', 214),
(103, 'IVAN FERNANDO', 'PONS', NULL, NULL, 'ivanfernandopons@gmail.com', 215),
(104, 'PABLO ANDRES', 'PACHECO', NULL, NULL, 'iceman9514@hotmail.com', 216),
(105, 'GERMAN', 'PETELEPEN', NULL, NULL, 'german_piloto@hotmail.com', 217),
(106, 'PABLO JOAQUIN', 'OTERO', NULL, NULL, 'pabliotero@gmail.com', 218),
(107, 'AXEL GIULIANO', 'ORTIZ', NULL, NULL, 'ortizaxelgiuliano@hotmail.com', 219),
(108, 'FACUNDO FELIX', 'ORIGONE', NULL, NULL, 'facudechaca@hotmail.com', 220),
(109, 'ANIBAL ALFREDO', 'OLIVERA', NULL, NULL, 'alfredoanibal_olivera@hotmail.com', 221),
(110, 'ARIEL JAIME', 'MAURIEL', NULL, NULL, '-', NULL),
(111, 'MATIAS EZEQUIEL', 'PALMISANO', NULL, NULL, 'matias_palmisano@hotmail.com', 222),
(112, 'NICOLAS AGUSTIN ', 'PENA', NULL, NULL, 'penanicolas91@gmail.com', 223),
(113, 'ALEJANDRO', 'PULVER', NULL, NULL, 'alepulver@gmail.com', 224),
(114, 'SERGIO FABRIZIO', 'POLICASTRO', NULL, NULL, 'sergiopolicastro73@hotmail.com', 225),
(115, 'JOSE', 'PASTOR', NULL, NULL, 'jlopez.mail@gmail.com', 226),
(116, 'EMILIANO VICTOR', 'PERRETA', NULL, NULL, '-', NULL),
(117, 'JOAQUIN ', 'PALACIOS', NULL, NULL, 'j.palaciosnegri@gmail.com', 227),
(118, 'JOSE IGNACIO', 'PAREDI', NULL, NULL, 'jiparedi@hotmail.com', 228),
(119, 'RENZO IGNACIO', 'PASTORE', NULL, NULL, 'i.pastore@yahoo.com.ar', 229),
(120, 'PABLO', 'PASTORIZA', NULL, NULL, 'pablo_callejero_rnr@hotmail.com', 230),
(121, 'LEANDRO ENRIQUE', 'PINTO', NULL, NULL, 'leandrop26@yahoo.com', 231),
(122, 'FACUNDO ARIEL', 'PEREZ', NULL, NULL, 'facundo.ariel.perez@gmail.com', 232),
(123, 'JAVIER', 'PORTO FEAL', NULL, NULL, '-', NULL),
(124, 'TOMAS', 'RENAUD', NULL, NULL, 'tomasrenaud@hotmail.com', 233),
(125, 'GABRIEL', 'RAMOS', NULL, NULL, 'gabiram_map@hotmail.com', 234),
(126, 'RENZO RENE', 'NAPOLI', NULL, NULL, 'renzonapoli@yahoo.com', 212),
(127, 'LISANDRO JOAQUIN ', 'RIMA', NULL, NULL, 'lisandrorima@hotmail.com', 237),
(128, 'JULIO DANIEL', 'RODRIGUEZ', NULL, NULL, 'juliod.rodriguez@hotmail.com', 238),
(129, 'NICOLAS AGUSTO', 'RONCEL', NULL, NULL, 'nicolasroncel2011@gmail.com', 239),
(130, 'TOMAS ', 'RODRIGUEZ', NULL, NULL, 'tomi.rodriguezv@gmail.com', 240),
(131, 'MATIAS NICOLAS', 'ROITMAN', NULL, NULL, 'matmanr@gmail.com', 241),
(132, 'FEDERICO', 'RAMPELLO', NULL, NULL, 'rampellof@gmail.com', 242),
(133, 'NICOLAS', 'RAFFAELLE', NULL, NULL, 'nicolas.raffaelle@hotmail.com', 243),
(134, 'FRANCISCO LUJAN', 'RODRIGUEZ', NULL, NULL, '-', NULL),
(135, 'DARIO', 'RICART', NULL, NULL, 'darioo.rt@hotmail.com', 244),
(136, 'CLAUDIO LUIS', 'ROJAS', NULL, NULL, 'claudioluisrojas@gmail.com', 245),
(137, 'JANET', 'RIVOLLIER', NULL, NULL, 'janetrivollier@yahoo.com.ar', 246),
(138, 'GABRIEL', 'RUSSO', NULL, NULL, 'g.russo1985@gmail.com', 247),
(139, 'MATIAS', 'QUINTANA', NULL, NULL, 'matiasq79@hotmail.com', 248),
(140, 'MARIA CECILIA', 'RIBAS SOMAR', NULL, NULL, '-', NULL),
(141, 'JOAQUIN ', 'SANCHEZ', NULL, NULL, 'joasancaff@hotmail.com', 249),
(142, 'MATEO ', 'SPIRITOSA', NULL, NULL, 'mateospiri14@hotmail.com', 250),
(143, 'MANUEL', 'SOLSONA', NULL, NULL, 'manu_solsona@hotmail.com', 251),
(144, 'MIGUEL ANGEL', 'SAGRERAS', NULL, NULL, 'msagre@gmail.com', 252),
(145, 'ANDREAS', 'STABLER RUDOLF', NULL, NULL, '-', NULL),
(146, 'LEOPOLDO', 'SILVA ROSSI', NULL, NULL, 'lsilva2@hotmail.com', 253),
(147, 'MARTIN', 'SOENGAS', NULL, NULL, 'martin.fs@gmail.com', 254),
(148, 'ANDRES', 'SANTILLAN', NULL, NULL, 'andres.santillan@live.com.ar', 255),
(149, 'JAVIER ALFREDO', 'SOLA', NULL, NULL, 'javiersola@hotmail.com', 256),
(150, 'GUSTAVO EZEQUIEL', 'SURANTI SILVA', NULL, NULL, '-', NULL),
(151, 'LUIS LEONARDO', 'SENSABATTIANO CASTAÑO', NULL, NULL, 'leosensabattiano@hotmail.com', 257),
(152, 'ZDENEK', 'SYKORA', NULL, NULL, '-', NULL),
(153, 'ANDRES', 'SOTO', NULL, NULL, 'soto_andres@live.com', 258),
(154, 'CRISTIAN ALBERTO', 'SANCHEZ', NULL, NULL, '1976.cristian@gmail.com', 259),
(155, 'IGNACIO ', 'SORIA', NULL, NULL, 'soria.ign@gmail.com', 260),
(156, 'GERMAN DIEGO', 'SUAREZ', NULL, NULL, 'gdsuarez@gmail.com', 261),
(157, 'FRANCISCO', 'SILVA FONT', NULL, NULL, 'fsilvafont@hotmail.com', 262),
(158, 'MATEO', 'SPIMTOSO', NULL, NULL, 'mateospim14@hotmail.com', 263),
(159, 'FRANCO', 'SANTARELLI', NULL, NULL, 'franco_santarelli@hotmail.com', 264),
(160, 'SERGIO DANIEL', 'SORIA', NULL, NULL, 'danielsoria_105@hotmail.com', 265),
(161, 'JUAN IGNACIO', 'SUGASTTI', NULL, NULL, 'juansugastti_97@hotmail.com', 266),
(162, 'GABRIEL ', 'TAU', NULL, NULL, 'gtau65@yahoo.com.ar', 267),
(163, 'LUIS MARTIN ', 'THOMAS', NULL, NULL, 'lucho4678@hotmail.com', 268),
(164, 'EZEQUIEL CLAUDIO', 'TRISANO', NULL, NULL, 'malconeze@hotmail.com', 269),
(165, 'MARIANO', 'TEJERINA', NULL, NULL, 'mtejerina7@hotmail.com', 270),
(166, 'SEBASTIAN', 'TELLERIA', NULL, NULL, 'sebastian_846@hotmail.com', 271),
(167, 'JAVIER ALEJANDRO ', 'SONIN', NULL, NULL, 'jsonin96@gmail.com', 272),
(168, 'JOSE ', 'URIBE', NULL, NULL, 'joseuriberoman@hotmail.com', 273),
(169, 'MARIANO DARIO', 'VILLAR CANO', NULL, NULL, 'villarcanom@hotmail.com', 274),
(170, 'MARIANO BERNABE', 'VILLAR', NULL, NULL, 'mariano_villar@hotmail.com', 275),
(171, 'MARCOS RENATO', 'VICENTIN', NULL, NULL, 'mascosvicentin@hotmail.com', 276),
(172, 'FLORENCIO', 'VILLAR', NULL, NULL, 'florovillar_20@hotmail.com', 277),
(173, 'JUAN IGNACIO', 'WALDMANN', NULL, NULL, 'juani_nachito@hotmail.com', 278),
(174, 'GONZALOS ROBERTO', 'YAGCI', NULL, NULL, 'gonzaloy84@msn.com', 279),
(175, 'ERIK FERNANDO', 'YEPES', NULL, NULL, 'erick_ypp93@hotmail.com', 280),
(176, 'ENRIQUETA', 'ZAMBONINI', NULL, NULL, 'enriqueta.zambonini@hotmail.com', 281),
(177, 'SERGIO GUILLERMO', 'ZUNINO ROMANO', NULL, NULL, 'zunino.romano@gmail.com', 282),
(178, 'ADRIANO', 'ZANDONA', NULL, NULL, 'adri_468@hotmail.com', 283);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_avion` int(11) DEFAULT NULL,
  `horario` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `piloto` int(11) DEFAULT NULL,
  `alumno` int(11) DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E7976762CDC8DC08` (`id_avion`),
  KEY `IDX_E7976762E25853A3` (`horario`),
  KEY `IDX_E79767628AE7BDC3` (`piloto`),
  KEY `IDX_E79767621435D52D` (`alumno`),
  KEY `IDX_E79767623E153BCE` (`dia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id`, `id_avion`, `horario`, `fecha`, `confirmado`, `piloto`, `alumno`, `dia`, `updated_at`) VALUES
(3, 2, 9, '2016-08-11 16:00:00', 1, NULL, 4, 4, '2016-08-09 00:47:39'),
(4, 2, 6, '2016-08-09 13:00:00', 1, NULL, 78, 2, '2016-08-09 01:04:12');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_1435D52D2265B05D` FOREIGN KEY (`usuario`) REFERENCES `fos_user` (`id`);

--
-- Filtros para la tabla `horario_deshabilitado`
--
ALTER TABLE `horario_deshabilitado`
  ADD CONSTRAINT `FK_E54FA77CA0B1D394` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id`);

--
-- Filtros para la tabla `piloto`
--
ALTER TABLE `piloto`
  ADD CONSTRAINT `FK_8AE7BDC32265B05D` FOREIGN KEY (`usuario`) REFERENCES `fos_user` (`id`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_E79767621435D52D` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `FK_E79767623E153BCE` FOREIGN KEY (`dia`) REFERENCES `dia` (`id`),
  ADD CONSTRAINT `FK_E79767628AE7BDC3` FOREIGN KEY (`piloto`) REFERENCES `piloto` (`id`),
  ADD CONSTRAINT `FK_E7976762CDC8DC08` FOREIGN KEY (`id_avion`) REFERENCES `avion` (`id`),
  ADD CONSTRAINT `FK_E7976762E25853A3` FOREIGN KEY (`horario`) REFERENCES `horario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
