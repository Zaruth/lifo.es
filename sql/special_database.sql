--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `from` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ma_aparece`
--

CREATE TABLE `ma_aparece` (
  `partida` varchar(60) NOT NULL,
  `hora` int(14) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ma_aparece`
--

INSERT INTO `ma_aparece` (`partida`, `hora`) VALUES
('lifoes_p1', 1660424400),
('lifoes_p2', 1660366800),
('lifoes_p3', 1660345200),
('lifoes_p4', 1660341600),
('lifoes_p5', 1660410000),
('lifoes_p6', 1660399200),
('lifoes_p7', 1660384800),
('lifoes_p8', 1660410000),
('lifoes_p9', 1660374000),
('lifoes_test', 1660384800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ma_ofertado`
--

CREATE TABLE `ma_ofertado` (
  `partida` varchar(60) NOT NULL,
  `idoferta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ma_ofertado`
--

INSERT INTO `ma_ofertado` (`partida`, `idoferta`) VALUES
('lifoes_p1', 13),
('lifoes_p1', 1),
('lifoes_p1', 3),
('lifoes_p1', 4),
('lifoes_p1', 2),
('lifoes_p2', 11),
('lifoes_p2', 2),
('lifoes_p2', 14),
('lifoes_p2', 4),
('lifoes_p2', 3),
('lifoes_p3', 13),
('lifoes_p3', 7),
('lifoes_p3', 14),
('lifoes_p3', 1),
('lifoes_p3', 2),
('lifoes_p4', 13),
('lifoes_p4', 7),
('lifoes_p4', 15),
('lifoes_p4', 11),
('lifoes_p4', 1),
('lifoes_p5', 2),
('lifoes_p5', 7),
('lifoes_p5', 13),
('lifoes_p5', 15),
('lifoes_p5', 1),
('lifoes_p6', 11),
('lifoes_p6', 1),
('lifoes_p6', 3),
('lifoes_p6', 15),
('lifoes_p6', 2),
('lifoes_p7', 7),
('lifoes_p7', 3),
('lifoes_p7', 2),
('lifoes_p7', 12),
('lifoes_p7', 11),
('lifoes_p8', 3),
('lifoes_p8', 11),
('lifoes_p8', 14),
('lifoes_p8', 15),
('lifoes_p8', 7),
('lifoes_p9', 7),
('lifoes_p9', 1),
('lifoes_p9', 13),
('lifoes_p9', 12),
('lifoes_p9', 14),
('lifoes_test', 1),
('lifoes_test', 11),
('lifoes_test', 15),
('lifoes_test', 13),
('lifoes_test', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ma_ofertas`
--

CREATE TABLE `ma_ofertas` (
  `id` int(11) NOT NULL,
  `idoferta` int(11) NOT NULL,
  `nombreobj` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `ofrecido` int(11) NOT NULL,
  `unica` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ma_ofertas`
--

INSERT INTO `ma_ofertas` (`id`, `idoferta`, `nombreobj`, `cantidad`, `ofrecido`, `unica`) VALUES
(40, 1, 'Recetario del gourmet', 1, 1, 0),
(41, 1, 'Palomitas de maiz', 10, 0, 0),
(60, 2, 'Tomo de los hechizos vudú', 1, 1, 0),
(61, 2, 'Muñeco', 5, 0, 0),
(62, 2, 'Estatuilla de madera', 5, 0, 0),
(63, 2, 'Estatuilla de madera sabia', 5, 0, 0),
(64, 3, 'Jarra de vino', 1, 1, 0),
(65, 3, 'Jarra de mosto', 1, 0, 0),
(66, 4, 'Tomo del control de la energía', 1, 1, 0),
(67, 4, 'Hechizo: Falso eclipse', 3, 0, 0),
(68, 5, 'Mapa: Purgatorio', 1, 1, 1),
(69, 5, 'Trozo de mapa A', 1, 0, 1),
(70, 5, 'Trozo de mapa B', 1, 0, 1),
(71, 5, 'Trozo de mapa C', 1, 0, 1),
(72, 5, 'Trozo de mapa D', 1, 0, 1),
(73, 5, 'Trozo de mapa E', 1, 0, 1),
(74, 5, 'Trozo de mapa F', 1, 0, 1),
(75, 6, 'Mapa: Limbo', 1, 1, 1),
(76, 6, 'Trozo de mapa A', 1, 0, 1),
(77, 6, 'Trozo de mapa B', 1, 0, 1),
(78, 6, 'Trozo de mapa C', 1, 0, 1),
(79, 6, 'Trozo de mapa D', 1, 0, 1),
(80, 6, 'Trozo de mapa E', 1, 0, 1),
(81, 6, 'Trozo de mapa F', 1, 0, 1),
(82, 7, 'Hechizo: Heridas cicatrizantes', 1, 1, 0),
(83, 7, 'Planta curativa', 1, 0, 0),
(84, 8, 'Halcón de fuego', 1, 1, 1),
(85, 8, 'Rosa roja', 5, 0, 1),
(86, 8, 'Polvo del fuego', 100, 0, 1),
(87, 8, 'Hechizo: Desatar infierno', 10, 0, 1),
(88, 9, 'Mitad izquierda perleada', 1, 1, 1),
(89, 9, 'Escudo celestial', 1, 0, 1),
(92, 11, 'Cono de Fresa', 1, 1, 0),
(93, 11, 'Pintura de un yeti', 1, 0, 0),
(94, 12, 'Esencia mágica', 1, 1, 0),
(95, 12, 'Paisaje pintoresco', 1, 0, 0),
(96, 13, 'Cristal de magia', 1, 1, 0),
(97, 13, 'Cuadro de una croqueta', 1, 0, 0),
(98, 14, 'Manual de creación de artefactos', 1, 1, 0),
(99, 14, 'Arma desconocida de amazona', 3, 0, 0),
(100, 15, 'Botas de fuego mágico', 1, 1, 0),
(101, 15, 'Yelmo de fuego mágico', 1, 0, 0),
(102, 15, 'Coraza de fuego mágico', 1, 0, 0),
(103, 15, 'Perneras de fuego mágico', 1, 0, 0),
(104, 15, 'Espada de fuego mágico', 1, 0, 0),
(105, 15, 'Daga de fuego mágico', 1, 0, 0),
(106, 15, 'Escudo de fuego mágico', 1, 0, 0),
(107, 1, 'Jarra de zumo de moras', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postman`
--

CREATE TABLE `postman` (
  `inicio` int(14) DEFAULT NULL,
  `cupos` int(3) NOT NULL DEFAULT 100
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `postman`
--

INSERT INTO `postman` (`inicio`, `cupos`) VALUES
(NULL, 99);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ma_ofertas`
--
ALTER TABLE `ma_ofertas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ma_ofertas`
--
ALTER TABLE `ma_ofertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
