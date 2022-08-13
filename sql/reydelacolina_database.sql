--
-- Estructura de tabla para la tabla `aprendido`
--

CREATE TABLE `aprendido` (
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `resultado` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `baneado`
--

CREATE TABLE `baneado` (
  `id` int(11) NOT NULL,
  `string` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `stringip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `isip` int(1) NOT NULL,
  `autor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `motivo` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `eliminado` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `horapuesto` int(20) NOT NULL,
  `horafin` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `id` int(11) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dia` int(2) NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clandata`
--

CREATE TABLE `clandata` (
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `clan` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `solicita` int(1) NOT NULL DEFAULT 0,
  `lider` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `claninsignia`
--

CREATE TABLE `claninsignia` (
  `clan` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `insignia` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conoce`
--

CREATE TABLE `conoce` (
  `editar` int(11) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `resultado` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contador`
--

CREATE TABLE `contador` (
  `contador` int(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contiene`
--

CREATE TABLE `contiene` (
  `id` int(11) NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `resultado` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dificultadaprender` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contiene`
--

INSERT INTO `contiene` (`id`, `nombreobj`, `resultado`, `dificultadaprender`) VALUES
(1, 'Tomo de la nigromancia', 'Hechizo: Ayudante de huesos', 20),
(2, 'Tomo de la nigromancia', 'Hechizo: Ayudante putrefacto', 60),
(3, 'Tomo de la nigromancia', 'Hechizo: Calavera voladora', 70),
(4, 'Tomo de la nigromancia', 'Hechizo: Esqueleto veloz', 60),
(5, 'Tomo de la nigromancia', 'Hechizo: Monstruosidad', 99),
(6, 'Manual de preparativos clericales', 'Agua bendita', 0),
(7, 'Manual de preparativos clericales', 'Agua sagrada', 50),
(8, 'Tomo de la clerecía', 'Hechizo: Bendición', 20),
(9, 'Tomo de la clerecía', 'Hechizo: Soplo divino', 40),
(10, 'Tomo de la clerecía', 'Hechizo: Aura divina', 60),
(11, 'Tomo de la clerecía', 'Hechizo: Coraje divino', 80),
(12, 'Tomo de la clerecía', 'Hechizo: Invocación divina', 99),
(13, 'Grimorio de alteración dimensional', 'Esfera del averno', 70),
(14, 'Grimorio de alteración dimensional', 'Esfera celestial', 70),
(15, 'Tomo de alteración dimensional aplicada', 'Arma adimensional', 90),
(16, 'Tomo de alteración dimensional aplicada', 'Escudo adimensional', 90),
(17, 'Tomo de alteración dimensional aplicada', 'Yelmo adimensional', 90),
(18, 'Tomo de alteración dimensional aplicada', 'Coraza adimensional', 90),
(19, 'Tomo de alteración dimensional aplicada', 'Botas adimensionales', 90),
(20, 'Tomo de alteración dimensional aplicada', 'Amuleto adimensional', 90),
(21, 'Tomo de alteración dimensional aplicada', 'Perneras adimensionales', 90),
(22, 'Manual de creación de artilugios', 'Escudo pegajoso', 10),
(23, 'Manual de creación de artilugios', 'Escudo pegajoso permanente', 70),
(24, 'Manual de creación de artilugios', 'Escudo lanzaclavos', 30),
(25, 'Manual de creación de artilugios', 'Escudo lanzaagujas', 50),
(31, 'Manual de creación de artefactos', 'Lanzaclavos', 30),
(32, 'Manual de creación de artefactos', 'Ballesta', 50),
(33, 'Manual de creación de artefactos', 'Ballesta sabia', 70),
(34, 'Manual de creación de artefactos', 'Ballesta de energía', 99),
(35, 'Tomo de los preparativos vudú', 'Algodón', 30),
(36, 'Tomo de los preparativos vudú', 'Muñeco', 60),
(37, 'Tomo de los preparativos vudú', 'Venda', 50),
(38, 'Tomo de los preparativos vudú', 'Estatuilla de madera', 80),
(39, 'Tomo de los preparativos vudú', 'Estatuilla de madera sabia', 90),
(40, 'Tomo de los preparativos vudú', 'Hongo vudú', 50),
(41, 'Tomo de los preparativos vudú', 'Esporas', 80),
(42, 'Tomo de los hechizos vudú', 'Hechizo: Herida vudú', 10),
(43, 'Tomo de los hechizos vudú', 'Hechizo: Control vudú', 30),
(44, 'Tomo de los hechizos vudú', 'Hechizo: Ceguera vudú', 50),
(45, 'Tomo de los hechizos vudú', 'Hechizo: Confusión vudú', 80),
(46, 'Tomo de los hechizos vudú', 'Hechizo: Devastación vudú', 90),
(47, 'Manual de preparación de espejos', 'Espejo', 60),
(48, 'Manual de preparación de espejos', 'Espejo sabio', 60),
(49, 'Grimorio del medium', 'Hechizo: Invocación fantasmal', 20),
(50, 'Grimorio del medium', 'Hechizo: Reflejo fantasmal', 10),
(51, 'Grimorio del medium', 'Hechizo: Lanzador de clavos fantasmal', 50),
(52, 'Grimorio del medium', 'Hechizo: Materialización fantasmal', 90),
(53, 'Grimorio del medium', 'Hechizo: Horda fantasmal', 99),
(54, 'Manual de forja de herramientas', 'Aguja', 5),
(55, 'Manual de forja de herramientas', 'Clavo', 5),
(56, 'Manual de forja de herramientas', 'Aguja de oro', 5),
(57, 'Manual de forja de herramientas', 'Clavo de oro', 5),
(58, 'Manual de forja de herramientas', 'Herramientas de forja avanzada', 20),
(59, 'Manual de carpintería', 'Tablón de madera', 10),
(60, 'Manual de carpintería', 'Savia', 20),
(61, 'Manual de carpintería', 'Tablón de madera sabia', 60),
(62, 'Manual de carpintería', 'Savia de madera sabia', 70),
(63, 'Manual de carpintería', 'Pegamento', 50),
(64, 'Manual de fundición', 'Pinturas', 0),
(65, 'Manual de fundición', 'Hierro líquido', 20),
(66, 'Manual de fundición', 'Mercurio', 70),
(67, 'Manual de fundición', 'Oro líquido', 90),
(68, 'Manual de refinado', 'Lingote de hierro', 10),
(69, 'Manual de refinado', 'Vial de eter', 30),
(70, 'Manual de refinado', 'Lingote de oro', 80),
(71, 'Tomo del gran druida', 'Vial de onyx líquido', 40),
(72, 'Tomo del gran druida', 'Frasco de onyx líquido', 60),
(73, 'Tomo del gran druida', 'Pócima de onyx líquido', 80),
(74, 'Tomo del gran druida', 'Vial de agua de los deseos', 40),
(75, 'Tomo del gran druida', 'Frasco de agua de los deseos', 60),
(76, 'Tomo del gran druida', 'Pócima de agua de los deseos', 80),
(77, 'Tomo avanzado del druida', 'Vial de polen de hidra', 20),
(78, 'Tomo avanzado del druida', 'Frasco de polen de hidra', 40),
(79, 'Tomo avanzado del druida', 'Pócima de polen de hidra', 60),
(80, 'Tomo avanzado del druida', 'Vial de sangre de dragón', 20),
(81, 'Tomo avanzado del druida', 'Frasco de sangre de dragón', 40),
(82, 'Tomo avanzado del druida', 'Pócima de sangre de dragón', 60),
(83, 'Tomo del control de la energía', 'Cristal de invocación del poder', 50),
(84, 'Tomo del control de la energía', 'Pergamino en blanco del poder', 50),
(85, 'Recetario del gran gourmet', 'Menú completo', 85),
(86, 'Tomo básico del druida', 'Preparado casero de fuerza', 20),
(87, 'Tomo básico del druida', 'Preparado casero de agilidad', 20),
(88, 'Tomo básico del druida', 'Hongo druida', 50),
(89, 'Recetario del gourmet', 'Ensalada', 35),
(90, 'Recetario del gourmet', 'Hamburguesa', 35),
(91, 'Recetario del gourmet', 'Jarra de bebida energética', 60),
(92, 'Recetario del gourmet', 'Yogur de frutas', 35),
(93, 'Recetario del gourmet', 'Sopa de pollo y huevo', 40),
(94, 'Recetario de cocina mágica avanzada', 'Jarra de cerveza', 10),
(95, 'Recetario de cocina mágica avanzada', 'Palomitas de maiz', 50),
(96, 'Recetario de cocina mágica avanzada', 'Yogur', 40),
(97, 'Recetario de cocina mágica avanzada', 'Empanada', 70),
(98, 'Recetario de cocina mágica avanzada', 'Sopa', 60),
(99, 'Recetario de cocina mágica avanzada', 'Tortilla', 70),
(100, 'Recetario de cocina mágica avanzada', 'Huevo cocido', 30),
(101, 'Recetario de cocina mágica avanzada', 'Frasco de vinagre', 60),
(102, 'Recetario de repostería mágica básica', 'Barra de pan', 30),
(103, 'Recetario de repostería mágica básica', 'Bizcocho', 30),
(104, 'Recetario de repostería mágica básica', 'Chocolate', 60),
(105, 'Recetario de cocina mágica básica', 'Jarra de vino', 60),
(106, 'Recetario de cocina mágica básica', 'Queso', 5),
(107, 'Recetario de cocina mágica básica', 'Mantequilla', 30),
(108, 'Recetario de cocina mágica básica', 'Ración de tostadas', 20),
(109, 'Libro de los secretos del café', 'Jarra de café con leche', 50),
(110, 'Libro de los secretos del café', 'Jarra de café con azucar', 50),
(111, 'Libro de los secretos del café', 'Jarra de café con leche y azucar', 70),
(112, 'Libro de los secretos del café', 'Jarra de café', 10),
(113, 'Libro de los secretos del café', 'Café molido', 0),
(114, 'Recetario de batidos', 'Jarra de batido de cacao', 20),
(115, 'Recetario de batidos', 'Jarra de batido de plátano', 50),
(116, 'Recetario de batidos', 'Jarra de batido de fresa', 60),
(117, 'Manual de prensado', 'Harina', 20),
(118, 'Manual de prensado', 'Frasco de aceite', 60),
(119, 'Manual de prensado', 'Cacao molido', 40),
(120, 'Manual de introducción a la magia', 'Hechizo: Misil mágico', 5),
(121, 'Manual de introducción a la magia', 'Hechizo: Destello', 5),
(122, 'Manual de destilación', 'Sal', 5),
(123, 'Manual de destilación', 'Azúcar', 20),
(124, 'Manual de destilación', 'Vial de alcohol puro', 65),
(125, 'Manual de destilación', 'Jarra de mosto de cebada', 65),
(126, 'Recetario de zumos de hortalizas', 'Jarra de zumo de tomate', 5),
(127, 'Recetario de zumos de hortalizas', 'Jarra de zumo de zanahoria', 6),
(128, 'Recetario de zumos de hortalizas', 'Jarra de zumo de remolacha', 10),
(129, 'Recetario de zumos de frutas', 'Jarra de zumo de naranja', 0),
(130, 'Recetario de zumos de frutas', 'Jarra de zumo de manzana', 0),
(131, 'Recetario de zumos de frutas', 'Jarra de zumo de pera', 0),
(132, 'Recetario de zumos de frutas', 'Jarra de zumo de plátano', 0),
(133, 'Recetario de zumos de frutas', 'Jarra de mosto', 5),
(134, 'Recetario de zumos de frutas', 'Jarra de zumo de coco', 8),
(135, 'Recetario de zumos de frutas', 'Jarra de zumo de sandía', 8),
(136, 'Recetario de zumos de frutas', 'Jarra de zumo de cerezas', 10),
(137, 'Recetario de zumos de frutas', 'Jarra de zumo de fresas', 12),
(138, 'Recetario de zumos de frutas', 'Jarra de zumo de moras', 16),
(139, 'Manual de introducción al ilusionismo', 'Hechizo: Falsa neblina', 20),
(140, 'Manual de introducción al ilusionismo', 'Hechizo: Falsa niebla', 30),
(141, 'Manual de introducción al ilusionismo', 'Hechizo: Falso eclipse', 40),
(142, 'Grimorio de las ilusiones', 'Hechizo: Falsas enredaderas', 10),
(143, 'Grimorio de las ilusiones', 'Hechizo: Locura', 20),
(144, 'Grimorio de las ilusiones', 'Hechizo: Levitación', 50),
(145, 'Grimorio de las ilusiones', 'Hechizo: Guerrero ilusorio', 70),
(146, 'Grimorio de la energía', 'Hechizo: Fortaleza', 10),
(147, 'Grimorio de la energía', 'Hechizo: Telekinesia', 15),
(148, 'Grimorio de la energía', 'Hechizo: Asfixia', 40),
(149, 'Grimorio de la energía', 'Hechizo: Criatura de energía', 60),
(150, 'Grimorio de la energía', 'Hechizo: Dragón de energía', 80),
(151, 'Grimorio del fuego', 'Hechizo: Bola de fuego', 20),
(152, 'Grimorio del fuego', 'Hechizo: Rayo de fuego', 30),
(153, 'Grimorio del fuego', 'Hechizo: Aura de fuego', 20),
(154, 'Grimorio del fuego', 'Hechizo: Poder elemental del fuego', 60),
(155, 'Grimorio del fuego', 'Hechizo: Desatar infierno', 80),
(156, 'Grimorio del hielo', 'Hechizo: Bola de hielo', 10),
(157, 'Grimorio del hielo', 'Hechizo: Rayo de hielo', 20),
(158, 'Grimorio del hielo', 'Hechizo: Aura de hielo', 40),
(159, 'Grimorio del hielo', 'Hechizo: Poder elemental del hielo', 70),
(160, 'Grimorio del hielo', 'Hechizo: Congelar alma', 80),
(161, 'Grimorio del tiempo', 'Hechizo: Variación del tiempo', 30),
(162, 'Grimorio del tiempo', 'Hechizo: Gran variación del tiempo', 40),
(163, 'Grimorio del tiempo', 'Hechizo: Presentir', 50),
(164, 'Grimorio del tiempo', 'Hechizo: Velocidad', 70),
(165, 'Grimorio del tiempo', 'Hechizo: Paradoja temporal', 80),
(166, 'Grimorio del caos', 'Hechizo: Inflingir enfermedad', 0),
(167, 'Grimorio del caos', 'Hechizo: Desorden de la realidad', 30),
(168, 'Grimorio del caos', 'Hechizo: Furia caótica', 60),
(169, 'Grimorio del caos', 'Hechizo: Aniquilación', 70),
(170, 'Grimorio del caos', 'Hechizo: Caos', 80),
(171, 'Grimorio de la vida', 'Hechizo: Heridas cicatrizantes', 20),
(172, 'Grimorio de la vida', 'Hechizo: Enredaderas', 20),
(173, 'Grimorio de la vida', 'Hechizo: Llamada a la naturaleza', 20),
(174, 'Grimorio de la vida', 'Hechizo: Enredaderas protectoras', 20),
(175, 'Grimorio de la vida', 'Hechizo: Terremoto', 20),
(176, 'Grimorio de la vida', 'Grimorio del caos', 90),
(177, 'Libro de montaje de arbolitos', 'Arbolito de navidad', 0),
(178, 'Manual de infusión de vida', 'Gárgola esmeralda viviente', 0),
(179, 'Manual de infusión de vida', 'Gárgola rubí viviente', 0),
(180, 'Tomo de los dragones', 'Dragón', 0),
(181, 'Tomo de encantamiento de cayados', 'Cayado de talla mágica', 0),
(182, 'Tomo de encantamiento de cayados', 'Cayado de hielo', 12),
(183, 'Tomo de encantamiento de cayados', 'Cayado de fuego', 24),
(184, 'Tomo de encantamiento de cayados', 'Cayado de la vida', 36),
(185, 'Tomo de encantamiento de cayados', 'Cayado de la muerte', 48),
(186, 'Tomo de encantamiento de cayados', 'Cayado del tiempo', 60),
(187, 'Tomo de encantamiento de cayados', 'Cayado del control', 72),
(188, 'Tomo de instrumentación mágica', 'Cayado del Archicanciller', 40),
(189, 'Tomo de mejora de varas', 'Vara activa', 50),
(190, 'Tomo de mejora de varas', 'Vara de la gran serpiente', 40),
(191, 'Manual de manipulación de joyería', 'Joya premium', 0),
(192, 'Manual de manipulación de joyería', 'Esquirla de joya premium', 0),
(193, 'Sagrada escritura', 'Mapa: Limbo', 0),
(194, 'Apocalipsis', 'Mapa: Purgatorio', 0),
(195, 'Grimorio del hielo', 'Espada Glacial', 75),
(196, 'Manual de hechicería', 'Caramelos', 0),
(197, 'Manual de hechicería', 'Bolsa de caramelos', 0),
(198, 'Manual de hechicería', 'Piruleta de manzana', 0),
(199, 'Manual de hechicería', 'Piruleta de fresa', 0),
(200, 'Manual de hechicería', 'Tarta de calabaza', 0),
(201, 'Manual de hechicería', 'Sombrero de hechicería', 0),
(202, 'Manual de hechicería', 'Calabaza decorada', 0),
(203, 'Manual de hechicería', 'Collar de la suerte(I)', 0),
(204, 'Manual de hechicería', 'Arma desconocida de amazona(I)', 0),
(205, 'Manual de hechicería', 'Extraño utensilio inutilizable(I)', 0),
(206, 'Manual de hechicería', 'Polvo de estrellas(I)', 0),
(207, 'Manual de hechicería', 'Planta curativa(I)', 0),
(208, 'Manual de hechicería', 'Símbolo sagrado(I)', 0),
(209, 'Manual de hechicería', 'Lámpara(I)', 0),
(210, 'Manual de hechicería', 'Corona(I)', 0),
(211, 'Manual de hechicería', 'Polvo de hueso rojo', 0),
(212, 'Pergamino mágico: Oso festivo', 'Oso festivo animado', 0),
(213, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo A', 50),
(214, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo B', 50),
(215, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo C', 50),
(216, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo D', 50),
(217, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo E', 50),
(218, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo F', 50),
(219, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo G', 50),
(220, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo H', 50),
(221, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo I', 50),
(222, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo J', 50),
(223, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo K', 50),
(224, 'Tomo de diseño de atrezzo', 'Insignia Atrezzo M', 50),
(225, 'Manual de manipulación de cristales', 'Cristal carmesí activado', 77),
(226, 'Manual de manipulación de cristales', 'Cristal añil activado', 77),
(227, 'Manual de manipulación de cristales', 'Cristal purpúreo activado', 77),
(228, 'Recetario de bocadillos', 'Bocadillo vegetal', 20),
(229, 'Recetario de bocadillos', 'Bocadillo de pollo y lechuga', 20),
(230, 'Recetario de bocadillos', 'Bocadillo de solomillo y queso', 50),
(231, 'Grimorio de la luz', 'Hechizo: Fuego sagrado', 0),
(232, 'Grimorio de la luz', 'Hechizo: Justicia divina', 30),
(233, 'Grimorio de la luz', 'Hechizo: Aura celestial', 60),
(234, 'Grimorio de la luz', 'Hechizo: Bastión', 70),
(235, 'Grimorio de la luz', 'Hechizo: Juicio final', 80),
(236, 'Grimorio de otro mundo', 'Hechizo: Ciclo infinito', 0),
(237, 'Grimorio de otro mundo', 'Hechizo: Igualdad', 30),
(238, 'Grimorio de otro mundo', 'Hechizo: Tiempo muerto', 60),
(239, 'Grimorio de otro mundo', 'Hechizo: Trinidad', 70),
(240, 'Grimorio de otro mundo', 'Hechizo: Dominación', 80),
(241, 'Grimorio de la vida', 'Grimorio de la luz', 90),
(242, 'Grimorio de alteración dimensional', 'Llaves de otro mundo', 70),
(243, 'Tomo de alteración dimensional aplicada', 'Grimorio de otro mundo', 90),
(244, 'Receta: Amuleto de otra era', 'Amuleto de otra era', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contiene_cofre`
--

CREATE TABLE `contiene_cofre` (
  `id` int(11) NOT NULL,
  `nombre_cofre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `probabilidad` double NOT NULL,
  `cant_min` int(10) NOT NULL,
  `cant_max` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contiene_cofre`
--

INSERT INTO `contiene_cofre` (`id`, `nombre_cofre`, `nombreobj`, `probabilidad`, `cant_min`, `cant_max`) VALUES
(5, 'Cofre festivo', 'Carbón dulce', 100, 1, 3),
(3, 'Cofre festivo', 'Chocolate caliente', 100, 1, 2),
(6, 'Cofre festivo', 'Felicitación 2021', 100, 1, 1),
(7, 'Cofre enano', 'Sable de honor', 5, 1, 1),
(8, 'Cofre enano', 'Espada suprema', 5, 1, 1),
(9, 'Cofre enano', 'Puñal de cristal de alma', 5, 1, 1),
(10, 'Cofre enano', 'Receta: Amuleto de otra era', 100, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encantamientos`
--

CREATE TABLE `encantamientos` (
  `id` int(11) NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `niveluso` int(10) NOT NULL DEFAULT 0,
  `prot` int(20) NOT NULL DEFAULT 0,
  `ataq` int(20) NOT NULL DEFAULT 0,
  `vida` int(20) NOT NULL DEFAULT 0,
  `esencia` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `encantamientos`
--

INSERT INTO `encantamientos` (`id`, `nombreobj`, `img`, `niveluso`, `prot`, `ataq`, `vida`, `esencia`) VALUES
(1, 'Hechizo: Caos', 'pcnn', 80, 0, 100, 0, 'Esencia: Caos'),
(2, 'Hechizo: Aniquilación', 'pcnr', 70, 0, 45, 0, 'Esencia: Aniquilación'),
(3, 'Hechizo: Horda fantasmal', 'phf', 62, 20, 20, 0, 'Esencia: Horda fantasmal'),
(4, 'Hechizo: Invocación divina', 'phe', 61, 12, 33, 0, 'Esencia: Invocación divina'),
(5, 'Hechizo: Coraje divino', 'phd', 60, 10, 24, 0, 'Esencia: Coraje divino'),
(6, 'Hechizo: Materialización fantasmal', 'pmf', 53, 10, 20, 0, 'Esencia: Materialización fantasmal'),
(7, 'Hechizo: Furia caótica', 'pcna', 50, 0, 26, 0, 'Esencia: Furia caótica'),
(8, 'Hechizo: Monstruosidad', 'pne', 50, 0, 26, 0, 'Esencia: Monstruosidad'),
(9, 'Hechizo: Lanzador de clavos fantasmal', 'plcf', 47, 0, 22, 0, 'Esencia: Lanzador de clavos fantasmal'),
(10, 'Hechizo: Esqueleto veloz', 'pnd', 47, 0, 22, 0, 'Esencia: Esqueleto veloz'),
(11, 'Hechizo: Desorden de la realidad', 'pcnz', 44, 0, 20, 0, 'Esencia: Desorden de la realidad'),
(12, 'Hechizo: Congelar alma', 'pcca', 42, 0, 20, 0, 'Esencia: Congelar alma'),
(13, 'Hechizo: Devastación vudú', 'hve', 44, 0, 19, 110, 'Esencia: Devastación vudú'),
(14, 'Hechizo: Paradoja temporal', 'pcan', 39, 5, 13, 0, 'Esencia: Paradoja temporal'),
(15, 'Hechizo: Invocación fantasmal', 'pif', 40, 0, 18, 0, 'Esencia: Invocación fantasmal'),
(16, 'Hechizo: Reflejo fantasmal', 'prf', 40, 18, 0, 0, 'Esencia: Reflejo fantasmal'),
(17, 'Hechizo: Desatar infierno', 'pcrn', 39, 0, 18, 0, 'Esencia: Desatar infierno'),
(18, 'Hechizo: Calavera voladora', 'pnc', 39, 0, 18, 0, 'Esencia: Calavera voladora'),
(19, 'Hechizo: Velocidad', 'pcar', 35, 7, 9, 0, 'Esencia: Velocidad'),
(20, 'Hechizo: Dragón de energía', 'pcbv', 35, 0, 16, 0, 'Esencia: Dragón de energía'),
(21, 'Hechizo: Aura divina', 'phc', 35, 16, 0, 0, 'Esencia: Aura divina'),
(22, 'Hechizo: Inflingir enfermedad', 'pcnb', 37, 0, 15, 0, 'Esencia: Inflingir enfermedad'),
(23, 'Hechizo: Terremoto', 'pcvr', 31, 0, 14, 90, 'Esencia: Terremoto'),
(24, 'Hechizo: Enredaderas protectoras', 'pcva', 31, 14, 0, 80, 'Esencia: Enredaderas protectoras'),
(25, 'Hechizo: Confusión vudú', 'hvd', 33, 14, 0, 100, 'Esencia: Confusión vudú'),
(26, 'Hechizo: Ayudante putrefacto', 'pnb', 33, 0, 14, 0, 'Esencia: Ayudante putrefacto'),
(27, 'Hechizo: Poder elemental del hielo', 'pccr', 31, 7, 7, 0, 'Esencia: Poder elemental del hielo'),
(28, 'Hechizo: Guerrero ilusorio', 'pcgi', 31, 6, 8, 0, 'Esencia: Guerrero ilusorio'),
(29, 'Hechizo: Llamada a la naturaleza', 'pcvv', 30, 4, 9, 70, 'Esencia: Llamada a la naturaleza'),
(30, 'Hechizo: Criatura de energía', 'pcbz', 28, 0, 12, 0, 'Esencia: Criatura de energía'),
(31, 'Hechizo: Ayudante de huesos', 'pna', 28, 0, 12, 0, 'Esencia: Ayudante de huesos'),
(32, 'Hechizo: Levitación', 'pcle', 28, 12, 0, 0, 'Esencia: Levitación'),
(33, 'Hechizo: Soplo divino', 'phb', 28, 12, 0, 0, 'Esencia: Soplo divino'),
(34, 'Hechizo: Presentir', 'pcav', 23, 10, 0, 0, 'Esencia: Presentir'),
(35, 'Hechizo: Bendición', 'pha', 20, 10, 0, 0, 'Esencia: Bendición'),
(36, 'Hechizo: Poder elemental del fuego', 'pcrv', 24, 5, 5, 0, 'Esencia: Poder elemental del fuego'),
(37, 'Hechizo: Gran variación del tiempo', 'pcaa', 20, 4, 5, 0, 'Esencia: Gran variación del tiempo'),
(38, 'Hechizo: Locura', 'pclo', 22, 3, 6, 0, 'Esencia: Locura'),
(39, 'Hechizo: Enredaderas', 'pcvc', 20, 2, 6, 50, 'Esencia: Enredaderas'),
(40, 'Hechizo: Ceguera vudú', 'hvc', 22, 0, 8, 60, 'Esencia: Ceguera vudú'),
(41, 'Hechizo: Asfixia', 'pcba', 20, 0, 8, 0, 'Esencia: Asfixia'),
(42, 'Hechizo: Aura de hielo', 'pccv', 18, 7, 0, 0, 'Esencia: Aura de hielo'),
(43, 'Hechizo: Rayo de fuego', 'pcra', 18, 0, 7, 0, 'Esencia: Rayo de fuego'),
(44, 'Hechizo: Control vudú', 'hvb', 20, 0, 7, 40, 'Esencia: Control vudú'),
(45, 'Hechizo: Rayo de hielo', 'pccm', 16, 0, 6, 0, 'Esencia: Rayo de hielo'),
(46, 'Hechizo: Variación del tiempo', 'pcab', 12, 2, 3, 0, 'Esencia: Variación del tiempo'),
(47, 'Hechizo: Falso eclipse', 'pce', 14, 5, 0, 0, 'Esencia: Falso eclipse'),
(48, 'Hechizo: Heridas cicatrizantes', 'pcvb', 14, 5, 0, 20, 'Esencia: Heridas cicatrizantes'),
(49, 'Hechizo: Aura de fuego', 'pcrz', 14, 5, 0, 0, 'Esencia: Aura de fuego'),
(50, 'Hechizo: Herida vudú', 'hva', 16, 0, 5, 30, 'Esencia: Herida vudú'),
(51, 'Hechizo: Bola de fuego', 'pcrb', 12, 0, 4, 0, 'Esencia: Bola de fuego'),
(52, 'Hechizo: Telekinesia', 'pcbr', 12, 0, 4, 0, 'Esencia: Telekinesia'),
(53, 'Hechizo: Falsas enredaderas', 'pcen', 12, 0, 4, 10, 'Esencia: Falsas enredaderas'),
(54, 'Hechizo: Fortaleza', 'pcbc', 9, 3, 0, 0, 'Esencia: Fortaleza'),
(55, 'Hechizo: Bola de hielo', 'pccb', 9, 0, 3, 0, 'Esencia: Bola de hielo'),
(56, 'Hechizo: Falsa niebla', 'pcno', 9, 3, 0, 0, 'Esencia: Falsa niebla'),
(57, 'Hechizo: Falsa neblina', 'pcn', 7, 2, 0, 0, 'Esencia: Falsa neblina'),
(58, 'Hechizo: Misil mágico', 'pmm', 5, 0, 1, 0, 'Esencia: Misil mágico'),
(59, 'Hechizo: Destello', 'pd', 5, 1, 0, 0, 'Esencia: Destello'),
(60, 'Hechizo: Fuego sagrado', 'phfs', 37, 15, 0, 0, 'Esencia: Fuego sagrado'),
(61, 'Hechizo: Justicia divina', 'phjd', 44, 20, 0, 0, 'Esencia: Justicia divina'),
(62, 'Hechizo: Aura celestial', 'phac', 50, 26, 0, 0, 'Esencia: Aura celestial'),
(63, 'Hechizo: Bastión', 'phba', 70, 45, 0, 0, 'Esencia: Bastión'),
(64, 'Hechizo: Juicio final', 'phjf', 80, 100, 0, 0, 'Esencia: Juicio final'),
(65, 'Hechizo: Ciclo infinito', 'phci', 110, 30, 80, 50, 'Esencia: Ciclo infinito'),
(66, 'Hechizo: Igualdad', 'phig', 120, 75, 1, 130, 'Esencia: Igualdad'),
(67, 'Hechizo: Tiempo muerto', 'phtm', 130, 150, 10, 10, 'Esencia: Tiempo muerto'),
(68, 'Hechizo: Trinidad', 'phtr', 140, 70, 70, 70, 'Esencia: Trinidad'),
(69, 'Hechizo: Dominación', 'phdo', 150, -50, 200, 100, 'Esencia: Dominación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exploracion`
--

CREATE TABLE `exploracion` (
  `id` int(11) NOT NULL,
  `mapa` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `probabilidad` int(10) NOT NULL,
  `oculto` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `exploracion`
--

INSERT INTO `exploracion` (`id`, `mapa`, `nombreobj`, `probabilidad`, `oculto`) VALUES
(1, 'Mapa: Campos de Lifo', 'Mapa: Bosques de Lifo', 1000, 0),
(3, 'Mapa: Campos de Lifo', 'Zanahoria', 3000, 0),
(4, 'Mapa: Campos de Lifo', 'Manzana', 5000, 0),
(5, 'Mapa: Campos de Lifo', 'Naranja', 5000, 0),
(6, 'Mapa: Campos de Lifo', 'Plátano', 5000, 0),
(7, 'Mapa: Campos de Lifo', 'Pera', 5000, 0),
(8, 'Mapa: Campos de Lifo', 'Tomate', 5000, 0),
(9, 'Mapa: Campos de Lifo', 'Lechuga', 5000, 0),
(10, 'Mapa: Campos de Lifo', 'Maiz', 5000, 0),
(11, 'Mapa: Campos de Lifo', 'Uvas', 1000, 0),
(12, 'Mapa: Campos de Lifo', 'Sandía', 500, 0),
(13, 'Mapa: Campos de Lifo', 'Remolacha', 1000, 0),
(14, 'Mapa: Campos de Lifo', 'Aceitunas', 500, 0),
(15, 'Mapa: Campos de Lifo', 'Calabaza', 500, 0),
(16, 'Mapa: Campos de Lifo', 'Planta de algodón', 1000, 0),
(17, 'Mapa: Campos de Lifo', 'Trigo', 2000, 0),
(18, 'Mapa: Campos de Lifo', 'Cebada', 2000, 0),
(19, 'Mapa: Bosques de Lifo', 'Mapa: Cueva de la plata', 700, 0),
(20, 'Mapa: Bosques de Lifo', 'Mapa: Gruta helada', 700, 0),
(23, 'Mapa: Bosques de Lifo', 'Ración de moras', 400, 0),
(24, 'Mapa: Bosques de Lifo', 'Ración de fresas', 400, 0),
(25, 'Mapa: Bosques de Lifo', 'Ración de cerezas', 400, 0),
(26, 'Mapa: Bosques de Lifo', 'Coco', 1000, 0),
(27, 'Mapa: Bosques de Lifo', 'Maiz', 3000, 0),
(28, 'Mapa: Bosques de Lifo', 'Uvas', 2000, 0),
(29, 'Mapa: Bosques de Lifo', 'Sandía', 1000, 0),
(30, 'Mapa: Bosques de Lifo', 'Remolacha', 3000, 0),
(31, 'Mapa: Bosques de Lifo', 'Aceitunas', 600, 0),
(32, 'Mapa: Bosques de Lifo', 'Calabaza', 600, 0),
(36, 'Mapa: Bosques de Lifo', 'Tronco de madera', 1000, 0),
(37, 'Mapa: Bosques de Lifo', 'Tablón de madera', 700, 0),
(38, 'Mapa: Bosques de Lifo', 'Tronco de madera sabia', 400, 0),
(39, 'Mapa: Bosques de Lifo', 'Esporas', 500, 0),
(40, 'Mapa: Bosques de Lifo', 'Hongo vudú', 500, 0),
(41, 'Mapa: Bosques de Lifo', 'Savia', 3000, 0),
(42, 'Mapa: Bosques de Lifo', 'Savia de madera sabia', 3000, 0),
(43, 'Mapa: Bosques de Lifo', 'Anillo de madera', 500, 0),
(44, 'Mapa: Gruta helada', 'Mapa: Laberinto de hielo', 500, 0),
(47, 'Mapa: Gruta helada', 'Pescado', 800, 0),
(530, 'Mapa: Gruta helada', 'Daga de cristal luminoso', 300, 0),
(533, 'Mapa: Mina de oro', 'Yelmo de oro', 500, 0),
(53, 'Mapa: Gruta helada', 'Yelmo de hielo', 1000, 0),
(54, 'Mapa: Gruta helada', 'Perneras de hielo', 500, 0),
(55, 'Mapa: Gruta helada', 'Coraza de hielo', 500, 0),
(56, 'Mapa: Gruta helada', 'Escudo de hielo', 1000, 0),
(58, 'Mapa: Gruta helada', 'Espada de hielo', 300, 0),
(59, 'Mapa: Laberinto de hielo', 'Mapa: Montaña helada', 400, 0),
(545, 'Mapa: Descenso profundo', 'Perneras encantadas', 400, 0),
(62, 'Mapa: Laberinto de hielo', 'Pescado', 1000, 0),
(541, 'Mapa: Laberinto de hielo', 'Botas de infantería', 300, 0),
(68, 'Mapa: Laberinto de hielo', 'Yelmo de hielo', 1000, 0),
(69, 'Mapa: Laberinto de hielo', 'Perneras de hielo', 600, 0),
(70, 'Mapa: Laberinto de hielo', 'Coraza de hielo', 600, 0),
(72, 'Mapa: Laberinto de hielo', 'Guadaña de hielo', 300, 0),
(73, 'Mapa: Laberinto de hielo', 'Espada de hielo', 300, 0),
(74, 'Mapa: Laberinto de hielo', 'Anillo de cobre', 300, 0),
(75, 'Mapa: Laberinto de hielo', 'Collar protector', 700, 0),
(76, 'Mapa: Laberinto de hielo', 'Daga celestial', 100, 0),
(77, 'Mapa: Laberinto de hielo', 'Daga de cristal luminoso', 300, 0),
(538, 'Mapa: Laberinto de hielo', 'Pescado grande', 800, 0),
(79, 'Mapa: Montaña helada', 'Mapa: Cordillera helada', 400, 0),
(553, 'Mapa: Montaña helada', 'Botas de infantería', 300, 0),
(82, 'Mapa: Montaña helada', 'Pescado', 1000, 0),
(555, 'Mapa: Montaña helada', 'Mandoble', 200, 0),
(554, 'Mapa: Montaña helada', 'Escudo de vampiro', 100, 0),
(88, 'Mapa: Montaña helada', 'Yelmo de hielo', 1000, 0),
(89, 'Mapa: Montaña helada', 'Perneras de hielo', 600, 0),
(90, 'Mapa: Montaña helada', 'Coraza de hielo', 600, 0),
(92, 'Mapa: Montaña helada', 'Guadaña de hielo', 300, 0),
(93, 'Mapa: Montaña helada', 'Espada de hielo', 300, 0),
(95, 'Mapa: Montaña helada', 'Collar protector', 700, 0),
(96, 'Mapa: Montaña helada', 'Daga celestial', 150, 0),
(97, 'Mapa: Montaña helada', 'Daga de cristal luminoso', 300, 0),
(568, 'Mapa: Inframundo', 'Yelmo etereo', 1000, 0),
(99, 'Mapa: Montaña helada', 'Anillo de cobre', 300, 0),
(101, 'Mapa: Montaña helada', 'Yelmo etereo', 1000, 0),
(550, 'Mapa: Montaña helada', 'Pescado grande', 900, 0),
(105, 'Mapa: Cordillera helada', 'Mapa: Cima nevada', 400, 0),
(107, 'Mapa: Cordillera helada', 'Mapa: Comarca', 500, 0),
(108, 'Mapa: Cordillera helada', 'Sal', 1000, 0),
(559, 'Mapa: Cordillera helada', 'Espada de hielo', 200, 0),
(566, 'Mapa: Inframundo', 'Daga de fuego mágico', 800, 0),
(556, 'Mapa: Cordillera helada', 'Trozo de ala de dragón', 700, 0),
(557, 'Mapa: Cordillera helada', 'Hacha celestial', 100, 0),
(116, 'Mapa: Cordillera helada', 'Daga celestial', 200, 0),
(117, 'Mapa: Cordillera helada', 'Daga de cristal luminoso', 300, 0),
(567, 'Mapa: Inframundo', 'Daga del averno', 200, 0),
(558, 'Mapa: Cordillera helada', 'Pescado grande', 1000, 0),
(120, 'Mapa: Cordillera helada', 'Tulipán', 500, 0),
(121, 'Mapa: Cordillera helada', 'Yelmo etereo', 1000, 0),
(122, 'Mapa: Cordillera helada', 'Escudo de batalla', 500, 0),
(123, 'Mapa: Cordillera helada', 'Mariposa de hielo', 400, 0),
(561, 'Mapa: Cordillera helada', 'Amuleto de la protección', 200, 0),
(560, 'Mapa: Cordillera helada', 'Amuleto de protección', 200, 0),
(128, 'Mapa: Cima nevada', 'Mapa: Escalera al cielo', 400, 0),
(607, 'Mapa: Cima nevada', 'Buho', 500, 0),
(604, 'Mapa: Cima nevada', 'Espada celestial', 200, 0),
(132, 'Mapa: Cima nevada', 'Daga celestial', 300, 0),
(610, 'Mapa: Cima nevada', 'Botas celestiales', 99, 0),
(609, 'Mapa: Cima nevada', 'Coraza de caballeria', 700, 0),
(603, 'Mapa: Cima nevada', 'Escudo celestial', 99, 0),
(615, 'Mapa: Cima nevada', 'Grimorio de la energía', 800, 0),
(627, 'Mapa: Cima nevada', 'Casco orco', 1000, 0),
(605, 'Mapa: Cima nevada', 'Casco sagrado', 200, 0),
(139, 'Mapa: Cima nevada', 'Mariposa de hielo', 500, 0),
(601, 'Mapa: Cima nevada', 'Anillo de oro', 99, 0),
(144, 'Mapa: Escalera al cielo', 'Mapa: Reino celestial', 400, 0),
(145, 'Mapa: Escalera al cielo', 'Mapa: Comarca', 400, 0),
(146, 'Mapa: Escalera al cielo', 'Martillo de guerra celestial', 99, 0),
(147, 'Mapa: Escalera al cielo', 'Espada celestial', 200, 0),
(149, 'Mapa: Escalera al cielo', 'Daga celestial', 400, 0),
(639, 'Mapa: Escalera al cielo', 'Coraza de escamas de dragón', 1000, 0),
(152, 'Mapa: Escalera al cielo', 'Coraza celestial', 99, 0),
(153, 'Mapa: Escalera al cielo', 'Perneras celestiales', 99, 0),
(640, 'Mapa: Escalera al cielo', 'Perneras de caparazón', 1000, 0),
(638, 'Mapa: Escalera al cielo', 'Coraza de caparazón', 1000, 0),
(156, 'Mapa: Reino celestial', 'Sagrada escritura', 500, 0),
(158, 'Mapa: Reino celestial', 'Trozo de mapa A', 1000, 0),
(159, 'Mapa: Reino celestial', 'Trozo de mapa B', 1000, 0),
(163, 'Mapa: Reino celestial', 'Trozo de mapa C', 1000, 0),
(168, 'Mapa: Reino celestial', 'Martillo de guerra celestial', 200, 0),
(169, 'Mapa: Reino celestial', 'Espada celestial', 200, 0),
(170, 'Mapa: Reino celestial', 'Hacha celestial', 200, 0),
(171, 'Mapa: Reino celestial', 'Daga celestial', 200, 0),
(172, 'Mapa: Reino celestial', 'Escudo celestial', 200, 0),
(173, 'Mapa: Reino celestial', 'Botas celestiales', 200, 0),
(174, 'Mapa: Reino celestial', 'Coraza celestial', 200, 0),
(175, 'Mapa: Reino celestial', 'Perneras celestiales', 200, 0),
(176, 'Mapa: Reino celestial', 'Yelmo celestial', 200, 0),
(177, 'Mapa: Reino celestial', 'Amuleto celestial', 200, 0),
(178, 'Mapa: Reino celestial', 'Esfera celestial', 200, 0),
(179, 'Mapa: Reino celestial', 'Agua bendita', 500, 0),
(180, 'Mapa: Reino celestial', 'Agua sagrada', 200, 0),
(181, 'Mapa: Reino celestial', 'Grimorio de alteración dimensional', 100, 0),
(182, 'Mapa: Reino celestial', 'Tomo de alteración dimensional aplicada', 100, 0),
(183, 'Mapa: Cueva de la plata', 'Mapa: Mina de oro', 500, 0),
(185, 'Mapa: Cueva de la plata', 'Hongo vudú', 1000, 0),
(186, 'Mapa: Cueva de la plata', 'Mineral de hierro', 1000, 0),
(523, 'Mapa: Cueva de la plata', 'Maza de oro', 500, 0),
(188, 'Mapa: Cueva de la plata', 'Hueso', 1000, 0),
(189, 'Mapa: Cueva de la plata', 'Calavera', 1000, 0),
(190, 'Mapa: Cueva de la plata', 'Carbón', 1000, 0),
(191, 'Mapa: Cueva de la plata', 'Espejo', 300, 0),
(193, 'Mapa: Mina de oro', 'Mapa: Descenso profundo', 400, 0),
(194, 'Mapa: Mina de oro', 'Mineral de hierro', 1000, 0),
(532, 'Mapa: Mina de oro', 'Perneras desmontables de oro', 500, 0),
(198, 'Mapa: Mina de oro', 'Carbón', 1000, 0),
(199, 'Mapa: Mina de oro', 'Mineral de oro', 400, 0),
(200, 'Mapa: Mina de oro', 'Mineral de mercurio', 800, 0),
(531, 'Mapa: Mina de oro', 'Coraza desmontable de oro', 500, 0),
(202, 'Mapa: Mina de oro', 'Champiñón mágico', 99, 0),
(203, 'Mapa: Mina de oro', 'Champiñón verde', 150, 0),
(204, 'Mapa: Mina de oro', 'Champiñón', 300, 0),
(206, 'Mapa: Descenso profundo', 'Mapa: Inframundo', 400, 0),
(543, 'Mapa: Descenso profundo', 'Perneras desmontables de oro', 600, 0),
(544, 'Mapa: Descenso profundo', 'Coraza encantada', 400, 0),
(542, 'Mapa: Descenso profundo', 'Coraza desmontable de oro', 600, 0),
(211, 'Mapa: Descenso profundo', 'Mineral de oro', 300, 0),
(212, 'Mapa: Descenso profundo', 'Mineral de mercurio', 300, 0),
(213, 'Mapa: Descenso profundo', 'Mercurio', 100, 0),
(214, 'Mapa: Descenso profundo', 'Champiñón mágico', 99, 0),
(215, 'Mapa: Descenso profundo', 'Champiñón verde', 150, 0),
(216, 'Mapa: Descenso profundo', 'Champiñón', 300, 0),
(217, 'Mapa: Inframundo', 'Mapa: Río de lava', 400, 0),
(218, 'Mapa: Inframundo', 'Grimorio del caos cerrado', 99, 0),
(219, 'Mapa: Inframundo', 'Llave del grimorio del caos', 99, 0),
(565, 'Mapa: Inframundo', 'Coraza de fuego mágico', 200, 0),
(222, 'Mapa: Inframundo', 'Hongo vudú', 1000, 0),
(563, 'Mapa: Inframundo', 'Cuervo', 200, 0),
(564, 'Mapa: Inframundo', 'Anillo de plata', 200, 0),
(226, 'Mapa: Inframundo', 'Hongo druida', 1000, 0),
(227, 'Mapa: Inframundo', 'Trozo de ala de dragón', 700, 0),
(228, 'Mapa: Río de lava', 'Mapa: Centro de volcán', 400, 0),
(585, 'Mapa: Río de lava', 'Botas de la oscuridad', 800, 0),
(231, 'Mapa: Río de lava', 'Trozo de ala de dragón', 1000, 0),
(232, 'Mapa: Río de lava', 'Oro líquido', 500, 0),
(582, 'Mapa: Río de lava', 'Llave del grimorio del caos', 99, 0),
(234, 'Mapa: Río de lava', 'Vial de eter', 1000, 0),
(235, 'Mapa: Río de lava', 'Onyx', 1000, 0),
(236, 'Mapa: Río de lava', 'Espada de fuego mágico', 300, 0),
(581, 'Mapa: Río de lava', 'Grimorio del caos cerrado', 99, 0),
(238, 'Mapa: Río de lava', 'Escudo de fuego mágico', 450, 0),
(240, 'Mapa: Río de lava', 'Perneras de fuego mágico', 400, 0),
(241, 'Mapa: Río de lava', 'Yelmo de fuego mágico', 450, 0),
(242, 'Mapa: Río de lava', 'Grimorio del fuego', 800, 0),
(244, 'Mapa: Centro de volcán', 'Mapa: Puertas del infierno', 400, 0),
(245, 'Mapa: Centro de volcán', 'Mapa: Templo subterráneo', 400, 0),
(247, 'Mapa: Centro de volcán', 'Coraza del averno', 99, 0),
(248, 'Mapa: Centro de volcán', 'Perneras del averno', 99, 0),
(635, 'Mapa: Inframundo', 'Perneras de la corona', 1000, 0),
(636, 'Mapa: Río de lava', 'Coraza de la corona', 1000, 0),
(251, 'Mapa: Centro de volcán', 'Martillo de guerra del averno', 99, 0),
(252, 'Mapa: Centro de volcán', 'Espada del averno', 200, 0),
(633, 'Mapa: Centro de volcán', 'Perneras de la corona', 1000, 0),
(254, 'Mapa: Centro de volcán', 'Daga del averno', 400, 0),
(634, 'Mapa: Centro de volcán', 'Coraza de la corona', 1000, 0),
(257, 'Mapa: Centro de volcán', 'Trozo de ala de dragón', 1000, 0),
(258, 'Mapa: Centro de volcán', 'Oro líquido', 500, 0),
(261, 'Mapa: Centro de volcán', 'Onyx', 1000, 0),
(262, 'Mapa: Centro de volcán', 'Espada de fuego mágico', 500, 0),
(263, 'Mapa: Centro de volcán', 'Daga de fuego mágico', 800, 0),
(637, 'Mapa: Centro de volcán', 'Coraza desmontable de oro', 1000, 0),
(266, 'Mapa: Centro de volcán', 'Perneras de fuego mágico', 500, 0),
(267, 'Mapa: Centro de volcán', 'Yelmo de fuego mágico', 500, 0),
(632, 'Mapa: Centro de volcán', 'Casco orco', 900, 0),
(269, 'Mapa: Puertas del infierno', 'Apocalipsis', 500, 0),
(271, 'Mapa: Puertas del infierno', 'Trozo de mapa F', 1000, 0),
(273, 'Mapa: Puertas del infierno', 'Trozo de mapa D', 1000, 0),
(274, 'Mapa: Puertas del infierno', 'Trozo de mapa E', 1000, 0),
(281, 'Mapa: Puertas del infierno', 'Botas del averno', 200, 0),
(282, 'Mapa: Puertas del infierno', 'Coraza del averno', 200, 0),
(283, 'Mapa: Puertas del infierno', 'Perneras del averno', 200, 0),
(284, 'Mapa: Puertas del infierno', 'Casco del averno', 200, 0),
(285, 'Mapa: Puertas del infierno', 'Amuleto del averno', 200, 0),
(286, 'Mapa: Puertas del infierno', 'Martillo de guerra del averno', 200, 0),
(287, 'Mapa: Puertas del infierno', 'Espada del averno', 200, 0),
(288, 'Mapa: Puertas del infierno', 'Hacha del averno', 200, 0),
(289, 'Mapa: Puertas del infierno', 'Daga del averno', 200, 0),
(290, 'Mapa: Puertas del infierno', 'Escudo del averno', 200, 0),
(291, 'Mapa: Puertas del infierno', 'Esfera del averno', 200, 0),
(292, 'Mapa: Puertas del infierno', 'Mariposa de fuego', 500, 0),
(293, 'Mapa: Puertas del infierno', 'Cristal de magia', 200, 0),
(294, 'Mapa: Puertas del infierno', 'Grimorio de alteración dimensional', 100, 0),
(295, 'Mapa: Puertas del infierno', 'Tomo de alteración dimensional aplicada', 100, 0),
(297, 'Mapa: Purgatorio', 'Tomo de la muerte', 200, 0),
(298, 'Mapa: Purgatorio', 'Tomo del control', 200, 0),
(299, 'Mapa: Purgatorio', 'Tomo del fuego', 200, 0),
(300, 'Mapa: Purgatorio', 'Mascara del pánico', 100, 0),
(301, 'Mapa: Purgatorio', 'Escudo de calaveras', 100, 0),
(302, 'Mapa: Purgatorio', 'Protector de almas', 100, 0),
(303, 'Mapa: Purgatorio', 'Polvo de estrellas', 100, 0),
(305, 'Mapa: Limbo', 'Tomo de la vida', 200, 0),
(306, 'Mapa: Limbo', 'Tomo del tiempo', 200, 0),
(307, 'Mapa: Limbo', 'Tomo del hielo', 200, 0),
(308, 'Mapa: Limbo', 'Estrella Polar', 100, 0),
(309, 'Mapa: Limbo', 'Anillo encantado', 100, 0),
(310, 'Mapa: Limbo', 'Puñal de cristal de alma', 100, 0),
(311, 'Mapa: Limbo', 'Polvo de estrellas', 100, 0),
(314, 'Mapa: Comarca', 'Mapa: Biblioteca', 400, 0),
(315, 'Mapa: Comarca', 'Mapa: Torre del mago', 400, 0),
(588, 'Mapa: Comarca', 'Solomillo', 300, 0),
(596, 'Mapa: Comarca', 'Champiñón', 200, 0),
(589, 'Mapa: Comarca', 'Bizcocho', 500, 0),
(587, 'Mapa: Comarca', 'Mate', 1000, 0),
(325, 'Mapa: Comarca', 'Sandía', 900, 0),
(590, 'Mapa: Comarca', 'Empanada', 500, 0),
(327, 'Mapa: Comarca', 'Aceitunas', 1000, 0),
(328, 'Mapa: Comarca', 'Calabaza', 1000, 0),
(598, 'Mapa: Comarca', 'Filete de dragón', 5, 0),
(597, 'Mapa: Comarca', 'Champiñón verde', 150, 0),
(599, 'Mapa: Comarca', 'Pulpo', 1000, 0),
(332, 'Mapa: Comarca', 'Coco', 900, 0),
(333, 'Mapa: Comarca', 'Ración de moras', 400, 0),
(334, 'Mapa: Comarca', 'Ración de fresas', 400, 0),
(335, 'Mapa: Comarca', 'Ración de cerezas', 600, 0),
(337, 'Mapa: Biblioteca', 'Mapa: Torre del mago', 300, 0),
(344, 'Mapa: Biblioteca', 'Pergamino de encantamiento de cayados', 50, 0),
(404, 'Mapa: Torre del mago', 'Mapa: Mazmorra', 500, 0),
(405, 'Mapa: Torre del mago', 'Mapa: Biblioteca', 300, 0),
(406, 'Mapa: Torre del mago', 'Cayado', 500, 0),
(407, 'Mapa: Torre del mago', 'Símbolo', 500, 0),
(408, 'Mapa: Torre del mago', 'Símbolo de oro', 500, 0),
(409, 'Mapa: Torre del mago', 'Agua bendita', 500, 0),
(410, 'Mapa: Torre del mago', 'Agua sagrada', 500, 0),
(411, 'Mapa: Torre del mago', 'Símbolo sagrado', 500, 0),
(412, 'Mapa: Torre del mago', 'Lámpara', 500, 0),
(413, 'Mapa: Torre del mago', 'Rosa roja', 500, 0),
(414, 'Mapa: Torre del mago', 'Planta curativa', 500, 0),
(415, 'Mapa: Torre del mago', 'Jarrón decorado', 500, 0),
(416, 'Mapa: Torre del mago', 'Fruto tropical', 500, 0),
(417, 'Mapa: Torre del mago', 'Corona', 500, 0),
(418, 'Mapa: Torre del mago', 'Cristal de magia', 200, 0),
(419, 'Mapa: Torre del mago', 'Esfera de cristal', 500, 0),
(420, 'Mapa: Torre del mago', 'Polvo de estrellas', 500, 0),
(421, 'Mapa: Torre del mago', 'Piedra decorada', 500, 0),
(422, 'Mapa: Torre del mago', 'Materia orgánica', 500, 0),
(423, 'Mapa: Torre del mago', 'Espejo', 500, 0),
(424, 'Mapa: Torre del mago', 'Espejo sabio', 500, 0),
(425, 'Mapa: Torre del mago', 'Aguja', 500, 0),
(426, 'Mapa: Torre del mago', 'Esporas', 500, 0),
(427, 'Mapa: Torre del mago', 'Hongo vudú', 500, 0),
(428, 'Mapa: Torre del mago', 'Pinturas', 500, 0),
(429, 'Mapa: Torre del mago', 'Muñeco', 500, 0),
(430, 'Mapa: Torre del mago', 'Venda', 500, 0),
(431, 'Mapa: Torre del mago', 'Polvo del caos', 500, 0),
(432, 'Mapa: Torre del mago', 'Polvo del fuego', 500, 0),
(433, 'Mapa: Torre del mago', 'Polvo de la energía', 500, 0),
(434, 'Mapa: Torre del mago', 'Polvo del hielo', 500, 0),
(435, 'Mapa: Torre del mago', 'Polvo del tiempo', 500, 0),
(436, 'Mapa: Torre del mago', 'Polvo de la vida', 500, 0),
(438, 'Mapa: Mazmorra', 'Mapa: Templo subterráneo', 300, 0),
(439, 'Mapa: Mazmorra', 'Hueso', 500, 0),
(440, 'Mapa: Mazmorra', 'Calavera', 500, 0),
(441, 'Mapa: Mazmorra', 'Lingote de hierro', 500, 0),
(442, 'Mapa: Mazmorra', 'Tomo de la nigromancia', 100, 0),
(443, 'Mapa: Templo subterraneo', 'Mapa: Cueva submarina', 1000, 0),
(444, 'Mapa: Templo subterraneo', 'Mapa: Cueva submarina', 300, 0),
(445, 'Mapa: Templo subterraneo', 'Pergamino de encantamiento de cayados', 500, 0),
(446, 'Mapa: Templo subterraneo', 'Símbolo', 3000, 0),
(447, 'Mapa: Templo subterraneo', 'Símbolo de oro', 2000, 0),
(448, 'Mapa: Templo subterraneo', 'Agua bendita', 2000, 0),
(449, 'Mapa: Templo subterraneo', 'Agua sagrada', 2000, 0),
(450, 'Mapa: Templo subterraneo', 'Símbolo sagrado', 2000, 0),
(451, 'Mapa: Templo subterraneo', 'Tomo de la clerecía', 100, 0),
(453, 'Mapa: Cueva submarina', 'Mapa: Mares de Lifo', 300, 0),
(454, 'Mapa: Cueva submarina', 'Mineral de hierro', 1000, 0),
(455, 'Mapa: Cueva submarina', 'Minerales variados', 2000, 0),
(456, 'Mapa: Cueva submarina', 'Carbón', 1000, 0),
(457, 'Mapa: Cueva submarina', 'Mineral de oro', 1000, 0),
(458, 'Mapa: Cueva submarina', 'Mineral de mercurio', 1000, 0),
(460, 'Mapa: Mares de Lifo', 'Mapa: Artefacto náutico', 300, 0),
(461, 'Mapa: Mares de Lifo', 'Filete de salmón', 500, 0),
(462, 'Mapa: Mares de Lifo', 'Pescado', 1200, 0),
(463, 'Mapa: Mares de Lifo', 'Pescado grande', 1000, 0),
(465, 'Mapa: Artefacto náutico', 'Mapa: Ciudad acuática', 300, 0),
(466, 'Mapa: Artefacto náutico', 'Globo de Lifo', 500, 0),
(468, 'Mapa: Ciudad acuática', 'Mapa: Portal', 300, 0),
(469, 'Mapa: Ciudad acuática', 'Tomo de instrumentación mágica', 400, 0),
(470, 'Mapa: Ciudad acuática', 'Pócima de agua de la justicia', 1000, 0),
(471, 'Mapa: Ciudad acuática', 'Vial de agua de la justicia', 1000, 0),
(472, 'Mapa: Ciudad acuática', 'Frasco de agua de la justicia', 4000, 0),
(473, 'Mapa: Ciudad acuática', 'Vial de agua de los deseos', 1000, 0),
(474, 'Mapa: Ciudad acuática', 'Frasco de agua de los deseos', 1000, 0),
(475, 'Mapa: Ciudad acuática', 'Pócima de agua de los deseos', 1000, 0),
(476, 'Mapa: Portal', 'Mapa: Luna Aio', 500, 0),
(477, 'Mapa: Portal', 'Mapa: Luna Phobos', 500, 0),
(478, 'Mapa: Portal', 'Mapa: Luna Dremek', 500, 0),
(479, 'Mapa: Portal', 'Mapa: Planeta Aeron', 500, 0),
(480, 'Mapa: Portal', 'Mapa: Luna Aio', 300, 0),
(481, 'Mapa: Portal', 'Mapa: Luna Phobos', 300, 0),
(482, 'Mapa: Portal', 'Mapa: Luna Dremek', 300, 0),
(483, 'Mapa: Portal', 'Mapa: Planeta Aeron', 300, 0),
(484, 'Mapa: Luna Aio', 'Estrella Polar', 500, 0),
(485, 'Mapa: Luna Aio', 'Estrella Polar', 100, 0),
(486, 'Mapa: Luna Phobos', 'Estrella Polar', 500, 0),
(487, 'Mapa: Luna Phobos', 'Estrella Polar', 100, 0),
(488, 'Mapa: Luna Dremek', 'Estrella Polar', 1000, 0),
(489, 'Mapa: Luna Dremek', 'Estrella Polar', 500, 0),
(490, 'Mapa: Luna Dremek', 'Estrella Polar', 100, 0),
(491, 'Mapa: Planeta Aeron', 'Oculo', 100, 0),
(493, 'Mapa: Cementerio', 'Esencia mágica', 500, 0),
(494, 'Mapa: Cementerio', 'Hueso rojo dulce', 500, 0),
(495, 'Mapa: Cementerio', 'Hueso', 500, 0),
(496, 'Mapa: Cementerio', 'Calabaza', 500, 0),
(497, 'Mapa: Cementerio', 'Mapa: Catacumbas', 500, 0),
(498, 'Mapa: Cementerio', 'Mapa: Catacumbas', 500, 0),
(499, 'Mapa: Catacumbas', 'Esencia mágica', 500, 0),
(500, 'Mapa: Catacumbas', 'Arma desconocida de amazona', 500, 0),
(501, 'Mapa: Catacumbas', 'Extraño utensilio inutilizable', 500, 0),
(502, 'Mapa: Cementerio', 'Collar de la suerte', 500, 0),
(503, 'Mapa: Cementerio', 'Planta curativa', 500, 0),
(504, 'Mapa: Catacumbas', 'Carne podrida', 500, 0),
(505, 'Mapa: Catacumbas', 'Mapa: Necrópolis', 500, 0),
(506, 'Mapa: Catacumbas', 'Mapa: Necrópolis', 500, 0),
(507, 'Mapa: Necrópolis', 'Símbolo sagrado', 500, 0),
(508, 'Mapa: Necrópolis', 'Esencia mágica', 500, 0),
(509, 'Mapa: Necrópolis', 'Hueso', 500, 0),
(510, 'Mapa: Necrópolis', 'Frasco de onyx líquido', 500, 0),
(511, 'Mapa: Catacumbas', 'Vial de onyx líquido', 500, 0),
(512, 'Mapa: Catacumbas', 'Polvo de estrellas', 500, 0),
(513, 'Mapa: Necrópolis', 'Polvo de estrellas', 500, 0),
(514, 'Mapa: Necrópolis', 'Lámpara', 500, 0),
(515, 'Mapa: Necrópolis', 'Corona', 500, 0),
(519, 'Mapa: Biblioteca', 'Violín de Oscar', 10, 0),
(524, 'Mapa: Cueva de la plata', 'Daga de oro', 500, 0),
(534, 'Mapa: Mina de oro', 'Botas de oro', 300, 0),
(535, 'Mapa: Mina de oro', 'Martillo de guerra', 400, 0),
(548, 'Mapa: Descenso profundo', 'Mandoble', 200, 0),
(549, 'Mapa: Descenso profundo', 'Botas de oro', 300, 0),
(621, 'Mapa: Inframundo', 'Coraza encantada', 800, 0),
(570, 'Mapa: Bosques de Lifo', 'Pollo sultan', 15, 1),
(571, 'Mapa: Bosques de Lifo', 'Pollo festivo', 10, 1),
(572, 'Mapa: Campos de Lifo', 'Pollo aficionado', 20, 1),
(573, 'Mapa: Cueva de la plata', 'Pollo cielo', 15, 1),
(574, 'Mapa: Gruta helada', 'Pollo moderno', 20, 1),
(575, 'Mapa: Mina de oro', 'Pollo arcoiris', 15, 1),
(576, 'Mapa: Laberinto de hielo', 'Pollo binario', 15, 1),
(577, 'Mapa: Descenso profundo', 'Pollo demoniaco', 10, 1),
(578, 'Mapa: Montaña helada', 'Pollo masculino', 15, 1),
(579, 'Mapa: Descenso profundo', 'Pollo valiente', 20, 1),
(580, 'Mapa: Laberinto de hielo', 'Pollo nocturno', 15, 1),
(584, 'Mapa: Río de lava', 'Botas del averno', 99, 0),
(586, 'Mapa: Río de lava', 'Escudo espectral', 800, 0),
(594, 'Mapa: Comarca', 'Racion de gambas', 10, 0),
(595, 'Mapa: Comarca', 'Champiñón mágico', 100, 0),
(600, 'Mapa: Comarca', 'Conejo', 100, 0),
(611, 'Mapa: Cima nevada', 'Perneras de la oscuridad', 500, 0),
(612, 'Mapa: Cima nevada', 'Martillo runico', 500, 0),
(614, 'Mapa: Cima nevada', 'Roca de los deseos', 1000, 0),
(617, 'Mapa: Cordillera helada', 'Coraza de hielo', 1000, 0),
(618, 'Mapa: Cordillera helada', 'Perneras de hielo', 1000, 0),
(619, 'Mapa: Cordillera helada', 'Guadaña', 800, 0),
(620, 'Mapa: Inframundo', 'Perneras encantadas', 800, 0),
(622, 'Mapa: Inframundo', 'Coraza desmontable de oro', 1000, 0),
(623, 'Mapa: Inframundo', 'Mandoble', 600, 0),
(624, 'Mapa: Río de lava', 'Perneras desmontables de oro', 1000, 0),
(625, 'Mapa: Río de lava', 'Coraza encantada', 800, 0),
(626, 'Mapa: Río de lava', 'Escudo del oraculo', 800, 0),
(628, 'Mapa: Cima nevada', 'Espada extraña', 800, 0),
(630, 'Mapa: Cima nevada', 'Perneras de hielo', 1000, 0),
(631, 'Mapa: Cima nevada', 'Coraza de hielo', 1000, 0),
(641, 'Mapa: Escalera al cielo', 'Roca de los deseos', 1000, 0),
(642, 'Mapa: Escalera al cielo', 'Yelmo espectral', 800, 0),
(643, 'Mapa: Escalera al cielo', 'Espada de la gárgola', 500, 0),
(647, 'Mapa: Escalera al cielo', 'Casco vikingo', 500, 0),
(646, 'Mapa: Escalera al cielo', 'Perneras de la oscuridad', 500, 0),
(648, 'Mapa: Escalera al cielo', 'Daga ceremonial', 500, 0),
(649, 'Mapa: Reino celestial', 'Esencia mágica', 200, 0),
(650, 'Mapa: Torre del mago', 'Esencia mágica', 200, 0),
(651, 'Biblioteca', 'Esencia mágica', 200, 0),
(652, 'Mapa: Biblioteca', 'Esencia mágica', 300, 0),
(653, 'Mapa: Biblioteca', 'Cristal de magia', 300, 0),
(654, 'Mapa: Cordillera helada', 'Grimorio de la luz cerrado', 99, 0),
(655, 'Mapa: Cordillera helada', 'Llave del Grimorio de la luz', 99, 0),
(656, 'Mapa: Cima nevada', 'Grimorio de la luz cerrado', 99, 0),
(657, 'Mapa: Cima nevada', 'Llave del Grimorio de la luz', 99, 0),
(658, 'Mapa: Luna Aio', 'Esfera de jade', 100, 0),
(659, 'Mapa: Luna Dremek', 'Esfera carmesí', 100, 0),
(660, 'Mapa: Luna Phobos', 'Esfera añil', 100, 0),
(661, 'Mapa: Planeta Aeron', 'Esfera de almas', 500, 0),
(662, 'Mapa: Planeta Aeron', 'Grimorio de otro mundo cerrado', 100, 0),
(665, 'Mapa: Torre del mago', 'Sextante de Altorias', 1, 1),
(667, 'Mapa: Templo subterráneo', 'Mitad derecha obsidiana', 500, 1),
(668, 'Mapa: Cima nevada', 'Corazón de la montaña', 100, 1),
(670, 'Mapa: Campos de Lifo', 'Diario de Eldron I', 200, 0),
(671, 'Mapa: Bosques de Lifo', 'Diario de Eldron II', 200, 0),
(672, 'Mapa: Campos de Lifo', 'Cartel del vendedor ambulante', 200, 0),
(673, 'Mapa: Gruta helada', 'Cartel del vendedor ambulante', 200, 0),
(674, 'Mapa: Cueva de la plata', 'Cartel del vendedor ambulante', 200, 0),
(675, 'Mapa: Comarca', 'Cartel del vendedor ambulante', 200, 0),
(676, 'Mapa: Bosques de Lifo', 'Carta a Melissa', 200, 0),
(677, 'Mapa: Comarca', 'Carta a Melissa', 200, 0),
(678, 'Mapa: Mina de oro', 'Historia de las Eras VOL I', 500, 0),
(679, 'Mapa: Laberinto de hielo', 'Historia de las Eras VOL II', 500, 0),
(680, 'Mapa: Descenso profundo', 'Historia de las Eras VOL III', 500, 0),
(681, 'Mapa: Montaña helada', 'Historia de las Eras VOL IV', 500, 0),
(682, 'Mapa: Cordillera helada', 'Historia de las Eras VOL V', 500, 0),
(683, 'Mapa: Descenso profundo', 'Halcón de fuego', 200, 0),
(684, 'Mapa: Montaña helada', 'Golem de piedra', 200, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `explorado`
--

CREATE TABLE `explorado` (
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mapa` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flood`
--

CREATE TABLE `flood` (
  `evento` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actor` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo` int(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forohebras`
--

CREATE TABLE `forohebras` (
  `id` int(14) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `hora` int(14) NOT NULL,
  `fijada` int(1) NOT NULL DEFAULT 0,
  `cerrada` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foromensajes`
--

CREATE TABLE `foromensajes` (
  `idmensaje` int(14) NOT NULL,
  `idhebra` int(14) DEFAULT NULL,
  `idmres` int(14) DEFAULT NULL,
  `pag` int(14) DEFAULT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hora` int(14) NOT NULL,
  `texto` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganadores`
--

CREATE TABLE `ganadores` (
  `id` int(11) NOT NULL,
  `nombrejug` varchar(30) NOT NULL,
  `premio` int(11) NOT NULL,
  `obtenido` int(14) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id` int(11) NOT NULL,
  `resultado` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`id`, `resultado`, `nombreobj`, `cantidad`) VALUES
(1, 'Hechizo: Ayudante de huesos', 'Hueso', 1),
(2, 'Hechizo: Ayudante de huesos', 'Polvo de la vida', 1),
(3, 'Hechizo: Ayudante putrefacto', 'Hueso', 1),
(4, 'Hechizo: Ayudante putrefacto', 'Polvo del caos', 1),
(5, 'Hechizo: Ayudante putrefacto', 'Esporas', 1),
(6, 'Hechizo: Calavera voladora', 'Calavera', 1),
(7, 'Hechizo: Calavera voladora', 'Aguja de oro', 34),
(8, 'Hechizo: Esqueleto veloz', 'Calavera', 1),
(9, 'Hechizo: Esqueleto veloz', 'Hueso', 3),
(10, 'Hechizo: Esqueleto veloz', 'Clavo de oro', 15),
(11, 'Hechizo: Monstruosidad', 'Calavera', 1),
(12, 'Hechizo: Monstruosidad', 'Savia de madera sabia', 1),
(13, 'Hechizo: Monstruosidad', 'Polvo del caos', 1),
(14, 'Hechizo: Monstruosidad', 'Hongo druida', 1),
(15, 'Agua bendita', 'Jarra de agua', 1),
(16, 'Agua sagrada', 'Agua bendita', 1),
(17, 'Agua sagrada', 'Aguja de oro', 14),
(18, 'Hechizo: Bendición', 'Agua bendita', 1),
(19, 'Hechizo: Soplo divino', 'Agua bendita', 1),
(20, 'Hechizo: Aura divina', 'Agua sagrada', 1),
(21, 'Hechizo: Coraje divino', 'Símbolo', 1),
(22, 'Hechizo: Coraje divino', 'Agua bendita', 1),
(23, 'Hechizo: Invocación divina', 'Símbolo de oro', 1),
(24, 'Hechizo: Invocación divina', 'Agua sagrada', 1),
(25, 'Esfera del averno', 'Martillo de guerra del averno', 1),
(26, 'Esfera del averno', 'Espada del averno', 1),
(27, 'Esfera del averno', 'Hacha del averno', 1),
(28, 'Esfera del averno', 'Daga del averno', 1),
(29, 'Esfera del averno', 'Escudo del averno', 1),
(30, 'Esfera del averno', 'Botas del averno', 1),
(31, 'Esfera del averno', 'Coraza del averno', 1),
(32, 'Esfera del averno', 'Perneras del averno', 1),
(33, 'Esfera del averno', 'Casco del averno', 1),
(34, 'Esfera del averno', 'Amuleto del averno', 1),
(35, 'Esfera celestial', 'Martillo de guerra celestial', 1),
(36, 'Esfera celestial', 'Espada celestial', 1),
(37, 'Esfera celestial', 'Hacha celestial', 1),
(38, 'Esfera celestial', 'Daga celestial', 1),
(39, 'Esfera celestial', 'Escudo celestial', 1),
(40, 'Esfera celestial', 'Botas celestiales', 1),
(41, 'Esfera celestial', 'Coraza celestial', 1),
(42, 'Esfera celestial', 'Perneras celestiales', 1),
(43, 'Esfera celestial', 'Yelmo celestial', 1),
(44, 'Esfera celestial', 'Amuleto celestial', 1),
(45, 'Arma adimensional', 'Caja de portal dimensional', 1),
(46, 'Arma adimensional', 'Esfera del averno', 1),
(47, 'Arma adimensional', 'Esfera celestial', 1),
(48, 'Arma adimensional', 'Espada suprema', 1),
(49, 'Escudo adimensional', 'Caja de portal dimensional', 1),
(50, 'Escudo adimensional', 'Esfera del averno', 1),
(51, 'Escudo adimensional', 'Esfera celestial', 1),
(52, 'Escudo adimensional', 'Escudo maldito', 1),
(53, 'Yelmo adimensional', 'Caja de portal dimensional', 1),
(54, 'Yelmo adimensional', 'Esfera del averno', 1),
(55, 'Yelmo adimensional', 'Esfera celestial', 1),
(56, 'Yelmo adimensional', 'Yelmo maldito', 1),
(57, 'Coraza adimensional', 'Caja de portal dimensional', 1),
(58, 'Coraza adimensional', 'Esfera del averno', 1),
(59, 'Coraza adimensional', 'Esfera celestial', 1),
(60, 'Coraza adimensional', 'Coraza mitológica real', 1),
(61, 'Botas adimensionales', 'Caja de portal dimensional', 1),
(62, 'Botas adimensionales', 'Esfera del averno', 1),
(63, 'Botas adimensionales', 'Esfera celestial', 1),
(64, 'Botas adimensionales', 'Botas aladas', 1),
(65, 'Amuleto adimensional', 'Caja de portal dimensional', 1),
(66, 'Amuleto adimensional', 'Esfera del averno', 1),
(67, 'Amuleto adimensional', 'Esfera celestial', 1),
(68, 'Amuleto adimensional', 'Amuleto supremo', 1),
(69, 'Perneras adimensionales', 'Caja de portal dimensional', 1),
(70, 'Perneras adimensionales', 'Esfera del averno', 1),
(71, 'Perneras adimensionales', 'Esfera celestial', 1),
(72, 'Perneras adimensionales', 'Perneras reales', 1),
(73, 'Escudo pegajoso', 'Escudo de madera', 1),
(74, 'Escudo pegajoso', 'Pegamento', 1),
(75, 'Escudo pegajoso permanente', 'Escudo de madera', 1),
(76, 'Escudo pegajoso permanente', 'Pegamento', 1),
(77, 'Escudo pegajoso permanente', 'Vial de eter', 1),
(78, 'Escudo lanzaclavos', 'Escudo de madera', 1),
(79, 'Escudo lanzaclavos', 'Clavo', 30),
(80, 'Escudo lanzaagujas', 'Escudo de madera', 1),
(81, 'Escudo lanzaagujas', 'Aguja', 80),
(97, 'Lanzaclavos', 'Tablón de madera', 2),
(98, 'Lanzaclavos', 'Herramientas de forja avanzada', 1),
(99, 'Lanzaclavos', 'Clavo', 25),
(100, 'Ballesta', 'Tablón de madera', 2),
(101, 'Ballesta', 'Herramientas de forja avanzada', 2),
(102, 'Ballesta', 'Tronco de madera', 6),
(103, 'Ballesta sabia', 'Tablón de madera sabia', 2),
(104, 'Ballesta sabia', 'Herramientas de forja avanzada', 2),
(105, 'Ballesta sabia', 'Tronco de madera', 6),
(106, 'Ballesta de energía', 'Tablón de madera sabia', 4),
(107, 'Ballesta de energía', 'Lingote de oro', 2),
(108, 'Ballesta de energía', 'Herramientas de forja avanzada', 4),
(109, 'Ballesta de energía', 'Cristal de invocación del poder', 4),
(110, 'Ballesta de energía', 'Cetro encantado', 1),
(111, 'Algodón', 'Planta de algodón', 2),
(112, 'Muñeco', 'Algodón', 3),
(113, 'Venda', 'Algodón', 2),
(114, 'Estatuilla de madera', 'Tronco de madera', 1),
(115, 'Estatuilla de madera sabia', 'Tronco de madera sabia', 1),
(116, 'Hongo vudú', 'Hongo vudú', 1),
(117, 'Esporas', 'Hongo vudú', 1),
(118, 'Hechizo: Herida vudú', 'Muñeco', 1),
(119, 'Hechizo: Herida vudú', 'Cuchillo de carnicero', 1),
(120, 'Hechizo: Herida vudú', 'Hongo vudú', 1),
(121, 'Hechizo: Control vudú', 'Muñeco', 1),
(122, 'Hechizo: Control vudú', 'Aguja', 10),
(123, 'Hechizo: Control vudú', 'Hongo vudú', 1),
(124, 'Hechizo: Ceguera vudú', 'Estatuilla de madera', 1),
(125, 'Hechizo: Ceguera vudú', 'Venda', 1),
(126, 'Hechizo: Ceguera vudú', 'Hongo vudú', 1),
(127, 'Hechizo: Confusión vudú', 'Estatuilla de madera', 1),
(128, 'Hechizo: Confusión vudú', 'Jarra de cerveza', 1),
(129, 'Hechizo: Confusión vudú', 'Hongo vudú', 1),
(130, 'Hechizo: Devastación vudú', 'Estatuilla de madera sabia', 1),
(131, 'Hechizo: Devastación vudú', 'Cuchillo de carnicero', 1),
(132, 'Hechizo: Devastación vudú', 'Hongo vudú', 1),
(133, 'Espejo', 'Hierro líquido', 1),
(134, 'Espejo', 'Tablón de madera', 1),
(135, 'Espejo', 'Mercurio', 1),
(136, 'Espejo sabio', 'Hierro líquido', 1),
(137, 'Espejo sabio', 'Tablón de madera sabia', 1),
(138, 'Espejo sabio', 'Mercurio', 1),
(139, 'Hechizo: Invocación fantasmal', 'Espejo', 1),
(140, 'Hechizo: Invocación fantasmal', 'Pinturas', 1),
(141, 'Hechizo: Invocación fantasmal', 'Esporas', 1),
(142, 'Hechizo: Invocación fantasmal', 'Polvo de la vida', 1),
(143, 'Hechizo: Reflejo fantasmal', 'Espejo', 1),
(144, 'Hechizo: Reflejo fantasmal', 'Esporas', 1),
(145, 'Hechizo: Reflejo fantasmal', 'Harina', 1),
(146, 'Hechizo: Lanzador de clavos fantasmal', 'Espejo', 1),
(147, 'Hechizo: Lanzador de clavos fantasmal', 'Clavo', 15),
(148, 'Hechizo: Lanzador de clavos fantasmal', 'Tronco de madera', 1),
(149, 'Hechizo: Materialización fantasmal', 'Espejo sabio', 1),
(150, 'Hechizo: Materialización fantasmal', 'Savia', 1),
(151, 'Hechizo: Materialización fantasmal', 'Jarra de agua', 1),
(152, 'Hechizo: Horda fantasmal', 'Espejo sabio', 1),
(153, 'Hechizo: Horda fantasmal', 'Sable', 10),
(154, 'Aguja', 'Lingote de hierro', 1),
(155, 'Clavo', 'Lingote de hierro', 1),
(156, 'Aguja de oro', 'Lingote de oro', 1),
(157, 'Clavo de oro', 'Lingote de oro', 1),
(158, 'Herramientas de forja avanzada', 'Lingote de hierro', 2),
(159, 'Tablón de madera', 'Tronco de madera', 1),
(160, 'Savia', 'Tronco de madera', 1),
(161, 'Tablón de madera sabia', 'Tronco de madera sabia', 1),
(162, 'Savia de madera sabia', 'Tronco de madera sabia', 1),
(163, 'Pegamento', 'Vial de eter', 1),
(164, 'Pegamento', 'Savia', 1),
(165, 'Pinturas', 'Minerales variados', 1),
(166, 'Hierro líquido', 'Mineral de hierro', 1),
(167, 'Mercurio', 'Mineral de mercurio', 1),
(168, 'Oro líquido', 'Mineral de oro', 1),
(169, 'Lingote de hierro', 'Hierro líquido', 1),
(170, 'Lingote de hierro', 'Vial de eter', 1),
(171, 'Vial de eter', 'Minerales variados', 3),
(172, 'Lingote de oro', 'Oro líquido', 1),
(173, 'Lingote de oro', 'Vial de eter', 1),
(174, 'Vial de onyx líquido', 'Onyx', 1),
(175, 'Vial de onyx líquido', 'Hongo druida', 1),
(176, 'Frasco de onyx líquido', 'Onyx', 2),
(177, 'Frasco de onyx líquido', 'Hongo druida', 1),
(178, 'Pócima de onyx líquido', 'Onyx', 3),
(179, 'Pócima de onyx líquido', 'Hongo druida', 1),
(180, 'Vial de agua de los deseos', 'Roca de los deseos', 1),
(181, 'Vial de agua de los deseos', 'Hongo druida', 1),
(182, 'Frasco de agua de los deseos', 'Roca de los deseos', 2),
(183, 'Frasco de agua de los deseos', 'Hongo druida', 1),
(184, 'Pócima de agua de los deseos', 'Roca de los deseos', 3),
(185, 'Pócima de agua de los deseos', 'Hongo druida', 1),
(186, 'Vial de polen de hidra', 'Trozo de flor de hidra', 1),
(187, 'Vial de polen de hidra', 'Hongo druida', 1),
(188, 'Frasco de polen de hidra', 'Trozo de flor de hidra', 2),
(189, 'Frasco de polen de hidra', 'Hongo druida', 1),
(190, 'Pócima de polen de hidra', 'Trozo de flor de hidra', 3),
(191, 'Pócima de polen de hidra', 'Hongo druida', 1),
(192, 'Vial de sangre de dragón', 'Trozo de ala de dragón', 1),
(193, 'Vial de sangre de dragón', 'Hongo druida', 1),
(194, 'Frasco de sangre de dragón', 'Trozo de ala de dragón', 2),
(195, 'Frasco de sangre de dragón', 'Hongo druida', 1),
(196, 'Pócima de sangre de dragón', 'Trozo de ala de dragón', 3),
(197, 'Pócima de sangre de dragón', 'Hongo druida', 1),
(198, 'Cristal de invocación del poder', 'Cristal de invocación', 1),
(199, 'Pergamino en blanco del poder', 'Pergamino en blanco', 1),
(200, 'Menú completo', 'Sopa de pollo y huevo', 1),
(201, 'Menú completo', 'Ensalada', 1),
(202, 'Menú completo', 'Hamburguesa', 1),
(203, 'Menú completo', 'Jarra de bebida energética', 1),
(204, 'Menú completo', 'Yogur de frutas', 1),
(205, 'Preparado casero de fuerza', 'Jarra de zumo de zanahoria', 1),
(206, 'Preparado casero de fuerza', 'Huevo cocido', 5),
(207, 'Preparado casero de agilidad', 'Zanahoria', 5),
(208, 'Preparado casero de agilidad', 'Jarra de zumo de plátano', 5),
(209, 'Hongo druida', 'Hongo druida', 1),
(210, 'Ensalada', 'Lechuga', 1),
(211, 'Ensalada', 'Tomate', 1),
(212, 'Ensalada', 'Frasco de aceite', 1),
(213, 'Ensalada', 'Frasco de vinagre', 1),
(214, 'Ensalada', 'Sal', 1),
(215, 'Hamburguesa', 'Lechuga', 1),
(216, 'Hamburguesa', 'Tomate', 1),
(217, 'Hamburguesa', 'Barra de pan', 1),
(218, 'Hamburguesa', 'Solomillo', 1),
(219, 'Jarra de bebida energética', 'Jarra de batido de fresa', 1),
(220, 'Jarra de bebida energética', 'Jarra de zumo de naranja', 1),
(221, 'Jarra de bebida energética', 'Jarra de zumo de plátano', 1),
(222, 'Jarra de bebida energética', 'Jarra de zumo de manzana', 1),
(223, 'Jarra de bebida energética', 'Jarra de zumo de moras', 1),
(224, 'Jarra de bebida energética', 'Jarra de vino', 1),
(225, 'Yogur de frutas', 'Yogur', 2),
(226, 'Yogur de frutas', 'Jarra de bebida energética', 1),
(227, 'Sopa de pollo y huevo', 'Sopa', 1),
(228, 'Sopa de pollo y huevo', 'Muslo de pollo', 1),
(229, 'Sopa de pollo y huevo', 'Huevo cocido', 1),
(230, 'Jarra de cerveza', 'Jarra de mosto de cebada', 1),
(231, 'Jarra de cerveza', 'Polvo del tiempo', 1),
(232, 'Palomitas de maiz', 'Maiz', 1),
(233, 'Palomitas de maiz', 'Sal', 1),
(234, 'Palomitas de maiz', 'Mantequilla', 1),
(235, 'Palomitas de maiz', 'Polvo del fuego', 1),
(236, 'Yogur', 'Jarra de leche', 1),
(237, 'Yogur', 'Levadura', 1),
(238, 'Yogur', 'Polvo del tiempo', 1),
(239, 'Yogur', 'Polvo de la vida', 1),
(240, 'Empanada', 'Solomillo', 1),
(241, 'Empanada', 'Harina', 1),
(242, 'Empanada', 'Levadura', 1),
(243, 'Empanada', 'Polvo de la vida', 1),
(244, 'Empanada', 'Polvo del fuego', 1),
(245, 'Sopa', 'Sal', 1),
(246, 'Sopa', 'Jarra de agua', 1),
(247, 'Sopa', 'Polvo del fuego', 1),
(248, 'Sopa', 'Polvo de la vida', 1),
(249, 'Tortilla', 'Huevo', 2),
(250, 'Tortilla', 'Frasco de aceite', 1),
(251, 'Tortilla', 'Polvo del fuego', 1),
(252, 'Tortilla', 'Sal', 1),
(253, 'Huevo cocido', 'Huevo', 1),
(254, 'Huevo cocido', 'Jarra de agua', 1),
(255, 'Huevo cocido', 'Polvo del fuego', 1),
(256, 'Frasco de vinagre', 'Jarra de vino', 1),
(257, 'Frasco de vinagre', 'Polvo del tiempo', 1),
(258, 'Barra de pan', 'Harina', 1),
(259, 'Barra de pan', 'Levadura', 1),
(260, 'Barra de pan', 'Polvo de la vida', 1),
(261, 'Barra de pan', 'Polvo del fuego', 1),
(262, 'Bizcocho', 'Polvo de la vida', 1),
(263, 'Bizcocho', 'Polvo del fuego', 1),
(264, 'Bizcocho', 'Harina', 1),
(265, 'Bizcocho', 'Levadura', 2),
(266, 'Bizcocho', 'Azúcar', 1),
(267, 'Chocolate', 'Cacao molido', 2),
(268, 'Chocolate', 'Jarra de leche', 1),
(269, 'Chocolate', 'Azúcar', 2),
(270, 'Chocolate', 'Polvo del fuego', 1),
(271, 'Jarra de vino', 'Jarra de mosto', 1),
(272, 'Jarra de vino', 'Polvo del tiempo', 1),
(273, 'Queso', 'Jarra de leche', 3),
(274, 'Queso', 'Polvo del tiempo', 1),
(275, 'Mantequilla', 'Jarra de leche', 2),
(276, 'Mantequilla', 'Polvo de la energía', 1),
(277, 'Ración de tostadas', 'Barra de pan', 1),
(278, 'Ración de tostadas', 'Polvo del fuego', 1),
(279, 'Jarra de café con leche', 'Jarra de café', 1),
(280, 'Jarra de café con leche', 'Jarra de leche', 1),
(281, 'Jarra de café con azucar', 'Jarra de café', 1),
(282, 'Jarra de café con azucar', 'Azúcar', 1),
(283, 'Jarra de café con leche y azucar', 'Jarra de café', 1),
(284, 'Jarra de café con leche y azucar', 'Azúcar', 1),
(285, 'Jarra de café con leche y azucar', 'Jarra de leche', 1),
(286, 'Jarra de café', 'Café molido', 1),
(287, 'Jarra de café', 'Jarra de agua', 1),
(288, 'Jarra de café', 'Polvo del fuego', 1),
(289, 'Café molido', 'Granos de café', 1),
(290, 'Jarra de batido de cacao', 'Cacao molido', 1),
(291, 'Jarra de batido de cacao', 'Jarra de leche', 1),
(292, 'Jarra de batido de cacao', 'Azúcar', 1),
(293, 'Jarra de batido de plátano', 'Plátano', 2),
(294, 'Jarra de batido de plátano', 'Jarra de leche', 1),
(295, 'Jarra de batido de plátano', 'Azúcar', 1),
(296, 'Jarra de batido de fresa', 'Ración de fresas', 1),
(297, 'Jarra de batido de fresa', 'Jarra de leche', 1),
(298, 'Jarra de batido de fresa', 'Azúcar', 1),
(299, 'Harina', 'Trigo', 1),
(300, 'Frasco de aceite', 'Aceitunas', 1),
(301, 'Cacao molido', 'Granos de cacao', 1),
(302, 'Hechizo: Misil mágico', 'Pergamino en blanco', 1),
(303, 'Hechizo: Misil mágico', 'Polvo de la energía', 1),
(304, 'Hechizo: Misil mágico', 'Sal', 2),
(305, 'Hechizo: Destello', 'Pergamino en blanco', 1),
(306, 'Hechizo: Destello', 'Polvo de la energía', 1),
(307, 'Hechizo: Destello', 'Jarra de agua', 2),
(308, 'Sal', 'Jarra de agua del mar', 1),
(309, 'Sal', 'Polvo del fuego', 1),
(310, 'Azúcar', 'Jarra de zumo de remolacha', 1),
(311, 'Azúcar', 'Polvo del fuego', 1),
(312, 'Vial de alcohol puro', 'Azúcar', 1),
(313, 'Vial de alcohol puro', 'Polvo del tiempo', 1),
(314, 'Jarra de mosto de cebada', 'Cebada', 1),
(315, 'Jarra de zumo de tomate', 'Tomate', 2),
(316, 'Jarra de zumo de zanahoria', 'Zanahoria', 2),
(317, 'Jarra de zumo de remolacha', 'Remolacha', 2),
(318, 'Jarra de zumo de moras', 'Ración de moras', 1),
(319, 'Jarra de zumo de fresas', 'Ración de fresas', 1),
(320, 'Jarra de zumo de cerezas', 'Ración de cerezas', 1),
(321, 'Jarra de zumo de sandía', 'Sandía', 1),
(322, 'Jarra de zumo de coco', 'Coco', 1),
(323, 'Jarra de mosto', 'Uvas', 2),
(324, 'Jarra de zumo de plátano', 'Plátano', 2),
(325, 'Jarra de zumo de pera', 'Pera', 2),
(326, 'Jarra de zumo de naranja', 'Naranja', 2),
(327, 'Jarra de zumo de manzana', 'Manzana', 2),
(328, 'Hechizo: Falsa neblina', 'Pergamino en blanco', 1),
(329, 'Hechizo: Falsa neblina', 'Polvo del hielo', 1),
(330, 'Hechizo: Falsa neblina', 'Jarra de agua', 1),
(331, 'Hechizo: Falsa niebla', 'Pergamino en blanco', 1),
(332, 'Hechizo: Falsa niebla', 'Polvo del hielo', 1),
(333, 'Hechizo: Falsa niebla', 'Jarra de agua', 2),
(334, 'Hechizo: Falso eclipse', 'Pergamino en blanco', 1),
(335, 'Hechizo: Falso eclipse', 'Polvo del tiempo', 1),
(336, 'Hechizo: Falso eclipse', 'Huevo cocido', 1),
(337, 'Hechizo: Falsas enredaderas', 'Pergamino en blanco', 1),
(338, 'Hechizo: Falsas enredaderas', 'Polvo de la vida', 1),
(339, 'Hechizo: Falsas enredaderas', 'Lechuga', 2),
(340, 'Hechizo: Locura', 'Pergamino en blanco', 1),
(341, 'Hechizo: Locura', 'Polvo del caos', 1),
(342, 'Hechizo: Locura', 'Cristal de invocación', 1),
(343, 'Hechizo: Levitación', 'Pergamino en blanco', 1),
(344, 'Hechizo: Levitación', 'Polvo de la energía', 1),
(345, 'Hechizo: Levitación', 'Botas de cuero', 1),
(346, 'Hechizo: Guerrero ilusorio', 'Pergamino en blanco', 1),
(347, 'Hechizo: Guerrero ilusorio', 'Polvo de la energía', 1),
(348, 'Hechizo: Guerrero ilusorio', 'Coraza de cuero', 1),
(349, 'Hechizo: Guerrero ilusorio', 'Perneras de cuero', 1),
(350, 'Hechizo: Guerrero ilusorio', 'Casco de cuero', 1),
(351, 'Hechizo: Guerrero ilusorio', 'Botas de cuero', 1),
(352, 'Hechizo: Fortaleza', 'Pergamino en blanco', 1),
(353, 'Hechizo: Fortaleza', 'Polvo de la energía', 1),
(354, 'Hechizo: Fortaleza', 'Sopa', 1),
(355, 'Hechizo: Telekinesia', 'Pergamino en blanco', 1),
(356, 'Hechizo: Telekinesia', 'Polvo de la energía', 1),
(357, 'Hechizo: Telekinesia', 'Vial de alcohol puro', 1),
(358, 'Hechizo: Asfixia', 'Pergamino en blanco', 1),
(359, 'Hechizo: Asfixia', 'Polvo de la energía', 1),
(360, 'Hechizo: Asfixia', 'Levadura', 1),
(361, 'Hechizo: Asfixia', 'Jarra de leche', 1),
(362, 'Hechizo: Criatura de energía', 'Pergamino en blanco', 1),
(363, 'Hechizo: Criatura de energía', 'Polvo de la energía', 1),
(364, 'Hechizo: Criatura de energía', 'Roca de los deseos', 1),
(365, 'Hechizo: Dragón de energía', 'Pergamino en blanco del poder', 1),
(366, 'Hechizo: Dragón de energía', 'Polvo de la energía', 1),
(367, 'Hechizo: Dragón de energía', 'Roca de los deseos', 1),
(368, 'Hechizo: Bola de fuego', 'Pergamino en blanco', 1),
(369, 'Hechizo: Bola de fuego', 'Polvo del fuego', 1),
(370, 'Hechizo: Bola de fuego', 'Harina', 1),
(371, 'Hechizo: Rayo de fuego', 'Pergamino en blanco', 1),
(372, 'Hechizo: Rayo de fuego', 'Polvo del fuego', 1),
(373, 'Hechizo: Rayo de fuego', 'Daga', 1),
(374, 'Hechizo: Aura de fuego', 'Pergamino en blanco', 1),
(375, 'Hechizo: Aura de fuego', 'Polvo del fuego', 1),
(376, 'Hechizo: Aura de fuego', 'Sal', 12),
(377, 'Hechizo: Aura de fuego', 'Jarra de agua del mar', 1),
(378, 'Hechizo: Poder elemental del fuego', 'Pergamino en blanco', 1),
(379, 'Hechizo: Poder elemental del fuego', 'Polvo del fuego', 5),
(380, 'Hechizo: Desatar infierno', 'Pergamino en blanco', 1),
(381, 'Hechizo: Desatar infierno', 'Polvo del fuego', 1),
(382, 'Hechizo: Desatar infierno', 'Cristal de invocación del poder', 1),
(383, 'Hechizo: Bola de hielo', 'Pergamino en blanco', 1),
(384, 'Hechizo: Bola de hielo', 'Polvo del hielo', 1),
(385, 'Hechizo: Bola de hielo', 'Jarra de agua', 1),
(386, 'Hechizo: Rayo de hielo', 'Pergamino en blanco', 1),
(387, 'Hechizo: Rayo de hielo', 'Polvo del hielo', 1),
(388, 'Hechizo: Rayo de hielo', 'Trigo', 1),
(389, 'Hechizo: Rayo de hielo', 'Levadura', 1),
(390, 'Hechizo: Aura de hielo', 'Pergamino en blanco', 1),
(391, 'Hechizo: Aura de hielo', 'Polvo del hielo', 1),
(392, 'Hechizo: Aura de hielo', 'Yogur', 1),
(393, 'Hechizo: Aura de hielo', 'Frasco de vinagre', 1),
(394, 'Hechizo: Poder elemental del hielo', 'Pergamino en blanco', 1),
(395, 'Hechizo: Poder elemental del hielo', 'Polvo del hielo', 5),
(396, 'Hechizo: Congelar alma', 'Pergamino en blanco del poder', 1),
(397, 'Hechizo: Congelar alma', 'Polvo del hielo', 1),
(398, 'Hechizo: Congelar alma', 'Cristal de invocación', 2),
(399, 'Hechizo: Variación del tiempo', 'Pergamino en blanco', 1),
(400, 'Hechizo: Variación del tiempo', 'Polvo del tiempo', 1),
(401, 'Hechizo: Variación del tiempo', 'Hongo druida', 16),
(402, 'Hechizo: Gran variación del tiempo', 'Pergamino en blanco', 1),
(403, 'Hechizo: Gran variación del tiempo', 'Polvo del tiempo', 1),
(404, 'Hechizo: Gran variación del tiempo', 'Hongo druida', 32),
(405, 'Hechizo: Presentir', 'Pergamino en blanco', 1),
(406, 'Hechizo: Presentir', 'Polvo del tiempo', 1),
(407, 'Hechizo: Presentir', 'Jarra de café con leche y azucar', 1),
(408, 'Hechizo: Velocidad', 'Pergamino en blanco', 1),
(409, 'Hechizo: Velocidad', 'Polvo del tiempo', 1),
(410, 'Hechizo: Velocidad', 'Sandía', 2),
(411, 'Hechizo: Paradoja temporal', 'Pergamino en blanco', 1),
(412, 'Hechizo: Paradoja temporal', 'Polvo del tiempo', 1),
(413, 'Hechizo: Paradoja temporal', 'Cristal de invocación del poder', 2),
(414, 'Hechizo: Inflingir enfermedad', 'Pergamino en blanco del poder', 1),
(415, 'Hechizo: Inflingir enfermedad', 'Polvo del caos', 1),
(416, 'Hechizo: Inflingir enfermedad', 'Champiñón', 1),
(417, 'Hechizo: Desorden de la realidad', 'Pergamino en blanco del poder', 1),
(418, 'Hechizo: Desorden de la realidad', 'Polvo del caos', 2),
(419, 'Hechizo: Desorden de la realidad', 'Filete de salmón', 1),
(420, 'Hechizo: Furia caótica', 'Pergamino en blanco del poder', 1),
(421, 'Hechizo: Furia caótica', 'Polvo del caos', 4),
(422, 'Hechizo: Furia caótica', 'Jarra de bebida energética', 12),
(423, 'Hechizo: Furia caótica', 'Jarra de café', 10),
(424, 'Hechizo: Aniquilación', 'Pergamino en blanco del poder', 1),
(425, 'Hechizo: Aniquilación', 'Polvo del caos', 5),
(426, 'Hechizo: Aniquilación', 'Cristal de invocación del poder', 1),
(427, 'Hechizo: Aniquilación', 'Mercurio', 3),
(428, 'Hechizo: Caos', 'Pergamino en blanco del poder', 1),
(429, 'Hechizo: Caos', 'Polvo del caos', 7),
(430, 'Hechizo: Caos', 'Cristal de invocación del poder', 1),
(431, 'Hechizo: Caos', 'Menú completo', 1),
(432, 'Hechizo: Caos', 'Oro líquido', 1),
(433, 'Hechizo: Heridas cicatrizantes', 'Pergamino en blanco', 1),
(434, 'Hechizo: Heridas cicatrizantes', 'Polvo de la vida', 1),
(435, 'Hechizo: Heridas cicatrizantes', 'Jarra de cerveza', 1),
(436, 'Hechizo: Enredaderas', 'Pergamino en blanco', 1),
(437, 'Hechizo: Enredaderas', 'Polvo de la vida', 1),
(438, 'Hechizo: Enredaderas', 'Lechuga', 4),
(439, 'Hechizo: Llamada a la naturaleza', 'Pergamino en blanco', 1),
(440, 'Hechizo: Llamada a la naturaleza', 'Polvo de la vida', 1),
(441, 'Hechizo: Llamada a la naturaleza', 'Frasco de aceite', 1),
(442, 'Hechizo: Enredaderas protectoras', 'Pergamino en blanco', 1),
(443, 'Hechizo: Enredaderas protectoras', 'Polvo de la vida', 1),
(444, 'Hechizo: Enredaderas protectoras', 'Lechuga', 4),
(445, 'Hechizo: Enredaderas protectoras', 'Tomate', 2),
(446, 'Hechizo: Terremoto', 'Pergamino en blanco', 1),
(447, 'Hechizo: Terremoto', 'Polvo de la vida', 1),
(448, 'Hechizo: Terremoto', 'Palomitas de maiz', 1),
(449, 'Grimorio del caos', 'Grimorio del caos cerrado', 1),
(450, 'Grimorio del caos', 'Llave del grimorio del caos', 1),
(451, 'Grimorio del caos', 'Polvo del caos', 100),
(452, 'Grimorio del caos', 'Polvo de la vida', 100),
(453, 'Arbolito de navidad', 'Bola de arbolito roja', 1),
(454, 'Arbolito de navidad', 'Bola de arbolito azul', 1),
(455, 'Arbolito de navidad', 'Bola de arbolito verde', 1),
(456, 'Arbolito de navidad', 'Bola de arbolito amarilla', 1),
(457, 'Arbolito de navidad', 'Estrella de arbolito', 1),
(458, 'Arbolito de navidad', 'Arbolito', 1),
(459, 'Gárgola esmeralda viviente', 'Estatua esmeralda', 1),
(460, 'Gárgola rubí viviente', 'Estatua rubí', 1),
(461, 'Dragón', 'Hechizo: Caos', 1),
(462, 'Dragón', 'Polvo de la vida', 100),
(463, 'Dragón', 'Cetro de invocación de dragones', 1),
(464, 'Dragón', 'Trozo de ala de dragón', 10),
(465, 'Dragón', 'Hueso', 6),
(466, 'Dragón', 'Escudo de alma de dragón', 1),
(467, 'Cayado de talla mágica', 'Cayado', 1),
(468, 'Cayado de talla mágica', 'Pergamino de encantamiento de cayados', 1),
(469, 'Cayado de hielo', 'Cayado de talla mágica', 1),
(470, 'Cayado de hielo', 'Tomo del hielo', 1),
(471, 'Cayado de hielo', 'Cristal de magia', 1),
(472, 'Cayado de fuego', 'Cayado de talla mágica', 1),
(473, 'Cayado de fuego', 'Tomo del fuego', 1),
(474, 'Cayado de fuego', 'Cristal de magia', 1),
(475, 'Cayado de la vida', 'Cayado de talla mágica', 1),
(476, 'Cayado de la vida', 'Tomo de la vida', 1),
(477, 'Cayado de la vida', 'Cristal de magia', 1),
(478, 'Cayado de la muerte', 'Cayado de talla mágica', 1),
(479, 'Cayado de la muerte', 'Tomo de la muerte', 1),
(480, 'Cayado de la muerte', 'Cristal de magia', 1),
(481, 'Cayado del tiempo', 'Cayado de talla mágica', 1),
(482, 'Cayado del tiempo', 'Tomo del tiempo', 1),
(483, 'Cayado del tiempo', 'Cristal de magia', 1),
(484, 'Cayado del control', 'Cayado de talla mágica', 1),
(485, 'Cayado del control', 'Tomo del control', 1),
(486, 'Cayado del control', 'Cristal de magia', 1),
(487, 'Cayado del Archicanciller', 'Cayado de hielo', 1),
(488, 'Cayado del Archicanciller', 'Cayado de fuego', 1),
(489, 'Cayado del Archicanciller', 'Cayado de la vida', 1),
(490, 'Cayado del Archicanciller', 'Cayado de la muerte', 1),
(491, 'Cayado del Archicanciller', 'Cayado del tiempo', 1),
(492, 'Cayado del Archicanciller', 'Cayado del control', 1),
(493, 'Cayado del Archicanciller', 'Polvo de estrellas', 5),
(494, 'Vara activa', 'Vara latente', 1),
(495, 'Vara activa', 'Pergamino de activación de varas', 1),
(496, 'Vara activa', 'Símbolo sagrado', 1),
(497, 'Vara de la gran serpiente', 'Vara de la serpiente', 1),
(498, 'Vara de la gran serpiente', 'Piedra decorada', 5),
(499, 'Vara de la gran serpiente', 'Esfera de cristal', 1),
(500, 'Joya premium', 'Esquirla de joya premium', 100),
(501, 'Esquirla de joya premium', 'Joya premium', 1),
(502, 'Mapa: Limbo', 'Trozo de mapa A', 1),
(503, 'Mapa: Limbo', 'Trozo de mapa B', 1),
(504, 'Mapa: Limbo', 'Trozo de mapa C', 1),
(505, 'Mapa: Limbo', 'Trozo de mapa D', 1),
(506, 'Mapa: Limbo', 'Trozo de mapa E', 1),
(507, 'Mapa: Limbo', 'Trozo de mapa F', 1),
(508, 'Mapa: Purgatorio', 'Trozo de mapa A', 1),
(509, 'Mapa: Purgatorio', 'Trozo de mapa B', 1),
(510, 'Mapa: Purgatorio', 'Trozo de mapa C', 1),
(511, 'Mapa: Purgatorio', 'Trozo de mapa D', 1),
(512, 'Mapa: Purgatorio', 'Trozo de mapa E', 1),
(513, 'Mapa: Purgatorio', 'Trozo de mapa F', 1),
(514, 'Espada Glacial', 'Espada de hielo', 70),
(515, 'Espada Glacial', 'Polvo del hielo', 100),
(516, 'Espada Glacial', 'Daga de cristal luminoso', 5),
(517, 'Calabaza decorada', 'Calabaza', 1),
(518, 'Calabaza decorada', 'Polvo de la vida', 1),
(519, 'Calabaza decorada', 'Polvo del fuego', 1),
(520, 'Calabaza decorada', 'Polvo de hueso rojo', 1),
(521, 'Polvo de hueso rojo', 'Hueso rojo dulce', 1),
(522, 'Bolsa de caramelos', 'Caramelos', 4),
(523, 'Bolsa de caramelos', 'Venda', 1),
(524, 'Bolsa de caramelos', 'Aguja', 4),
(525, 'Caramelos', 'Azúcar', 1),
(526, 'Caramelos', 'Polvo de hueso rojo', 1),
(527, 'Caramelos', 'Polvo del fuego', 1),
(528, 'Sombrero de hechicería', 'Hueso rojo dulce', 5),
(529, 'Sombrero de hechicería', 'Carne podrida', 4),
(530, 'Sombrero de hechicería', 'Venda impura', 3),
(531, 'Sombrero de hechicería', 'Ala de murciélago', 2),
(532, 'Sombrero de hechicería', 'Fuego fatuo', 1),
(533, 'Tarta de calabaza', 'Azúcar', 2),
(534, 'Tarta de calabaza', 'Calabaza', 1),
(535, 'Tarta de calabaza', 'Mantequilla', 1),
(536, 'Tarta de calabaza', 'Huevo', 2),
(537, 'Tarta de calabaza', 'Harina', 1),
(538, 'Tarta de calabaza', 'Levadura', 1),
(539, 'Tarta de calabaza', 'Polvo de hueso rojo', 1),
(540, 'Piruleta de manzana', 'Azúcar', 1),
(541, 'Piruleta de manzana', 'Jarra de zumo de manzana', 1),
(542, 'Piruleta de manzana', 'Polvo de hueso rojo', 1),
(543, 'Piruleta de manzana', 'Polvo del fuego', 1),
(544, 'Piruleta de fresa', 'Azúcar', 1),
(545, 'Piruleta de fresa', 'Jarra de zumo de fresas', 1),
(546, 'Piruleta de fresa', 'Polvo de hueso rojo', 1),
(547, 'Piruleta de fresa', 'Polvo del fuego', 1),
(548, 'Collar de la suerte(I)', 'Collar de la suerte', 1),
(549, 'Collar de la suerte(I)', 'Hueso rojo dulce', 1),
(550, 'Arma desconocida de amazona(I)', 'Arma desconocida de amazona', 1),
(551, 'Arma desconocida de amazona(I)', 'Hueso rojo dulce', 1),
(552, 'Extraño utensilio inutilizable(I)', 'Extraño utensilio inutilizable', 1),
(553, 'Extraño utensilio inutilizable(I)', 'Hueso rojo dulce', 1),
(554, 'Arma desconocida de amazona(I)', 'Esencia mágica', 2),
(555, 'Collar de la suerte(I)', 'Esencia mágica', 1),
(556, 'Extraño utensilio inutilizable(I)', 'Esencia mágica', 2),
(557, 'Planta curativa(I)', 'Planta curativa', 1),
(558, 'Planta curativa(I)', 'Carne podrida', 3),
(559, 'Planta curativa(I)', 'Esencia mágica', 3),
(560, 'Polvo de estrellas(I)', 'Polvo de estrellas', 2),
(561, 'Polvo de estrellas(I)', 'Carne podrida', 2),
(562, 'Polvo de estrellas(I)', 'Esencia mágica', 3),
(563, 'Símbolo sagrado(I)', 'Símbolo sagrado', 1),
(564, 'Símbolo sagrado(I)', 'Venda impura', 2),
(565, 'Símbolo sagrado(I)', 'Esencia mágica', 4),
(566, 'Símbolo sagrado(I)', 'Polvo de estrellas(I)', 1),
(567, 'Lámpara(I)', 'Lámpara', 1),
(568, 'Lámpara(I)', 'Venda impura', 2),
(569, 'Lámpara(I)', 'Esencia mágica', 4),
(570, 'Lámpara(I)', 'Polvo de estrellas(I)', 1),
(571, 'Corona(I)', 'Corona', 1),
(572, 'Corona(I)', 'Ala de murciélago', 3),
(573, 'Corona(I)', 'Esencia mágica', 5),
(574, 'Corona(I)', 'Polvo de estrellas(I)', 2),
(575, 'Oso festivo animado', 'Osito festivo de peluche', 1),
(576, 'Insignia Atrezzo A', 'Tablón de madera sabia', 10),
(577, 'Insignia Atrezzo A', 'Pegamento', 30),
(578, 'Insignia Atrezzo A', 'Clavo', 50),
(579, 'Insignia Atrezzo A', 'Pinturas', 20),
(580, 'Insignia Atrezzo B', 'Tablón de madera sabia', 10),
(581, 'Insignia Atrezzo B', 'Pegamento', 30),
(582, 'Insignia Atrezzo B', 'Clavo', 50),
(583, 'Insignia Atrezzo B', 'Pinturas', 20),
(584, 'Insignia Atrezzo C', 'Tablón de madera sabia', 10),
(585, 'Insignia Atrezzo C', 'Pegamento', 30),
(586, 'Insignia Atrezzo C', 'Clavo', 50),
(587, 'Insignia Atrezzo C', 'Pinturas', 20),
(588, 'Insignia Atrezzo D', 'Tablón de madera sabia', 10),
(589, 'Insignia Atrezzo D', 'Pegamento', 30),
(590, 'Insignia Atrezzo D', 'Clavo', 50),
(591, 'Insignia Atrezzo D', 'Pinturas', 20),
(592, 'Insignia Atrezzo E', 'Tablón de madera sabia', 10),
(593, 'Insignia Atrezzo E', 'Pegamento', 30),
(594, 'Insignia Atrezzo E', 'Clavo', 50),
(595, 'Insignia Atrezzo E', 'Pinturas', 20),
(596, 'Insignia Atrezzo F', 'Tablón de madera sabia', 10),
(597, 'Insignia Atrezzo F', 'Pegamento', 30),
(598, 'Insignia Atrezzo F', 'Clavo', 50),
(599, 'Insignia Atrezzo F', 'Pinturas', 20),
(600, 'Insignia Atrezzo G', 'Tablón de madera sabia', 10),
(601, 'Insignia Atrezzo G', 'Pegamento', 30),
(602, 'Insignia Atrezzo G', 'Clavo', 50),
(603, 'Insignia Atrezzo G', 'Pinturas', 20),
(604, 'Insignia Atrezzo H', 'Tablón de madera sabia', 10),
(605, 'Insignia Atrezzo H', 'Pegamento', 30),
(606, 'Insignia Atrezzo H', 'Clavo', 50),
(607, 'Insignia Atrezzo H', 'Pinturas', 20),
(608, 'Insignia Atrezzo I', 'Tablón de madera sabia', 10),
(609, 'Insignia Atrezzo I', 'Pegamento', 30),
(610, 'Insignia Atrezzo I', 'Clavo', 50),
(611, 'Insignia Atrezzo I', 'Pinturas', 20),
(612, 'Insignia Atrezzo J', 'Tablón de madera sabia', 10),
(613, 'Insignia Atrezzo J', 'Pegamento', 30),
(614, 'Insignia Atrezzo J', 'Clavo', 50),
(615, 'Insignia Atrezzo J', 'Pinturas', 20),
(616, 'Insignia Atrezzo K', 'Tablón de madera sabia', 10),
(617, 'Insignia Atrezzo K', 'Pegamento', 30),
(618, 'Insignia Atrezzo K', 'Clavo', 50),
(619, 'Insignia Atrezzo K', 'Pinturas', 20),
(620, 'Insignia Atrezzo M', 'Tablón de madera sabia', 10),
(621, 'Insignia Atrezzo M', 'Pegamento', 30),
(622, 'Insignia Atrezzo M', 'Clavo', 50),
(623, 'Insignia Atrezzo M', 'Pinturas', 20),
(624, 'Cristal carmesí activado', 'Cristal carmesí inerte', 1),
(625, 'Cristal carmesí activado', 'Cristal de invocación', 25),
(626, 'Cristal carmesí activado', 'Mercurio', 1),
(627, 'Cristal carmesí activado', 'Polvo del fuego', 10),
(628, 'Cristal añil activado', 'Cristal añil inerte', 1),
(629, 'Cristal añil activado', 'Cristal de invocación', 25),
(630, 'Cristal añil activado', 'Mercurio', 1),
(631, 'Cristal añil activado', 'Polvo del hielo', 25),
(632, 'Cristal purpúreo activado', 'Cristal purpúreo inerte', 1),
(633, 'Cristal purpúreo activado', 'Cristal de invocación', 25),
(634, 'Cristal purpúreo activado', 'Mercurio', 1),
(635, 'Cristal purpúreo activado', 'Polvo del caos', 50),
(636, 'Bocadillo vegetal', 'Barra de pan', 1),
(637, 'Bocadillo vegetal', 'Lechuga', 1),
(638, 'Bocadillo de pollo y lechuga', 'Barra de pan', 1),
(639, 'Bocadillo vegetal', 'Tomate', 1),
(640, 'Bocadillo de pollo y lechuga', 'Lechuga', 1),
(641, 'Bocadillo de pollo y lechuga', 'Muslo de pollo', 1),
(642, 'Bocadillo de solomillo y queso', 'Barra de pan', 1),
(643, 'Bocadillo de solomillo y queso', 'Solomillo', 1),
(644, 'Bocadillo de solomillo y queso', 'Queso', 1),
(645, 'Ballesta sabia', 'Esencia viva', 1),
(646, 'Ballesta', 'Esencia viva', 1),
(647, 'Lanzaclavos', 'Esencia viva', 1),
(648, 'Escudo lanzaagujas', 'Esencia viva', 1),
(649, 'Escudo lanzaclavos', 'Esencia viva', 1),
(650, 'Escudo pegajoso permanente', 'Esencia viva', 1),
(651, 'Escudo pegajoso', 'Esencia viva', 1),
(652, 'Ballesta de energía', 'Esencia viva', 1),
(653, 'Grimorio de la luz', 'Grimorio de la luz cerrado', 1),
(654, 'Grimorio de la luz', 'Llave del grimorio de la luz', 1),
(655, 'Grimorio de la luz', 'Polvo del tiempo', 100),
(656, 'Grimorio de la luz', 'Polvo de la vida', 100),
(657, 'Llaves de otro mundo', 'Esfera añil', 1),
(658, 'Llaves de otro mundo', 'Esfera carmesí', 1),
(659, 'Llaves de otro mundo', 'Esfera de jade', 1),
(660, 'Grimorio de otro mundo', 'Grimorio de otro mundo cerrado', 1),
(661, 'Grimorio de otro mundo', 'Llaves de otro mundo', 1),
(662, 'Hechizo: Fuego sagrado', 'Pergamino en blanco del poder', 1),
(663, 'Hechizo: Fuego sagrado', 'Polvo del tiempo', 1),
(664, 'Hechizo: Fuego sagrado', 'Champiñón', 1),
(665, 'Hechizo: Justicia divina', 'Pergamino en blanco del poder', 1),
(666, 'Hechizo: Justicia divina', 'Polvo del tiempo', 2),
(667, 'Hechizo: Justicia divina', 'Filete de salmón', 1),
(668, 'Hechizo: Aura celestial', 'Pergamino en blanco del poder', 1),
(669, 'Hechizo: Aura celestial', 'Polvo del tiempo', 4),
(670, 'Hechizo: Aura celestial', 'Jarra de bebida energética', 12),
(671, 'Hechizo: Aura celestial', 'Jarra de café', 10),
(672, 'Hechizo: Bastión', 'Pergamino en blanco del poder', 1),
(673, 'Hechizo: Bastión', 'Polvo del tiempo', 5),
(674, 'Hechizo: Bastión', 'Cristal de invocación del poder', 1),
(675, 'Hechizo: Bastión', 'Mercurio', 3),
(676, 'Hechizo: Juicio final', 'Pergamino en blanco del poder', 1),
(677, 'Hechizo: Juicio final', 'Polvo del tiempo', 7),
(678, 'Hechizo: Juicio final', 'Cristal de invocación del poder', 1),
(679, 'Hechizo: Juicio final', 'Menú completo', 1),
(680, 'Hechizo: Juicio final', 'Oro líquido', 1),
(681, 'Hechizo: Trinidad', 'Hechizo: Caos', 1),
(682, 'Hechizo: Trinidad', 'Hechizo: Juicio final', 1),
(683, 'Hechizo: Trinidad', 'Hechizo: Devastación vudú', 1),
(684, 'Hechizo: Ciclo infinito', 'Hechizo: Paradoja temporal', 1),
(685, 'Hechizo: Ciclo infinito', 'Hechizo: Enredaderas', 1),
(686, 'Hechizo: Ciclo infinito', 'Hechizo: Invocación divina', 1),
(687, 'Hechizo: Igualdad', 'Hechizo: Misil mágico', 1),
(688, 'Hechizo: Igualdad', 'Hechizo: Dragón de energía', 10),
(689, 'Hechizo: Igualdad', 'Hechizo: Confusión vudú', 1),
(690, 'Hechizo: Tiempo muerto', 'Hechizo: Bastión', 3),
(691, 'Hechizo: Tiempo muerto', 'Hechizo: Gran variación del tiempo', 1),
(692, 'Hechizo: Tiempo muerto', 'Hechizo: Paradoja temporal', 1),
(693, 'Hechizo: Dominación', 'Hechizo: Caos', 2),
(694, 'Hechizo: Dominación', 'Hechizo: Terremoto', 1),
(695, 'Hechizo: Dominación', 'Hechizo: Desatar infierno', 10),
(696, 'Hechizo: Trinidad', 'Esfera de almas', 1),
(697, 'Hechizo: Igualdad', 'Esfera de almas', 1),
(698, 'Hechizo: Tiempo muerto', 'Esfera de almas', 1),
(699, 'Hechizo: Dominación', 'Esfera de almas', 10),
(700, 'Hechizo: Ciclo infinito', 'Esfera de almas', 1),
(701, 'Amuleto de otra era', 'Lingote de oro', 1),
(702, 'Amuleto de otra era', 'Mitad izquierda perleada', 1),
(703, 'Amuleto de otra era', 'Mitad derecha obsidiana', 1),
(704, 'Amuleto de otra era', 'Joya antigua', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemstrueques`
--

CREATE TABLE `itemstrueques` (
  `idtrueque` int(14) DEFAULT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(1) NOT NULL,
  `encantamiento` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `verificado` int(1) NOT NULL DEFAULT 0,
  `recibemail` int(1) NOT NULL DEFAULT 1,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `emailnuevo` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailnuevocambio` int(14) NOT NULL DEFAULT 0,
  `creado` int(14) NOT NULL,
  `login` int(14) NOT NULL DEFAULT 0,
  `premiumhasta` int(14) NOT NULL DEFAULT 0,
  `clan` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '(ninguno)',
  `baneadohasta` int(14) NOT NULL DEFAULT 0,
  `emailreg` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ipcreado` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `iplogin` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` int(10) NOT NULL DEFAULT 1,
  `insignia` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `puntos` int(20) NOT NULL DEFAULT 0,
  `puntossuma` int(20) NOT NULL DEFAULT 0,
  `puntosnivel` int(20) NOT NULL DEFAULT 0,
  `puntosobjeto` int(20) NOT NULL DEFAULT 0,
  `oro` bigint(30) NOT NULL DEFAULT 0,
  `energia` int(20) NOT NULL DEFAULT 100,
  `enerext` int(20) NOT NULL DEFAULT 0,
  `trabajando` int(14) NOT NULL DEFAULT 0,
  `fintrabajo` int(14) NOT NULL DEFAULT 0,
  `puntostrabajo` int(20) NOT NULL DEFAULT 0,
  `trabajopremium` int(1) NOT NULL DEFAULT 0,
  `trabajado` int(14) NOT NULL DEFAULT 0,
  `orotrabajo` int(10) NOT NULL DEFAULT 0,
  `protegidohasta` int(14) NOT NULL DEFAULT 0,
  `noatacarhasta` int(14) NOT NULL DEFAULT 0,
  `noexplorarhasta` int(14) NOT NULL DEFAULT 0,
  `nocomerhasta` int(14) NOT NULL DEFAULT 0,
  `combates` int(10) NOT NULL DEFAULT 0,
  `vencedor` int(10) NOT NULL DEFAULT 0,
  `vencido` int(10) NOT NULL DEFAULT 0,
  `visitashijos` int(10) NOT NULL DEFAULT 0,
  `visitasnietos` int(10) NOT NULL DEFAULT 0,
  `hijos` int(10) NOT NULL DEFAULT 0,
  `nietos` int(10) NOT NULL DEFAULT 0,
  `padre` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '(desconocido)',
  `ultimoforo` int(14) NOT NULL DEFAULT 0,
  `zonahoraria` int(3) NOT NULL DEFAULT -15,
  `ultimaact` int(14) NOT NULL DEFAULT 0,
  `admin` int(1) NOT NULL DEFAULT 0,
  `moderador` int(1) NOT NULL DEFAULT 0,
  `enchufado` int(1) NOT NULL DEFAULT 0,
  `sabiduria` int(11) NOT NULL DEFAULT 0,
  `encantado` int(11) NOT NULL DEFAULT 0,
  `ascension` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lasttime`
--

CREATE TABLE `lasttime` (
  `lasttime` int(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loginlog`
--

CREATE TABLE `loginlog` (
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hora` int(14) NOT NULL,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logros`
--

CREATE TABLE `logros` (
  `id` int(14) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `puntos` int(10) NOT NULL,
  `tituloid` int(14) DEFAULT NULL,
  `objetos` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oculto` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `logros`
--

INSERT INTO `logros` (`id`, `nombre`, `descripcion`, `puntos`, `tituloid`, `objetos`, `oculto`) VALUES
(2, 'Oficial', 'Acumula 1 semana de trabajo en total.', 10, 1, 'Cristal carmesí inerte$1', 0),
(1, 'Aprendiz', 'Acumula 24 horas de trabajo en total.', 5, NULL, NULL, 0),
(3, 'Maestro', 'Acumula 1 mes de trabajo en total(30 días).', 15, 2, 'Cristal añil inerte$1', 0),
(4, 'Jefe de gremio', 'Acumula 3 meses de trabajo en total(90 días).', 20, 3, 'Cristal purpúreo inerte$1', 0),
(5, 'Jornada completa', 'Trabaja 8 horas seguidas sin parar.', 5, NULL, NULL, 0),
(6, 'Horas extra', 'Trabaja 16 horas seguidas sin parar.', 10, NULL, 'Cristal carmesí inerte$1', 0),
(7, '¿Quién necesita dormir?', 'Trabaja 24 horas seguidas sin parar.', 15, 4, 'Cristal añil inerte$1', 0),
(8, 'Necesito unas vacaciones', 'Trabaja 1 semana seguida sin parar.', 20, 5, 'Cristal purpúreo inerte$1', 0),
(9, 'Iniciado', 'Gana 10 combates.', 5, NULL, NULL, 0),
(10, 'Conocido', 'Gana 100 combates.', 10, NULL, 'Cristal carmesí inerte$1', 0),
(11, 'Gladiador', 'Gana 1000 combates.', 15, 6, 'Cristal añil inerte$1', 0),
(12, 'Se me rompió la espada', 'Pierde 1 combate.', 5, NULL, NULL, 0),
(13, '¡A la aventura!', 'Explora un mapa.', 5, NULL, NULL, 0),
(14, '¡Eh, otro mapa!', 'Explora 10 mapas.', 10, 7, 'Cristal carmesí inerte$1', 0),
(15, '¿No huele a quemado?', 'Explora la siguiente linea de mapas:<br>- Mapa: Cueva de la plata<br>- Mapa: Mina de oro<br>- Mapa: Descenso profundo<br>- Mapa: Inframundo<br>- Mapa: Río de lava<br>- Mapa: Centro de volcán<br>- Mapa: Puertas del infierno<br>- Mapa: Purgatorio', 20, 8, 'Cristal añil inerte$2', 0),
(16, '*Brrr*, qué frío', 'Explora la siguiente linea de mapas:<br>- Mapa: Gruta helada<br>- Mapa: Laberinto de hielo<br>- Mapa: Montaña helada<br>- Mapa: Cordillera helada<br>- Mapa: Cima nevada<br>- Mapa: Escalera al cielo<br>- Mapa: Reino celestial<br>- Mapa: Limbo', 20, 9, 'Cristal añil inerte$2', 0),
(17, 'Caminante de las estrellas', 'Explora la siguiente linea de mapas:<br>- Mapa: Luna Phobos<br>- Mapa: Luna Dremek<br>- Mapa: Luna Aio<br>- Mapa: Planeta Aeron', 20, 10, 'Cristal purpúreo inerte$2', 0),
(49, 'Corazón del bosque', 'Explora al menos 1000 veces el mapa \"Bosques de Lifo\"', 15, 39, 'Champiñón mágico$1', 0),
(18, 'Lo he visto todo', 'Consigue los siguientes logros:<br>- ¿No huele a quemado?<br>-*Brrrrr*,qué frio<br>-Caminante de las estrellas', 25, 11, 'Cristal purpúreo inerte$2', 0),
(19, '¿Qué habrá dentro?', 'Abre un cofre.', 5, NULL, NULL, 0),
(20, 'Lector casual', 'Lee 5 libros o escrituras completos.', 5, 12, NULL, 0),
(21, 'Lector Nato', 'Lee 25 libros o escrituras completos.', 10, 13, NULL, 0),
(22, '¡Lo sé todo!', 'Lee 50 libros o escrituras completos.', 20, 14, NULL, 0),
(23, 'Fabricación casual', 'Fabrica 100 objetos en total.', 10, 15, NULL, 0),
(24, 'Cadena de montaje', 'Fabrica 1000 objetos en total.', 15, 16, NULL, 0),
(25, '¿Necesitas algo?', 'Fabrica 10000 objetos total.', 20, 17, NULL, 0),
(26, 'Chef', 'Fabrica 30 menús completos.', 25, 18, 'Menú divino$1', 0),
(27, 'Algo me sigue', 'Adopta una mascota.', 5, NULL, NULL, 0),
(28, 'Exótico', 'Adopta 5 mascotas.', 5, NULL, NULL, 0),
(29, '¿Dónde conseguiste ese bicho?', 'Adopta 10 mascotas.', 10, NULL, NULL, 0),
(30, 'Mira lo que tengo', 'Adopta 15 mascotas.', 10, NULL, NULL, 0),
(31, 'Mío y sólo mío', 'Adopta 20 mascotas.', 15, NULL, NULL, 0),
(33, 'Domador de pollos', 'Adopta 5 pollos distintos.', 10, 25, 'Trofeo: Pollo de oro$1', 0),
(32, 'Domador de alimañas', 'Adopta 25 mascotas.', 20, 26, NULL, 0),
(34, 'Bienvenido a Lifo', 'Alcanza nivel 10.', 5, 27, NULL, 0),
(35, 'Paso a paso', 'Alcanza nivel 25.', 5, 28, NULL, 0),
(36, 'Se va notando el gym', 'Alcanza nivel 50.', 5, 29, 'Trofeo: Pluma de bronce$1', 0),
(37, '¿Quién me hará frente ahora?', 'Alcanza nivel 100.', 10, 30, NULL, 0),
(38, 'Poderoso y asombroso', 'Alcanza nivel 200.', 10, 31, 'Trofeo: Pluma de plata$1', 0),
(39, 'Meh', 'Alcanza nivel 300.', 10, NULL, NULL, 0),
(40, 'Ya queda poco', 'Alcanza nivel 400.', 15, NULL, 'Trofeo: Pluma de oro$1', 0),
(41, 'Soy leyenda', 'Alcanza nivel 500.', 15, 32, 'Trofeo: Pluma de platino$1', 0),
(42, '¡Flipendo!', 'Fabrica 1 hechizo.', 5, NULL, NULL, 0),
(43, 'Wololo...', 'Fabrica 15 hechizo.', 10, NULL, NULL, 0),
(44, 'Discípulo de Merasmus', 'Fabrica todos los hechizos.', 20, 33, NULL, 0),
(45, '¡POR LIFO!', 'Vence a Xilok en un combate.', 20, 34, NULL, 0),
(46, 'En busca de la fama', 'Acumula 100 puntos de logro.', 10, NULL, 'Cristal carmesí inerte$2', 0),
(47, 'Me suena tu nombre...', 'Acumula 250 puntos de logro.', 25, NULL, 'Cristal añil inerte$2', 0),
(48, 'Míster Lifo', 'Acumula 500 puntos de logro.', 50, 35, 'Cristal purpúreo inerte$2', 0),
(50, 'Experto en plátanos', 'Fabrica 10000 \"Jarra de batido de plátano\".', 15, 42, 'Trofeo: Banana de oro$1', 1),
(51, '¡Eureka!', 'Encanta 1 objeto con éxito.', 5, 51, NULL, 0),
(52, 'Rituales arcanos', 'Encanta 100 objetos con éxito.', 10, 52, NULL, 0),
(53, 'Experto en artes prohibidas', 'Encanta 1000 objetos con éxito.', 15, 53, NULL, 0),
(54, 'Señor del Caos', 'Encanta un cuchillo con \"Hechizo: Caos\".', 20, 50, NULL, 1),
(55, 'Ascensión', 'Asciende 1 vez.', 10, 54, NULL, 0),
(56, 'Camino al cielo', 'Asciende 5 veces.', 10, 55, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `nombremascota` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `alimento` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ataquebase` int(20) NOT NULL DEFAULT 0,
  `defensabase` int(20) NOT NULL DEFAULT 0,
  `vidabase` int(20) NOT NULL DEFAULT 0,
  `ataquenivel` int(20) NOT NULL DEFAULT 0,
  `defensanivel` int(20) NOT NULL DEFAULT 0,
  `vidanivel` int(20) NOT NULL DEFAULT 0,
  `expbase` int(20) NOT NULL DEFAULT 0,
  `expmult` int(20) NOT NULL DEFAULT 0,
  `expgana` int(20) NOT NULL DEFAULT 0,
  `maxnivel` int(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`nombremascota`, `nombreobj`, `img`, `alimento`, `ataquebase`, `defensabase`, `vidabase`, `ataquenivel`, `defensanivel`, `vidanivel`, `expbase`, `expmult`, `expgana`, `maxnivel`) VALUES
('Gárgola esmeralda', 'Gárgola esmeralda viviente', 'rrrppat', 'Piedra decorada', 1, 1, 0, 3, 2, 0, 10, 10, 1, 10),
('Gárgola rubí', 'Gárgola rubí viviente', 'rrrost', 'Piedra decorada', 1, 1, 0, 2, 3, 0, 10, 10, 1, 10),
('Mono', 'Mono', 'sp', 'Jarra de zumo de plátano', 1, 1, 5, 1, 0, 1, 20, 0, 1, 8),
('Buho', 'Buho', 'mab', 'Muslo de pollo', 1, 1, 0, 0, 1, 0, 10, 10, 1, 12),
('Cuervo', 'Cuervo', 'mar', 'Solomillo', 1, 1, 0, 1, 0, 0, 10, 15, 1, 14),
('Bufalo', 'Bufalo', 'mac', 'Jarra de leche', 0, 0, 7, 2, 1, 2, 30, 0, 1, 5),
('Pollo', 'Pollo', 'map', 'Trigo', 0, 1, 2, 0, 1, 1, 10, 0, 1, 4),
('Perro', 'Perro', 'mag', 'Hueso', 2, 1, 0, 2, 1, 0, 40, 10, 1, 4),
('Gato', 'Gato', 'mam', 'Pescado grande', 1, 2, 0, 1, 2, 0, 40, 10, 1, 4),
('Conejo', 'Conejo', 'marr', 'Zanahoria', 0, 0, 0, 0, 1, 0, 10, 6, 1, 15),
('Ordok', 'Ordok', 'mat', 'Calabaza', 5, 5, 0, 1, 1, 0, 10, 15, 1, 15),
('Diablillo ígneo', 'Diablillo ígneo', 'mazf', 'Polvo del fuego', 2, 2, 0, 2, 1, 0, 10, 15, 1, 12),
('Diablillo gélido', 'Diablillo gélido', 'mazh', 'Polvo del hielo', 2, 2, 0, 1, 2, 0, 10, 15, 1, 12),
('Dragón', 'Dragón', 'mad', 'Menú completo', 10, 10, 0, 1, 1, 0, 10, 8, 1, 30),
('Mutante XX', 'Mutante XX', 'muta', 'Materia orgánica', 0, 0, 0, 6, 6, 0, 10, 10, 1, 10),
('Mutante XY', 'Mutante XY', 'mutb', 'Materia orgánica', 0, 0, 0, 6, 6, 0, 10, 10, 1, 10),
('Mutante YY', 'Mutante XY', 'mutc', 'Materia orgánica', 0, 0, 0, 6, 6, 0, 10, 10, 1, 10),
('Golem de lava', 'Golem de lava', 'mgl', 'Piedra decorada', 0, 0, 0, 6, 6, 0, 10, 10, 1, 10),
('Golem vegetal', 'Golem vegetal', 'mgv', 'Piedra decorada', 0, 0, 0, 6, 6, 0, 10, 10, 1, 10),
('Golem de piedra', 'Golem de piedra', 'mgp', 'Hechizo: Congelar alma', 4, 4, 0, 6, 6, 0, 10, 10, 1, 10),
('Dragón de huesos', 'Dragón de huesos', 'mra', 'Hechizo: Calavera voladora', 10, 10, 0, 5, 5, 0, 20, 8, 1, 10),
('Escorpión', 'Escorpión', 'mrb', 'Hechizo: Criatura de energía', 15, 4, 0, 6, 3, 0, 12, 8, 1, 13),
('Espíritu de dragón', 'Espíritu de dragón', 'mrc', 'Hechizo: Invocación fantasmal', 14, 0, 0, 4, 2, 0, 10, 12, 1, 25),
('Halcón de fuego', 'Halcón de fuego', 'mrd', 'Hechizo: Desatar infierno', 2, 2, 0, 14, 0, 0, 6, 14, 1, 9),
('Lagarto alado', 'Lagarto alado', 'mre', 'Hechizo: Monstruosidad', 0, 4, 0, 1, 2, 0, 10, 10, 1, 65),
('Mapache', 'Mapache', 'hdanimalmarino', 'Esporas', 0, 1, 2, 0, 1, 0, 10, 0, 1, 4),
('Rata topo', 'Rata topo', 'hdratatopo', 'Trigo', 0, 1, 0, 0, 1, 0, 10, 0, 1, 4),
('Oculo', 'Oculo', 'oculo', 'Estrella Polar', 50, 50, 0, 75, 75, 0, 25, 25, 1, 5),
('Pollo Aficionado', 'Pollo Aficionado', 'maprecre', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Cielo', 'Pollo Cielo', 'mapceles', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Valiente', 'Pollo Valiente', 'mapcasco', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Vamporo Helado', 'Vamporo Helado', 'frozenbat', 'Jarra de zumo de tomate', -7, 1, 12, 3, 1, 2, 25, 5, 2, 20),
('Pollo Masculino', 'Pollo Masculino', 'mapr', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Nocturno', 'Pollo Nocturno', 'mapnoc', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Moderno', 'Pollo Moderno', 'mapmod', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Sultán', 'Pollo Sultán', 'mapalapollo', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Demoniaco', 'Pollo Demoniaco', 'mapdemon', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Adimensional', 'Pollo Adimensional', 'mapdimensional', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Arcoiris', 'Pollo Arcoiris', 'maparcoiris', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Binario', 'Pollo Binario', 'mapcybern', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Pollo Festivo', 'Pollo Festivo', 'mapfestivo', 'Trigo', -4, 0, 0, 3, 2, 0, 10, 6, 2, 6),
('Oso festivo', 'Oso festivo animado', 'osonavanim', 'Carbón', 1, 1, 0, 2, 2, 0, 10, 10, 1, 10),
('Águila', 'Águila', 'mragi', 'Conejo', 0, 0, 0, 5, 1, 0, 2, 6, 1, 8),
('Dragón glacial', 'Dragón glacial', 'dragohielo', 'Menú completo', 5, 15, 10, 1, 1, 2, 10, 8, 1, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idmensaje` int(20) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remitente` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hora` int(14) NOT NULL,
  `visto` int(1) NOT NULL DEFAULT 0,
  `reportado` int(1) NOT NULL DEFAULT 0,
  `tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'General',
  `mensaje` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Disparadores `mensajes`
--
DELIMITER $$
CREATE TRIGGER `after_mensajes_inserted` AFTER INSERT ON `mensajes` FOR EACH ROW BEGIN
    INSERT INTO `mensajescopy`(`idmensaje`, `nombrejug`, `remitente`, `hora`, `visto`, `reportado`, `tipo`, `mensaje`) 
    VALUES (new.idmensaje,new.nombrejug,new.remitente,new.hora,new.visto,new.reportado,new.tipo,new.mensaje);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajescopy`
--

CREATE TABLE `mensajescopy` (
  `idmensaje` int(20) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remitente` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hora` int(14) NOT NULL,
  `visto` int(1) NOT NULL DEFAULT 0,
  `reportado` int(1) NOT NULL DEFAULT 0,
  `tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'General',
  `mensaje` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruos`
--

CREATE TABLE `monstruos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` int(255) NOT NULL DEFAULT 0,
  `coste` int(255) NOT NULL DEFAULT 0,
  `oromin` int(255) NOT NULL DEFAULT 0,
  `oromax` int(255) NOT NULL DEFAULT 0,
  `expmin` int(255) NOT NULL DEFAULT 0,
  `expmax` int(255) NOT NULL DEFAULT 0,
  `dmg` int(255) NOT NULL DEFAULT 0,
  `hp` int(255) NOT NULL DEFAULT 0,
  `crit` int(255) NOT NULL DEFAULT 0,
  `evasion` int(255) NOT NULL DEFAULT 0,
  `blocking` int(255) NOT NULL DEFAULT 0,
  `skills` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pasives` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puntuacion` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `monstruos`
--

INSERT INTO `monstruos` (`id`, `nombre`, `img`, `nivel`, `coste`, `oromin`, `oromax`, `expmin`, `expmax`, `dmg`, `hp`, `crit`, `evasion`, `blocking`, `skills`, `pasives`, `puntuacion`) VALUES
(6, 'Defensor Myrrodir', 'memyrrodir', 80, 0, 5000, 100000, 700, 1000, 200, 1100, 10, 10, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE `objetos` (
  `nombreobj` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nivelcomprar` int(10) NOT NULL,
  `nivelencontrar` int(10) NOT NULL,
  `niveluso` int(10) NOT NULL,
  `valor` bigint(30) NOT NULL,
  `prot` int(20) NOT NULL DEFAULT 0,
  `ataq` int(20) NOT NULL DEFAULT 0,
  `vida` int(20) NOT NULL DEFAULT 0,
  `posibilidad` int(10) NOT NULL,
  `puntosencontrar` int(20) NOT NULL,
  `usos` int(1) NOT NULL DEFAULT 0,
  `pasivas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `texto` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `objetos`
--

INSERT INTO `objetos` (`nombreobj`, `tipo`, `img`, `nivelcomprar`, `nivelencontrar`, `niveluso`, `valor`, `prot`, `ataq`, `vida`, `posibilidad`, `puntosencontrar`, `usos`, `pasivas`, `texto`, `descripcion`) VALUES
('Ballesta sabia', 'Artilugio', 'bals', 0, 0, 35, 160000, 0, 60, 0, 0, 0, 0, '', NULL, NULL),
('Martillo de guerra del averno', 'Arma', 'mgav', 0, 39, 39, 10000000, 1, 62, 0, 20, 140000, 0, '', NULL, NULL),
('Martillo de guerra celestial', 'Arma', 'mgcel', 0, 39, 39, 10000000, 19, 44, 0, 20, 130000, 0, '', NULL, NULL),
('Mandoble de lava', 'Arma', 'eest', 0, 39, 36, 6000000, 17, 43, 0, 30, 90000, 0, '', NULL, NULL),
('Espada del averno', 'Arma', 'eav', 0, 36, 33, 2000000, 15, 42, 0, 30, 72000, 0, '', NULL, NULL),
('Espada celestial', 'Arma', 'ecel', 0, 34, 33, 2000000, 17, 40, 0, 50, 67000, 0, '', NULL, NULL),
('Hacha del averno', 'Arma', 'haver', 0, 32, 30, 1000000, 14, 41, 0, 80, 60000, 0, '', NULL, NULL),
('Hacha celestial', 'Arma', 'hcels', 0, 30, 30, 1000000, 16, 39, 0, 90, 56000, 0, '', NULL, NULL),
('Daga del averno', 'Arma', 'dav', 0, 32, 30, 450000, 5, 27, 0, 70, 35000, 0, '', NULL, NULL),
('Daga celestial', 'Arma', 'dcel', 0, 30, 30, 450000, 7, 25, 0, 90, 30000, 0, '', NULL, NULL),
('Espada de fuego mágico', 'Arma', 'efm', 0, 28, 26, 650000, 14, 39, 0, 500, 47000, 0, '', NULL, NULL),
('Cuchilla eterea', 'Arma', 'ceth', 0, 25, 27, 20000, 1, 62, 0, 500, 10000, 1, '', NULL, NULL),
('Espada encantada', 'Arma', 'eet', 0, 25, 23, 330000, 12, 35, 0, 500, 43000, 0, '', NULL, NULL),
('Maza de la oscuridad', 'Arma', 'menc', 0, 25, 22, 360000, 15, 32, 0, 200, 45000, 0, '', NULL, NULL),
('Daga de cristal luminoso', 'Arma', 'dcl', 0, 22, 20, 222000, 0, 35, 0, 300, 25000, 0, '', NULL, NULL),
('Guadaña de hielo', 'Arma', 'guah', 0, 21, 19, 260000, 7, 33, 0, 2000, 29000, 0, '', NULL, NULL),
('Mandoble', 'Arma', 'mplat', 0, 22, 20, 255000, 14, 35, 0, 200, 36000, 0, '', NULL, NULL),
('Guadaña', 'Arma', 'guag', 0, 20, 18, 190000, 7, 32, 0, 2000, 28000, 0, '', NULL, NULL),
('Espada de la corona', 'Arma', 'ere', 0, 20, 16, 150000, 9, 29, 0, 2000, 28000, 0, '', NULL, NULL),
('Martillo de guerra', 'Arma', 'mguer', 0, 16, 13, 105000, 6, 29, 0, 5000, 16000, 0, '', NULL, NULL),
('Daga de fuego mágico', 'Arma', 'dfm', 0, 17, 17, 13000, 6, 18, 0, 400, 20000, 0, '', NULL, NULL),
('Espada de hielo', 'Arma', 'hlo', 0, 14, 12, 25000, 3, 22, 0, 5000, 1300, 0, '', NULL, NULL),
('Maza de monje', 'Arma', 'mmon', 0, 12, 10, 67000, 10, 17, 0, 1200, 1800, 0, '', NULL, NULL),
('Espada de oro', 'Arma', 'esoro', 0, 10, 6, 32000, 6, 19, 0, 500, 1000, 0, '', NULL, NULL),
('Hacha doble', 'Arma', 'hdob', 1, 14, 10, 8700, 4, 19, 0, 7000, 600, 0, '', NULL, NULL),
('Sable', 'Arma', 'sab', 1, 10, 8, 7000, 4, 17, 0, 10000, 500, 0, '', NULL, NULL),
('Hacha de bárbaro', 'Arma', 'hbar', 0, 8, 11, 12000, 5, 19, 0, 7000, 700, 0, '', NULL, NULL),
('Espada de bárbaro', 'Arma', 'esbar', 0, 8, 6, 4000, 5, 16, 0, 10000, 600, 0, '', NULL, NULL),
('Ballesta', 'Artilugio', 'bal', 0, 0, 12, 12000, 0, 35, 0, 0, 0, 0, '', NULL, NULL),
('Estrella del alba', 'Arma', 'mst', 1, 12, 7, 3500, 2, 16, 0, 6000, 800, 0, '', NULL, NULL),
('Daga de diente de dragon', 'Arma', 'ddd', 0, 7, 3, 800, 6, 4, 0, 1000, 600, 0, '', NULL, NULL),
('Hacha de leñador', 'Arma', 'hlen', 1, 5, 5, 1100, 4, 10, 0, 12000, 300, 0, '', NULL, NULL),
('Maza de oro', 'Arma', 'mazor', 0, 10, 6, 14000, 3, 19, 0, 1000, 1500, 0, '', NULL, NULL),
('Maza', 'Arma', 'maz', 1, 5, 5, 1000, 1, 13, 0, 11000, 350, 0, '', NULL, NULL),
('Espada curva', 'Arma', 'escur', 0, 6, 4, 900, 3, 10, 0, 3000, 400, 0, '', NULL, NULL),
('Espada larga', 'Arma', 'esplg', 1, 6, 4, 700, 4, 8, 0, 10000, 300, 0, '', NULL, NULL),
('Daga de oro', 'Arma', 'doro', 0, 10, 6, 6000, 5, 16, 0, 1000, 1000, 0, '', NULL, NULL),
('Lanzaclavos', 'Artilugio', 'plc', 0, 0, 8, 2000, 0, 14, 0, 0, 0, 0, '', NULL, NULL),
('Espada', 'Arma', 'espp', 1, 6, 3, 300, 3, 5, 0, 20000, 200, 0, '', NULL, NULL),
('Hacha de hueso', 'Arma', 'hh', 0, 2, 2, 2000, 4, 9, 0, 400, 1000, 0, '', NULL, NULL),
('Espada roma', 'Arma', 'esrom', 0, 2, 2, 100, 4, 2, 0, 10000, 100, 0, '', NULL, NULL),
('Daga de jade', 'Arma', 'dja', 0, 4, 2, 600, 3, 7, 0, 5000, 300, 0, '', NULL, NULL),
('Daga de cobre', 'Arma', 'dcob', 0, 2, 1, 300, 3, 3, 0, 5000, 100, 0, '', NULL, NULL),
('Espada corta', 'Arma', 'ecor', 1, 5, 1, 100, 2, 3, 0, 20000, 100, 0, '', NULL, NULL),
('Daga', 'Arma', 'dco', 1, 3, 1, 40, 1, 2, 0, 20000, 30, 0, '', NULL, NULL),
('Cuchillo de carnicero', 'Arma', 'cuc', 1, 2, 1, 20, 0, 2, 0, 35000, 20, 0, '', NULL, NULL),
('Cuchillo', 'Arma', 'cupeq', 1, 1, 1, 10, 0, 1, 0, 30000, 10, 0, '', NULL, NULL),
('Espada de atrezzo', 'Arma', 'eatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo celestial', 'Escudo', 'edcel', 0, 37, 33, 4000000, 37, 0, 0, 50, 100000, 0, '', NULL, NULL),
('Escudo del averno', 'Escudo', 'edav', 0, 35, 33, 4000000, 30, 7, 0, 60, 90000, 0, '', NULL, NULL),
('Escudo pensante', 'Escudo', 'epens', 0, 30, 29, 2000000, 21, 14, 0, 100, 70000, 0, '', NULL, NULL),
('Escudo del guardián', 'Escudo', 'edpos', 0, 25, 22, 1200000, 21, 12, 0, 100, 60000, 0, '', NULL, NULL),
('Escudo de fuego mágico', 'Escudo', 'esfm', 0, 23, 21, 780000, 20, 11, 0, 500, 40000, 0, '', NULL, NULL),
('Escudo de vampiro', 'Escudo', 'evamp', 0, 22, 20, 625000, 23, 7, 0, 500, 20000, 0, '', NULL, NULL),
('Escudo perdido de la orden', 'Escudo', 'edord', 0, 20, 25, 400000, 29, 0, 0, 20, 90000, 0, '', NULL, NULL),
('Escudo del oráculo', 'Escudo', 'eorac', 0, 20, 16, 400000, 24, 4, 0, 1000, 10000, 0, '', NULL, NULL),
('Escudo de camaleón', 'Escudo', 'ecml', 0, 17, 14, 260000, 24, 0, 0, 2000, 3000, 0, '', NULL, NULL),
('Escudo de escamas de dragón', 'Escudo', 'eedd', 0, 15, 10, 180000, 20, 0, 0, 5000, 1000, 0, '', NULL, NULL),
('Escudo del invocador', 'Escudo', 'einv', 0, 15, 11, 180000, 18, 2, 0, 3000, 1500, 0, '', NULL, NULL),
('Escudo del observador', 'Escudo', 'eobs', 0, 13, 9, 67000, 16, 0, 0, 300, 1000, 0, '', NULL, NULL),
('Escudo de oro', 'Escudo', 'eoro', 0, 10, 6, 47000, 14, 0, 0, 1000, 2000, 0, '', NULL, NULL),
('Escudo de la naturaleza', 'Escudo', 'eont', 0, 10, 6, 16000, 12, 0, 0, 5000, 600, 0, '', NULL, NULL),
('Escudo de guardia', 'Escudo', 'egrn', 0, 7, 5, 6400, 10, 0, 0, 10000, 400, 0, '', NULL, NULL),
('Escudo de hielo', 'Escudo', 'ehil', 0, 8, 5, 4500, 9, 0, 0, 10000, 300, 0, '', NULL, NULL),
('Escudo bárbaro', 'Escudo', 'ebar', 0, 6, 3, 4000, 8, 1, 0, 10000, 200, 0, '', NULL, NULL),
('Escudo lanzaagujas', 'Artilugio', 'ela', 0, 0, 4, 700, 0, 10, 0, 0, 0, 0, '', NULL, NULL),
('Escudo lanzaclavos', 'Artilugio', 'elc', 0, 0, 4, 500, 2, 7, 0, 0, 0, 0, '', NULL, NULL),
('Escudo pegajoso permanente', 'Artilugio', 'epega', 0, 0, 3, 3200, 14, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo pegajoso', 'Artilugio', 'epeg', 0, 0, 2, 710, 7, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo de placas', 'Escudo', 'epla', 1, 6, 2, 3500, 7, 0, 0, 20000, 100, 0, '', NULL, NULL),
('Escudo con pinchos', 'Escudo', 'ep', 1, 3, 2, 1050, 5, 1, 0, 20000, 50, 0, '', NULL, NULL),
('Escudo de hierro', 'Escudo', 'emet', 1, 2, 1, 100, 5, 0, 0, 25000, 20, 0, '', NULL, NULL),
('Escudo de madera', 'Escudo', 'em', 1, 1, 1, 50, 4, 0, 0, 30000, 10, 0, '', NULL, NULL),
('Escudo militar de atrezzo', 'Escudo', 'esmatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo de atrezzo', 'Escudo', 'esatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Botas celestiales', 'Botas', 'botpp', 0, 32, 30, 4000000, 3, 2, 0, 100, 75000, 0, '', NULL, NULL),
('Botas del averno', 'Botas', 'botav', 0, 30, 30, 4000000, 3, 2, 0, 100, 70000, 0, '', NULL, NULL),
('Botas de la oscuridad', 'Botas', 'botos', 0, 20, 15, 1600000, 3, 1, 0, 100, 10000, 0, '', NULL, NULL),
('Botas de oro', 'Botas', 'boto', 0, 10, 6, 390000, 3, 0, 0, 100, 1000, 0, '', NULL, NULL),
('Botas de escamas de dragón', 'Botas', 'botpd', 0, 15, 10, 880000, 3, 0, 0, 100, 500, 0, '', NULL, NULL),
('Botas de infantería', 'Botas', 'botinf', 0, 15, 14, 80000, 2, 1, 0, 100, 400, 0, '', NULL, NULL),
('Botas de acero', 'Botas', 'botar', 1, 5, 1, 1000, 1, 1, 0, 10000, 150, 0, '', NULL, NULL),
('Botas forradas', 'Botas', 'botf', 1, 1, 1, 300, 2, 0, 0, 20000, 15, 0, '', NULL, NULL),
('Botas de cuero', 'Botas', 'botl', 1, 1, 1, 30, 1, 0, 0, 30000, 10, 0, '', NULL, NULL),
('Coraza del averno', 'Coraza', 'cbaver', 0, 39, 39, 9000000, 22, 6, 0, 40, 175000, 0, '', NULL, NULL),
('Coraza celestial', 'Coraza', 'cril', 0, 39, 39, 9000000, 28, 0, 0, 60, 150000, 0, '', NULL, NULL),
('Coraza de fuego mágico', 'Coraza', 'cfm', 0, 25, 23, 2000000, 22, 4, 0, 500, 40000, 0, '', NULL, NULL),
('Coraza de la oscuridad', 'Coraza', 'cosco', 0, 22, 20, 1400000, 21, 3, 0, 1500, 30000, 0, '', NULL, NULL),
('Coraza encantada', 'Coraza', 'core', 0, 19, 17, 700000, 21, 0, 0, 2000, 13000, 0, '', NULL, NULL),
('Coraza de caparazón', 'Coraza', 'cpes', 0, 17, 15, 500000, 19, 0, 0, 3000, 9000, 0, '', NULL, NULL),
('Coraza de escamas de dragón', 'Coraza', 'ced', 0, 15, 10, 300000, 17, 0, 0, 3000, 5000, 0, '', NULL, NULL),
('Coraza de la corona', 'Coraza', 'ccor', 0, 13, 11, 47000, 16, 0, 0, 5000, 4500, 0, '', NULL, NULL),
('Coraza de hielo', 'Coraza', 'chie', 0, 11, 8, 36000, 15, 0, 0, 5000, 4000, 0, '', NULL, NULL),
('Coraza desmontable de oro', 'Coraza', 'coro', 0, 10, 6, 25000, 14, 0, 0, 500, 7000, 0, '', NULL, NULL),
('Coraza de cota de mallas', 'Coraza', 'ccm', 0, 12, 10, 17000, 13, 0, 0, 5000, 1000, 0, '', NULL, NULL),
('Coraza de batalla', 'Coraza', 'cbt', 0, 7, 5, 12000, 10, 2, 0, 9000, 500, 0, '', NULL, NULL),
('Coraza desmontable', 'Coraza', 'cdes', 1, 7, 3, 3000, 10, 0, 0, 10000, 400, 0, '', NULL, NULL),
('Coraza de placas', 'Coraza', 'cpl', 1, 4, 2, 580, 8, 0, 0, 20000, 200, 0, '', NULL, NULL),
('Coraza de cuero reforzado', 'Coraza', 'ccr', 1, 3, 1, 260, 5, 0, 0, 10000, 100, 0, '', NULL, NULL),
('Coraza de cuero', 'Coraza', 'corc', 1, 1, 1, 90, 3, 0, 0, 20000, 30, 0, '', NULL, NULL),
('Chaleco de cuero', 'Coraza', 'cc', 1, 1, 1, 20, 1, 0, 0, 20000, 10, 0, '', NULL, NULL),
('Coraza de atrezzo', 'Coraza', 'catr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Coraza militar de atrezzo', 'Coraza', 'cmatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Perneras del averno', 'Perneras', 'qcbaver', 0, 39, 39, 8000000, 18, 6, 0, 40, 175000, 0, '', NULL, NULL),
('Perneras celestiales', 'Perneras', 'qcril', 0, 39, 39, 8000000, 24, 0, 0, 60, 150000, 0, '', NULL, NULL),
('Perneras de fuego mágico', 'Perneras', 'qcfm', 0, 25, 23, 2100000, 17, 4, 0, 500, 40000, 0, '', NULL, NULL),
('Perneras de la oscuridad', 'Perneras', 'qcosco', 0, 22, 20, 1300000, 16, 3, 0, 1500, 30000, 0, '', NULL, NULL),
('Perneras encantadas', 'Perneras', 'qcore', 0, 19, 17, 800000, 16, 0, 0, 2000, 13000, 0, '', NULL, NULL),
('Perneras de caparazón', 'Perneras', 'qcpes', 0, 17, 15, 400000, 14, 0, 0, 3000, 9000, 0, '', NULL, NULL),
('Perneras de escamas de dragón', 'Perneras', 'qced', 0, 15, 10, 200000, 13, 0, 0, 3000, 5000, 0, '', NULL, NULL),
('Perneras de la corona', 'Perneras', 'qccor', 0, 13, 11, 100000, 12, 0, 0, 5000, 4500, 0, '', NULL, NULL),
('Perneras de hielo', 'Perneras', 'qchie', 0, 11, 8, 50000, 10, 0, 0, 5000, 4000, 0, '', NULL, NULL),
('Perneras desmontables de oro', 'Perneras', 'qcoro', 0, 10, 6, 30000, 8, 0, 0, 500, 7000, 0, '', NULL, NULL),
('Perneras de cota de mallas', 'Perneras', 'qccm', 0, 12, 10, 17000, 7, 0, 0, 5000, 1000, 0, '', NULL, NULL),
('Perneras de batalla', 'Perneras', 'qcbt', 0, 7, 5, 15000, 5, 2, 0, 9000, 500, 0, '', NULL, NULL),
('Perneras desmontables', 'Perneras', 'qcdes', 1, 7, 3, 4000, 5, 0, 0, 10000, 400, 0, '', NULL, NULL),
('Perneras de placas', 'Perneras', 'qcpl', 1, 4, 2, 780, 3, 0, 0, 20000, 200, 0, '', NULL, NULL),
('Perneras de cuero reforzado', 'Perneras', 'qccr', 1, 3, 1, 260, 2, 0, 0, 10000, 100, 0, '', NULL, NULL),
('Perneras de cuero', 'Perneras', 'qcc', 1, 1, 1, 20, 1, 0, 0, 20000, 10, 0, '', NULL, NULL),
('Yelmo celestial', 'Yelmo', 'ycel', 0, 31, 30, 3000000, 25, 0, 0, 30, 92000, 0, '', NULL, NULL),
('Casco del averno', 'Yelmo', 'caver', 0, 30, 30, 3000000, 18, 7, 0, 40, 80000, 0, '', NULL, NULL),
('Yelmo etereo', 'Yelmo', 'ceter', 0, 29, 29, 20000, 22, 3, 0, 3000, 8000, 1, '', NULL, NULL),
('Yelmo de fuego mágico', 'Yelmo', 'yfm', 0, 28, 25, 1400000, 19, 4, 0, 1500, 40000, 0, '', NULL, NULL),
('Yelmo encantado', 'Yelmo', 'yenc', 0, 25, 23, 900000, 20, 0, 0, 1500, 30000, 0, '', NULL, NULL),
('Yelmo de la corona', 'Yelmo', 'cccor', 0, 18, 16, 200000, 18, 0, 0, 2000, 16400, 0, '', NULL, NULL),
('Casco pesado', 'Yelmo', 'ypes', 0, 16, 13, 78000, 15, 0, 0, 2000, 10000, 0, '', NULL, NULL),
('Yelmo de guerrero', 'Yelmo', 'cguer', 0, 15, 13, 52000, 13, 1, 0, 2300, 7400, 0, '', NULL, NULL),
('Casco de cota de mallas', 'Yelmo', 'cccm', 0, 14, 12, 45000, 13, 0, 0, 3000, 6000, 0, '', NULL, NULL),
('Casco de escamas de dragón', 'Yelmo', 'cced', 0, 12, 10, 50000, 12, 0, 0, 2000, 7000, 0, '', NULL, NULL),
('Yelmo de oro', 'Yelmo', 'yoro', 0, 10, 6, 35000, 11, 0, 0, 1000, 4000, 0, '', NULL, NULL),
('Yelmo de batalla', 'Yelmo', 'ybt', 0, 9, 7, 26000, 9, 2, 0, 4000, 900, 0, '', NULL, NULL),
('Yelmo de hielo', 'Yelmo', 'chil', 0, 9, 6, 18000, 9, 0, 0, 5000, 600, 0, '', NULL, NULL),
('Yelmo con celada', 'Yelmo', 'ccel', 0, 7, 4, 8000, 8, 0, 0, 15000, 300, 0, '', NULL, NULL),
('Yelmo de infantería', 'Yelmo', 'yinf', 1, 10, 3, 3000, 6, 0, 0, 10000, 200, 0, '', NULL, NULL),
('Casco de placas', 'Yelmo', 'cpla', 1, 6, 2, 600, 5, 0, 0, 10000, 400, 0, '', NULL, NULL),
('Casco cerrado de hierro', 'Yelmo', 'chc', 1, 6, 2, 240, 3, 0, 0, 10000, 200, 0, '', NULL, NULL),
('Casco de hierro', 'Yelmo', 'ch', 1, 3, 1, 120, 2, 0, 0, 20000, 100, 0, '', NULL, NULL),
('Casco de cuero', 'Yelmo', 'ccu', 1, 1, 1, 30, 1, 0, 0, 30000, 10, 0, '', NULL, NULL),
('Amuleto celestial', 'Amuleto', 'amc', 0, 31, 30, 170000, 4, 2, 15, 10, 110000, 0, '', NULL, NULL),
('Amuleto del averno', 'Amuleto', 'ama', 0, 32, 30, 150000, 3, 3, 15, 20, 100000, 0, '', NULL, NULL),
('Collar protector etereo', 'Amuleto', 'cetr', 0, 1, 10, 6000, 12, 0, 30, 200, 1000, 1, '', NULL, NULL),
('Amuleto de ataque', 'Amuleto', 'aat', 0, 10, 12, 3000, 0, 3, 10, 500, 800, 0, '', NULL, NULL),
('Amuleto de la vida', 'Amuleto', 'avid', 0, 10, 12, 3000, 0, 0, 20, 500, 800, 0, '', NULL, NULL),
('Collar protector de oro', 'Amuleto', 'cpro', 0, 1, 4, 1000, 1, 0, 10, 500, 500, 0, '', NULL, NULL),
('Collar protector', 'Amuleto', 'cprot', 0, 1, 5, 500, 1, 0, 5, 500, 300, 0, '', NULL, NULL),
('Collar de la suerte', 'Amuleto', 'csrt', 0, 1, 1, 50, 0, 0, 10, 500, 100, 0, '', NULL, NULL),
('Pócima de agua del sino', 'Poción', 'ppphh', 0, 34, 1, 120000, 24, 24, 0, 50, 9000, 1, '', NULL, NULL),
('Frasco de agua del sino', 'Poción', 'pfphh', 0, 29, 1, 60000, 18, 18, 0, 100, 6000, 1, '', NULL, NULL),
('Vial de agua del sino', 'Poción', 'pvphh', 0, 25, 1, 30000, 12, 12, 0, 200, 3000, 1, '', NULL, NULL),
('Pócima de onyx líquido', 'Poción', 'pppny', 0, 24, 1, 15000, 24, 0, 0, 500, 900, 1, '', NULL, NULL),
('Frasco de onyx líquido', 'Poción', 'pfpny', 0, 19, 1, 10000, 18, 0, 0, 1000, 600, 1, '', NULL, NULL),
('Vial de onyx líquido', 'Poción', 'pvpny', 0, 15, 1, 5000, 12, 0, 0, 2000, 300, 1, '', NULL, NULL),
('Pócima de agua de los deseos', 'Poción', 'pppch', 0, 24, 1, 15000, 0, 24, 0, 500, 900, 1, '', NULL, NULL),
('Frasco de agua de los deseos', 'Poción', 'pfpch', 0, 19, 1, 10000, 0, 18, 0, 1000, 600, 1, '', NULL, NULL),
('Vial de agua de los deseos', 'Poción', 'pvpch', 0, 15, 1, 5000, 0, 12, 0, 2000, 300, 1, '', NULL, NULL),
('Pócima de agua de la justicia', 'Poción', 'ppj', 0, 14, 1, 6000, 8, 8, 0, 3000, 130, 1, '', NULL, NULL),
('Frasco de agua de la justicia', 'Poción', 'pfj', 0, 9, 1, 3000, 4, 4, 0, 4000, 110, 1, '', NULL, NULL),
('Vial de agua de la justicia', 'Poción', 'pvj', 0, 5, 1, 1000, 2, 2, 0, 10000, 80, 1, '', NULL, NULL),
('Pócima de polen de hidra', 'Poción', 'ppphi', 0, 14, 1, 4000, 10, 0, 0, 3000, 120, 1, '', NULL, NULL),
('Frasco de polen de hidra', 'Poción', 'pfphi', 0, 9, 1, 2000, 7, 0, 0, 4000, 100, 1, '', NULL, NULL),
('Vial de polen de hidra', 'Poción', 'pvphi', 0, 5, 1, 1000, 4, 0, 0, 10000, 80, 1, '', NULL, NULL),
('Pócima de sangre de dragón', 'Poción', 'ppsd', 0, 14, 1, 4000, 0, 10, 0, 3000, 120, 1, '', NULL, NULL),
('Frasco de sangre de dragón', 'Poción', 'pfsd', 0, 9, 1, 2000, 0, 7, 0, 4000, 100, 1, '', NULL, NULL),
('Vial de sangre de dragón', 'Poción', 'pvsd', 0, 5, 1, 1000, 0, 4, 0, 10000, 80, 1, '', NULL, NULL),
('Pócima de savia de hidra', 'Poción', 'ppshi', 0, 1, 1, 700, 3, 0, 0, 10000, 60, 1, '', NULL, NULL),
('Frasco de savia de hidra', 'Poción', 'pfshi', 0, 1, 1, 450, 2, 0, 0, 10000, 40, 1, '', NULL, NULL),
('Vial de savia de hidra', 'Poción', 'pvshi', 0, 1, 1, 200, 1, 0, 0, 10000, 20, 1, '', NULL, NULL),
('Pócima de sangre de heroe', 'Poción', 'ppsh', 0, 1, 1, 700, 0, 3, 0, 10000, 60, 1, '', NULL, NULL),
('Frasco de sangre de heroe', 'Poción', 'pfsh', 0, 1, 1, 450, 0, 2, 0, 10000, 40, 1, '', NULL, NULL),
('Vial de sangre de heroe', 'Poción', 'pvsh', 0, 1, 1, 200, 0, 1, 0, 10000, 20, 1, '', NULL, NULL),
('Preparado casero de fuerza', 'Poción', 'ppf', 1, 1, 1, 200, 0, 1, 0, 10000, 10, 1, '', NULL, NULL),
('Preparado casero de agilidad', 'Poción', 'ppa', 1, 1, 1, 200, 1, 0, 0, 10000, 10, 1, '', NULL, NULL),
('Espada suprema', 'Arma', 'rres', 0, 69, 69, 120000000, 8, 78, 0, 5, 300000, 0, '', NULL, NULL),
('Espada maldita', 'Arma', 'rrem', 0, 65, 69, 100000000, 10, 75, 0, 5, 280000, 0, '', NULL, NULL),
('Sable del maestro artesano', 'Arma', 'rrsma', 0, 69, 69, 90000000, 13, 72, 0, 15, 240000, 0, '', NULL, NULL),
('Espada mitológica', 'Arma', 'ref', 0, 69, 69, 80000000, 22, 62, 0, 30, 180000, 0, '', NULL, NULL),
('Espada de la luz', 'Arma', 'rehe', 0, 69, 65, 70000000, 21, 61, 0, 50, 160000, 0, '', NULL, NULL),
('Hacha maldita', 'Arma', 'rrhma', 0, 69, 65, 70000000, 11, 71, 0, 10, 220000, 0, '', NULL, NULL),
('Espada curva artesanal', 'Arma', 'rreca', 0, 68, 66, 65000000, 20, 61, 0, 50, 160000, 0, '', NULL, NULL),
('Hacha encantada', 'Arma', 'rrhe', 0, 66, 65, 65000000, 16, 65, 0, 30, 170000, 0, '', NULL, NULL),
('Espada gigante', 'Arma', 'regig', 0, 64, 61, 50000000, 20, 60, 0, 70, 120000, 0, '', NULL, NULL),
('Espada del maestro artesano', 'Arma', 'remar', 0, 62, 59, 39000000, 20, 57, 0, 150, 100000, 0, '', NULL, NULL),
('Maza equilibrada', 'Arma', 'rmeq', 0, 59, 56, 32000000, 20, 54, 0, 200, 90000, 0, '', NULL, NULL),
('Sable real', 'Arma', 'rrsr', 0, 59, 55, 32500000, 15, 59, 0, 100, 120000, 0, '', NULL, NULL),
('Mandoble artesanal', 'Arma', 'rrmd', 0, 57, 55, 28000000, 25, 48, 0, 300, 90000, 0, '', NULL, NULL),
('Cimitarra artesanal', 'Arma', 'rcim', 0, 55, 53, 25000000, 20, 52, 0, 300, 80000, 0, '', NULL, NULL),
('Espada rúnica', 'Arma', 'rrer', 0, 55, 51, 26000000, 15, 57, 0, 400, 75000, 0, '', NULL, NULL),
('Espada artesanal', 'Arma', 'rreq', 0, 55, 51, 23000000, 15, 56, 0, 500, 65000, 0, '', NULL, NULL),
('Ballesta de energía', 'Artilugio', 'bale', 0, 0, 35, 32000000, 0, 85, 0, 0, 0, 0, '', NULL, NULL),
('Cetro encantado', 'Arma', 'rcen', 0, 53, 51, 20000000, 10, 60, 0, 100, 100000, 0, '', NULL, NULL),
('Hacha del guardián', 'Arma', 'rhg', 0, 52, 50, 18000000, 14, 55, 0, 400, 65000, 0, '', NULL, NULL),
('Martillo de hueso de gigante', 'Arma', 'rmh', 0, 50, 47, 14000000, 17, 51, 0, 700, 60000, 0, '', NULL, NULL),
('Martillo de guerra sagrado', 'Arma', 'rrmgs', 0, 49, 47, 14500000, 14, 54, 0, 500, 70000, 0, '', NULL, NULL),
('Espada del heroe', 'Arma', 'rreh', 0, 50, 48, 14000000, 21, 47, 0, 300, 75000, 0, '', NULL, NULL),
('Daga rúnica', 'Arma', 'rrdr', 0, 49, 46, 13200000, 18, 49, 0, 500, 60000, 0, '', NULL, NULL),
('Espada equilibrada', 'Arma', 'req', 0, 50, 46, 13000000, 20, 47, 0, 800, 55000, 0, '', NULL, NULL),
('Maza de hechicero', 'Arma', 'rmzh', 0, 48, 45, 10000000, 21, 46, 0, 1000, 50000, 0, '', NULL, NULL),
('Espada extraña dorada', 'Arma', 'rreeo', 0, 47, 42, 9000000, 15, 50, 0, 600, 40000, 0, '', NULL, NULL),
('Cetro druida de los elementos', 'Arma', 'rrce', 0, 47, 47, 11000000, 35, 30, 0, 100, 80000, 0, '', NULL, NULL),
('Espada protectora', 'Arma', 'rrep', 0, 48, 44, 9000000, 26, 39, 0, 300, 70000, 0, '', NULL, NULL),
('Hacha vikinga', 'Arma', 'rhv', 0, 46, 44, 8500000, 17, 48, 0, 1300, 30000, 0, '', NULL, NULL),
('Hacha de coral', 'Arma', 'rrhc', 0, 46, 42, 10000000, 7, 58, 0, 300, 80000, 0, '', NULL, NULL),
('Maza rúnica', 'Arma', 'rrmc', 0, 45, 43, 8000000, 12, 52, 0, 1000, 32000, 0, '', NULL, NULL),
('Daga ceremonial', 'Arma', 'rdcer', 0, 44, 42, 7000000, 19, 45, 0, 1500, 25000, 0, '', NULL, NULL),
('Cuchilla robaalmas', 'Arma', 'rrcr', 0, 42, 40, 8000000, 2, 60, 0, 35, 50000, 0, '', NULL, NULL),
('Robaalmas espectral', 'Arma', 'raesp', 0, 42, 40, 8000000, 1, 60, 0, 50, 45000, 0, '', NULL, NULL),
('Martillo de guerra rúnico', 'Arma', 'rrmgr', 0, 44, 42, 6000000, 12, 47, 0, 300, 30000, 0, '', NULL, NULL),
('Martillo del trueno', 'Arma', 'rmtru', 0, 44, 42, 5000000, 8, 50, 0, 70, 25000, 0, '', NULL, NULL),
('Espada de la gárgola', 'Arma', 'rreg', 0, 43, 40, 6000000, 18, 41, 0, 1000, 25000, 0, '', NULL, NULL),
('Hacha del nigromante', 'Arma', 'rrhg', 0, 43, 40, 5000000, 18, 40, 0, 1000, 25000, 0, '', NULL, NULL),
('Hacha ceremonial', 'Arma', 'rhce', 0, 42, 40, 3000000, 10, 46, 0, 100, 25000, 0, '', NULL, NULL),
('Hacha equilibrada', 'Arma', 'rheq', 0, 40, 38, 2000000, 14, 40, 0, 1500, 20000, 0, '', NULL, NULL),
('Martillo rúnico', 'Arma', 'rrmar', 0, 39, 37, 1750000, 10, 44, 0, 1000, 20000, 0, '', NULL, NULL),
('Sable de la oscuridad', 'Arma', 'rrso', 0, 38, 36, 1500000, 5, 50, 0, 800, 30000, 0, '', NULL, NULL),
('Sable dorado', 'Arma', 'rrsd', 0, 36, 34, 1000000, 10, 45, 0, 1000, 24000, 0, '', NULL, NULL),
('Espada extraña', 'Arma', 'rree', 0, 36, 29, 850000, 14, 40, 0, 1000, 22000, 0, '', NULL, NULL),
('Martillo de hierro y madera', 'Arma', 'rrmm', 0, 10, 11, 14000, 7, 18, 0, 7000, 750, 0, '', NULL, NULL),
('Martillo de madera', 'Arma', 'rrmr', 0, 7, 5, 3800, 7, 14, 0, 8000, 620, 0, '', NULL, NULL),
('Escudo maldito', 'Escudo', 'remal', 0, 69, 69, 50000000, 52, 6, 0, 10, 120000, 0, '', NULL, NULL),
('Escudo extraño', 'Escudo', 'ree', 0, 66, 60, 38000000, 35, 20, 0, 30, 100000, 0, '', NULL, NULL),
('Escudo de protección', 'Escudo', 'rrea', 0, 64, 62, 36000000, 54, 0, 0, 80, 80000, 0, '', NULL, NULL),
('Escudo giratorio', 'Escudo', 'regi', 0, 62, 60, 32000000, 39, 15, 0, 100, 60000, 0, '', NULL, NULL),
('Escudo mitológico', 'Escudo', 'remi', 0, 60, 58, 28000000, 42, 11, 0, 100, 60000, 0, '', NULL, NULL),
('Escudo arcano', 'Escudo', 'rearc', 0, 58, 54, 22000000, 42, 10, 0, 200, 50000, 0, '', NULL, NULL),
('Escudo del maestro artesano', 'Escudo', 'rear', 0, 54, 52, 18000000, 44, 6, 0, 400, 33000, 0, '', NULL, NULL),
('Escudo de los enanos', 'Escudo', 'reen', 0, 52, 50, 16000000, 49, 0, 0, 700, 30000, 0, '', NULL, NULL),
('Escudo del heroe', 'Escudo', 'reh', 0, 50, 48, 12000000, 43, 5, 0, 500, 30000, 0, '', NULL, NULL),
('Escudo sagrado', 'Escudo', 'resag', 0, 48, 47, 8000000, 42, 4, 0, 700, 23000, 0, '', NULL, NULL),
('Escudo del geomante', 'Escudo', 'retal', 0, 46, 44, 6000000, 42, 0, 0, 800, 22000, 0, '', NULL, NULL),
('Escudo del nigromante', 'Escudo', 'reng', 0, 44, 42, 4500000, 30, 9, 0, 1000, 20000, 0, '', NULL, NULL),
('Escudo vikingo', 'Escudo', 'revik', 0, 44, 19, 3000000, 31, 2, 0, 300, 28000, 0, '', NULL, NULL),
('Escudo completo', 'Escudo', 'recm', 0, 44, 42, 4000000, 38, 0, 0, 1600, 16000, 0, '', NULL, NULL),
('Escudo ceremonial', 'Escudo', 'recer', 0, 42, 40, 3000000, 37, 0, 0, 1800, 16000, 0, '', NULL, NULL),
('Escudo espectral', 'Escudo', 'reesp', 0, 42, 40, 3000000, 30, 7, 0, 2000, 15000, 0, '', NULL, NULL),
('Escudo de infantería', 'Escudo', 'rresp', 0, 39, 38, 2900000, 35, 1, 0, 2000, 11000, 0, '', NULL, NULL),
('Escudo de soldado', 'Escudo', 'rreso', 0, 38, 37, 2900000, 30, 6, 0, 2000, 11000, 0, '', NULL, NULL),
('Escudo de batalla', 'Escudo', 'rreb', 0, 37, 35, 2700000, 28, 7, 0, 2000, 10000, 0, '', NULL, NULL),
('Botas aladas', 'Botas', 'rbala', 0, 60, 45, 10000000, 0, 8, 0, 15, 250000, 0, '', NULL, NULL),
('Botas extrañas', 'Botas', 'rbext', 0, 50, 40, 6000000, 3, 3, 0, 30, 150000, 0, '', NULL, NULL),
('Botas espectrales', 'Botas', 'rbesp', 0, 42, 40, 3000000, 2, 2, 0, 100, 15000, 0, '', NULL, NULL),
('Coraza mitológica real', 'Coraza', 'rracc', 0, 69, 69, 90000000, 42, 4, 0, 5, 220000, 0, '', NULL, NULL),
('Coraza mitológica', 'Coraza', 'rag', 0, 69, 67, 80000000, 42, 2, 0, 10, 160000, 0, '', NULL, NULL),
('Coraza real', 'Coraza', 'rracd', 0, 68, 66, 70000000, 40, 2, 0, 30, 140000, 0, '', NULL, NULL),
('Coraza demoniaca', 'Coraza', 'rdem', 0, 64, 62, 50000000, 20, 20, 0, 100, 70000, 0, '', NULL, NULL),
('Coraza arcana', 'Coraza', 'rar', 0, 58, 55, 30000000, 30, 7, 0, 200, 50000, 0, '', NULL, NULL),
('Coraza del maestro artesano', 'Coraza', 'rmar', 0, 54, 51, 22000000, 28, 6, 0, 300, 40000, 0, '', NULL, NULL),
('Coraza del heroe', 'Coraza', 'rher', 0, 50, 48, 16000000, 27, 5, 0, 500, 30000, 0, '', NULL, NULL),
('Coraza del nigromante', 'Coraza', 'rrcg', 0, 48, 46, 14000000, 20, 10, 0, 300, 40000, 0, '', NULL, NULL),
('Coraza sagrada', 'Coraza', 'rsag', 0, 48, 44, 12000000, 30, 1, 0, 700, 22000, 0, '', NULL, NULL),
('Coraza completa', 'Coraza', 'rcom', 0, 44, 42, 8000000, 29, 0, 0, 1600, 17000, 0, '', NULL, NULL),
('Coraza de caballería', 'Coraza', 'rrcc', 0, 45, 41, 9000000, 25, 5, 0, 600, 30000, 0, '', NULL, NULL),
('Coraza del capitán', 'Coraza', 'rrca', 0, 44, 42, 6700000, 28, 0, 0, 600, 30000, 0, '', NULL, NULL),
('Coraza ceremonial', 'Coraza', 'rcer', 0, 42, 40, 6600000, 27, 1, 0, 1800, 16200, 0, '', NULL, NULL),
('Coraza espectral', 'Coraza', 'resp', 0, 42, 40, 6000000, 22, 5, 0, 2000, 15000, 0, '', NULL, NULL),
('Coraza del geomante', 'Coraza', 'rrcgg', 0, 40, 39, 5700000, 26, 1, 0, 2000, 12000, 0, '', NULL, NULL),
('Coraza de guardián', 'Coraza', 'rrcgu', 0, 38, 37, 5500000, 26, 0, 0, 2000, 10000, 0, '', NULL, NULL),
('Perneras reales', 'Perneras', 'rrpr', 0, 69, 66, 48000000, 30, 2, 0, 30, 100000, 0, '', NULL, NULL),
('Perneras demoniacas', 'Perneras', 'rpdem', 0, 65, 60, 35000000, 15, 15, 0, 100, 70000, 0, '', NULL, NULL),
('Perneras arcanas', 'Perneras', 'rpar', 0, 58, 55, 25000000, 21, 8, 0, 200, 55000, 0, '', NULL, NULL),
('Perneras del maestro artesano', 'Perneras', 'rpma', 0, 54, 52, 19000000, 21, 6, 0, 300, 45000, 0, '', NULL, NULL),
('Perneras del heroe', 'Perneras', 'rpher', 0, 51, 49, 14000000, 20, 5, 0, 500, 35000, 0, '', NULL, NULL),
('Perneras sagradas', 'Perneras', 'rpsag', 0, 48, 42, 10000000, 23, 1, 0, 1000, 25000, 0, '', NULL, NULL),
('Perneras ceremoniales', 'Perneras', 'rpcer', 0, 42, 40, 5000000, 21, 1, 0, 1800, 16300, 0, '', NULL, NULL),
('Perneras espectrales', 'Perneras', 'rpesp', 0, 42, 40, 5000000, 17, 5, 0, 2000, 15000, 0, '', NULL, NULL),
('Perneras del geomante', 'Perneras', 'rrcpg', 0, 40, 39, 4700000, 21, 1, 0, 2000, 15000, 0, '', NULL, NULL),
('Yelmo mitológico', 'Yelmo', 'rymit', 0, 69, 66, 34000000, 30, 4, 0, 40, 120000, 0, '', NULL, NULL),
('Yelmo demoniaco', 'Yelmo', 'rydem', 0, 64, 61, 26000000, 16, 16, 0, 60, 80000, 0, '', NULL, NULL),
('Yelmo maldito', 'Yelmo', 'rcmit', 0, 61, 59, 20000000, 28, 6, 0, 100, 70000, 0, '', NULL, NULL),
('Yelmo arcano', 'Yelmo', 'ryar', 0, 58, 54, 14000000, 26, 6, 0, 200, 55000, 0, '', NULL, NULL),
('Yelmo del maestro artesano', 'Yelmo', 'rcmar', 0, 54, 51, 11000000, 25, 4, 0, 400, 35000, 0, '', NULL, NULL),
('Yelmo del heroe', 'Yelmo', 'rcher', 0, 50, 48, 7000000, 25, 2, 0, 500, 30000, 0, '', NULL, NULL),
('Casco sagrado', 'Yelmo', 'rcsag', 0, 48, 45, 4500000, 24, 2, 0, 700, 25000, 0, '', NULL, NULL),
('Casco vikingo', 'Yelmo', 'rcvik', 0, 44, 19, 3000000, 12, 8, 0, 400, 30000, 0, '', NULL, NULL),
('Casco ceremonial', 'Yelmo', 'rycer', 0, 42, 40, 2900000, 22, 3, 0, 1500, 20000, 0, '', NULL, NULL),
('Yelmo espectral', 'Yelmo', 'rcesp', 0, 42, 40, 2500000, 19, 5, 0, 2000, 15000, 0, '', NULL, NULL),
('Casco orco', 'Yelmo', 'rrcp', 0, 42, 40, 2200000, 19, 4, 0, 2000, 10000, 0, '', NULL, NULL),
('Amuleto supremo', 'Amuleto', 'ams', 0, 60, 60, 3000000, 5, 5, 30, 10, 180000, 0, '', NULL, NULL),
('Amuleto de la protección', 'Amuleto', 'rrap', 0, 40, 40, 47000, 5, 0, 20, 100, 38000, 0, '', NULL, NULL),
('Menú completo', 'Alimento', 'mcom', 0, 0, 1, 500000, 1400, 0, 0, 0, 0, 2, '', NULL, 'Ración completa de alimentos.\r\nTe alimentará durante días.'),
('Ración de gambas', 'Alimento', 'rgrg', 0, 69, 1, 180000, 200, 0, 0, 400, 2000, 2, '', NULL, 'Ración de deliciosos crustáceos marinos.'),
('Champiñón mágico', 'Alimento', 'rgchg', 0, 60, 1, 80000, 120, 0, 0, 500, 1000, 2, '', NULL, 'Seta roja con motas blancas.\r\nAdvertencia: su consumo puede provocar alucinaciones.'),
('Yogur de frutas', 'Alimento', 'yogf', 0, 0, 1, 80000, 120, 0, 0, 0, 0, 2, '', NULL, 'Delicioso yogur con frutos del bosque.\r\nA los niños les encanta.'),
('Jarra de bebida energética', 'Alimento', 'jbe', 0, 0, 1, 70000, 100, 0, 0, 0, 0, 2, '', NULL, 'Bebida compuesta principálmente por zumos de frutas y cafeina.'),
('Champiñón verde', 'Alimento', 'rgchv', 0, 55, 1, 48000, 80, 0, 0, 3000, 700, 2, '', NULL, 'Todo champiñón rojo, tiene su hermano champiñón verde.'),
('Champiñón', 'Alimento', 'rgch', 0, 50, 1, 38000, 60, 0, 0, 4000, 500, 2, '', NULL, 'Champiñón anaranjado con la copa redondeada.\r\nMuy cotizado entre los seteros.'),
('Jarra de batido de fresa', 'Alimento', 'jbf', 0, 0, 1, 37000, 65, 0, 0, 0, 0, 2, '', NULL, 'Ahora con un 37% de fruta.'),
('Filete de salmón', 'Alimento', 'rgfs', 0, 1, 1, 24000, 17, 0, 0, 4000, 300, 2, '', NULL, 'Trozo de salmón de los rios de Lifo.'),
('Jarra de batido de cacao', 'Alimento', 'jbc', 0, 0, 1, 24000, 50, 0, 0, 0, 0, 2, '', NULL, 'Leche, cacao y azucar.\r\nPerfecta combinación.'),
('Jarra de zumo de fresas', 'Alimento', 'jzf', 0, 0, 1, 24000, 50, 0, 0, 0, 0, 2, '', NULL, 'Ahora con un 100% de fruta.'),
('Ración de fresas', 'Alimento', 'rgrf', 0, 40, 1, 19000, 43, 0, 0, 4000, 250, 2, '', NULL, 'Fruta roja silvestre.\r\nSe puede encontrar en los bosques frondosos.'),
('Jarra de zumo de moras', 'Alimento', 'jzmo', 0, 0, 1, 19000, 43, 0, 0, 0, 0, 2, '', NULL, 'Zumo de moras silvestres.'),
('Ración de moras', 'Alimento', 'rgrm', 0, 35, 1, 16000, 37, 0, 0, 4000, 200, 2, '', NULL, 'Ración de moras silvestres.\r\nSi las recoges demasiado pronto se amargán.'),
('Chocolate', 'Alimento', 'choco', 0, 0, 1, 20000, 37, 0, 0, 500, 300, 2, '', NULL, 'Barra dulce de felicidad.\r\nContiene un 80% de cacao.'),
('Hamburguesa', 'Alimento', 'bur', 0, 0, 1, 19000, 37, 0, 0, 0, 0, 2, '', NULL, 'Alimento áltamente calórico.\r\nNo lleva pepinillos.'),
('Jarra de zumo de cerezas', 'Alimento', 'jzce', 0, 0, 1, 16000, 37, 0, 0, 0, 0, 2, '', NULL, 'Jarra de un dulce zumo de cerezas.'),
('Ensalada', 'Alimento', 'ens', 0, 0, 1, 10000, 30, 0, 0, 0, 0, 2, '', NULL, 'Alimento compuesto por verduras frescas.'),
('Ración de cerezas', 'Alimento', 'rgrc', 0, 31, 1, 13000, 33, 0, 0, 4000, 170, 2, '', NULL, 'Puñado de cerezas rojas.\r\nSon ácidas y dulces.'),
('Bizcocho', 'Alimento', 'rgbz', 0, 27, 1, 10000, 27, 0, 0, 5000, 150, 2, '', NULL, 'Masa dulce recién horneada.'),
('Empanada', 'Alimento', 'rgem', 0, 27, 1, 10000, 27, 0, 0, 5000, 150, 2, '', NULL, 'Masa salada horneada.\r\nPuede estar rellena de carne o pescado.'),
('Sopa de pollo y huevo', 'Alimento', 'sopp', 0, 0, 1, 9000, 25, 0, 0, 0, 0, 2, '', NULL, 'Sopa caliente.\r\nPara los frios inviernos de Lifo.'),
('Jarra de zumo de sandía', 'Alimento', 'jzs', 0, 0, 1, 5000, 21, 0, 0, 0, 0, 2, '', NULL, 'Zumo refrigerado de sandía.\r\nPerfecto para el verano de Lifo.'),
('Jarra de café con leche y azucar', 'Alimento', 'jacla', 0, 0, 1, 1600, 25, 0, 0, 0, 0, 2, '', NULL, 'Aliménto rico en cafeina.\r\nTómese con moderación.'),
('Jarra de café con azucar', 'Alimento', 'jaca', 0, 0, 1, 3000, 24, 0, 0, 0, 0, 2, '', NULL, 'Café sólo con azucar.'),
('Tortilla', 'Alimento', 'tor', 0, 0, 1, 4000, 25, 0, 0, 0, 0, 2, '', NULL, 'Plato de huevo batido y cocinado en sartén.'),
('Pescado grande', 'Alimento', 'rgpg', 0, 25, 1, 4000, 16, 0, 0, 5000, 120, 2, '', NULL, 'Gran pieza pescada en los mares de Lifo.'),
('Jarra de vino', 'Alimento', 'jv', 0, 0, 1, 4000, 20, 0, 0, 500, 120, 2, '', NULL, 'Mosto de uva que ha madurado con el tiempo.'),
('Jarra de cerveza', 'Alimento', 'jc', 0, 0, 1, 4000, 20, 0, 0, 600, 120, 2, '', NULL, 'Producto resultante del fermento de la cebada.\r\nContiene alcohol.'),
('Jarra de zumo de coco', 'Alimento', 'jzc', 0, 0, 1, 1500, 20, 0, 0, 0, 0, 2, '', NULL, 'Zumo de coco exprimido.\r\nSí, cocos exprimidos.'),
('Jarra de café con leche', 'Alimento', 'jacl', 0, 0, 1, 1000, 17, 0, 0, 0, 0, 2, '', NULL, 'Café con leche, sin azucar añadido.'),
('Azúcar', 'Alimento', 'saz', 0, 0, 1, 2000, 20, 0, 0, 500, 100, 2, '', NULL, 'Alimento dulce extraido de la remolacha o la caña de azucar.'),
('Jarra de mosto', 'Alimento', 'jm', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, '', NULL, 'Zumo de uva a penas fermentado.\r\nCon el tiempo se convierte en vino.'),
('Jarra de café', 'Alimento', 'jac', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, '', NULL, '100% café, 0% azucar'),
('Jarra de mosto de cebada', 'Alimento', 'jmc', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, '', NULL, 'Bebida obtenida a partir del 1° fermento de cebada.'),
('Solomillo', 'Alimento', 'rgs', 0, 23, 1, 3200, 15, 0, 0, 6000, 150, 2, '', NULL, 'Pedazo de carne jugoso.'),
('Frasco de aceite', 'Alimento', 'pfac', 0, 0, 1, 5000, 15, 0, 0, 0, 0, 2, '', NULL, 'Producto obtenido al prensar las aceitunas.'),
('Sandía', 'Alimento', 'rgsn', 0, 21, 1, 2400, 14, 0, 0, 8000, 120, 2, '', NULL, 'Fruta esférica verde acuosa con un interior rojo dulce.'),
('Palomitas de maiz', 'Alimento', 'pma', 0, 0, 1, 3000, 14, 0, 0, 0, 0, 2, '', NULL, 'Aperitivo a base de maiz.'),
('Yogur', 'Alimento', 'yog', 0, 0, 1, 2500, 14, 0, 0, 0, 0, 2, '', NULL, 'Produto agrio obtenido a partir del fermento de la leche.'),
('Ración de tostadas', 'Alimento', 'mantor', 0, 0, 1, 2000, 14, 0, 0, 0, 0, 2, '', NULL, 'Rebanadas de pan caliente.'),
('Coco', 'Alimento', 'rgc', 0, 18, 1, 1900, 13, 0, 0, 8000, 100, 2, '', NULL, 'Fruta esférica dura que crece en la cumbre de las palmeras.'),
('Calabaza', 'Alimento', 'rgcz', 0, 14, 1, 1500, 12, 0, 0, 8000, 80, 2, '', NULL, 'Hortaliza esferica anaranjada.\r\nIdeal para purés.'),
('Jarra de batido de plátano', 'Alimento', 'jbp', 0, 0, 1, 1700, 30, 0, 0, 0, 0, 2, '', NULL, 'Batido de platano y leche muy popular.\r\nA veces se usa como moneda de cambio.'),
('Jarra de zumo de tomate', 'Alimento', 'jzt', 0, 0, 1, 750, 10, 0, 0, 0, 0, 2, '', NULL, 'Zumo de ... ¿fruta o verdura?'),
('Jarra de zumo de zanahoria', 'Alimento', 'jzz', 0, 0, 1, 750, 10, 0, 0, 0, 0, 2, '', NULL, 'Zumo de hortaliza.\r\nSe puede usar para hacer tartas dulces.'),
('Jarra de zumo de remolacha', 'Alimento', 'jzza', 0, 0, 1, 750, 10, 0, 0, 0, 0, 2, '', NULL, 'Zumo de remolachas exprimidas.\r\nSe usa comúnmente para la fabricación de azucar.'),
('Sopa', 'Alimento', 'sop', 0, 0, 1, 800, 11, 0, 0, 0, 0, 2, '', NULL, 'Caldo caliente.'),
('Queso', 'Alimento', 'rgq', 1, 6, 1, 750, 10, 0, 0, 2000, 60, 2, '', NULL, 'Alimento a partir de la maduración de la cuajada de leche.'),
('Mantequilla', 'Alimento', 'man', 0, 0, 1, 650, 9, 0, 0, 0, 0, 2, '', NULL, 'Obtenido a partir de la nata de la leche y sal.'),
('Pescado', 'Alimento', 'rgps', 1, 6, 1, 450, 9, 0, 0, 2000, 60, 2, '', NULL, 'Criatura marina que habita los mares de Lifo.'),
('Uvas', 'Alimento', 'rgu', 1, 6, 1, 350, 8, 0, 0, 2000, 60, 2, '', NULL, 'Fruta agria usada en la fabricación de zumos y vinos.'),
('Aceitunas', 'Alimento', 'pac', 0, 6, 1, 650, 8, 0, 0, 3000, 80, 2, '', NULL, 'Alimento usado en la fabricación de aceites.'),
('Jarra de zumo de plátano', 'Alimento', 'jzpl', 0, 0, 1, 350, 8, 0, 0, 0, 0, 2, '', NULL, 'Zumo de plátanos.\r\nEs bastante denso.'),
('Jarra de zumo de naranja', 'Alimento', 'jzn', 0, 0, 1, 350, 8, 0, 0, 0, 0, 2, '', NULL, '<i>Por la mañana oro,\r\npor la tarde plata y\r\npor la noche plomo</i>\r\n-Un desconocido-'),
('Barra de pan', 'Alimento', 'rgb', 1, 5, 1, 300, 7, 0, 0, 2000, 40, 2, '', NULL, 'Masa de harina y agua horneada.'),
('Huevo cocido', 'Alimento', 'hco', 0, 0, 1, 300, 7, 0, 0, 0, 0, 2, '', NULL, 'Huevo cocido listo para comer.'),
('Muslo de pollo', 'Alimento', 'rgmp', 1, 5, 1, 200, 6, 0, 0, 2000, 40, 2, '', NULL, 'Trozo de una pata de pollo.'),
('Huevo', 'Alimento', 'rgh', 1, 4, 1, 100, 5, 0, 0, 2000, 40, 2, '', NULL, 'Producto animal obtenido de las gallinas.'),
('Maiz', 'Alimento', 'rgma', 1, 3, 1, 60, 4, 0, 0, 2000, 30, 2, '', NULL, 'Hortaliza amarilla que crece en espiga.'),
('Lechuga', 'Alimento', 'lec', 1, 3, 1, 60, 4, 0, 0, 2000, 30, 2, '', NULL, 'Verdura verde rica en fibra.'),
('Jarra de zumo de manzana', 'Alimento', 'jzm', 0, 0, 1, 60, 4, 0, 0, 0, 0, 2, '', NULL, 'Zumo dulce de manzana.\r\nIngrediente para batidos y pasteles de manzana.'),
('Zanahoria', 'Alimento', 'rgz', 1, 2, 1, 30, 3, 0, 0, 2000, 30, 2, '', NULL, 'Hortaliza naranja alargada.'),
('Tomate', 'Alimento', 'rgt', 1, 2, 1, 30, 3, 0, 0, 2000, 15, 2, '', NULL, '(¿Fruta/verdura?) plantada en los huertos de Lifo.\r\nEs rica en agua.'),
('Remolacha', 'Alimento', 'grr', 1, 2, 1, 30, 3, 0, 0, 2000, 15, 2, '', NULL, 'Raiz a partir de la cuál se obtiene azucar.'),
('Jarra de zumo de pera', 'Alimento', 'jzp', 0, 0, 1, 30, 3, 0, 0, 0, 0, 2, '', NULL, 'Zumo de pera.\r\nIdeal para purés de frutas.'),
('Naranja', 'Alimento', 'rgn', 1, 2, 1, 10, 2, 0, 0, 2000, 10, 2, '', NULL, 'Fruta esférica narajan.\r\n<i>¿\"Naranja\" es por el color o por la fruta?</i>'),
('Plátano', 'Alimento', 'rgpl', 1, 1, 1, 10, 2, 0, 0, 2000, 10, 2, '', NULL, 'Fruto tropical que crece en las palmeras.'),
('Jarra de leche', 'Alimento', 'jl', 1, 1, 1, 10, 2, 0, 0, 2000, 10, 2, '', NULL, 'Producto animal obtenido a partir de vacas.'),
('Manzana', 'Alimento', 'rgm', 1, 1, 1, 5, 1, 0, 0, 2000, 5, 2, '', NULL, 'Fruto rojo que crece en árboles.'),
('Pera', 'Alimento', 'rgp', 1, 1, 1, 5, 1, 0, 0, 2000, 5, 2, '', NULL, 'Fruto verde rico en agua que crece en los árboles.'),
('Jarra de agua', 'Alimento', 'jag', 1, 1, 1, 5, 1, 0, 0, 2000, 5, 2, '', NULL, 'Elemento base de la vida en Lifo.'),
('Cristal de invocación del poder', 'Recurso', 'icip', 0, 0, 1, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Pergamino en blanco del poder', 'Recurso', 'pvp', 0, 0, 1, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Cristal de invocación', 'Recurso', 'ici', 1, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Pergamino en blanco', 'Recurso', 'pv', 1, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Polvo del caos', 'Recurso', 'cca', 1, 0, 1, 300, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Polvo del fuego', 'Recurso', 'cfu', 1, 0, 1, 260, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Polvo de la energía', 'Recurso', 'cen', 1, 0, 1, 180, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Polvo del hielo', 'Recurso', 'chi', 1, 0, 1, 260, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Polvo del tiempo', 'Recurso', 'cti', 1, 0, 1, 280, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Polvo de la vida', 'Recurso', 'cvi', 1, 0, 1, 280, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Jarra de agua del mar', 'Recurso', 'jagm', 1, 0, 1, 10, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Sal', 'Recurso', 'sal', 0, 0, 1, 10, 0, 0, 0, 500, 10, 4, '', NULL, NULL),
('Vial de alcohol puro', 'Recurso', 'pvap', 0, 0, 1, 4000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Trigo', 'Recurso', 'rtr', 1, 0, 1, 700, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Cebada', 'Recurso', 'rtc', 1, 0, 1, 700, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Granos de café', 'Recurso', 'pacf', 1, 0, 1, 300, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Granos de cacao', 'Recurso', 'paca', 0, 1, 1, 300, 0, 0, 0, 2000, 40, 4, '', NULL, NULL),
('Harina', 'Recurso', 'cha', 0, 0, 1, 150, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Levadura', 'Recurso', 'cle', 1, 0, 1, 350, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Cacao molido', 'Recurso', 'cm', 0, 0, 1, 600, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Café molido', 'Recurso', 'fm', 0, 0, 1, 350, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Frasco de vinagre', 'Recurso', 'pfv', 0, 0, 1, 5000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Hongo druida', 'Recurso', 'hdr', 0, 1, 1, 20, 0, 0, 0, 2000, 50, 4, '', NULL, NULL),
('Trozo de flor de hidra', 'Recurso', 'tfh', 0, 1, 1, 600, 0, 0, 0, 2000, 100, 4, '', NULL, NULL),
('Trozo de ala de dragón', 'Recurso', 'tad', 0, 1, 1, 600, 0, 0, 0, 2500, 100, 4, '', NULL, NULL),
('Onyx', 'Recurso', 'oyx', 0, 1, 1, 2000, 0, 0, 0, 1500, 200, 4, '', NULL, NULL),
('Roca de los deseos', 'Recurso', 'dd', 0, 1, 1, 2000, 0, 0, 0, 1500, 200, 4, '', NULL, NULL),
('Llave del grimorio del caos', 'Recurso', 'gtc', 0, 40, 1, 2000000, 0, 0, 0, 200, 12000, 4, '', NULL, NULL),
('Grimorio del caos cerrado', 'Recurso', 'lgccc', 0, 40, 1, 6000000, 0, 0, 0, 70, 20000, 4, '', NULL, NULL),
('Mercurio', 'Recurso', 'cme', 0, 0, 1, 200000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Oro líquido', 'Recurso', 'cmo', 0, 0, 1, 400000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Planta de algodón', 'Recurso', 'pal', 1, 0, 1, 500, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Algodón', 'Recurso', 'al', 0, 0, 1, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Muñeco', 'Recurso', 'mun', 0, 0, 1, 3000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Venda', 'Recurso', 'ven', 0, 0, 1, 2000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Tronco de madera', 'Recurso', 'tron', 1, 0, 1, 200, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Tronco de madera sabia', 'Recurso', 'tronms', 0, 20, 1, 18000, 0, 0, 0, 1000, 200, 4, '', NULL, NULL),
('Tablón de madera', 'Recurso', 'tabl', 0, 0, 1, 400, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Tablón de madera sabia', 'Recurso', 'tablms', 0, 0, 1, 40000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Savia', 'Recurso', 'salv', 0, 0, 1, 200, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Savia de madera sabia', 'Recurso', 'salvms', 0, 0, 1, 19000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Estatuilla de madera', 'Recurso', 'est', 0, 20, 1, 1000, 0, 0, 0, 2000, 200, 4, '', NULL, NULL),
('Estatuilla de madera sabia', 'Recurso', 'estms', 0, 30, 1, 60000, 0, 0, 0, 600, 600, 4, '', NULL, NULL),
('Hongo vudú', 'Recurso', 'honvud', 0, 10, 1, 200, 0, 0, 0, 2000, 200, 4, '', NULL, NULL),
('Esporas', 'Recurso', 'esp', 0, 0, 1, 2000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Aguja', 'Recurso', 'aguj', 0, 0, 1, 3, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Pinturas', 'Recurso', 'pint', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Hierro líquido', 'Recurso', 'hli', 0, 0, 1, 300, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Clavo', 'Recurso', 'clav', 0, 0, 1, 5, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Lingote de hierro', 'Recurso', 'hlin', 0, 0, 1, 600, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Lingote de oro', 'Recurso', 'olin', 0, 20, 1, 500000, 0, 0, 0, 100, 5000, 4, '', NULL, NULL),
('Mineral de mercurio', 'Recurso', 'minm', 0, 20, 1, 150000, 0, 0, 0, 500, 300, 4, '', NULL, NULL),
('Mineral de oro', 'Recurso', 'mino', 0, 20, 1, 300000, 0, 0, 0, 300, 500, 4, '', NULL, NULL),
('Mineral de hierro', 'Recurso', 'minh', 1, 10, 1, 200, 0, 0, 0, 2000, 20, 4, '', NULL, NULL),
('Minerales variados', 'Recurso', 'minv', 1, 5, 1, 75, 0, 0, 0, 2000, 10, 4, '', NULL, NULL),
('Vial de eter', 'Recurso', 'pvet', 0, 0, 1, 400, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Pegamento', 'Recurso', 'peg', 0, 0, 1, 700, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Espejo', 'Recurso', 'espj', 0, 0, 1, 250000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Espejo sabio', 'Recurso', 'esps', 0, 0, 1, 300000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Clavo de oro', 'Recurso', 'clavo', 0, 0, 1, 7500, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Aguja de oro', 'Recurso', 'agujo', 0, 0, 1, 4000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Herramientas de forja avanzada', 'Recurso', 'hfa', 0, 0, 1, 800, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Hueso', 'Recurso', 'hu', 0, 10, 1, 100, 0, 0, 0, 500, 20, 4, '', NULL, NULL),
('Calavera', 'Recurso', 'cal', 0, 10, 1, 150, 0, 0, 0, 400, 50, 4, '', NULL, NULL),
('Símbolo', 'Recurso', 'sm', 0, 30, 1, 10000, 0, 0, 0, 200, 800, 4, '', NULL, NULL),
('Símbolo de oro', 'Recurso', 'smo', 0, 30, 1, 100000, 0, 0, 0, 30, 3000, 4, '', NULL, NULL),
('Agua bendita', 'Recurso', 'ab', 0, 0, 1, 4, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Agua sagrada', 'Recurso', 'as', 0, 0, 1, 5000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Caja de portal dimensional', 'Recurso', 'cpd', 0, 70, 1, 25000000, 0, 0, 0, 4, 190000, 4, '', NULL, NULL),
('Esfera del averno', 'Recurso', 'eava', 0, 0, 1, 50000000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esfera celestial', 'Recurso', 'ecl', 0, 0, 1, 50000000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Carbón dulce', 'Alimento', 'carbond', 0, 0, 1, 0, 130, 0, 0, 0, 0, 2, '', NULL, 'Regalo que reciben, en navidad, los usuarios que han sido malos durante el año.'),
('Carbón', 'Recurso', 'carbon', 0, 0, 1, 0, 1300, 0, 0, 0, 0, 4, '', NULL, NULL),
('Hechizo: Caos', 'Hechizo', 'pcnn', 0, 0, 80, 0, 0, 100, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Aniquilación', 'Hechizo', 'pcnr', 0, 0, 70, 0, 0, 45, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Horda fantasmal', 'Hechizo', 'phf', 0, 0, 62, 0, 20, 20, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Invocación divina', 'Hechizo', 'phe', 0, 0, 61, 0, 12, 33, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Coraje divino', 'Hechizo', 'phd', 0, 0, 60, 0, 10, 24, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Materialización fantasmal', 'Hechizo', 'pmf', 0, 0, 53, 0, 10, 20, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Furia caótica', 'Hechizo', 'pcna', 0, 0, 50, 0, 0, 26, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Monstruosidad', 'Hechizo', 'pne', 0, 0, 50, 0, 0, 26, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Lanzador de clavos fantasmal', 'Hechizo', 'plcf', 0, 0, 47, 0, 0, 22, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Esqueleto veloz', 'Hechizo', 'pnd', 0, 0, 47, 0, 0, 22, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Desorden de la realidad', 'Hechizo', 'pcnz', 0, 0, 44, 0, 0, 20, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Congelar alma', 'Hechizo', 'pcca', 0, 0, 42, 0, 0, 20, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Devastación vudú', 'Hechizo', 'hve', 0, 0, 44, 0, 0, 19, 110, 0, 0, 1, '', NULL, NULL),
('Hechizo: Paradoja temporal', 'Hechizo', 'pcan', 0, 0, 39, 0, 5, 13, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Invocación fantasmal', 'Hechizo', 'pif', 0, 0, 40, 0, 0, 18, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Reflejo fantasmal', 'Hechizo', 'prf', 0, 0, 40, 0, 18, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Desatar infierno', 'Hechizo', 'pcrn', 0, 0, 39, 0, 0, 18, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Calavera voladora', 'Hechizo', 'pnc', 0, 0, 39, 0, 0, 18, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Velocidad', 'Hechizo', 'pcar', 0, 0, 35, 0, 7, 9, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Dragón de energía', 'Hechizo', 'pcbv', 0, 0, 35, 0, 0, 16, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Aura divina', 'Hechizo', 'phc', 0, 0, 35, 0, 16, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Inflingir enfermedad', 'Hechizo', 'pcnb', 0, 0, 37, 0, 0, 15, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Terremoto', 'Hechizo', 'pcvr', 0, 0, 31, 0, 0, 14, 90, 0, 0, 1, '', NULL, NULL),
('Hechizo: Enredaderas protectoras', 'Hechizo', 'pcva', 0, 0, 31, 0, 14, 0, 80, 0, 0, 1, '', NULL, NULL),
('Hechizo: Confusión vudú', 'Hechizo', 'hvd', 0, 0, 33, 0, 14, 0, 100, 0, 0, 1, '', NULL, NULL),
('Hechizo: Ayudante putrefacto', 'Hechizo', 'pnb', 0, 0, 33, 0, 0, 14, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Poder elemental del hielo', 'Hechizo', 'pccr', 0, 0, 31, 0, 7, 7, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Guerrero ilusorio', 'Hechizo', 'pcgi', 0, 0, 31, 0, 6, 8, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Llamada a la naturaleza', 'Hechizo', 'pcvv', 0, 0, 30, 0, 4, 9, 70, 0, 0, 1, '', NULL, NULL),
('Hechizo: Criatura de energía', 'Hechizo', 'pcbz', 0, 0, 28, 0, 0, 12, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Ayudante de huesos', 'Hechizo', 'pna', 0, 0, 28, 0, 0, 12, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Levitación', 'Hechizo', 'pcle', 0, 0, 28, 0, 12, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Soplo divino', 'Hechizo', 'phb', 0, 0, 28, 0, 12, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Presentir', 'Hechizo', 'pcav', 0, 0, 23, 0, 10, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Bendición', 'Hechizo', 'pha', 0, 0, 20, 0, 10, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Poder elemental del fuego', 'Hechizo', 'pcrv', 0, 0, 24, 0, 5, 5, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Gran variación del tiempo', 'Hechizo', 'pcaa', 0, 0, 20, 0, 4, 5, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Locura', 'Hechizo', 'pclo', 0, 0, 22, 0, 3, 6, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Enredaderas', 'Hechizo', 'pcvc', 0, 0, 20, 0, 2, 6, 50, 0, 0, 1, '', NULL, NULL),
('Hechizo: Ceguera vudú', 'Hechizo', 'hvc', 0, 0, 22, 0, 0, 8, 60, 0, 0, 1, '', NULL, NULL),
('Hechizo: Asfixia', 'Hechizo', 'pcba', 0, 0, 20, 0, 0, 8, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Aura de hielo', 'Hechizo', 'pccv', 0, 0, 18, 0, 7, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Rayo de fuego', 'Hechizo', 'pcra', 0, 0, 18, 0, 0, 7, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Control vudú', 'Hechizo', 'hvb', 0, 0, 20, 0, 0, 7, 40, 0, 0, 1, '', NULL, NULL),
('Hechizo: Rayo de hielo', 'Hechizo', 'pccm', 0, 0, 16, 0, 0, 6, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Variación del tiempo', 'Hechizo', 'pcab', 0, 0, 12, 0, 2, 3, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Falso eclipse', 'Hechizo', 'pce', 0, 0, 14, 0, 5, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Heridas cicatrizantes', 'Hechizo', 'pcvb', 0, 0, 14, 0, 5, 0, 20, 0, 0, 1, '', NULL, NULL),
('Hechizo: Aura de fuego', 'Hechizo', 'pcrz', 0, 0, 14, 0, 5, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Herida vudú', 'Hechizo', 'hva', 0, 0, 16, 0, 0, 5, 30, 0, 0, 1, '', NULL, NULL),
('Hechizo: Bola de fuego', 'Hechizo', 'pcrb', 0, 0, 12, 0, 0, 4, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Telekinesia', 'Hechizo', 'pcbr', 0, 0, 12, 0, 0, 4, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Falsas enredaderas', 'Hechizo', 'pcen', 0, 0, 12, 0, 0, 4, 10, 0, 0, 1, '', NULL, NULL),
('Hechizo: Fortaleza', 'Hechizo', 'pcbc', 0, 0, 9, 0, 3, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Bola de hielo', 'Hechizo', 'pccb', 0, 0, 9, 0, 0, 3, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Falsa niebla', 'Hechizo', 'pcno', 0, 0, 9, 0, 3, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Falsa neblina', 'Hechizo', 'pcn', 0, 0, 7, 0, 2, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Misil mágico', 'Hechizo', 'pmm', 0, 0, 5, 0, 0, 1, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Destello', 'Hechizo', 'pd', 0, 0, 5, 0, 1, 0, 0, 0, 0, 1, '', NULL, NULL),
('Arma adimensional', 'Arma', 'adima', 0, 0, 140, 0, 1, 140, 0, 0, 0, 0, '', NULL, NULL),
('Escudo adimensional', 'Escudo', 'adime', 0, 0, 120, 0, 70, 10, 0, 0, 0, 0, '', NULL, NULL),
('Botas adimensionales', 'Botas', 'adimb', 0, 0, 85, 0, 0, 15, 0, 0, 0, 0, '', NULL, NULL),
('Coraza adimensional', 'Coraza', 'adimc', 0, 0, 110, 0, 60, 5, 0, 0, 0, 0, '', NULL, NULL),
('Perneras adimensionales', 'Perneras', 'adimp', 0, 0, 95, 0, 45, 2, 0, 0, 0, 0, '', NULL, NULL),
('Yelmo adimensional', 'Yelmo', 'adimy', 0, 0, 100, 0, 45, 5, 0, 0, 0, 0, '', NULL, NULL),
('Amuleto adimensional', 'Amuleto', 'adimm', 0, 0, 90, 0, 7, 7, 80, 0, 0, 0, '', NULL, NULL);
INSERT INTO `objetos` (`nombreobj`, `tipo`, `img`, `nivelcomprar`, `nivelencontrar`, `niveluso`, `valor`, `prot`, `ataq`, `vida`, `posibilidad`, `puntosencontrar`, `usos`, `pasivas`, `texto`, `descripcion`) VALUES
('Tomo de la nigromancia', 'Libro', 'ln', 0, 40, 1, 1000000, 0, 120, 0, 300, 3000, 3, '', NULL, NULL),
('Manual de preparativos clericales', 'Libro', 'lpc', 0, 32, 1, 800000, 0, 70, 0, 400, 2000, 3, '', NULL, NULL),
('Tomo de la clerecía', 'Libro', 'lhc', 0, 40, 1, 1000000, 0, 120, 0, 300, 3000, 3, '', NULL, NULL),
('Grimorio de alteración dimensional', 'Libro', 'lade', 0, 60, 1, 10000000, 0, 1500, 0, 50, 20000, 3, '', NULL, NULL),
('Tomo de alteración dimensional aplicada', 'Libro', 'ladea', 0, 80, 1, 32000000, 0, 1600, 0, 10, 90000, 3, '', NULL, NULL),
('Manual de creación de artilugios', 'Libro', 'lca', 0, 2, 1, 6000, 0, 10, 0, 2000, 120, 3, '', NULL, NULL),
('Tomo de diseño de atrezzo', 'Libro', 'lda', 0, 12, 1, 26000, 0, 14, 0, 60, 6000, 3, '', NULL, 'Este tomo contiene recetas para fabricar insignias para clanes.'),
('Manual de creación de artefactos', 'Libro', 'lcaa', 0, 38, 1, 490000, 0, 65, 0, 1000, 5000, 3, '', NULL, NULL),
('Tomo de los preparativos vudú', 'Libro', 'lpv', 0, 35, 1, 300000, 0, 90, 0, 1000, 1000, 3, '', NULL, NULL),
('Tomo de los hechizos vudú', 'Libro', 'lv', 0, 40, 1, 400000, 0, 120, 0, 1000, 1000, 3, '', NULL, NULL),
('Manual de preparación de espejos', 'Libro', 'lpe', 0, 45, 1, 700000, 0, 30, 0, 1000, 2000, 3, '', NULL, NULL),
('Grimorio del medium', 'Libro', 'lm', 0, 50, 1, 900000, 0, 150, 0, 700, 4000, 3, '', NULL, NULL),
('Manual de forja de herramientas', 'Libro', 'lfh', 1, 15, 1, 5000, 0, 20, 0, 20, 100, 3, '', NULL, NULL),
('Manual de carpintería', 'Libro', 'lc', 0, 10, 1, 10000, 0, 25, 0, 3000, 200, 3, '', NULL, NULL),
('Manual de fundición', 'Libro', 'lf', 0, 15, 1, 15000, 0, 35, 0, 1500, 500, 3, '', NULL, NULL),
('Manual de refinado', 'Libro', 'lr', 0, 20, 1, 25000, 0, 25, 0, 1000, 700, 3, '', NULL, NULL),
('Tomo del gran druida', 'Libro', 'lgd', 0, 35, 1, 250000, 0, 85, 0, 700, 1000, 3, '', NULL, NULL),
('Tomo avanzado del druida', 'Libro', 'lad', 0, 15, 1, 25000, 0, 45, 0, 200, 300, 3, '', NULL, NULL),
('Tomo del control de la energía', 'Libro', 'lce', 0, 40, 1, 1000000, 0, 30, 0, 700, 1200, 3, '', NULL, NULL),
('Recetario del gran gourmet', 'Libro', 'lgg', 0, 40, 1, 1000000, 0, 150, 0, 700, 1500, 3, '', NULL, NULL),
('Tomo básico del druida', 'Libro', 'lbd', 1, 5, 1, 5000, 0, 15, 0, 2000, 100, 3, '', NULL, NULL),
('Recetario del gourmet', 'Libro', 'lg', 0, 35, 1, 500000, 0, 100, 0, 1500, 1200, 3, '', NULL, NULL),
('Recetario de cocina mágica avanzada', 'Libro', 'lcma', 0, 30, 1, 350000, 0, 80, 0, 1500, 770, 3, '', NULL, NULL),
('Recetario de repostería mágica básica', 'Libro', 'lrb', 0, 22, 1, 150000, 0, 42, 0, 1500, 370, 3, '', NULL, NULL),
('Recetario de cocina mágica básica', 'Libro', 'lcmb', 0, 20, 1, 200000, 0, 50, 0, 1500, 400, 3, '', NULL, NULL),
('Libro de los secretos del café', 'Libro', 'lsc', 0, 22, 1, 100000, 0, 32, 0, 2000, 400, 3, '', NULL, NULL),
('Recetario de batidos', 'Libro', 'lb', 0, 15, 1, 15000, 0, 12, 0, 4000, 300, 3, '', NULL, NULL),
('Manual de prensado', 'Libro', 'lmp', 0, 16, 1, 45000, 0, 40, 0, 4000, 400, 3, '', NULL, NULL),
('Manual de introducción a la magia', 'Libro', 'lim', 1, 1, 1, 5000, 0, 20, 0, 2000, 200, 3, '', NULL, NULL),
('Manual de destilación', 'Libro', 'lmd', 0, 15, 1, 35000, 0, 35, 0, 4000, 300, 3, '', NULL, NULL),
('Recetario de zumos de hortalizas', 'Libro', 'lzh', 1, 5, 1, 400, 0, 15, 0, 2000, 70, 3, '', NULL, NULL),
('Recetario de zumos de frutas', 'Libro', 'lzf', 1, 5, 1, 1000, 0, 25, 0, 2000, 100, 3, '', NULL, NULL),
('Manual de introducción al ilusionismo', 'Libro', 'li', 0, 10, 1, 10000, 0, 28, 0, 4000, 500, 3, '', NULL, NULL),
('Grimorio de las ilusiones', 'Libro', 'lgi', 0, 20, 1, 200000, 0, 42, 0, 1200, 800, 3, '', NULL, NULL),
('Grimorio de la energía', 'Libro', 'lge', 0, 30, 1, 300000, 0, 52, 0, 1500, 1000, 3, '', NULL, NULL),
('Grimorio del fuego', 'Libro', 'lgf', 0, 35, 1, 340000, 0, 56, 0, 1500, 1000, 3, '', NULL, NULL),
('Grimorio del hielo', 'Libro', 'lghh', 0, 40, 1, 360000, 0, 64, 0, 1500, 1000, 3, '', NULL, NULL),
('Grimorio del tiempo', 'Libro', 'lght', 0, 42, 1, 450000, 0, 80, 0, 1200, 1200, 3, '', NULL, NULL),
('Grimorio del caos', 'Libro', 'lgcc', 0, 0, 1, 16000000, 0, 800, 0, 0, 0, 3, '', NULL, NULL),
('Grimorio de la vida', 'Libro', 'lgvv', 0, 45, 1, 1300000, 0, 150, 0, 1200, 1500, 3, '', NULL, NULL),
('Hacha de Xilok', 'Arma', 'xar', 0, 0, 135, 250000000, 13, 100, 0, 0, 0, 0, '', NULL, NULL),
('Escudo de Xilok', 'Escudo', 'xes', 0, 0, 135, 250000000, 68, 10, 0, 0, 0, 0, '', NULL, NULL),
('Botas de Xilok', 'Botas', 'xbo', 0, 0, 100, 250000000, 3, 13, 0, 0, 0, 0, '', NULL, NULL),
('Coraza de Xilok', 'Coraza', 'xco', 0, 0, 120, 250000000, 55, 8, 0, 0, 0, 0, '', NULL, NULL),
('Perneras de Xilok', 'Perneras', 'xpe', 0, 0, 100, 250000000, 40, 5, 0, 0, 0, 0, '', NULL, NULL),
('Máscara de Xilok', 'Yelmo', 'xye', 0, 0, 131, 250000000, 42, 10, 0, 0, 0, 0, '', NULL, NULL),
('Amuleto de Xilok', 'Amuleto', 'xam', 0, 0, 130, 250000000, 11, 11, 20, 0, 0, 0, '', NULL, NULL),
('Bola de arbolito roja', 'Navidad', 'zbanr', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Bola de arbolito azul', 'Navidad', 'zbana', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Bola de arbolito verde', 'Navidad', 'zbanv', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Bola de arbolito amarilla', 'Navidad', 'zband', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Arbolito', 'Navidad', 'zar', 0, 0, 1, 20, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Estrella de arbolito', 'Navidad', 'zean', 0, 0, 1, 15, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Arbolito de navidad', 'Navidad', 'zarn', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Arbolito de navidad con regalos', 'Navidad', 'zarnr', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Libro de montaje de arbolitos', 'Navidad', 'zln', 0, 0, 1, 20, 0, 10, 0, 0, 0, 3, '', NULL, NULL),
('Joya premium', 'Premium', 'rprem', 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, '', NULL, NULL),
('Manual de infusión de vida', 'Libro', 'rrrlo', 0, 1, 1, 0, 0, 15, 0, 0, 0, 3, '', NULL, NULL),
('Estatua esmeralda', 'Recurso', 'rrrppa', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Gárgola esmeralda viviente', 'Mascota', 'rrrppat', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Ramas de bambú', 'Recurso', 'jrb', 0, 1, 1, 10000, 12, 0, 0, 5000, 100, 4, '', NULL, NULL),
('Estatua rubí', 'Recurso', 'rrros', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Gárgola rubí viviente', 'Mascota', 'rrrost', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Jarra de miel', 'Alimento', 'jmi', 0, 1, 1, 10000, 17, 0, 0, 5000, 100, 2, '', NULL, 'El alimento favorito de los osos amarillos.'),
('Mono', 'Mascota', 'sp', 1, 0, 1, 10000, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Buho', 'Mascota', 'mab', 0, 50, 1, 40000, 0, 0, 0, 500, 500, 6, '', NULL, NULL),
('Cuervo', 'Mascota', 'mar', 0, 75, 1, 400000, 0, 0, 0, 100, 5000, 6, '', NULL, NULL),
('Bufalo', 'Mascota', 'mac', 0, 10, 1, 10000, 0, 0, 0, 2500, 200, 6, '', NULL, NULL),
('Pollo', 'Mascota', 'map', 1, 0, 1, 500, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Perro', 'Mascota', 'mag', 0, 70, 1, 100000, 0, 0, 0, 200, 6000, 6, '', NULL, NULL),
('Gato', 'Mascota', 'mam', 0, 70, 1, 100000, 0, 0, 0, 200, 6000, 6, '', NULL, NULL),
('Conejo', 'Mascota', 'marr', 0, 80, 1, 150000, 0, 0, 0, 300, 5000, 6, '', NULL, NULL),
('Ordok', 'Mascota', 'mat', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Diablillo ígneo', 'Mascota', 'mazf', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Diablillo gélido', 'Mascota', 'mazh', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Aniquiladora Divina', 'Arma', 'rrree', 0, 180, 200, 750000000, 0, 300, 0, 2, 320000, 0, '', NULL, NULL),
('Hacha de la devastación', 'Arma', 'rrrahc', 0, 170, 190, 650000000, 0, 250, 0, 3, 320000, 0, '', NULL, NULL),
('Espada de la bondad', 'Arma', 'rrrgja', 0, 180, 180, 600000000, 30, 170, 0, 4, 320000, 0, '', NULL, NULL),
('Hacha extraña', 'Arma', 'rrrhh', 0, 160, 175, 550000000, 0, 165, 0, 9, 320000, 0, '', NULL, NULL),
('Gran espada curva', 'Arma', 'rrrecur', 0, 170, 170, 500000000, 65, 100, 0, 10, 320000, 0, '', NULL, NULL),
('Gran hacha de la experiencia', 'Arma', 'rrrhase', 0, 165, 165, 360000000, 35, 100, 0, 30, 320000, 0, '', NULL, NULL),
('Hacha de la experiencia', 'Arma', 'rrrju', 0, 155, 155, 260000000, 25, 100, 0, 300, 320000, 0, '', NULL, NULL),
('Lanza tribal', 'Arma', 'rrrlanz', 0, 150, 150, 250000000, 15, 100, 0, 120, 150000, 0, '', NULL, NULL),
('Hacha mitológica', 'Arma', 'rrrhd', 0, 145, 140, 225000000, 10, 100, 0, 220, 110000, 0, '', NULL, NULL),
('Espada de hojas', 'Arma', 'rrrgh', 0, 140, 120, 200000000, 20, 87, 0, 60, 300000, 0, '', NULL, NULL),
('Maza mecánica', 'Arma', 'rrrmpi', 0, 140, 130, 150000000, 50, 57, 0, 220, 100000, 0, '', NULL, NULL),
('Tridente mitológico', 'Arma', 'wtrid', 0, 121, 121, 80000000, 24, 60, 0, 60, 100000, 0, '', NULL, NULL),
('Lanza mitológica', 'Arma', 'warg', 0, 131, 131, 75000000, 18, 66, 0, 190, 60000, 0, '', NULL, NULL),
('Maza elemental de hielo', 'Arma', 'rrrmel', 0, 110, 110, 5500000, 10, 70, 0, 110, 75000, 0, '', NULL, NULL),
('Puñal de cristal de alma', 'Arma', 'rrrpun', 0, 100, 100, 22000000, 20, 50, 0, 1000, 35000, 0, '', NULL, NULL),
('Sable de honor', 'Arma', 'rrrach', 0, 90, 90, 20000000, 10, 80, 0, 350, 55000, 0, '', NULL, NULL),
('Defensor Demoniaco', 'Escudo', 'rrrm', 0, 180, 200, 750000000, 150, 0, 0, 2, 320000, 0, '', NULL, NULL),
('Escudo arcaico', 'Escudo', 'rrrce', 0, 160, 160, 500000000, 100, 0, 0, 100, 31337, 0, '', NULL, NULL),
('Escudo tribal', 'Escudo', 'rrrtr', 0, 140, 140, 225000000, 89, 1, 0, 200, 110000, 0, '', NULL, NULL),
('Escudo templario', 'Escudo', 'wetem', 0, 120, 120, 100000000, 60, 6, 0, 300, 50000, 0, '', NULL, NULL),
('Escudo de alma de dragón', 'Escudo', 'rrred', 0, 80, 80, 60000000, 41, 0, 0, 350, 40000, 0, '', NULL, NULL),
('Cabeza del Mal', 'Yelmo', 'rrrym', 0, 180, 200, 750000000, 80, 0, 0, 2, 320000, 0, '', NULL, NULL),
('Yelmo espiritual', 'Yelmo', 'rrrcef', 0, 170, 170, 650000000, 60, 0, 0, 40, 200000, 0, '', NULL, NULL),
('Yelmo oscuro', 'Yelmo', 'rrrpoa', 0, 150, 150, 390000000, 46, 3, 0, 180, 110000, 0, '', NULL, NULL),
('Yelmo poseído', 'Yelmo', 'wrra', 0, 130, 130, 150000000, 40, 6, 0, 300, 75000, 0, '', NULL, NULL),
('Casco cortante', 'Yelmo', 'rrrcal', 0, 110, 110, 70000000, 32, 9, 0, 400, 50000, 0, '', NULL, NULL),
('Estrella Polar', 'Amuleto', 'rrram', 0, 170, 200, 30000000, 12, 12, 45, 6, 320000, 0, '', NULL, NULL),
('Pulpo', 'Alimento', 'wcal', 0, 23, 1, 5200, 18, 0, 0, 600, 150, 2, '', NULL, 'Cefalópodo marino de los mares de Lifo.'),
('Túnica del Sol', 'Coraza', 'rrrctr', 0, 180, 200, 750000000, 100, 0, 0, 2, 320000, 0, '', NULL, NULL),
('Coraza de capas', 'Coraza', 'rrrarm', 0, 160, 160, 700000000, 80, 0, 0, 120, 300000, 0, '', NULL, NULL),
('Coraza ascendida', 'Coraza', 'rrrca', 0, 140, 140, 250000000, 60, 1, 0, 350, 150000, 0, '', NULL, NULL),
('Cetro de invocación de dragones', 'Recurso', 'rrrvdr', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Tomo de los dragones', 'Libro', 'rrrgl', 0, 100, 1, 100000000, 0, 300, 0, 500, 50000, 3, '', NULL, NULL),
('Dragón', 'Mascota', 'mad', 0, 0, 1, 100000000, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Amanecer', 'Arma', 'rrrram', 0, 250, 300, 3000000000, 0, 777, 0, 1, 500000, 0, '', NULL, NULL),
('Devastador Demoniaco', 'Arma', 'rrrrdv', 0, 250, 275, 2000000000, 0, 666, 0, 1, 450000, 0, '', NULL, NULL),
('Espadón templario', 'Arma', 'rrrret', 0, 200, 230, 1600000000, 50, 415, 0, 4, 420000, 0, '', NULL, NULL),
('Hacha protectora', 'Arma', 'rrrrhp', 0, 220, 210, 1200000000, 300, 100, 0, 15, 150000, 0, '', NULL, NULL),
('Espada de mithril', 'Arma', 'rrrrehm', 0, 230, 200, 1100000000, 150, 250, 0, 20, 40000, 0, '', NULL, NULL),
('Gran hacha', 'Arma', 'rrrrgh', 0, 220, 220, 1600000000, 10, 399, 0, 6, 370000, 0, '', NULL, NULL),
('Cuchillo trágico', 'Arma', 'rrrrct', 0, 160, 220, 1400000000, 0, 400, 0, 2, 400000, 0, '', NULL, NULL),
('Sable pirata', 'Arma', 'rrrrp', 0, 200, 205, 900000000, 20, 360, 0, 7, 350000, 0, '', NULL, NULL),
('Martillo de opresión', 'Arma', 'rrrrm', 0, 210, 200, 850000000, 50, 330, 0, 8, 340000, 0, '', NULL, NULL),
('Vara de la muerte', 'Arma', 'rrrrv', 0, 200, 165, 1100000000, 0, 300, 0, 4, 350000, 0, '', NULL, NULL),
('Sable de jade', 'Arma', 'rrrrj', 0, 200, 180, 650000000, 100, 150, 0, 10, 320000, 0, '', NULL, NULL),
('Vara de la serpiente', 'Arma', 'rrrrvs', 0, 200, 160, 500000000, 100, 150, 0, 19, 80000, 0, '', NULL, NULL),
('Extraño utensilio inutilizable', 'Recurso', 'rrrrarco', 0, 50, 1, 10000, 30, 0, 0, 1000, 100, 4, '', NULL, NULL),
('Arma desconocida de amazona', 'Recurso', 'rrrrarcoa', 0, 50, 1, 10000, 30, 0, 0, 1000, 100, 4, '', NULL, NULL),
('Botas dragón', 'Botas', 'bdr', 0, 180, 100, 650000000, 4, 17, 0, 20, 20000, 0, '', NULL, NULL),
('Escudo de la orden del águila', 'Escudo', 'rrrrag', 0, 210, 230, 1200000000, 180, 20, 0, 2, 320000, 0, '', NULL, NULL),
('Escudo de amazona', 'Escudo', 'rrrrea', 0, 210, 220, 850000000, 175, 0, 0, 7, 160000, 0, '', NULL, NULL),
('Escudo de hueso', 'Escudo', 'rrrreh', 0, 200, 210, 750000000, 155, 0, 0, 10, 80000, 0, '', NULL, NULL),
('Escudo de calaveras', 'Escudo', 'rrrrec', 0, 180, 180, 450000000, 130, 0, 0, 20, 40000, 0, '', NULL, NULL),
('Coraza visceral', 'Coraza', 'rrrrcv', 0, 180, 180, 650000000, 90, 0, 0, 10, 40000, 0, '', NULL, NULL),
('Coraza de amazona', 'Coraza', 'rrrrca', 0, 200, 160, 550000000, 70, 0, 0, 20, 25000, 0, '', NULL, NULL),
('Perneras dragón', 'Perneras', 'rrrrpd', 0, 220, 200, 900000000, 60, 30, 0, 3, 250000, 0, '', NULL, NULL),
('Perneras de amazona', 'Perneras', 'rrrrpa', 0, 180, 140, 88000000, 60, 0, 0, 20, 25000, 0, '', NULL, NULL),
('Menú divino', 'Alimento', 'rrrrmd', 0, 200, 1, 50000000, 5000, 0, 0, 5, 200000, 2, '', NULL, 'Alimento compuesto por manjares de otro mundo. Sólo para dioses.'),
('Amuleto templario', 'Amuleto', 'rrrrpt', 0, 230, 200, 70000000, 20, 23, 50, 2, 400000, 0, '', NULL, NULL),
('Protector de almas', 'Amuleto', 'rrrrpda', 0, 180, 150, 18000000, 20, 0, 60, 5, 220000, 0, '', NULL, NULL),
('Brillo del alba', 'Amuleto', 'rrrrba', 0, 120, 110, 12000000, 16, 0, 50, 9, 170000, 0, '', NULL, NULL),
('Amuleto tétrico', 'Amuleto', 'rrrrat', 0, 100, 100, 9000000, 5, 9, 40, 13, 140000, 0, '', NULL, NULL),
('Casco divino', 'Yelmo', 'rrrrccd', 0, 250, 250, 2000000000, 133, 33, 0, 1, 500000, 0, '', NULL, NULL),
('Yelmo de cuernos de diablo', 'Yelmo', 'rrrrcd', 0, 240, 240, 1600000000, 105, 20, 0, 3, 350000, 0, '', NULL, NULL),
('Diadema de la velocidad', 'Yelmo', 'rrrrddv', 0, 240, 240, 1300000000, 120, 0, 0, 10, 150000, 0, '', NULL, NULL),
('Yelmo beato', 'Yelmo', 'rrrryb', 0, 230, 230, 1200000000, 105, 0, 0, 12, 150000, 0, '', NULL, NULL),
('Yelmo de cuernos de minotauro', 'Yelmo', 'rrrrmin', 0, 230, 210, 1100000000, 60, 40, 0, 4, 350000, 0, '', NULL, NULL),
('Yelmo de amazona', 'Yelmo', 'rrrryam', 0, 220, 210, 900000000, 90, 0, 0, 6, 200000, 0, '', NULL, NULL),
('Diadema de duende', 'Yelmo', 'rrrrddu', 0, 210, 200, 800000000, 60, 25, 0, 3, 300000, 0, '', NULL, NULL),
('Mascara del pánico', 'Yelmo', 'rrrrmp', 0, 180, 180, 700000000, 60, 5, 0, 20, 100000, 0, '', NULL, NULL),
('Yelmo abierto', 'Yelmo', 'rrrrya', 0, 200, 200, 750000000, 80, 5, 0, 10, 130000, 0, '', NULL, NULL),
('Cuadro de una croqueta', 'Recurso', 'rrrxa', 0, 12, 1, 30000, 0, 0, 0, 4, 200, 4, '', NULL, NULL),
('Paisaje pintoresco', 'Recurso', 'rrrxb', 0, 12, 1, 30000, 0, 0, 0, 4, 200, 4, '', NULL, NULL),
('Pintura de un yeti', 'Recurso', 'rrrxc', 0, 12, 1, 30000, 0, 0, 0, 4, 200, 4, '', NULL, NULL),
('Mariposa de fuego', 'Recurso', 'rrrvmf', 0, 12, 1, 1500, 0, 0, 0, 12, 400, 4, '', NULL, NULL),
('Mariposa de hielo', 'Recurso', 'rrrvmh', 0, 12, 1, 1500, 0, 0, 0, 12, 400, 4, '', NULL, NULL),
('Símbolo sagrado', 'Recurso', 'rrrvsds', 0, 100, 1, 150000, 0, 0, 0, 4, 40000, 4, '', NULL, NULL),
('Lámpara', 'Recurso', 'rrrla', 0, 130, 1, 180000, 0, 0, 0, 3, 80000, 4, '', NULL, NULL),
('Tulipán', 'Recurso', 'rrrtu', 0, 10, 1, 100, 0, 0, 0, 30, 200, 4, '', NULL, NULL),
('Rosa roja', 'Recurso', 'rrrrose', 0, 10, 1, 100, 0, 0, 0, 30, 200, 4, '', NULL, NULL),
('Planta curativa', 'Recurso', 'rrrhu', 0, 10, 1, 12000, 0, 0, 0, 10, 20000, 4, '', NULL, NULL),
('Jarrón decorado', 'Recurso', 'rrrj', 0, 180, 1, 120000, 0, 0, 0, 20, 10000, 4, '', NULL, NULL),
('Globo de Lifo', 'Recurso', 'rrrge', 0, 200, 1, 1200000, 0, 0, 0, 5, 100000, 4, '', NULL, NULL),
('Fruto tropical', 'Recurso', 'rrrfr', 0, 50, 1, 14000, 0, 0, 0, 50, 300, 4, '', NULL, NULL),
('Corona', 'Recurso', 'rrrc', 0, 200, 1, 14000000, 0, 0, 0, 2, 300000, 4, '', NULL, NULL),
('Cristal de magia', 'Recurso', 'rrrcv', 0, 80, 1, 100000, 0, 0, 0, 60, 2000, 4, '', NULL, NULL),
('Esfera de cristal', 'Recurso', 'rrrbc', 0, 160, 1, 1000000, 0, 0, 0, 10, 200000, 4, '', NULL, NULL),
('Polvo de estrellas', 'Recurso', 'rrrpm', 0, 140, 1, 800000, 0, 0, 0, 30, 40000, 4, '', NULL, NULL),
('Piedra decorada', 'Recurso', 'rrrpma', 0, 1, 1, 50, 0, 0, 0, 5000, 400, 4, '', NULL, NULL),
('Cofre del tesoro', 'Recurso', 'rrrts', 0, 230, 1, 100000000, 0, 0, 0, 2, 200000, 4, '', NULL, NULL),
('Tomo del fuego', 'Recurso', 'rrrqr', 0, 200, 1, 750000000, 0, 0, 0, 8, 100000, 4, '', NULL, NULL),
('Tomo del hielo', 'Recurso', 'rrrqa', 0, 200, 1, 750000000, 0, 0, 0, 8, 100000, 4, '', NULL, NULL),
('Tomo de la vida', 'Recurso', 'rrrqv', 0, 230, 1, 1100000000, 0, 0, 0, 6, 200000, 4, '', NULL, NULL),
('Tomo de la muerte', 'Recurso', 'rrrqg', 0, 230, 1, 1100000000, 0, 0, 0, 6, 200000, 4, '', NULL, NULL),
('Tomo del tiempo', 'Recurso', 'rrrqam', 0, 230, 1, 1100000000, 0, 0, 0, 6, 200000, 4, '', NULL, NULL),
('Tomo del control', 'Recurso', 'rrrqp', 0, 260, 1, 2200000000, 0, 0, 0, 3, 400000, 4, '', NULL, NULL),
('Pergamino de encantamiento de cayados', 'Recurso', 'rrrp', 0, 100, 1, 200000, 0, 0, 0, 40, 28000, 4, '', NULL, NULL),
('Pergamino de activación de varas', 'Recurso', 'rrrza', 0, 100, 1, 200000, 0, 0, 0, 20, 28000, 4, '', NULL, NULL),
('Cayado del Archicanciller', 'Arma', 'rrrvoz', 0, 0, 200, 6000000000, 0, 888, 0, 0, 0, 0, '', NULL, NULL),
('Vara activa', 'Arma', 'rrrveq', 0, 0, 200, 1600000000, 50, 400, 0, 0, 0, 0, '', NULL, NULL),
('Vara de la gran serpiente', 'Arma', 'rrrvmd', 0, 0, 190, 1400000000, 100, 320, 0, 0, 0, 0, '', NULL, NULL),
('Vara latente', 'Arma', 'rrrve', 0, 230, 200, 1100000000, 110, 210, 0, 20, 40000, 0, '', NULL, NULL),
('Vara engarzada', 'Arma', 'rrrvh', 0, 220, 250, 1500000000, 120, 300, 0, 2, 400000, 0, '', NULL, NULL),
('Bastón orbe', 'Arma', 'rrrvc', 0, 160, 220, 800000000, 175, 225, 0, 3, 200000, 0, '', NULL, NULL),
('Cayado de fuego', 'Arma', 'rrrvob', 0, 260, 200, 950000000, 150, 240, 0, 1, 340000, 0, '', NULL, NULL),
('Cayado de hielo', 'Arma', 'rrrvoa', 0, 260, 200, 950000000, 250, 140, 0, 1, 340000, 0, '', NULL, NULL),
('Cayado de la vida', 'Arma', 'rrrvoc', 0, 0, 230, 1300000000, 250, 140, 0, 0, 0, 0, '', NULL, NULL),
('Cayado de la muerte', 'Arma', 'rrrvon', 0, 0, 230, 1300000000, 50, 340, 0, 0, 0, 0, '', NULL, NULL),
('Cayado del tiempo', 'Arma', 'rrrvod', 0, 0, 230, 1300000000, 150, 240, 0, 0, 0, 0, '', NULL, NULL),
('Cayado del control', 'Arma', 'rrrvop', 0, 0, 260, 2600000000, 220, 220, 0, 0, 0, 0, '', NULL, NULL),
('Báculo de defensa', 'Arma', 'rrrvhg', 0, 150, 150, 550000000, 115, 115, 0, 30, 190000, 0, '', NULL, NULL),
('Cayado de talla mágica', 'Arma', 'rrrvom', 0, 0, 20, 20000, 8, 18, 0, 0, 0, 0, '', NULL, NULL),
('Cayado', 'Arma', 'rrrvo', 0, 2, 2, 2000, 4, 9, 0, 400, 1000, 0, '', NULL, NULL),
('Botas de la naturaleza', 'Botas', 'rrrbn', 0, 180, 120, 550000000, 4, 14, 0, 40, 10000, 0, '', NULL, NULL),
('Escudo lagarto', 'Escudo', 'rrrvel', 0, 220, 230, 1000000000, 175, 10, 0, 3, 260000, 0, '', NULL, NULL),
('Tomo de encantamiento de cayados', 'Libro', 'rrrql', 0, 180, 1, 144000000, 0, 500, 0, 20, 100000, 3, '', NULL, NULL),
('Tomo de instrumentación mágica', 'Libro', 'rrrqs', 0, 200, 1, 244000000, 0, 1000, 0, 7, 500000, 3, '', NULL, NULL),
('Tomo de mejora de varas', 'Libro', 'rrrqvv', 0, 200, 1, 200000000, 0, 800, 0, 8, 400000, 3, '', NULL, NULL),
('Materia orgánica', 'Recurso', 'mup', 0, 1, 100, 10000, 0, 0, 0, 500, 200, 4, '', NULL, NULL),
('Mutante XX', 'Mascota', 'muta', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Mutante XY', 'Mascota', 'mutb', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Mutante YY', 'Mascota', 'mutc', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Golem de lava', 'Mascota', 'mgl', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Golem vegetal', 'Mascota', 'mgv', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Golem de piedra', 'Mascota', 'mgp', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Mate', 'Alimento', 'arg', 0, 23, 1, 3200, 15, 0, 0, 6000, 150, 2, '', NULL, 'Infusión hecha a partir de Yerba Mate.'),
('Dragón de huesos', 'Mascota', 'mra', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Escorpión', 'Mascota', 'mrb', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Espíritu de dragón', 'Mascota', 'mrc', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Halcón de fuego', 'Mascota', 'mrd', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Lagarto alado', 'Mascota', 'mre', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Insignia especial moderador', 'Especial', 'mod', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Insignia especial administrador', 'ADMIN', 'clangm', 0, 0, 1, 0, 10000, 10000, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial H', 'Z-Esp2', 'insh', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial K', 'Z-Esp3', 'insk', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial T', 'Z-Esp4', 'inst', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial B', 'Z-Esp5', 'insb', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial Z', 'Z-Esp6', 'insz', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial J', 'Z-Esp7', 'insj', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo Campeonato - Primero', 'Z-Esp9', 'toi', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo Campeonato - Segundo', 'Z-Esp10', 'toii', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo Campeonato - Tercero', 'Z-Esp11', 'toiii', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Primer nivel trescientos', 'Z-Esp12', 'trescientos', 0, 0, 1, 0, 10, 10, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma de oro', 'Z-Esp13', 'trporo', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma de plata', 'Z-Esp14', 'trpplata', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma de bronce', 'Z-Esp15', 'trpbronce', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma escritor', 'Z-Esp17', 'trpdos', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Competición mascotas', 'Z-Esp18', 'tab', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-A', 'Z-Esp19', 'trca', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-B', 'Z-Esp20', 'trcb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-C', 'Z-Esp21', 'trcc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-D', 'Z-Esp22', 'trcd', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-E', 'Z-Esp23', 'trce', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-F', 'Z-Esp24', 'trcf', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-G', 'Z-Esp25', 'trcg', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Primero', 'Z-Esp26', 'taaaa', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Segundo', 'Z-Esp27', 'taaab', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Tercero', 'Z-Esp28', 'taaac', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Clan', 'Z-Esp29', 'taaad', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: II - Primero', 'Z-Esp30', 'taaba', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: II - Segundo', 'Z-Esp31', 'taabb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: II - Tercero', 'Z-Esp32', 'taabc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Primero', 'Z-Esp33', 'taaca', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Segundo', 'Z-Esp34', 'taacb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Tercero', 'Z-Esp35', 'taacc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Clan', 'Z-Esp36', 'taacd', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: IV - Primero', 'Z-Esp37', 'taada', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: IV - Segundo', 'Z-Esp38', 'taadb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: IV - Tercero', 'Z-Esp39', 'taadc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: V - Primero', 'Z-Esp40', 'taaea', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: V - Segundo', 'Z-Esp41', 'taaeb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: V - Tercero', 'Z-Esp42', 'taaec', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: VI - Primero', 'Z-Esp43', 'taafa', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: VI - Segundo', 'Z-Esp44', 'taafb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: VI - Tercero', 'Z-Esp45', 'taafc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Historia oro', 'Z-Esp47', 'trhoro', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Historia plata', 'Z-Esp48', 'trhplata', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Historia bronce', 'Z-Esp49', 'trhbronce', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Competición Variedades', 'Z-Esp50', 'trdv', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Competición Clanes', 'Z-Esp51', 'trdc', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Primer nivel cuatrocientos', 'Z-Esp52', 'cuatrocientos', 0, 0, 1, 0, 10, 10, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: La búsqueda oscura', 'Z-Esp53', 'trbos', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Combates - Primero', 'Z-Esp54', 'trfa', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Combates - Segundo', 'Z-Esp55', 'trfb', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Combates - Tercero', 'Z-Esp56', 'trfc', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Mapache', 'Mascota', 'hdanimalmarino', 1, 0, 1, 100, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Esquirla de joya premium', 'Premium', 'rpreme', 0, 1, 0, 0, 0, 0, 0, 10, 0, 8, '', NULL, NULL),
('Manual de manipulación de joyería', 'Libro', 'rljp', 1, 0, 1, 50, 0, 10, 0, 0, 0, 3, '', NULL, NULL),
('Trozo de mapa A', 'Recurso', 'rmapaapua', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Trozo de mapa B', 'Recurso', 'rmapaapub', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Trozo de mapa C', 'Recurso', 'rmapaapuc', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Trozo de mapa D', 'Recurso', 'rmapaapud', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Trozo de mapa E', 'Recurso', 'rmapaapue', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Trozo de mapa F', 'Recurso', 'rmapaapuf', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Sagrada escritura', 'Libro', 'rsagesc', 0, 0, 1, 1000000, 0, 100, 0, 0, 0, 3, '', NULL, NULL),
('Apocalipsis', 'Libro', 'rapo', 0, 0, 1, 1000000, 0, 100, 0, 0, 0, 3, '', NULL, NULL),
('Mapa: Campos de Lifo', 'Mapa', 'rmapaacl', 1, 0, 1, 100, 0, 5, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Bosques de Lifo', 'Mapa', 'rmapaabl', 0, 0, 7, 200, 0, 5, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Gruta helada', 'Mapa', 'rmapaagh', 0, 0, 19, 1000, 0, 10, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Laberinto de hielo', 'Mapa', 'rmapaalh', 0, 0, 32, 2000, 0, 15, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Montaña helada', 'Mapa', 'rmapaamh', 0, 0, 36, 2500, 0, 20, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Cordillera helada', 'Mapa', 'rmapaach', 0, 0, 50, 3000, 0, 25, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Cima nevada', 'Mapa', 'rmapaacn', 0, 0, 70, 4000, 0, 33, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Escalera al cielo', 'Mapa', 'rmapaaen', 0, 0, 85, 5000, 0, 35, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Reino celestial', 'Mapa', 'rmapaarc', 0, 0, 110, 25000, 0, 70, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Cueva de la plata', 'Mapa', 'rmapaacp', 0, 0, 12, 500, 0, 10, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Mina de oro', 'Mapa', 'rmapaamo', 0, 0, 25, 1500, 0, 15, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Descenso profundo', 'Mapa', 'rmapaadp', 0, 0, 34, 2000, 0, 20, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Inframundo', 'Mapa', 'rmapaaim', 0, 0, 50, 5000, 0, 25, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Río de lava', 'Mapa', 'rmapaarl', 0, 0, 60, 6000, 0, 30, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Centro de volcán', 'Mapa', 'rmapaacv', 0, 0, 77, 12000, 0, 35, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Puertas del infierno', 'Mapa', 'rmapaapi', 0, 0, 110, 23000, 0, 70, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Purgatorio', 'Mapa', 'rmapaapu', 0, 0, 120, 100000, 0, 70, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Limbo', 'Mapa', 'rmapaali', 0, 0, 120, 100000, 0, 70, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Comarca', 'Mapa', 'rrrme', 0, 0, 65, 30000, 0, 32, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Biblioteca', 'Mapa', 'rmapaabi', 0, 0, 75, 40000, 0, 42, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Torre del mago', 'Mapa', 'rmapaato', 0, 0, 90, 70000, 0, 55, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Mazmorra', 'Mapa', 'rmapaama', 0, 0, 96, 75000, 0, 57, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Templo subterráneo', 'Mapa', 'rmapaats', 0, 0, 100, 90000, 0, 67, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Cueva submarina', 'Mapa', 'rmapaacs', 0, 0, 105, 95000, 0, 69, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Mares de Lifo', 'Mapa', 'rrrmm', 0, 0, 125, 100000, 0, 80, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Artefacto náutico', 'Mapa', 'rmapaaan', 0, 0, 130, 120000, 0, 95, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Ciudad acuática', 'Mapa', 'rmapaaca', 0, 0, 140, 140000, 0, 110, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Portal', 'Mapa', 'rmapaapo', 0, 0, 150, 200000, 0, 150, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Luna Aio', 'Mapa', 'rmapaala', 0, 0, 180, 230000, 0, 160, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Luna Phobos', 'Mapa', 'rmapaalb', 0, 0, 180, 230000, 0, 160, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Luna Dremek', 'Mapa', 'rmapaalc', 0, 0, 180, 230000, 0, 160, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Planeta Aeron', 'Mapa', 'rmapaald', 0, 0, 200, 300000, 0, 200, 0, 0, 0, 7, '', NULL, NULL),
('Anillo del destino', 'Anillo', 'rfd', 0, 250, 250, 2500000000, 160, 0, 0, 1, 500000, 0, '', NULL, NULL),
('Anillo de la muerte', 'Anillo', 'rfmu', 0, 240, 200, 1400000000, 130, 20, 0, 2, 350000, 0, '', NULL, NULL),
('Anillo de las estrellas', 'Anillo', 'rfes', 0, 190, 190, 1100000000, 120, 10, 0, 2, 150000, 0, '', NULL, NULL),
('Anillo mágico', 'Anillo', 'rfma', 0, 170, 170, 1000000000, 120, 0, 0, 2, 150000, 0, '', NULL, NULL),
('Anillo de los deseos', 'Anillo', 'rfad', 0, 150, 150, 600000000, 90, 25, 0, 2, 200000, 0, '', NULL, NULL),
('Anillo ancho', 'Anillo', 'rfga', 0, 130, 130, 800000000, 68, 2, 0, 4, 100000, 0, '', NULL, NULL),
('Anillo encantado', 'Anillo', 'rfe', 0, 120, 120, 24000000, 35, 6, 0, 1, 120000, 0, '', NULL, NULL),
('Anillo con ruby', 'Anillo', 'rfr', 0, 95, 95, 16000000, 20, 25, 0, 4, 80000, 0, '', NULL, NULL),
('Anillo de cristal', 'Anillo', 'rfcr', 0, 72, 72, 15000000, 35, 0, 0, 2, 70000, 0, '', NULL, NULL),
('Anillo de platino', 'Anillo', 'rfpt', 0, 54, 54, 12000000, 26, 0, 0, 5, 55000, 0, '', NULL, NULL),
('Anillo de oro', 'Anillo', 'rfo', 0, 30, 30, 10000000, 23, 0, 0, 100, 35000, 0, '', NULL, NULL),
('Anillo de plata', 'Anillo', 'rfp', 0, 16, 16, 150000, 18, 0, 0, 500, 16400, 0, '', NULL, NULL),
('Anillo de cobre', 'Anillo', 'rfc', 0, 6, 6, 35000, 11, 0, 0, 300, 4000, 0, '', NULL, NULL),
('Anillo de madera', 'Anillo', 'rfm', 0, 1, 3, 3000, 0, 6, 0, 3000, 200, 0, '', NULL, NULL),
('Anillo de coco', 'Anillo', 'rfh', 1, 1, 1, 30, 0, 1, 0, 10000, 10, 0, '', NULL, NULL),
('Oculo', 'Mascota', 'oculo', 0, 0, 1, 40000000, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Espada Glacial', 'Arma', 'iceblade', 0, 0, 75, 15000000, 17, 60, 10, 0, 0, 0, '', NULL, NULL),
('Pollo Aficionado', 'Mascota', 'maprecre', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Adimensional', 'Mascota', 'mapdimensional', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Ala de murciélago', 'Recurso', 'batwing', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Arma desconocida de amazona(I)', 'Reliquia', 'rrrrarcoai', 0, 0, 10, 100, 0, 0, 0, 1000, 100, 0, '1$20$%#2$10$%#3$5$%#7$5$%', NULL, NULL),
('Bolsa de caramelos', 'Alimento', 'candybag', 0, 0, 1, 1000, 100, 0, 0, 0, 0, 2, '', NULL, 'Saco lleno de caramelos.\r\nNo es muy sano.\r\nEstuvo disponible durante Halloween 2018.'),
('Calabaza decorada', 'Halloween', 'pumpkinhead', 0, 0, 1, 100, 1, 1, 0, 0, 0, 0, '', NULL, NULL),
('Caramelos', 'Alimento', 'candies', 0, 0, 1, 100, 23, 0, 0, 0, 0, 2, '', NULL, 'Bolas dulces envueltas (el envoltorio no se come).\r\nEstuvo disponible durante Halloween 2018.'),
('Carne podrida', 'Alimento', 'rottenmeat', 0, 0, 1, 100, -10, 0, 0, 0, 0, 2, '', NULL, 'Trozo de carne de zombie.\r\nNo es una buena idea comérsela...\r\nEstuvo disponible durante Halloween 2018.'),
('Corona(I)', 'Reliquia', 'rrrci', 0, 0, 30, 100, 0, 0, 0, 2, 300000, 0, '1$75$%#2$100$%#3$15$%#4$15$%#5$30$%#6$25$%#7$50$%', NULL, NULL),
('Esencia mágica', 'Recurso', 'magicesence', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Extraño utensilio inutilizable(I)', 'Reliquia', 'rrrrarcoi', 0, 0, 10, 100, 0, 0, 0, 1000, 100, 0, '1$10$%#2$20$%#3$5$%#7$10$%', NULL, NULL),
('Fruta prohibida', 'Alimento', 'frutaprohibida', 0, 0, 1, 1000, 1500, 0, 0, 0, 0, 2, '', NULL, 'Este fruto se prohibió en toda la comarca de Lifo.<br>\r\nEl poder que otorga te puede permitir conquistar territorios.<br>\r\n<i>En el peor de los casos te dará dolor de cabeza.</i>'),
('Fuego fatuo', 'Recurso', 'fatuo', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Hueso rojo dulce', 'Recurso', 'hurojo', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Lámpara(I)', 'Reliquia', 'rrrlai', 0, 0, 20, 100, 0, 0, 0, 3, 80000, 0, '1$40$%#2$50$%#4$15$%#5$20$%#6$20$%#7$30$%', NULL, NULL),
('Manual de hechicería', 'Libro', 'manuhechi', 0, 0, 1, 100, 0, 100, 0, 0, 0, 3, '', NULL, NULL),
('Mapa: Catacumbas', 'Mapa', 'tomb', 0, 0, 11, 100, 0, 30, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Cementerio', 'Mapa', 'cemetery', 0, 0, 10, 100, 0, 15, 0, 0, 0, 7, '', NULL, NULL),
('Mapa: Necrópolis', 'Mapa', 'necropolis', 0, 0, 12, 100, 0, 50, 0, 0, 0, 7, '', NULL, NULL),
('Piruleta de fresa', 'Alimento', 'lollipopstraw', 0, 0, 1, 100, 80, 0, 0, 0, 0, 2, '', NULL, 'Dulce de fresa en un palo.\r\nEstuvo disponible durante Halloween 2018.'),
('Piruleta de manzana', 'Alimento', 'lollipopapple', 0, 0, 1, 100, 28, 0, 0, 0, 0, 2, '', NULL, 'Dulce de manzana en un palo.\r\nEstuvo disponible durante Halloween 2018.'),
('Planta curativa(I)', 'Reliquia', 'rrrhui', 0, 0, 15, 100, 0, 0, 0, 10, 20000, 0, '2$35$%#5$15$%#7$25$%', NULL, NULL),
('Polvo de estrellas(I)', 'Reliquia', 'rrrpmi', 0, 0, 15, 100, 0, 0, 0, 30, 40000, 0, '1$15$%#2$15$%#3$15$%#4$15$%#5$15$%#6$15$%#7$15$%', NULL, NULL),
('Polvo de hueso rojo', 'Recurso', 'redpowder', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Símbolo sagrado(I)', 'Reliquia', 'rrrvsdsi', 0, 0, 20, 100, 0, 0, 0, 4, 40000, 0, '1$50$%#2$30$%#3$10$%#5$20$%#6$20$%#7$30$%', NULL, NULL),
('Sombrero de hechicería', 'Halloween', 'rsonhe', 0, 0, 50, 9000000, 22, 22, 0, 0, 0, 0, '', NULL, NULL),
('Tarta de calabaza', 'Alimento', 'tartacalabaza', 0, 0, 1, 100, 76, 0, 0, 0, 0, 2, '', NULL, 'Tarta con un dulce sabor a calabaza.\r\nEstuvo disponible durante Halloween 2018.'),
('Venda impura', 'Recurso', 'bandage', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Collar de la suerte(I)', 'Reliquia', 'csrti', 0, 0, 1, 100, 0, 0, 0, 500, 100, 0, '1$10$%#3$10$%', NULL, NULL),
('Trofeo: La boda', 'Z-EspBoda', 'trboda', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, '', NULL, NULL),
('Vamporo Helado', 'Mascota', 'frozenbat', 0, 0, 1, 100, 0, 0, 0, 0, 0, 6, '', NULL, 'Esta mascota helada se puede comprar en la tienda premium durante el festival de invierno.'),
('Trofeo: La calabaza', 'Z-Esp57', 'trbaza', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, '', NULL, NULL),
('Chocolate caliente', 'Alimento', 'chococaliente', 0, 0, 1, 1000, 60, 0, 0, 0, 0, 2, '', NULL, 'Nada como una buena taza de chocolate caliente para afrontar los frios inviernos.'),
('Bastón de caramelo', 'Alimento', 'bdecaramelo', 0, 0, 1, 1000, 20, 0, 0, 0, 0, 2, '', NULL, 'Bastón de caramelo dulce, el favorito de los niños.'),
('Galletas de mantequilla', 'Alimento', 'gaman', 0, 0, 1, 1000, 55, 0, 0, 0, 0, 2, '', NULL, 'Galletas de mantequilla hechas con la receta de la abuela.'),
('Gorro de festivo', 'Yelmo', 'gorrosanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, '', NULL, 'Gorro usado durante la festividad del invierno.'),
('Túnica festiva', 'Coraza', 'tunicasanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, '', NULL, 'Túnica usada durante la festividad del invierno.'),
('Pantalones festivos', 'Perneras', 'pantalonessanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, '', NULL, 'Pantalones usados durante la festividad del invierno.'),
('Botas festivas', 'Botas', 'botassanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, '', NULL, 'Botas usadas durante la festividad del invierno.'),
('Osito festivo de peluche', 'Recurso', 'ososanta', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Este oso de felpa se reparte cada festividad a todos los niños de Lifo.'),
('Matasuegras', 'Recurso', 'matasuegras', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Silvato festivo usado en celebraciones.'),
('Pollo Arcoiris', 'Mascota', 'maparcoiris', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Cielo', 'Mascota', 'mapceles', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Demoniaco', 'Mascota', 'mapdemon', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Masculino', 'Mascota', 'mapr', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Moderno', 'Mascota', 'mapmod', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Nocturno', 'Mascota', 'mapnoc', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Sultán', 'Mascota', 'mapalapollo', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Valiente', 'Mascota', 'mapcasco', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Binario', 'Mascota', 'mapcybern', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Pollo Festivo', 'Mascota', 'mapfestivo', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL),
('Oso festivo animado', 'Mascota', 'osonavanim', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, '', NULL, NULL),
('Pergamino mágico: Oso festivo', 'Navidad', 'pergaosonav', 0, 0, 1, 100, 0, 100, 0, 0, 0, 3, '', NULL, NULL),
('Cofre festivo', 'Cofre', 'cofrenav', 0, 0, 1, 0, 0, 0, 0, 0, 0, 9, NULL, NULL, '¿Qué tendrá dentro?'),
('Insignia Atrezzo A', 'Atrezzo', 'atreza', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo B', 'Atrezzo', 'atrezb', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo C', 'Atrezzo', 'atrezc', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo D', 'Atrezzo', 'atrezd', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo E', 'Atrezzo', 'atreze', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo F', 'Atrezzo', 'atrezf', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo G', 'Atrezzo', 'atrezg', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo H', 'Atrezzo', 'atrezh', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo I', 'Atrezzo', 'atrezi', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo J', 'Atrezzo', 'atrezj', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo K', 'Atrezzo', 'atrezk', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo M', 'Atrezzo', 'atrezm', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Cristal carmesí inerte', 'Recurso', 'cenerroj', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, '', NULL, 'Este cristal parece... ¿inerte?'),
('Cristal carmesí activado', 'Aumento', 'cenerrojacti', 0, 0, 1, 100, 0, 10, 0, 0, 0, 10, '', NULL, 'Un cristal carmesí. Parece desprender una especie de energía....<br>Aumenta la enegía máxima en <strong style=\"color:red;\">+10</strong>.'),
('Cono de Fresa', 'Alimento', 'conestrawberry', 0, 0, 1, 100, 100, 0, 0, 0, 0, 2, '', NULL, 'Cono de helado de fresa.\r\nEl favorito de Xilok.'),
('Gusanos de gominola', 'Alimento', 'yummyworms', 0, 0, 1, 100, 150, 0, 0, 0, 0, 2, '', NULL, 'Los gusanos de gominola se hacen a partir de azucar y almas de gusanos de tierra.'),
('Águila', 'Mascota', 'mragi', 0, 0, 1, 250000, 0, 0, 0, 0, 0, 6, NULL, NULL, 'Ave rapaz capaz de arrancar la carne de sus presas con sus afiladas garras.'),
('Cristal añil activado', 'Aumento', 'cenerazuacti', 0, 0, 1, 10000, 0, 25, 0, 0, 0, 10, '', NULL, 'Un cristal añil . Parece desprender una especie de energía....<br>Aumenta la enegía máxima en <strong style=\"color:blue;\">+25</strong>.'),
('Cristal añil inerte', 'Recurso', 'cenerazu', 0, 0, 1, 1000, 0, 0, 0, 0, 0, 4, '', NULL, 'Este cristal parece... ¿inerte?'),
('Cristal purpúreo activado', 'Aumento', 'cenerlilacti', 0, 0, 1, 1000000, 0, 50, 0, 0, 0, 10, '', NULL, 'Un cristal purpúreo. Parece desprender una especie de energía....<br>Aumenta la enegía máxima en <strong style=\"color:purple;\">+50</strong>.'),
('Cristal purpúreo inerte', 'Recurso', 'cenerlil', 0, 0, 1, 100000, 0, 0, 0, 0, 0, 4, '', NULL, 'Este cristal parece... ¿inerte?'),
('Filete de dragón', 'Alimento', 'filetedrag', 0, 0, 1, 360000, 400, 0, 0, 0, 0, 2, '', NULL, 'Huele rancio, aunque parece aportar bastante energía.<br>Premio de competencia de clanes.'),
('Guantes de oro', 'Guantes', 'gudeoro', 0, 0, 1, 18000, 5, 0, 0, 0, 0, 0, '', NULL, 'Ligeros como una pluma pero duros como una piedra.<br>Aún así, relucen como el primer día.<br>Premio de competencia de clanes.'),
('Manual de manipulación de cristales', 'Libro', 'rljpcr', 20, 0, 20, 20000, 0, 50, 0, 0, 0, 3, '', NULL, 'Manual que contiene las recetas para fabricar cristales mágicos de pura energía.'),
('Violín de Oscar', 'Artefacto', 'vioscar', 0, 0, 72, 100000, 1, 0, 0, 0, 1000, 0, '', NULL, 'El mejor regalo para una madre.</br><i>Marca Lifo</i>'),
('Dragón glacial', 'Mascota', 'dragohielo', 0, 0, 1, 100000000, 0, 0, 0, 0, 0, 6, '', NULL, 'Mascota de Xilok el despiadado.<br>Su aliento es gélido, como el corazón de su amo.'),
('Trofeo: Pluma de platino', 'Z-Esp13pla', 'trpplati', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, '', NULL, NULL),
('Receta: Amuleto de otra era', 'Libro', 'raotraera', 0, 0, 1, 0, 0, 10, 0, 0, 0, 3, '', NULL, 'Enseña a fabricar un amuleto de un poder sin igual.'),
('Escudo roto', 'Escudo', 'esroto', 0, 1, 1, 5, 2, 0, 0, 0, 0, 0, '', NULL, 'Escudo obtenido por verificar la cuenta de usuario.'),
('Insignia especial mano derecha', 'Especial', 'manod', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Insignia especial creada para las manos derechas.'),
('Trofeo: Medalla amistad', 'Z-Espri', 'medallaamistad', 0, 0, 20, 0, 1, 0, 50, 0, 0, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Trofeo: Medalla destreza', 'Z-Espri', 'medalladestreza', 0, 0, 20, 0, 1, 0, 50, 0, 0, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Trofeo: Medalla honor', 'Z-Espri', 'medallahonor', 0, 0, 20, 0, 1, 0, 50, 0, 0, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Trofeo: Medalla sangre', 'Z-Espri', 'medallasangre', 0, 0, 20, 0, 1, 0, 50, 0, 0, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Horca', 'Arma', 'pitchfork', 0, 0, 1, 10, 0, 1, 0, 0, 10, 0, '', NULL, 'La horca de un viejo granjero...'),
('Felicitación 2020', 'Cifrado', 'navidadi', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<h4>¡Feliz 2020!</h4>\r\n    Desde la administración queremos darte las gracias<br>\r\n    por jugar a <b>Lifo</b> y por ayudar a que este juego<br>\r\n    siga vivo.<br><br>\r\n    Ha sido un largo año, lleno de cambios para todos.<br>\r\n    Desde la administración, queremos comunicar que continuaremos<br>\r\n    esforzándonos por mantener el juego y modificarlo a poco<br>\r\n    con actualizaciones.<br><br>\r\n    Una vez más, gracias por todo. Un fuerte abrazo.<br>\r\n    Att: <i>Lifo</i>.', 'Felicitación de 2020 para los usuarios de Lifo.'),
('Brakna', 'Alimento', 'brakna', 0, 0, 1, 1000, 700, 0, 0, 0, 0, 2, '', NULL, 'La brakna es una fruta originaria de las cavernas de Lifo.<br>\r\nSu sabor recuerda al del membrillo, pero con un toque de mango.<br>\r\n<i style=\"color:red;\">Advertencia: Puede producir alucinaciones</i>'),
('Trofeo: Pollo de oro', 'Z-EspPollo', 'trofpollo', 0, 0, 1, 0, 0, 5, 10, 0, 0, 0, '', NULL, NULL),
('Recetario de bocadillos', 'Libro', 'lboc', 0, 5, 1, 1000, 0, 15, 0, 2000, 500, 3, '', NULL, 'Contiene recetas básicas para bocadillos.'),
('Bocadillo vegetal', 'Alimento', 'bocveg', 0, 0, 1, 1900, 13, 0, 0, 0, 0, 2, '', NULL, 'Bocata de vegetales.<br><i>100% sano</i>'),
('Bocadillo de pollo y lechuga', 'Alimento', 'bocpollec', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, '', NULL, 'Bocadillo de pollo y lechuga<br><i>El clásico</i>'),
('Bocadillo de solomillo y queso', 'Alimento', 'bocsolque', 0, 0, 1, 1600, 25, 0, 0, 0, 0, 2, '', NULL, 'Bocadillo de solomillo y queso.<br><i>Producto 100% no vegano</i>'),
('Esencia viva', 'Recurso', 'essence', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Aniquilación', 'Esencia', 'esencia_Aniquilacion', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Asfixia', 'Esencia', 'esencia_Asfixia', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Aura celestial', 'Esencia', 'esencia_Aura_celestial', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Aura de fuego', 'Esencia', 'esencia_Aura_de_fuego', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Aura de hielo', 'Esencia', 'esencia_Aura_de_hielo', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Aura divina', 'Esencia', 'esencia_Aura_divina', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Ayudante de huesos', 'Esencia', 'esencia_Ayudante_de_huesos', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Ayudante putrefacto', 'Esencia', 'esencia_Ayudante_putrefacto', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Bastión', 'Esencia', 'esencia_Bastion', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Bendición', 'Esencia', 'esencia_Bendicion', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Bola de fuego', 'Esencia', 'esencia_Bola_de_fuego', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Bola de hielo', 'Esencia', 'esencia_Bola_de_hielo', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Calavera voladora', 'Esencia', 'esencia_Calavera_voladora', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Caos', 'Esencia', 'esencia_Caos', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Ceguera vudú', 'Esencia', 'esencia_Ceguera_vudu', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Ciclo infinito', 'Esencia', 'esencia_Ciclo_infinito', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Confusión vudú', 'Esencia', 'esencia_Confusion_vudu', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Congelar alma', 'Esencia', 'esencia_Congelar_alma', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Control vudú', 'Esencia', 'esencia_Control_vudu', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Coraje divino', 'Esencia', 'esencia_Coraje_divino', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Criatura de energía', 'Esencia', 'esencia_Criatura_de_energia', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Desatar infierno', 'Esencia', 'esencia_Desatar_infierno', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Desorden de la realidad', 'Esencia', 'esencia_Desorden_de_la_realidad', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Destello', 'Esencia', 'esencia_Destello', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Devastación vudú', 'Esencia', 'esencia_Devastacion_vudu', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Dominación', 'Esencia', 'esencia_Dominacion', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Dragón de energía', 'Esencia', 'esencia_Dragon_de_energia', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Enredaderas', 'Esencia', 'esencia_Enredaderas', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Enredaderas protectoras', 'Esencia', 'esencia_Enredaderas_protectoras', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Esqueleto veloz', 'Esencia', 'esencia_Esqueleto_veloz', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Falsa neblina', 'Esencia', 'esencia_Falsa_neblina', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Falsa niebla', 'Esencia', 'esencia_Falsa_niebla', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Falsas enredaderas', 'Esencia', 'esencia_Falsas_enredareras', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Falso eclipse', 'Esencia', 'esencia_Falso_eclipse', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Fortaleza', 'Esencia', 'esencia_Fortaleza', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Fuego sagrado', 'Esencia', 'esencia_Fuego_sagrado', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Furia caótica', 'Esencia', 'esencia_Furia_caotica', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Gran variación del tiempo', 'Esencia', 'esencia_Gran_variacion_del_tiempo', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Guerrero ilusorio', 'Esencia', 'esencia_Guerrero_ilusorio', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: herida vudú', 'Esencia', 'esencia_Herida_vudu', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Heridas cicatrizantes', 'Esencia', 'esencia_Heridas_cicatrizantes', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Horda fantasmal', 'Esencia', 'esencia_Horda_fantasmal', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Igualdad', 'Esencia', 'esencia_Igualdad', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL);
INSERT INTO `objetos` (`nombreobj`, `tipo`, `img`, `nivelcomprar`, `nivelencontrar`, `niveluso`, `valor`, `prot`, `ataq`, `vida`, `posibilidad`, `puntosencontrar`, `usos`, `pasivas`, `texto`, `descripcion`) VALUES
('Esencia: Inflingir enfermedad', 'Esencia', 'esencia_Inflingir_enfermedad', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Invocación divina', 'Esencia', 'esencia_Invocacion_divina', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Invocación fantasmal', 'Esencia', 'esencia_Invocacion_fantasmal', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Juicio final', 'Esencia', 'esencia_Juicio_final', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Justicia divina', 'Esencia', 'esencia_Justicia_divina', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Lanzador de clavos fantasmal', 'Esencia', 'esencia_Lanzador_de_clavos_fantasmal', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Levitación', 'Esencia', 'esencia_Levitacion', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Llamada a la naturaleza', 'Esencia', 'esencia_Llamada_a_la_naturaleza', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Locura', 'Esencia', 'esencia_Locura', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Materialización fantasmal', 'Esencia', 'esencia_Materializacion_fantasmal', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Misil mágico', 'Esencia', 'esencia_Misil_magico', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Monstruosidad', 'Esencia', 'esencia_Monstruosidad', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Paradoja temporal', 'Esencia', 'esencia_Paradoja_temporal', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Poder elemental del fuego', 'Esencia', 'esencia_Poder_elemental_del_fuego', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Poder elemental del hielo', 'Esencia', 'esencia_Poder_elemental_del_hielo', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Presentir', 'Esencia', 'esencia_Presentir', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Rayo de fuego', 'Esencia', 'esencia_Rayo_de_fuego', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Rayo de hielo', 'Esencia', 'esencia_Rayo_de_hielo', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Reflejo fantasmal', 'Esencia', 'esencia_Reflejo_fantasmal', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Soplo divino', 'Esencia', 'esencia_Soplo_divino', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Telekinesia', 'Esencia', 'esencia_Telekinesia', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Terremoto', 'Esencia', 'esencia_Terremoto', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Tiempo muerto', 'Esencia', 'esencia_Tiempo_muerto', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Trinidad', 'Esencia', 'esencia_Trinidad', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Variación del tiempo', 'Esencia', 'esencia_Variacion_del_tiempo', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esencia: Velocidad', 'Esencia', 'esencia_Velocidad', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Hechizo: Juicio final', 'Hechizo', 'phjf', 0, 0, 80, 0, 100, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Bastión', 'Hechizo', 'phba', 0, 0, 70, 0, 45, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Aura celestial', 'Hechizo', 'phac', 0, 0, 50, 0, 26, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Justicia divina', 'Hechizo', 'phjd', 0, 0, 44, 0, 20, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Fuego sagrado', 'Hechizo', 'phfs', 0, 0, 37, 0, 15, 0, 0, 0, 0, 1, '', NULL, NULL),
('Hechizo: Ciclo infinito', 'Hechizo', 'phci', 0, 0, 110, 0, 30, 80, 50, 0, 0, 1, '', NULL, NULL),
('Hechizo: Igualdad', 'Hechizo', 'phig', 0, 0, 120, 0, 75, 1, 130, 0, 0, 1, '', NULL, NULL),
('Hechizo: Tiempo muerto', 'Hechizo', 'phtm', 0, 0, 130, 0, 150, 10, 10, 0, 0, 1, '', NULL, NULL),
('Hechizo: Trinidad', 'Hechizo', 'phtr', 0, 0, 140, 0, 70, 70, 70, 0, 0, 1, '', NULL, NULL),
('Hechizo: Dominación', 'Hechizo', 'phdo', 0, 0, 150, 0, -50, 200, 100, 0, 0, 1, '', NULL, NULL),
('Grimorio de la luz', 'Libro', 'lglu', 0, 0, 1, 16000000, 0, 800, 0, 0, 0, 3, '', NULL, NULL),
('Grimorio de la luz cerrado', 'Recurso', 'lgluc', 0, 40, 1, 6000000, 0, 0, 0, 70, 20000, 4, '', NULL, NULL),
('Grimorio de otro mundo', 'Libro', 'lgdom', 0, 0, 110, 300000000, 0, 2000, 0, 0, 0, 3, '', NULL, NULL),
('Grimorio de otro mundo cerrado', 'Libro', 'lgdomc', 0, 0, 1, 150000000, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Llave del grimorio de la luz', 'Recurso', 'gtl', 0, 40, 1, 2000000, 0, 0, 0, 200, 12000, 4, '', NULL, NULL),
('Llaves de otro mundo', 'Recurso', 'gtdom', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esfera añil', 'Recurso', 'esferaazulA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esfera carmesí', 'Recurso', 'esferarojaA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esfera de almas', 'Recurso', 'esferamoradaA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Esfera de jade', 'Recurso', 'esferaverdeA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, '', NULL, NULL),
('Ración de uvas dimensionales', 'Festividad', 'rguu', 0, 0, 1, 1000000, 40, 0, 0, 10, 0, 2, '', NULL, 'Fruta agria usada en la fabricación de zumos y vinos.<br>\r\nA la venta durante el 1 de enero de 2021.'),
('Felicitación 2021', 'Cifrado', 'feliz2021', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<h4>¡Feliz 2021!</h4>\r\n Desde la administración queremos darte las gracias<br>\r\n por jugar a <b>Lifo</b> y por ayudar a que este juego<br>\r\n siga vivo.<br><br>\r\n Ha sido un largo año, lleno de cambios para todos.<br>\r\n \r\n Desde la administración, queremos comunicar que continuaremos<br>\r\n esforzándonos por mantener el juego y seguiremos mejorándolo<br>\r\n con cambios y mejoras.<br><br>\r\n Una vez más, gracias por todo. Un fuerte abrazo.<br>\r\n Att: <i>Lifo</i>.', 'Felicitación de 2021 para los usuarios de Lifo.'),
('Amuleto de otra era', 'Amuleto', 'aotraera', 0, 0, 100, 0, 50, 25, 100, 0, 0, 0, '', NULL, 'Un amuleto poderoso forjado por los enanos eras atrás.<br>\r\nReforjar este amuleto sería toda una hazaña.'),
('Joya antigua', 'Recurso', 'joyaantigua', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Antigua joya de la decimoséptima era. Dicen que esta joya procede de otra dimensión.<br>Quizás sirva para algo.'),
('Mitad derecha obsidiana', 'Recurso', 'mitadderecha', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Esta semiesfera negra está compuesta en su totalidad por una piedra de obsidiana.<br>Quizás sirva para algo.'),
('Mitad izquierda perleada', 'Recurso', 'mitadizquierda', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Esta semiesfera negra está compuesta en su totalidad por una perla marina.<br>Quizás sirva para algo.'),
('Sextante de Altorias', 'Recurso', 'sextante', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'Parece ser un instrumento mágico del mago Altorias.<br>Después de verlo detenidamente no entiendes como se usa.'),
('Naranja acuchillada', 'Arma', 'esplgnar', 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, '', NULL, 'Es una naranja atravesada por una espada...'),
('Trofeo: Medalla misterio', 'Z-Espri', 'medallamisterio', 0, 0, 20, 0, 1, 0, 50, 0, 0, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Trofeo: Medalla saber', 'Z-Espri', 'medallasaber', 0, 0, 20, 0, 1, 0, 50, 0, 0, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Naranja doblemente acuchillada', 'Arma', 'esplgnarr', 0, 0, 1, 0, 10, 0, 0, 0, 0, 0, '', NULL, 'Es una naranja atravesada por una espada y por una daga...'),
('Naranja triplemente acuchillada', 'Arma', 'esplgnarrr', 0, 0, 1, 0, 15, 0, 0, 0, 0, 0, '', NULL, 'Es una naranja atravesada por una espada y por dos dagas...'),
('Botas de fuego mágico', 'Botas', 'botfma', 0, 0, 30, 5000000, 5, 0, 0, 0, 0, 0, '', NULL, 'Estas botas emanan fuego que no quema al portador.<br>\r\nSu fuego protege al dueño de la lava.'),
('Cofre enano', 'Cofre', 'cenano', 0, 0, 1, 0, 0, 0, 0, 0, 0, 9, NULL, NULL, '¿Qué tendrá dentro?'),
('Corazón de la montaña', 'Amuleto', 'amcormon', 0, 0, 40, 0, 0, 5, 20, 0, 0, 0, '', NULL, 'Dicen que este amuleto es usado por los <br>\r\nantiguos enanos que habitan el interior <br>\r\nde las montañas.<br>\r\nEsta hecho con cuarzo azul.'),
('Diario de Eldron I', 'Cifrado', 'diarioeldroni', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', 'La vida de un gnomo no es fácil, y más <br>\r\nsi eres un gnomo mágico. En la comarca <br>\r\nno quieren ni verme y más después del <br>\r\ndesastre que hice en el puesto donde <br>\r\ntrabajaba. <br>\r\n<br>\r\nSiempre ha sido difícil hacerse un hueco <br>\r\nen algún sitio. Padre trabaja defendiendo <br>\r\na los aventureros más débiles en la arena, <br>\r\ny madre tiene un mercado en el pueblo.<br>\r\n<br>\r\nPodría decirse que me sentía inútil. <br>\r\nPero fue antes de conocer a Altorias. <br>\r\n<br>\r\nAltorias es un viejo mago de la XVIII guerra y vive <br>\r\nen el centro de los bosques de Lifo, oculto a la vista <br>\r\nde todos. No sé como, pero un día explorando el bosque <br>\r\nacabe en frente de su cabaña y... nos conocimos. <br>\r\n<br>\r\nOmitiré los detalles. Pero lo curioso es que este viejo <br>\r\nloco acabó contratándome para que defienda su hogar <br>\r\nlas 23 horas del día. Sí, digo 23 porque al menos me deja <br>\r\ndescansar de 5:00AM a 6:00AM, que es cuando los <br>\r\naventureros que lo molestan duermen.<br>\r\n<br>\r\nComo a esa hora estoy descansando, la barrera mágica <br>\r\nque genero desaparece, haciendo la cabaña visible para <br>\r\ntodos. Incluso para los que están fuera del bosque.<br>\r\n<br>\r\nEspero que nunca se de cuenta de esto, o si no me matará.<br>\r\n<br>\r\n<i>Eldron - 10 de Enero de la IV Era</i>', 'Diario personal.'),
('Diario de Eldron II', 'Cifrado', 'diarioeldronii', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', 'El día de hoy lo titulo: Desastre<br>\r\n<br>\r\nAyer el maestro Altorias salió camino a la <br>\r\nComarca, a encontrarse con los aspirantes que <br>\r\nparticipan este año en el reto de las campanas <br>\r\nreales. Iba a ser un viaje largo, de 1 día al <br>\r\nmenos. Por lo que el maestro me dejó a cargo <br>\r\nde la cabaña defendiéndola de cualquiera que <br>\r\nosase acercarse a ella.<br>\r\n<br>\r\n...<br>\r\n<br>\r\nMe doy vergüenza a mi mismo. ¿Por qué lo digo? <br>\r\nPorque aproveché que no estaba el maestro para <br>\r\nsalir al bosque a recoger moras y fresas. <br>\r\nCuando ya estaba cerca de la cabaña, las devoré <br>\r\ny me acabé quedando dormido del zampón que me <br>\r\ndi. Sí, ahí mismo, en la pura hierva de al lado <br>\r\nla cabaña. <br> Si me hubiese visto el maestro <br>\r\nahora mismo sería un gnomo transformado en cerdo.<br>\r\n<br>\r\nLo peor de todo no fue eso.<br> Cuando desperté <br>\r\nun dragón alado se había colado en la cabaña, supongo <br>\r\nque atraído por el olor de la poción de savia de <br>\r\nhidra que estaba realizando el maestro. <br>\r\n<br>\r\nFue un caos. Tiro todos los viales al suelo, rompió el cayado <br>\r\nde archicanciller del maestro, e incluso rasgó sus togas <br>\r\nde hechicero. Sí, sus favoritas, unas amarillas. <br>\r\nUn desastre.<br>\r\n<br>\r\nPor suerte Altorias llegó y con un par de hechizos <br>\r\necho al dragón de la cabaña, aunque hay malas noticias...<br>\r\nEl dragón se llevó bastantes cosas que encontró, y entre ellas <br>\r\nlos sextantes mágicos del maestro.<br> No hubo <br>\r\nmanera de hacer que el maldito dragón los soltase y, <br>\r\nal final, acabó yéndose con ellos.<br>\r\n<br>\r\nSin embargo, no todo está perdido. Vi al dragón volar <br>\r\nhacia la torre del maestro, la que se encuentra al lado <br>\r\nde la Comarca. Probablemente el dragón se refugiase <br>\r\nallí y soltase los sextantes.<br>\r\n<br>\r\nIría yo mismo a buscarlos, pero solo tengo una hora de descanso,<br>\r\nasí que no me daría tiempo a volver...<br>\r\nQué remedio.<br>\r\n<br>\r\nEn fin, que ricas estaban las moras, me encantan.<br>\r\n<br>\r\n<i>Eldron - 20 de Junio de la IV Era</i>', 'Diario personal.'),
('Cartel del vendedor ambulante', 'Cifrado', 'cartelvendedor', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<strong>\r\nHOLA AMIGO,<br>\r\n<br>\r\n¿QUERER COMIDAS EXÓTICA?<br>\r\nYO TENER.<br>\r\n¿QUERER ARMADURAS EXÓTICA?<br>\r\nYO TENER.<br>\r\n¿QUERER MASCOTAS EXÓTICA?<br>\r\nYO TENER.<br>\r\n<br>\r\nTENER TODO Y MÁS, Y PODER <br>\r\nSER TUYO, SI TENER ALGO <br>\r\nQUE OFRECER CLARO ESTAR.<br>\r\n<br>\r\nSI TU VER, VENIR A MI, NO <br>\r\nDUDAR. SI ALGO INTERESAR,<br>\r\nHABER TRATO AMIGO.</strong><br>\r\n<br>\r\n<i>Firmado: el Vendedor Ambulante</i>', 'Cartel con información.'),
('Carta a Melissa', 'Cifrado', 'cartamelissa', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', 'Hola Melissa, ¿Cómo estás? <br>\r\n <br>\r\nTu tío y yo estamos bien, aunque un  <br>\r\npoco preocupados por ti. Cuéntanos, <br> \r\n¿Cómo es la vida en la Comarca?  <br>\r\nAquí la vida sigue siendo tranquila en <br>\r\nlos campos. Segamos, recogemos el trigo  <br>\r\ny la cebada, hacemos cerveza, cortamos  <br>\r\nleña... Bueno, lo que siempre hemos hecho. <br>\r\n <br>\r\nPor lo demás todo sigue igual, tu hermana  <br>\r\nsigue perdida con ese caballero \"apuesto\". <br>\r\nEse tal Eldron. Aún no nos lo ha presentado, <br>\r\na pesar de que todos los días la vemos ir  <br>\r\nal bosque a verlo. Dice que es un hombre  <br>\r\nguapo, alto y que tiene tierras, que nos  <br>\r\nencantará. Pero que aún no está preparada  <br>\r\npara presentárnoslo. Esperaremos pues. <br>\r\n <br>\r\nPor cierto, el otro día vino un vendedor  <br>\r\nambulante. Ni nos dimos cuenta, creo que  <br>\r\nusa algún tipo de magia o algo, porque  <br>\r\napareció de repente. Tu tío se asustó, y mucho, <br>\r\nporque apareció de la nada. <br>\r\nEl vendedor dijo que puede aparecer en cualquier  <br>\r\nsitio a cualquier persona, que es raro pero  <br>\r\nposible. Nos empezó a contar una historia de  <br>\r\nalgo de \"magia de suerte\" o algo por el estilo. <br>\r\nTampoco es que prestase mucha atención, estaba <br>\r\nanonadada viendo lo que ofrecía el vendedor. <br>\r\nAunque si me llegué a enterar algo de \"1 posibilidad <br>\r\nentre 100 cada vez que sales y entras del mundo\". <br>\r\nNo tengo ni idea de a que se refería. Tu tío igual <br>\r\nse quedó un rato con él hasta que bueno, se esfumó. <br>\r\n<br>\r\nEn fin, historias de la granja, tonterías. <br>\r\nCuídate mi pequeña. Pronto nos veremos en el cumpleaños <br>\r\nde tu madre.<br>\r\n<br>\r\nUn abrazo de tu tío y de tu tía.<br>\r\n<br>\r\n<i>Shadra - 13 de Marzo de la IV Era</i>', 'Carta personal.'),
('Historia de las Eras VOL I', 'Cifrado', 'historiaerasi', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<div class=\"txt_escritos\" style=\"font-family: Baskerville Old Face; font-size: 16px;\">\r\n<h3>- Los Enanos -</h3>\r\nHay unos seres que habitan el interior de las montañas de Lifo, que excavan túneles a través de la dura roca y que rara vez ven la luz del Sol. Los enanos, descendientes de los hombres que una vez fueron obligados a esconderse en las profundidades de la tierra. \r\nNadie deseaba ese destino, pero la segunda guerra fue dura, para todos.<br>\r\n<br>\r\nLos gigantes arrasaban con todo a su paso. La comarca, los campos, los bosques, todo. Solo había dos opciones: vivir una vida siendo siervo; o huir hacia donde nadie pueda verte, hacia las profundidades…<br>\r\n<br>\r\nLos que una vez fueron hombres, con el pasar de las eras, fueron perdiendo estatura. Mientras que, por un lado, gracias a los minerales de la montaña fortalecieron su cuerpo, la falta de luz solar les hizo empequeñecer y la comida, contaminada por carbón, tiñó su piel de oscuro. <br>\r\n<br>\r\nA pesar de vivir recluidos en las profundidades, los enanos forjaron una comunidad, progresaron, y una ciudad nació con el pasar de las eras. Ionar. Casas, puentes, esculturas. Todo tallado en la dura roca de la montaña. Una ciudad que desprendía grandeza y respeto se mire por donde se mire…<br>\r\n<br>\r\n<img src=\"//img.lifo.es/img/reionar.jpg\" style=\"max-width:450px; border: 4px ridge grey;\" alt=\"Pintura\"><br>\r\n<i>Ionar, ciudad de los enanos.</i>\r\n</div>', 'Contiene historias antiguas.'),
('Historia de las Eras VOL II', 'Cifrado', 'historiaerasii', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<div  class=\"txt_escritos\" style=\"font-family: Baskerville Old Face; font-size: 16px;\">\r\n<h3>- Ejercito enano -</h3>\r\nLos enanos son una raza curiosa. A pesar de su estatura, son valerosos guerreros y tienen un fuerte sentido del honor.<br>\r\n<br>\r\nEntre las filas de su ejército, puedes encontrar múltiples roles, como magos, guerreros, nigromantes, chamanes y arqueros. Aunque hay una característica común entre todos ellos. Siempre portan armaduras y armas de fuego mágico. Al parecer, es indispensable usar este equipo en las profundidades de su reino para sobrevivir. El fuego mágico protege de la lava y del fuego a su portador y, además, regula su temperatura. <br>\r\n<br>\r\nOtra característica curiosa es qué entre ellos, existe una creencia. Aquel enano, que no porte todo el equipo completo de fuego mágico es considerado indigno. Se cree que es porque todos, de jóvenes, son obligados a forjarse su propia armadura y armas y, si no la llevas, significa que no respetas las tradiciones de tu pueblo. <br>\r\n<br>\r\nLos aventureros amigos de los enanos también deben portar esta armadura. Tiempo atrás, el mago Altorias los visitó una vez sin llevar encima la espada de fuego mágico. Lo que ocurrió después era lo esperable. Un enano al verlo incompleto y, al grito de “indigno”, le atacó por la espalda. Casi acaba con él, pero por suerte, pudo escapar. Más adelante regresó, esta vez con todo el equipo para evitar males mayores. <br>\r\n<br>\r\nPor precaución y por respeto hacia su pueblo, si se visita Ionar o si explorando hay algún encuentro con un enano, es vital estar equipados con la armadura completa, más el escudo y su espada. Todo de fuego mágico. <br>\r\n<br>\r\n<img src=\"//img.lifo.es/img/reejercitoenano.jpg\" style=\"max-width:450px; border: 4px ridge grey;\" alt=\"Pintura\"><br>\r\n<i>Ejercito enano en las profundidades, preparándose para la 2º guerra.</i>\r\n</div>', 'Contiene historias antiguas.'),
('Historia de las Eras VOL III', 'Cifrado', 'historiaerasiii', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<div class=\"txt_escritos\" style=\"font-family: Baskerville Old Face; font-size: 16px;\">\r\n<h3>- En el corazón de la montaña -</h3>\r\nIonar, ciudad de los enanos. Oculta a la vista de todos, tallada en roca dentro de una montaña. No cualquiera podía acceder a ella. Solo unos pocos han conocido los pilares de piedra que la soportan o las inmensas estatuas de los reyes enanos que la custodian.<br>\r\n<br>\r\nLa única forma de acceder o salir de ella no era sencilla. Solo aquel que portase el amuleto, era considerado miembro de la comunidad. Cada enano, mujer, hombre, anciano o niño. Todos debían contar con su amuleto, y para tenerlo había que ganárselo.<br>\r\n<br>\r\nCada enano, era sometido de joven a una prueba: escalar la montaña hasta la cima. La tarea no era sencilla, debían atravesar distintas zonas que, para un niño… pueden ser letales. Atravesar una gruta helada llena de vamporos helados. Hallar la salida del laberinto de hielo. Salir a la luz escalando por la montaña helada y, posteriormente, a través de toda la cordillera. Todo esto para lograr alcanzar la cima nevada.\r\nLa última parte de la prueba conllevaba buscar un fragmento de cuarzo azul, lo cual, no era tarea sencilla, teniendo en consideración las fuertes ventiscas de la cima.<br>\r\n<br>\r\nNo todos los enanos conseguían esta hazaña, sólo los más fuertes regresaban con su cuarzo colgado al cuello, abriéndoles éste las puertas de la ciudad.<br>\r\nAunque no siempre fue un enano el que conseguía el collar. Ciertos aventureros han completado la prueba. Amigos de enanos que fueron considerados merecedores de entrar en la ciudad.<br> \r\nAún siendo así, todos ellos recorrieron el mismo camino hasta la cima, en busca de su amuleto, su cuarzo, su llave hacia la ciudad.<br>\r\n<br> \r\nTodos ellos portaban, el corazón de la montaña.<br>\r\n<br>\r\n<img src=\"//img.lifo.es/img/recorazonmontana.jpg\" style=\"max-width:450px; border: 4px ridge grey;\" alt=\"Pintura\"><br>\r\n<i>Cima de la montaña, en plena ventisca.</i>\r\n</div>', 'Contiene historias antiguas.'),
('Historia de las Eras VOL IV', 'Cifrado', 'historiaerasiv', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<div class=\"txt_escritos\" style=\"font-family: Baskerville Old Face; font-size: 16px;\">\r\n<h3>- Las dos mitades -</h3>\r\nTiempo atrás, durante la cuarta guerra, los enanos eran asolados de nuevo por los gigantes y, está vez, se añadió un nuevo problema: los trolls de las profundidades. Para defenderse de tal amenaza, el rey Nathril, encargó forjar algo. Un amuleto singular, una pieza de gran poder que dotase a su portador de energía sin igual. <br>\r\n<br>\r\nPara fabricar este amuleto, los enanos usaron media perla de Nereia, que les concedió la reina del mar por su ayuda en la tercera guerra. Para la otra mitad del collar, se usó un fragmento de obsidiana, obtenida por Nathril de las profundidades de un volcán. Por último, se engarzó una joya, pero no una cualquiera. Esta joya era la manifestación física de la montaña, la cuál los enanos atesoraban por el gran poder que contenía.<br>\r\n<br>\r\nUna vez forjado el collar, el rey lo usó para defender a su pueblo. Nadie, salvo los enanos, cruzó las puertas de Ionar. La ciudad fue defendida, aunque se pagó un alto precio… El uso del collar llevó a la locura al rey, que ansioso de poder, atacó a su propio pueblo y a quienes se oponían a su palabra.<br>\r\n<br>\r\nEn un acto de valentía, Myrrodir, hijo de Nathril, arrebató el amuleto a su padre, desprendiéndolo de todo el poder que adquirió. Una vez débil, el rey fue encarcelado por sus actos y se le ocultó al mundo en algún lugar de las profundas mazmorras de la ciudad. Mientras tanto, la comunidad decidió deshacerse del amuleto. El amuleto que una vez sirvió para defenderlos a todos, ahora solo traía desdicha a su pueblo.<br>\r\n<br>\r\nEl amuleto se partió en lo que una vez lo compuso y para asegurarse de que nadie volviera a forjar el amuleto, sus partes fueron ocultadas al mundo. De la mitad de la perla no se sabe nada. De lo que si sabe es del fragmento obsidiano, y de la joya. <br>\r\n<br>\r\nEl fragmento obsidiano, se ocultó en el templo subterráneo, más allá de las mazmorras trolls. Por otro lado, la joya, al ser la parte con más poder, se le encomendó su custodia a un mago conocido amigo del rey, Altorias.<br>\r\n<br>\r\n<img src=\"//img.lifo.es/img/rereynathril.jpg\" style=\"max-width:450px; border: 4px ridge grey;\" alt=\"Pintura\"><br>\r\n<i>Rey Nathril, corrompido por el amuleto.</i>\r\n</div>', 'Contiene historias antiguas.'),
('Historia de las Eras VOL V', 'Cifrado', 'historiaerasv', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, '', '<div class=\"txt_escritos\" style=\"font-family: Baskerville Old Face; font-size: 16px;\">\r\n<h3>- El destino del custodio -</h3>\r\nLas partes del amuleto se habían ocultado. Solo faltaba esconder una última cosa, la receta que enseñaba a forjarlo. Los enanos, por si en algún futuro se viesen obligados a tener que recurrir de nuevo a los poderes del amuleto, escribieron los pasos en un papiro para fabricarlo y lo sellaron con lava de las entrañas de la montaña.<br>\r\n<br>\r\nA diferencia de los otros componentes, éste era el más importante. Por ellos, se guardó en un cofre en las profundidades de un volcán.<br>\r\n<br>\r\nAunque con esto se podría pensar que era suficiente, se tomo otra medida para asegurar que no cayese en las manos equivocadas. Se le asignó un custodio, alguien que estuviese todo el día y sin descanso defendiéndola de posibles saqueadores.<br>\r\n<br>\r\nNadie quería un destino así. Custodiar por toda la eternidad un artefacto poderoso no era algo que pudiese hacer cualquiera. Sin embargo, si hubo una persona que se ofreció para esta tarea. Myrrodir, el hijo de Nathril.<br>\r\n<br>\r\nTeniendo un sentimiento de culpa, Myrrodir eligió ese destino.<br>\r\n<br>\r\nY así fue, se le recluyó junto al cofre en una sala oculta a la vista de todos, en el centro del volcán. La sala fue sellada, para que solo los portadores del corazón de la montaña pudiesen verla. En cuanto Myrrodir, se despidió de su familia y se encaminó a su destino eterno.<br> \r\n<br>\r\n<i>Altorias:</i>  “¿Estás listo Myrrodir?”<br>\r\n<i>Myrrodir:</i>  “Sí. Adelante.”<br>\r\n<i>Altorias:</i> “Tu sacrificio será olvidado, pero protegerás con él a tu pueblo.”<br>\r\n<br>\r\nAltorias, lanzó un hechizo sobre Myrrodir, que transformó su piel oscura en piedra. Su corazón, dejó de latir, y junto al cofre se quedó arrodillado.<br>\r\n<br>\r\nLa sala fue sellada, y Altorias, el único conocedor de su ubicación, dejó la comunidad y nunca regresó a Ionar.<br>\r\n<br>\r\n<img src=\"//img.lifo.es/img/remyrrodir.jpg\" style=\"max-width:450px; border: 4px ridge grey;\" alt=\"Pintura\"><br>\r\n<i>Myrrodir, convertido en piedra.</i>\r\n</div>', 'Contiene historias antiguas.'),
('Cerdo asado', 'Alimento', 'cerdoasado', 0, 0, 1, 0, 55, 0, 0, 0, 0, 2, '', NULL, 'Es una pata de cerdo asada.'),
('Cerdo', 'Mascota', 'macerd', 0, 10, 1, 10000, 0, 0, 0, 2500, 200, 4, '', NULL, NULL),
('Pañuelo mágico', 'Recurso', 'panuelodetela', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '', NULL, 'A pesar de ser un pañuelo mágico de tela, <br>\r\nestá lleno de mocos...'),
('Cocktail de moras mágicas', 'Alimento', 'rrcocmora', 0, 0, 1, 0, 60, 0, 0, 0, 0, 2, '', NULL, 'Un cocktail de moras mágicas fabricado por Altorias.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertasambulante`
--

CREATE TABLE `ofertasambulante` (
  `id` int(11) NOT NULL,
  `idoferta` int(11) NOT NULL,
  `nombreobj` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `ofrecido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ofertasambulante`
--

INSERT INTO `ofertasambulante` (`id`, `idoferta`, `nombreobj`, `cantidad`, `ofrecido`) VALUES
(1, 1, 'Escorpión', 1, 1),
(2, 1, 'Carbón', 25, 0),
(3, 2, 'Mitad izquierda perleada', 1, 1),
(4, 2, 'Escudo celestial', 1, 0),
(5, 3, 'Cono de Fresa', 1, 1),
(6, 3, 'Pescado grande', 10, 0),
(7, 4, 'Ración de uvas dimensionales', 1, 1),
(8, 4, 'Uvas', 50, 0),
(9, 5, 'Botas de fuego mágico', 1, 1),
(10, 5, 'Daga de fuego mágico', 1, 0),
(11, 5, 'Espada de fuego mágico', 1, 0),
(12, 5, 'Escudo de fuego mágico', 1, 0),
(13, 5, 'Yelmo de fuego mágico', 1, 0),
(14, 5, 'Coraza de fuego mágico', 1, 0),
(15, 5, 'Perneras de fuego mágico', 1, 0),
(20, 6, 'Cerdo asado', 2, 1),
(21, 6, 'Cerdo', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertasesp`
--

CREATE TABLE `ofertasesp` (
  `id` int(11) NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `preciojoyas` int(10) NOT NULL,
  `unico` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ofertasesp`
--

INSERT INTO `ofertasesp` (`id`, `nombreobj`, `preciojoyas`, `unico`) VALUES
(1, 'Manual de infusión de vida', 1, 0),
(2, 'Estatua esmeralda', 1, 0),
(3, 'Estatua rubí', 1, 0),
(4, 'Ordok', 1, 0),
(5, 'Diablillo ígneo', 1, 0),
(6, 'Diablillo gélido', 1, 0),
(7, 'Cetro de invocación de dragones', 3, 0),
(13, 'Fruta prohibida', 2, 0),
(15, 'Brakna', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id` int(11) NOT NULL,
  `idsorteo` int(11) NOT NULL,
  `nombrejug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntoshalloween`
--

CREATE TABLE `puntoshalloween` (
  `id` int(11) NOT NULL,
  `nombrejug` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `resultado` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidadresultado` int(10) NOT NULL,
  `tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `energia` int(20) NOT NULL,
  `dificultadhacer` int(4) NOT NULL,
  `perderingredientes` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `resultado`, `cantidadresultado`, `tipo`, `energia`, `dificultadhacer`, `perderingredientes`) VALUES
(1, 'Hechizo: Ayudante de huesos', 1, 'Hechizo', 26, 20, 1),
(2, 'Hechizo: Ayudante putrefacto', 1, 'Hechizo', 29, 40, 1),
(3, 'Hechizo: Calavera voladora', 1, 'Hechizo', 34, 35, 1),
(4, 'Hechizo: Esqueleto veloz', 1, 'Hechizo', 39, 22, 1),
(5, 'Hechizo: Monstruosidad', 1, 'Hechizo', 40, 40, 0),
(6, 'Agua bendita', 1, 'Recurso', 5, 0, 0),
(7, 'Agua sagrada', 1, 'Recurso', 10, 10, 0),
(8, 'Hechizo: Bendición', 1, 'Hechizo', 9, 60, 0),
(9, 'Hechizo: Soplo divino', 1, 'Hechizo', 12, 66, 0),
(10, 'Hechizo: Aura divina', 1, 'Hechizo', 14, 64, 0),
(11, 'Hechizo: Coraje divino', 1, 'Hechizo', 20, 70, 0),
(12, 'Hechizo: Invocación divina', 1, 'Hechizo', 24, 70, 0),
(13, 'Esfera del averno', 1, 'Recurso', 10, 10, 0),
(14, 'Esfera celestial', 1, 'Recurso', 10, 10, 0),
(15, 'Arma adimensional', 1, 'Arma', 1800, 90, 0),
(16, 'Escudo adimensional', 1, 'Escudo', 1800, 90, 0),
(17, 'Yelmo adimensional', 1, 'Yelmo', 1800, 90, 0),
(18, 'Coraza adimensional', 1, 'Coraza', 1800, 90, 0),
(19, 'Botas adimensionales', 1, 'Botas', 1800, 90, 0),
(20, 'Amuleto adimensional', 1, 'Amuleto', 1800, 90, 0),
(21, 'Perneras adimensionales', 1, 'Perneras', 1800, 90, 0),
(22, 'Escudo pegajoso', 1, 'Artilugio', 5, 40, 0),
(23, 'Escudo pegajoso permanente', 1, 'Artilugio', 19, 70, 0),
(24, 'Escudo lanzaclavos', 1, 'Artilugio', 9, 50, 0),
(25, 'Escudo lanzaagujas', 1, 'Artilugio', 12, 60, 0),
(217, 'Insignia Atrezzo E', 1, 'Atrezzo', 100, 0, 0),
(216, 'Insignia Atrezzo D', 1, 'Atrezzo', 100, 0, 0),
(215, 'Insignia Atrezzo C', 1, 'Atrezzo', 100, 0, 0),
(214, 'Insignia Atrezzo B', 1, 'Atrezzo', 100, 0, 0),
(213, 'Insignia Atrezzo A', 1, 'Atrezzo', 100, 0, 0),
(31, 'Lanzaclavos', 1, 'Artilugio', 90, 80, 1),
(32, 'Ballesta', 1, 'Artilugio', 105, 90, 1),
(33, 'Ballesta sabia', 1, 'Artilugio', 140, 40, 0),
(34, 'Ballesta de energía', 1, 'Artilugio', 370, 60, 0),
(35, 'Algodón', 1, 'Recurso', 4, 10, 1),
(36, 'Muñeco', 1, 'Recurso', 2, 30, 1),
(37, 'Venda', 1, 'Recurso', 1, 40, 1),
(38, 'Estatuilla de madera', 1, 'Recurso', 10, 30, 1),
(39, 'Estatuilla de madera sabia', 1, 'Recurso', 14, 60, 1),
(40, 'Hongo vudú', 3, 'Recurso', 5, 30, 0),
(41, 'Esporas', 1, 'Recurso', 1, 12, 1),
(42, 'Hechizo: Herida vudú', 1, 'Hechizo', 10, 10, 1),
(43, 'Hechizo: Control vudú', 1, 'Hechizo', 15, 15, 0),
(44, 'Hechizo: Ceguera vudú', 1, 'Hechizo', 23, 20, 0),
(45, 'Hechizo: Confusión vudú', 1, 'Hechizo', 34, 10, 0),
(46, 'Hechizo: Devastación vudú', 1, 'Hechizo', 54, 55, 1),
(47, 'Espejo', 1, 'Recurso', 10, 18, 1),
(48, 'Espejo sabio', 1, 'Recurso', 10, 24, 1),
(49, 'Hechizo: Invocación fantasmal', 1, 'Hechizo', 10, 20, 0),
(50, 'Hechizo: Reflejo fantasmal', 1, 'Hechizo', 12, 10, 0),
(51, 'Hechizo: Lanzador de clavos fantasmal', 1, 'Hechizo', 20, 20, 0),
(52, 'Hechizo: Materialización fantasmal', 1, 'Hechizo', 85, 12, 0),
(53, 'Hechizo: Horda fantasmal', 1, 'Hechizo', 100, 5, 1),
(54, 'Aguja', 100, 'Recurso', 20, 0, 0),
(55, 'Clavo', 50, 'Recurso', 15, 0, 0),
(56, 'Aguja de oro', 100, 'Recurso', 15, 0, 0),
(57, 'Clavo de oro', 50, 'Recurso', 10, 0, 0),
(58, 'Herramientas de forja avanzada', 1, 'Recurso', 30, 40, 0),
(59, 'Tablón de madera', 1, 'Recurso', 3, 5, 1),
(60, 'Savia', 1, 'Recurso', 6, 15, 1),
(61, 'Tablón de madera sabia', 1, 'Recurso', 3, 55, 1),
(62, 'Savia de madera sabia', 1, 'Recurso', 6, 65, 1),
(63, 'Pegamento', 1, 'Recurso', 5, 30, 1),
(64, 'Pinturas', 1, 'Recurso', 3, 5, 1),
(65, 'Hierro líquido', 1, 'Recurso', 5, 10, 0),
(66, 'Mercurio', 1, 'Recurso', 37, 50, 0),
(67, 'Oro líquido', 1, 'Recurso', 38, 50, 1),
(68, 'Lingote de hierro', 1, 'Recurso', 5, 10, 0),
(69, 'Vial de eter', 1, 'Recurso', 8, 20, 1),
(70, 'Lingote de oro', 1, 'Recurso', 30, 50, 0),
(71, 'Vial de onyx líquido', 1, 'Poción', 5, 20, 1),
(72, 'Frasco de onyx líquido', 1, 'Poción', 7, 40, 1),
(73, 'Pócima de onyx líquido', 1, 'Poción', 9, 60, 1),
(74, 'Vial de agua de los deseos', 1, 'Poción', 5, 20, 1),
(75, 'Frasco de agua de los deseos', 1, 'Poción', 7, 40, 1),
(76, 'Pócima de agua de los deseos', 1, 'Poción', 9, 60, 1),
(77, 'Vial de polen de hidra', 1, 'Poción', 2, 10, 0),
(78, 'Frasco de polen de hidra', 1, 'Poción', 3, 20, 0),
(79, 'Pócima de polen de hidra', 1, 'Poción', 4, 30, 0),
(80, 'Vial de sangre de dragón', 1, 'Poción', 2, 10, 0),
(81, 'Frasco de sangre de dragón', 1, 'Poción', 3, 20, 0),
(82, 'Pócima de sangre de dragón', 1, 'Poción', 4, 30, 0),
(83, 'Cristal de invocación del poder', 1, 'Recurso', 25, 50, 1),
(84, 'Pergamino en blanco del poder', 1, 'Recurso', 25, 50, 1),
(85, 'Menú completo', 1, 'Alimento', 45, 95, 0),
(86, 'Preparado casero de fuerza', 5, 'Poción', 10, 10, 0),
(87, 'Preparado casero de agilidad', 5, 'Poción', 10, 10, 0),
(88, 'Hongo druida', 5, 'Recurso', 10, 10, 0),
(89, 'Ensalada', 1, 'Alimento', 5, 20, 1),
(90, 'Hamburguesa', 1, 'Alimento', 5, 30, 1),
(91, 'Jarra de bebida energética', 6, 'Alimento', 25, 60, 1),
(92, 'Yogur de frutas', 2, 'Alimento', 30, 70, 1),
(93, 'Sopa de pollo y huevo', 1, 'Alimento', 10, 50, 0),
(94, 'Jarra de cerveza', 1, 'Alimento', 4, 10, 0),
(95, 'Palomitas de maiz', 1, 'Alimento', 2, 20, 0),
(96, 'Yogur', 1, 'Alimento', 3, 20, 0),
(97, 'Empanada', 1, 'Alimento', 4, 40, 0),
(98, 'Sopa', 1, 'Alimento', 2, 20, 0),
(99, 'Tortilla', 1, 'Alimento', 3, 50, 0),
(100, 'Huevo cocido', 1, 'Alimento', 2, 10, 0),
(101, 'Frasco de vinagre', 1, 'Recurso', 2, 20, 0),
(102, 'Barra de pan', 1, 'Alimento', 4, 40, 0),
(103, 'Bizcocho', 1, 'Alimento', 5, 50, 1),
(104, 'Chocolate', 2, 'Alimento', 4, 20, 1),
(105, 'Jarra de vino', 1, 'Alimento', 4, 40, 0),
(106, 'Queso', 1, 'Alimento', 4, 20, 0),
(107, 'Mantequilla', 1, 'Alimento', 2, 30, 0),
(108, 'Ración de tostadas', 2, 'Alimento', 5, 30, 0),
(109, 'Jarra de café con leche', 2, 'Alimento', 1, 40, 0),
(110, 'Jarra de café con azucar', 1, 'Alimento', 2, 30, 0),
(111, 'Jarra de café con leche y azucar', 2, 'Alimento', 3, 50, 0),
(112, 'Jarra de café', 1, 'Alimento', 4, 30, 0),
(113, 'Café molido', 1, 'Recurso', 2, 20, 1),
(114, 'Jarra de batido de cacao', 1, 'Alimento', 5, 10, 1),
(115, 'Jarra de batido de plátano', 1, 'Alimento', 5, 20, 0),
(116, 'Jarra de batido de fresa', 1, 'Alimento', 5, 25, 0),
(117, 'Harina', 1, 'Recurso', 2, 30, 1),
(118, 'Frasco de aceite', 1, 'Alimento', 2, 40, 1),
(119, 'Cacao molido', 1, 'Recurso', 2, 20, 1),
(120, 'Hechizo: Misil mágico', 1, 'Hechizo', 6, 0, 0),
(121, 'Hechizo: Destello', 1, 'Hechizo', 6, 0, 0),
(122, 'Sal', 3, 'Recurso', 1, 5, 0),
(123, 'Azúcar', 1, 'Alimento', 4, 10, 0),
(124, 'Vial de alcohol puro', 1, 'Recurso', 2, 20, 1),
(125, 'Jarra de mosto de cebada', 1, 'Alimento', 6, 15, 0),
(126, 'Jarra de zumo de tomate', 1, 'Alimento', 4, 22, 0),
(127, 'Jarra de zumo de zanahoria', 1, 'Alimento', 4, 32, 0),
(128, 'Jarra de zumo de remolacha', 1, 'Alimento', 4, 32, 0),
(129, 'Jarra de zumo de moras', 1, 'Alimento', 4, 29, 1),
(130, 'Jarra de zumo de fresas', 1, 'Alimento', 4, 26, 1),
(131, 'Jarra de zumo de cerezas', 1, 'Alimento', 3, 24, 1),
(132, 'Jarra de zumo de sandía', 1, 'Alimento', 5, 18, 1),
(133, 'Jarra de zumo de coco', 1, 'Alimento', 8, 18, 1),
(134, 'Jarra de mosto', 1, 'Alimento', 6, 12, 1),
(135, 'Jarra de zumo de plátano', 1, 'Alimento', 4, 5, 0),
(136, 'Jarra de zumo de pera', 1, 'Alimento', 1, 0, 0),
(137, 'Jarra de zumo de naranja', 1, 'Alimento', 4, 5, 0),
(138, 'Jarra de zumo de manzana', 1, 'Alimento', 2, 0, 0),
(139, 'Hechizo: Falsa neblina', 1, 'Hechizo', 3, 10, 0),
(140, 'Hechizo: Falsa niebla', 1, 'Hechizo', 6, 15, 0),
(141, 'Hechizo: Falso eclipse', 1, 'Hechizo', 8, 20, 0),
(142, 'Hechizo: Falsas enredaderas', 1, 'Hechizo', 7, 25, 0),
(143, 'Hechizo: Locura', 1, 'Hechizo', 11, 29, 0),
(144, 'Hechizo: Levitación', 1, 'Hechizo', 17, 39, 0),
(145, 'Hechizo: Guerrero ilusorio', 1, 'Hechizo', 25, 46, 0),
(146, 'Hechizo: Fortaleza', 1, 'Hechizo', 4, 14, 1),
(147, 'Hechizo: Telekinesia', 1, 'Hechizo', 5, 22, 1),
(148, 'Hechizo: Asfixia', 1, 'Hechizo', 9, 32, 1),
(149, 'Hechizo: Criatura de energía', 1, 'Hechizo', 12, 40, 1),
(150, 'Hechizo: Dragón de energía', 1, 'Hechizo', 15, 40, 1),
(151, 'Hechizo: Bola de fuego', 1, 'Hechizo', 7, 10, 0),
(152, 'Hechizo: Rayo de fuego', 1, 'Hechizo', 9, 20, 1),
(153, 'Hechizo: Aura de fuego', 1, 'Hechizo', 4, 24, 1),
(154, 'Hechizo: Poder elemental del fuego', 1, 'Hechizo', 8, 67, 0),
(155, 'Hechizo: Desatar infierno', 1, 'Hechizo', 14, 50, 1),
(156, 'Hechizo: Bola de hielo', 1, 'Hechizo', 1, 80, 1),
(157, 'Hechizo: Rayo de hielo', 1, 'Hechizo', 3, 80, 1),
(158, 'Hechizo: Aura de hielo', 1, 'Hechizo', 2, 60, 1),
(159, 'Hechizo: Poder elemental del hielo', 1, 'Hechizo', 12, 67, 1),
(160, 'Hechizo: Congelar alma', 1, 'Hechizo', 16, 67, 1),
(161, 'Hechizo: Variación del tiempo', 1, 'Hechizo', 8, 10, 0),
(162, 'Hechizo: Gran variación del tiempo', 1, 'Hechizo', 13, 10, 0),
(163, 'Hechizo: Presentir', 1, 'Hechizo', 15, 10, 0),
(164, 'Hechizo: Velocidad', 1, 'Hechizo', 16, 10, 0),
(165, 'Hechizo: Paradoja temporal', 1, 'Hechizo', 18, 10, 0),
(166, 'Hechizo: Inflingir enfermedad', 1, 'Hechizo', 10, 1, 1),
(167, 'Hechizo: Desorden de la realidad', 1, 'Hechizo', 18, 1, 1),
(168, 'Hechizo: Furia caótica', 1, 'Hechizo', 100, 1, 1),
(169, 'Hechizo: Aniquilación', 1, 'Hechizo', 1200, 1, 1),
(170, 'Hechizo: Caos', 1, 'Hechizo', 1800, 1, 1),
(171, 'Hechizo: Heridas cicatrizantes', 1, 'Hechizo', 6, 14, 1),
(172, 'Hechizo: Enredaderas', 1, 'Hechizo', 6, 25, 0),
(173, 'Hechizo: Llamada a la naturaleza', 1, 'Hechizo', 8, 50, 0),
(174, 'Hechizo: Enredaderas protectoras', 1, 'Hechizo', 10, 55, 0),
(175, 'Hechizo: Terremoto', 1, 'Hechizo', 12, 60, 1),
(176, 'Grimorio del caos', 1, 'Libro', 800, 50, 1),
(177, 'Arbolito de navidad', 1, 'Navidad', 100, 0, 0),
(178, 'Gárgola esmeralda viviente', 1, 'Mascota', 1, 0, 0),
(179, 'Gárgola rubí viviente', 1, 'Mascota', 1, 0, 0),
(180, 'Dragón', 1, 'Mascota', 500, 50, 0),
(181, 'Cayado de talla mágica', 1, 'Arma', 100, 10, 0),
(182, 'Cayado de hielo', 1, 'Arma', 200, 10, 0),
(183, 'Cayado de fuego', 1, 'Arma', 250, 20, 0),
(184, 'Cayado de la vida', 1, 'Arma', 300, 30, 0),
(185, 'Cayado de la muerte', 1, 'Arma', 350, 40, 0),
(186, 'Cayado del tiempo', 1, 'Arma', 400, 50, 0),
(187, 'Cayado del control', 1, 'Arma', 500, 30, 1),
(188, 'Cayado del Archicanciller', 1, 'Arma', 1000, 50, 0),
(189, 'Vara activa', 1, 'Arma', 700, 40, 0),
(190, 'Vara de la gran serpiente', 1, 'Arma', 600, 13, 1),
(191, 'Joya premium', 1, 'Premium', 1, 0, 0),
(192, 'Esquirla de joya premium', 100, 'Premium', 1, 0, 0),
(193, 'Mapa: Limbo', 1, 'Mapa', 200, 60, 0),
(194, 'Mapa: Purgatorio', 1, 'Mapa', 200, 60, 0),
(195, 'Espada Glacial', 1, 'Arma', 200, 85, 0),
(196, 'Sombrero de hechicería', 1, 'Halloween', 200, 0, 0),
(197, 'Calabaza decorada', 1, 'Halloween', 10, 0, 0),
(198, 'Collar de la suerte(I)', 1, 'Reliquia', 100, 10, 0),
(199, 'Arma desconocida de amazona(I)', 1, 'Reliquia', 100, 10, 0),
(200, 'Extraño utensilio inutilizable(I)', 1, 'Reliquia', 100, 10, 0),
(201, 'Polvo de estrellas(I)', 1, 'Reliquia', 100, 10, 0),
(202, 'Planta curativa(I)', 1, 'Reliquia', 100, 10, 0),
(203, 'Símbolo sagrado(I)', 1, 'Reliquia', 100, 10, 0),
(204, 'Lámpara(I)', 1, 'Reliquia', 100, 10, 0),
(205, 'Corona(I)', 1, 'Reliquia', 100, 10, 0),
(206, 'Tarta de calabaza', 1, 'Halloween', 10, 30, 1),
(207, 'Piruleta de fresa', 1, 'Halloween', 5, 50, 1),
(208, 'Piruleta de manzana', 1, 'Halloween', 3, 30, 1),
(209, 'Bolsa de caramelos', 1, 'Halloween', 2, 0, 0),
(210, 'Caramelos', 1, 'Halloween', 1, 30, 1),
(211, 'Polvo de hueso rojo', 2, 'Halloween', 2, 0, 0),
(212, 'Oso festivo animado', 1, 'Mascota', 50, 0, 0),
(218, 'Insignia Atrezzo F', 1, 'Atrezzo', 100, 0, 0),
(219, 'Insignia Atrezzo G', 1, 'Atrezzo', 100, 0, 0),
(220, 'Insignia Atrezzo H', 1, 'Atrezzo', 100, 0, 0),
(221, 'Insignia Atrezzo I', 1, 'Atrezzo', 100, 0, 0),
(222, 'Insignia Atrezzo J', 1, 'Atrezzo', 100, 0, 0),
(223, 'Insignia Atrezzo K', 1, 'Atrezzo', 100, 0, 0),
(224, 'Insignia Atrezzo M', 1, 'Atrezzo', 100, 0, 0),
(225, 'Cristal carmesí activado', 1, 'Aumento', 20, 10, 0),
(226, 'Cristal añil activado', 1, 'Aumento', 35, 10, 0),
(227, 'Cristal purpúreo activado', 1, 'Aumento', 50, 10, 0),
(228, 'Bocadillo vegetal', 1, 'Alimento', 2, 10, 1),
(229, 'Bocadillo de pollo y lechuga', 1, 'Alimento', 3, 15, 1),
(230, 'Bocadillo de solomillo y queso', 1, 'Alimento', 5, 25, 1),
(231, 'Grimorio de la Luz', 1, 'Libro', 800, 50, 0),
(232, 'Llaves de otro mundo', 1, 'Recurso', 500, 50, 0),
(233, 'Grimorio de otro mundo', 1, 'Libro', 800, 50, 1),
(234, 'Hechizo: Juicio final', 1, 'Hechizo', 1800, 1, 1),
(235, 'Hechizo: Bastión', 1, 'Hechizo', 1200, 1, 1),
(236, 'Hechizo: Aura celestial', 1, 'Hechizo', 100, 1, 1),
(237, 'Hechizo: Justicia divina', 1, 'Hechizo', 18, 1, 1),
(238, 'Hechizo: Fuego sagrado', 1, 'Hechizo', 10, 1, 1),
(239, 'Hechizo: Dominación', 1, 'Hechizo', 1800, 1, 1),
(240, 'Hechizo: Trinidad', 1, 'Hechizo', 1200, 1, 1),
(241, 'Hechizo: Tiempo muerto', 1, 'Hechizo', 100, 1, 1),
(242, 'Hechizo: Igualdad', 1, 'Hechizo', 18, 1, 1),
(243, 'Hechizo: Ciclo infinito', 1, 'Hechizo', 10, 1, 1),
(244, 'Amuleto de otra era', 1, 'Amuleto', 100, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relatos`
--

CREATE TABLE `relatos` (
  `id` int(11) NOT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `partida` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `texto` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `relatos`
--

INSERT INTO `relatos` (`id`, `autor`, `partida`, `titulo`, `texto`) VALUES
(1, 'Random', 'Partida 2', 'Karma', '<p>La banda se disponía a realizar su segundo asalto en la noche. Ya habían pasado satisfactoriamente por casa de la señora Milton y tras haber desvalijado todas sus joyas huyeron en el Morris Oxford sin hacer ningún tipo de ruido. Sin embargo, Stein había insistido en amordazar a la señora para evitar que alarmara al vecindario con sus gritos, pero Möller, el líder de la banda, se negó categóricamente.</p>\r\n<p>Möller y Stein Gudmunsson eran dos hermanos que casi siempre estaban en desacuerdo, pero obviamente el hecho de que Möller fuese el líder de la banda jugaba siempre a su favor. Sus padres eran suecos, pero ellos nacieron en territorio americano. Möller tenía 36 años, medía unos 190 cm, delgado, tez pálida y cabello grisáceo. Si lo veías en medio de la noche con una gabardina negra parecía un vampiro novelesco. Su función en la banda consistía en planificar los asaltos desde el lugar del asalto hasta la forma de escape.</p>\r\n<p>Por otro lado, Stein era 4 años menor, más bajo y robusto y más impulsivo. Creía que controlar de forma contundente a las víctimas evitaba cualquier posible aviso a la policía, pero Möller prefería no hacerlo salvo necesidad imperiosa. Stein jugaba un papel muy importante en la banda ya que sabía localizar muy bien los escondrijos donde podían estar los objetos de valor e incluso las cajas fuertes. Aunque de abrir esto último se encargaban los demás componentes de la banda.</p>\r\n<p>Los demás miembros de la banda eran Jensen, Klaus y Norheim, tres amigos daneses que habían entrado ilegalmente a Estados Unidos quince años atrás tras haber escapado de Dinamarca por estar en situación de búsqueda y captura. Pese a su procedencia, no se parecían nada en absoluto a un Gran Danés. Eran bajos, morenos y podrían pasar perfectamente por bosnios de origen árabe.</p>\r\n<p>De todas maneras, tenían una habilidad pasmosa para abrir cajas fuertes, habilidad que aprendieron en la fábrica de cajas fuertes en la que se conocieron de jóvenes. Años más tardes la policía les cazó en Oslo robando en casa de un opulento señor de la ciudad. Lograron escapar y se escondieron el tiempo suficiente hasta poder huir del país en busca de nuevas oportunidades.</p>\r\n<br>\r\n<p>En las noches de cacería, como las llamaban ellos, el segundo asalto era el importante. El primero era algo sencillo con lo que calentar y así estar despiertos y muy concentrados. El segundo lo realizarían en la Mansión Hurley, al norte de la ciudad Filaldelfia, zona muy próspera doscientos años atrás en la Edad Moderna, hecho que proveyó a varias familias de grandes fortunas.</p>\r\n<p>El objetivo era un objeto extremadamente valioso: La caja de portal dimensional. Un codiciado objeto cuyo uso ellos desconocían, pero que podrían vender por un alto precio en el mercado negro.</p>\r\n<p>La Mansión estaba habitada únicamente por el personal de servicio, dado que la familia estaba en Nueva York visitando a la madre del señor Hurley. </p>\r\n<p>La casa tenía dos alas, el ala este y el ala oeste. La familia tenía los dormitorios en el ala este y el personal en el ala oeste, por lo tanto los objetos de valor probablemente se encontrasen en el ala “familiar”. La edificación databa del siglo XVIII por lo que era probable que hubiese alguna cámara secreta donde escondiesen artículos de gran valor.</p>\r\n<p>Las semanas previas al asalto Möller se dedicó a preguntar a los vecinos de la zona si sabían algo acerca de la casa, bajo la excusa de que él era arquitecto y le resultaba muy atractiva e interesante. </p>\r\n<p>Una vez obtuvo toda la información necesaria, preparó el siguiente plan: aparcarían el coche en el perímetro de la Mansión y Klaus se quedaría esperando en el coche con el motor apagado para huir en cuanto salieran de la mansión. Los demás miembros de banda incurrirían por esa parte de la casa con suma cautela y dispondrían de sus mejores bolsas para meter dentro todo lo que creyeran que tuviera valor.</p>\r\n<br>\r\n<p>Así pues, sobre las 4 de la madrugada llegaron a la zona de la Mansión Hurley y aparcaron el coche. Los 4 miembros de la banda vestidos con sus respectivos trajes negros salieron del vehículo y saltaron la verja del perímetro. La iluminación no estaba encendida por lo que pasaban por alto ante la mirada de cualquier personal de la casa. Se situaron debajo del balcón de la habitación de la hija del señor Hurley y tiraron una especie de gancho atado a una cuerda que quedó cogido a la baranda.</p>\r\n<p>Para subir debían pasar dos cosas: que la baranda de mármol sujetase el peso de cada miembro de la banda, y caminar por la columna que sujetaba el balcón. Para ello no debían dejar marcas en la columna de los zapatos sucios por el césped del jardín, así que se calzaron unos plásticos y realizaron el ascenso.</p>\r\n<p>Una vez arriba abrieron el ventanal que daba acceso a la habitación de la chica y entraron con agilidad.</p>\r\n<p>Möller sabía que la Caja debía estar en el despacho del señor Hurley. O por lo menos estaría ahí la entrada a la sala secreta de la mansión, así que se dispusieron a llegar a esa zona de la casa.</p>\r\n<p>Para ello debían recorrer un pasillo, bajar unas escaleras, cruzar una pequeña sala de estar y volver a subir las escaleras, ya que el despacho se situaba entre ambas alas de la mansión.</p>\r\n<p>Abrieron la puerta que daba acceso al pasillo y oyeron unos pasos al fondo del pasillo bajando las escaleras. La intención era seguir esos pasos sin hacer ruido, pero Norheim era bastante torpe por lo que rozó un jarrón que balanceó de un lado al otro y cayó en el suelo. Afortunadamente el jarrón era de cobre por lo que no se rompió en mil pedazos, pero sí alarmó a la persona que estaba bajando.</p>\r\n<p>Stein, en un ataque fugaz, neutralizó a la chica que llevaba un candil en una lámpara en la mano y Jensen y Norheim la amordazaron y la dejaron en la habitación en la hija del señor Hurley durmiendo plácidamente con un golpe en la sesera…</p>\r\n<p>Möller dirigió el camino hasta el despacho del señor Hurley sin problemas y entraron cerrando la puerta muy despacio.</p>\r\n<br>\r\n<p>El despacho del señor Hurley era una sala cuadrada de grandes dimensiones y estaba lustrada con grandes obras pictóricas y fantásticas esculturas romanas. Una de ellas era un busto de su propia cabeza con aires megalomaníacos. En los costados de la sala habían muebles muy antiguos que velaban de la gran mesa central de roble, escudando a una silla que bien podría haber sido la silla del Rey Arturo en la mesa redonda. Detrás de todo había una chimenea encendida con un lema sobre ella que rezaba “Ad victoriam”. Möller tradujo del latín “Hacia la victoria” y Stein le miró con desdén. </p>\r\n<p>La banda se puso manos a la obra y empezó a guardar todo tipo de objetos preciosos en las bolsas que llevaban consigo. No debían llenarlas mucho ya que luego sería un problema escapar sin ser detectados.</p>\r\n<p>Jensen cogía por la derecha y Norheim por la izquierda. Stein y Möller observaban y pensaban dónde podría estar la sala o la Caja. Abrieron cajones, miraron tras la alfombra por si había una trampilla. Tocaron por la zona de la chimenea por si accionaba algún sistema que abriese a una sala oculta pero nada.</p>\r\n<p>Norheim se quejó de estaban sudando de lo lindo, dado que era verano y la chimenea estaba encendida. Entonces fue cuando Möller se percató. No era lógico que la chimenea estuviese encendida.</p>\r\n<p>Con grandes esfuerzos los cuatro tipos apagaron el fuego y Stein con una pinza de hierro quitó los troncos candentes. Entre las ascuas se podía percibir una esquina que irradiaba un brillo extraño. Quitaron las ascuas como pudieron y allí estaba la ansiada Caja.</p>\r\n<p>La banda contemplaba con ojos incrédulos la irradiación anormal que producía esa caja. Parecía ser transparente pero al mismo tiempo hacía destellos psicodélicos. Como si fuesen de otro planeta.</p>\r\n<p>De todas maneras, estaba ardiendo, por lo que no podían cogerlas con las manos. Así que Jensen se decidió a ir a por agua. Salió de la sala con cuidado de que no hubiese nadie y al rato volvió con un cubo con agua. Los demás se miraron sorprendidos de la iniciativa de Jensen y rieron para adentro. Jensen tiró el agua y Möller secó y se metió la Caja en la bolsa.</p>\r\n<p>No querían nada más. Si vendían ese objeto por unas cuantas gemas podrían vivir tranquilos durante 10 o 15 años.</p>\r\n<p>Consiguientemente, salieron del despacho y volvieron a la habitación de la hija del señor Hurley donde dormía el ama de llaves. Salieron a la terraza y bajaron uno a uno. Del mismo modo debían saltar la verja con las bolsas llenas de objetos, así que primero saltó Norheim, después saltó Jensen con Stein, y Möller les pasó las bolsas. </p>\r\n<p>Möller, al saltar a la otra parte de la verja, se encontró con sus cuatro compañeros de la banda inconscientes en el suelo y tres tipos enormes esperándole a él. Le golpearon y cayó.</p>\r\n<p>Horas después despertó con las sirenas de la policía y vio a sus compañeros en el suelo reaccionando igual que él.</p>\r\n<p>Todos tenían un sobre encima de las bolsas vacías que abrieron rápidamente antes de que los policías llegasen. Leyeron al mismo tiempo la frase: </p>\r\n<br>\r\n<p><i>“Disculpen las molestias. Firmado: Sr. Random”.</i></p>\r\n<br>\r\n<p>La carta se quemó a los pocos segundos como por arte de magia y la policía llegó con intenciones poco pacíficas.</p>'),
(2, 'Astaroth', 'Partida 2', 'El grito del ahogado', '<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\">Todav&iacute;a recuerdo como si hubiera sido ayer aquellos d&iacute;as de anta&ntilde;o en los que mi padre, August Deepwater, me contaba de sus haza&ntilde;as en el mar antes de acostarme a dormir, de c&oacute;mo supo defenderse de innumerables ataques a su barco, de c&oacute;mo naveg&oacute; sobre aguas practicamente imposibles de domar, de los tesoros que trajo a casa y de otros que se vio obligado a abandonar. Nunca se cansaba de decirnos que su mayor conquista fue mi madre, &aacute;mbar , y que yo era su tesoro m&aacute;s querido y cuidado. August era un hombre alto, con un pelo tan oscuro como las profundidades del mar y unos ojos verdes tan penetrantes que hac&iacute;an poner inc&oacute;modo hasta a los m&aacute;s duros marineros. Mientras que mi madre, &Aacute;mbar, era una mujer rubia, con una sonrisa tan bella que eran semejantes a las caricias del sol en primavera, era imposible no sentir calidez y calma al estar junto a ella .</p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\"><br />Con el pasar de los a&ntilde;os mi padre se encargo de ense&ntilde;arme a izar las velas, el cuidado y limpieza en los barcos, el manejo de armas de fuego, y algunos trucos de cartas , mientras que mi abuelo me ense&ntilde;&oacute; algunas cosas sobre la herrer&iacute;a ya que &eacute;l era realmente bueno en eso, a tal punto de ser sumamente conocido por todas las islas aleda&ntilde;as. <br />Pero fui un iluso al creer que todo iba a ser tan perfecto como mi padre esperaba, el tiempo pas&oacute; y nada nos pudo preparar para la tragedia que nos azotar&iacute;a.</p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\">- \"Si tan solo mi padre hubiese escuchado las advertencias de mi abuelo...\" - Me repito a diario. </p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\">&Eacute;l sab&iacute;a que llegar a ese lugar no significaba nada bueno y lo intent&oacute; detener, pero no hubo caso. Mi padre era demasiado obstinado y temerario en cuanto a aventuras se refer&iacute;a . Por lo que zarparon para no regresar jam&aacute;s.<br />Pasaron semanas hasta que encontraron a Tadeo, uno de los camaradas de mi padre. Hab&iacute;a perdido demasiado peso y estaba muy deshidratado, sin embargo, lo que me dio pavor fueron sus ojos: Carec&iacute;an de cordura, estaban perdidos en el mar, con l&aacute;grimas que ca&iacute;an a c&aacute;ntaros sobre sus mejillas, realmente uno podia sentir parte del terror por el que hab&iacute;a pasado s&oacute;lo con verlo a los ojos...y cuando pudo recobrar el aliento, dijo con su voz quebrada y temblorosa: <br />- \"&iexcl;E-El mar nos va a tragar a todos!, &iexcl;No deber&iacute;amos haber ido nunca! Todo esto es culpa de tu padre, gracias a &eacute;l estamos todos condenados, Incluso t&uacute;, su propia sangre...- Luego de eso cay&oacute; inconciente sobre la arena y corr&iacute; en busca de ayuda.</p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\"><br />Unos dias mas tarde me acerqu&eacute; a &eacute;l para buscar una explicaci&oacute;n sobre lo que hab&iacute;a pasado y el paradero de mi padre, a lo que me respondio muy nerviosamente: <br />- \" Realmente lo siento, lo que dije aquel dia fueron delirios, no estaba bien y no recuerdo que fue lo que sucedi&oacute; tampoco...solo s&eacute; que fui el &uacute;nico que pudo regresar\" . Y me entreg&oacute; un colgante de plata que pertenec&iacute;a a August, pero con una extra&ntilde;a marca de una especie de calamar, que antes no ten&iacute;a... <br />- \"Creo que te ser&aacute; mas &uacute;til a ti que a m&iacute;. Ahora si me lo perm&iacute;tes, quiero descansar. \" dijo, y se dirigi&oacute; a su caba&ntilde;a, por lo que yo regres&eacute; con mi madre. <br />Ella al escuchar la noticia de mi padre no hizo mas que llorar por varios d&iacute;as, qued&oacute; devastada y dej&oacute; de ser una persona que irradiaba energ&iacute;a y alegr&iacute;a donde quiera que vaya, para pasar a ser un ente que apenas se relacionaba con personas, incluso conmigo...Realmente una parte de su alma muri&oacute; con mi padre, entro en un ciclo sin fin de lamentos y de sufrimiento del cual no la pudimos sacar...La &uacute;nica frase con sentido que sal&iacute;a de sus labios era: <br />- \"Aunque el mar se lo llev&oacute;, todav&iacute;a escucho su voz suplic&aacute;ndome que lo encuentre...que &eacute;l me va a esperar all&iacute;, por siempre. \" &ndash;</p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\">Pasaron un par de d&iacute;as y mi madre no hac&iacute;a otra cosa m&aacute;s que empeorar , deliraba, ya no com&iacute;a, estaba irritada todo el tiempo y no hubo nadie en la isla capaz de ayudarla, ni si quiera yo.<br />Por no cuidar adecuadamente de ella en ese estado, la termine perdiendo tambi&eacute;n. Algunos testigos dicen que se lanz&oacute; al mar y no volvi&oacute; a aparecer, que corrieron a socorrerla en el instante en el que salt&oacute;, pero no hab&iacute;a nada, absolutamente nada. <br />Totalmente destrozado por dentro decid&iacute; ignorar lo que Tadeo me advirti&oacute; una vez y comenc&eacute; a organizar una expedici&oacute;n en direcci&oacute;n al Norte para descubrir la verdad sobre mi padre y lo que habia sucedido. Ya no ten&iacute;a nada mas que perder, o al menos eso era lo que pensaba... <br />Logr&eacute; convencer al due&ntilde;o de un peque&ntilde;o barco para que me acompa&ntilde;e en mi b&uacute;squeda con la promesa de tesoros inimaginables, una fortuna que alcanzar&iacute;a para que &eacute;l y sus hijos e hijos de sus hijos vivieran como reyes toda su vida, y pude reunir un grupo de personas que estaban deseosas de conocer y viajar a bordo de un barco desde siempre, algunos con experiencia y otros no, pero todos fueron de gran ayuda hasta aquel d&iacute;a.</p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\">Habian pasado varios dias tranquilos dentro del barco, ya teniamos una organizaci&oacute;n decente y estabamos bastante bien encaminados. Hasta que escuchamos un ruido ensordecedor a la distancia, y pocos segundos despu&eacute;s todo comenz&oacute; a desmoronarse bajo nuestros pies. <br />- \"Nos acaban de atacar!. \" Pens&eacute;. - \" Pero, &iquest;&iquest;De donde??. \" <br />Mientras la gente hu&iacute;a aterrorizada o saltaban al mar, yo decid&iacute; subir a lo mas alto del carajo para tener un mejor panorama de la situaci&oacute;n. Recuerdo estar llegando a la cima cuando se escucha otro estruendo y algo que impacta poco mas abajo de donde yo estaba trepando y comienzo a caer de espaldas. <br />Pens&eacute; que morir&iacute;a asique agarre el colgante de mi padre con mi mano izquierda y la lleve a mi pecho mientras ca&iacute;a, pidiendole perd&oacute;n por haberle fallado y que pronto los seguir&iacute;a. <br />Tal vez fu&eacute; mi imaginaci&oacute;n pero la ca&iacute;da duro mas de lo que esperaba, parec&iacute;an minutos desde el impacto y no s&oacute;lo eso, me parecio escuchar una voz que ven&iacute;a debajo de mi: <br />- \" Jaja! Maravilloso! Realmente maravilloso. \" - Dijo entre risas. - \"Parece que reuniremos una familia antes de lo pensado...Sin importar cuanto lo intentes, alguien tan in&uacute;til como t&uacute; no podr&iacute;a cambiar aquello que ya esta destinado a suceder. \" <br />Luego de eso mi cuerpo golpe&oacute; en seco el suelo, dejandome inconciente...pas&oacute; un tiempo hasta que recobr&eacute; la conciencia a los gritos, y fue por un dolor punzante y terrible que sent&iacute;a en mi brazo izquierdo, o al menos en lo que quedaba de &eacute;l. La parte de mi brazo que habia tocado el mar hab&iacute;a sido arrancado y lo &uacute;nico en lo que pude pensar fue en lo que Tadeo hab&iacute;a dicho cuando lo encontramos en la playa...\"el mar nos va a tragar \". <br />El torniquete que hice en mi brazo con mi camisa hecha harapos apenas alcanz&oacute; a ser suficiente para salvarme la vida, les di&oacute; tiempo a que nos encontraran. <br />Pasaron unas semanas hasta que por f&iacute;n decid&iacute; comenzar mi b&uacute;squeda de nuevo, necesitar&iacute;an mas que eso para detenerme. Pero antes de eso ten&iacute;a que darle una &uacute;ltima visita a Tadeo. <br />Estuve un rato largo caminando, ya que su hogar se encontraba aislado del mar y de la sociedad, su puerta de entrada estaba abierta por lo que decid&iacute; entrar. La imagen que vi al hacerlo no se borrar&aacute; nunca de mi mente, fue demasiado para mi...&Eacute;l estaba sentado frente a una botella de ron en una mesa, con los codos clavados en sus piernas y sus manos ensangrentadas sujetando y cubriendo su cara. Corr&iacute; hacia &eacute;l para ayudarlo, pero no habia nada que yo pudiera hacer... al correrle sus manos solo pude ver sus cavidades orbitarias vac&iacute;as, perdiendo sangre a borbotones y lo escuche decir algo en una voz apenas audible: <br />- \"No tendriamos que haber ido...&iquest;porque&nbsp; lo hicimos ?...&iquest;porque?...\". - y dej&oacute; caer sus brazos a la nada y su cara contra la mesa...Habia muerto. Y al caer, una moneda rod&oacute; hasta mi pie, tenia la misma insignia del&nbsp; calamar que el colgante de ni padre, por lo que la guarde en mi bolsillo, estaba seguro de que esa insignia estaba relacionado de alguna forma con todo lo que estaba sucediendo y volv&iacute; con mi abuelo. Sent&iacute; que deb&iacute;a partir de inmediato. <br />Decid&iacute; no contarle detalles de lo que sucedi&oacute; con tadeo a mi abuelo, s&oacute;lo le dije que atacaron el barco y que la p&eacute;rdida de mi brazo fue un peque&ntilde;o precio a pagar a comparaci&oacute;n a muchas de las personas que murieron ese dia. Le coment&eacute; que necesitaba alejarme de la isla, que necesitaba alejarme un poco de todo, por lo que iba a emprender un nuevo viaje.</p>\r\n<p style=\"margin-bottom: 0.35cm; line-height: 115%; widows: 0; orphans: 0;\">-Suenas igual a tu padre, se que sin importar que diga te ir&aacute;s de todas formas- Dijo, con una voz bastante calma y amena. Me pidi&oacute; que lo acompa&ntilde;e...que si iba a viajar, de seguro iba a necesitar algo de ayuda. Sac&oacute; una caja de abajo de su cama y me entreg&oacute; una protesis hecha de cobre, y una superaleaci&oacute;n a base de niquel que soporta altas temperaturas y algunos detalles en plata; adem&aacute;s ten&iacute;a unas inscripciones talladas en un idioma que desconozco que parec&iacute;an tener un brillo propio. La pr&oacute;tesis ten&iacute;a diferentes accesorios, y cuya funci&oacute;n era similar a la de un ca&ntilde;&oacute;n de mano. Realmente era una obra maestra hecha a medida para mi, por lo que promet&iacute; cuidarla y que volver&iacute;a con vida con suficiente oro para pagar 10 veces lo que habia construido para mi. <br /><br /><br />Y asi comienza mi historia. Rafael Deepwater.</p>');
INSERT INTO `relatos` (`id`, `autor`, `partida`, `titulo`, `texto`) VALUES
(3, 'Irwyng', 'Partida 4', 'El Hombre Embarrado', '<div class=\"post-body entry-content\" id=\"post-body-993968563178273157\" itemprop=\"description articleBody\">\r\n<br>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<u><span style=\"font-size: 24.0pt; line-height: 107%; mso-bidi-font-size: 11.0pt;\" lang=\"ES-AR\"><br></span></u></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<u><span style=\"font-size: 24.0pt; line-height: 107%; mso-bidi-font-size: 11.0pt;\" lang=\"ES-AR\">EL HOMBRE\r\nEMBARRADO<o:p></o:p></span></u></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: right;\">\r\n<span lang=\"ES-AR\">Escrito\r\npor: Irwyng - p4.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<b style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-AR\">AHORA<o:p></o:p></span></u></b></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<b style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-AR\"><o:p><span style=\"text-decoration: none;\"><br></span></o:p></span></u></b></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">I<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">En lo alto de una repisa polvorienta dormía\r\nde manera inmortal un pequeño frasco con veneno de dragón.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Extracto de guerras pasadas, aquel elixir\r\nde la muerte, llevaba generaciones inmóvil bajo el subsuelo de Casa Atreide.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">II<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Con dificultad, Recycled, uno de los\r\ncaballeros del clan, descendía a tropezones por las escaleras que daban hacia\r\nlas misteriosas mazmorras de la Casa de Dragones.</span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\nCargaba a rastras al hombre embarrado, un\r\nsujeto que Nebula había encontrado malherido y totalmente cubierto de lodo por\r\nlos alrededores de los Bosques de Lifo.</div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\nUna sinfonía de quejidos sonaba del hombre\r\nembarrado con cada escalón que se bajaba.</div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">La oscuridad de aquella mazmorra estaba\r\napenas quebrantada por un halo naciente de luciérnagas doradas y hongos\r\nfluorescentes que debían de llevar allí desde los tiempos de Elokimbeta.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled sentó en el suelo al hombre y este\r\nse apoyó agotado contra la pared de rocas húmedas.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Entre todo el barro que cargaba el sujeto,\r\nse percibía que una franja roja teñía su coraza de caballería. Uno de sus\r\nbrazos hacia presión sobre esa herida, mientras el otro caía rendido a su lado.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled aún estaba confundido, hacia menos\r\nde media hora se encontraba durmiendo su siesta invernal al murmullo de las\r\nbrasas en el salón común del clan y ahora, en cambio, caía ante el silencio\r\nincomodo que se produce entre dos desconocidos...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿Tienes... Algo para beber? </span>-<span lang=\"ES-AR\">le preguntó el hombre\r\ncon el eco de sus palabras ásperas y viejas rebotando contra las paredes</span>-.<span lang=\"ES-AR\"> Por favor...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled recorrió la mazmorra con la\r\nmirada, encontró un tarro metálico y lo relleno con el vino de una barrica\r\nantigua.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Al darle el tarro el hombre volvió a\r\nhablar.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿Tienes... Veneno?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled se quedó absorto.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿Por qué me pedirías algo así? </span>-<span lang=\"ES-AR\">preguntó Recycled.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">En ese momento, sobre sus cabezas tembló el\r\ntecho de madera con un fuerte estruendo, se escuchó el golpe de las sillas\r\nrebotando contra el piso y el chirrido agudo de vasos rotos.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Vamos a brindar por mi muerte </span>-<span lang=\"ES-AR\">dijó el hombre levantando\r\nen lo alto el vaso de vino </span>-.<span lang=\"ES-AR\"> Pero para eso necesito veneno... y unos cuantos tarros más.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled desenvaino su Espada suprema y se\r\ncolocó en guardia al final de las escaleras. Nebula había advertido antes que\r\nunos sujetos estaban persiguiendo al extraño sujeto embarrado.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">No podrás... </span>–d<span lang=\"ES-AR\">ijó el hombre poniéndose de pie con dificultad. Acto seguido comenzó\r\na sacudirse toda la suciedad</span>-.<span lang=\"ES-AR\"> Los miembros de tu clan ya deben de estar todos acabados.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">El resplandor verdoso de la espada suprema\r\nmostraba el rostro sorprendido de Recycled.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Eso no puede ser verdad... </span>-<span lang=\"ES-AR\">Murmuró este.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Ya sin barro encima, Recycled pudo ver el\r\nbrillo cósmico del equipo adimensional que portaba aquel hombre.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Quienes me persiguen no conocen la piedad ni la misericordia... <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">La luz de una puerta abierta viajo por la\r\nescalera hasta los pies de la mazmorra, luego, escucharon pasos pesados\r\ndescendiendo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Si queremos sobrevivir deberás confiar en mí </span>–d<span lang=\"ES-AR\">ijó el hombre\r\nmirándolo fijamente a los ojos.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¿Quién eres? </span>-<span lang=\"ES-AR\">le preguntó Recycled.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Soy Random.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">III<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Redwar y Melegaunt llegaron hasta la\r\nmazmorra, ambos serios y con calma, observaron como Random bebía sin parar por\r\nla canilla saliente del estómago de la barrica.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Aggg... </span>–d<span lang=\"ES-AR\">ijó limpiándose la boca </span>-. <span lang=\"ES-AR\">Amigos míos, no podrían haber\r\nescogido un lugar mejor para emboscarme. ¡Quién diría que entre los Bosques de\r\nLifo se encontraba el vino tinto de los dioses! ¡Ni Lz debe de haber probado\r\nalgo así!<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Por unos segundos solo se escuchó el\r\nbramido de los truenos poderosos del exterior.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled mantenía su mano escondida sobra\r\nla empuñadura de su espada, preparado a cualquier cosa que ocurriera.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Imaginé que tendrías sed, después de un viaje tan largo </span>-<span lang=\"ES-AR\">comenzó a decir Redwar\r\napacible</span>-. <span lang=\"ES-AR\">Sin embargo debe de ser una lástima, para ti, que la máxima\r\nrecompensa obtenida por tanto esfuerzo sea solamente el de beber del pico de\r\nuna barrica.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Las ratas salieron despavoridas de la\r\nmazmorra, olían el miedo y la adrenalina feroz que emanaban todos los cuerpos\r\nen ese lugar.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Por otra parte, al menos veo que estas acompañado, lo que me hace\r\npreguntar porque el señor Recycled se encuentra también entre nosotros –dijó\r\nRedwar observándolo. <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¿Qué pasó con mis colegas? –les preguntó Recycled aunque Random le\r\nhabía dicho que no hablase.</span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Les pasó lo mismo que les pasa a los que están en el bando\r\nincorrecto –le respondió Melegaunt secamente.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Malditos… </span>-<span lang=\"ES-AR\">gruñó Recycled adelantándose hacia él.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Random lo frenó con la mano.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¡No! Él no se interpondrá –dijó insistente Random. Paso siguiente soltó\r\nuna carcajada agria y corta y agregó:</span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Porque… Pase lo que pase ustedes no me dejaran ir... ¿Verdad? –les\r\npreguntó casi sin importarle.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">El silencio respondió todo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Es una lástima… ¿no me darías una mano Mele?... Por favor…\r\nAyúdame…Por los viejos tiempos… </span>-<span lang=\"ES-AR\">suplicó Random con el rostro en pedazos.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Melegaunt torció la vista y susurro por lo\r\nbajo a Redwar.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¿Es verdad que no hay otra forma?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">No </span>-<span lang=\"ES-AR\">sentenció este.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Entonces... </span>–c<span lang=\"ES-AR\">omenzó a decir Random llenando cuatro tarros con vino</span>-. <span lang=\"ES-AR\">Este es el adiós...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Le entregó uno a Recycled quien observaba\r\ntodo el circo al lado de la barrica. Luego caminó hacia sus persecutores.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Melegaunt tomo el tarro de inmediato con un\r\ndejo de ojos mojados en su mirada. Redwar, en cambio, se mantuvo quieto y\r\ndistante.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">-Concédanme un último brindis... Por favor.\r\nDe donde yo vengo nosotros aún somos grandes compañeros… y sé que eso pueden\r\nsentirlo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Melegaunt dudó por unos segundos, hasta que\r\ncedió y levantó su tarro diciendo:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¡Por Lifo!<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Random dio media vuelta y observo a\r\nRecycled, este repitió las palabras de Melegaunt en voz baja levantando también\r\nsu tarro.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Solo quedas tú </span>–d<span lang=\"ES-AR\">ijó Random sonriéndole a Redwar – Luego prometo entregarme.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Este agarro el tarro cansino.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n–<span lang=\"ES-AR\">Por Lifo... </span>–replicó<span lang=\"ES-AR\"> Redwar al fin.</span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¡Por Lifo! -concluyó Random y bebió a fondo el tarro, todos lo\r\nimitaron.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Al paladar se sintió, alcohólico y frutado,\r\naquella bebida les dejo la lengua tánica y adormecida, pero con una viva\r\nfelicidad de ansias relajadas.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Muy bien… Llego la ahora </span>–exclam<span lang=\"ES-AR\">ó Melegaunt – Por el poder que\r\nnos han otorgado… Tú… Ag… </span>-<span lang=\"ES-AR\">Algo le sucedía a su mandíbula, era como si no pudiera controlarla.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Unos segundos después las manos de Redwar y\r\nMelegaunt soltaron sus tarros inconscientemente, estos cayeron estrepitosos\r\ncontra el suelo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Un fuerte dolor les endureció el cuerpo\r\ncontrayéndoles tanto los brazos como las piernas y dejándolos tirados en el\r\nsuelo como a un par de escarabajos muertos.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¡Funcionó! </span>–festejó<span lang=\"ES-AR\"> Recycled asombrado</span>-.<span lang=\"ES-AR\">¡De verdad funciono! ¡No percataron el veneno de dragón en los\r\ntarros! <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¡Asombro! –asintió Random debelando el frasquito bajo su manga</span>-.<span lang=\"ES-AR\"> ¿Verdad que es\r\nindetectable?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled estaba por responder, pero no\r\npudo, intento moverse pero le fue imposible.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">No... No... </span>–a<span lang=\"ES-AR\">lcanzó a decir antes de caer contra una de las barricas.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Sus ojos miraban con odio desesperado a\r\nRandom.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¿Cómo pudiste ser tan tonto? </span>–l<span lang=\"ES-AR\">e cuestionó Random\r\nsonriendo con los colmillos salientes.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Yo…¡¡Confié en ti!! </span>–gritó<span lang=\"ES-AR\"> con los dientes apretados Recycled mientras poco a poco sus\r\npulmones se paralizaban</span>-<span lang=\"ES-AR\">. ¡¡Confié en ti Random!!<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Ese es el problema... ¡¡Confiar significa no pensar!! </span>-<span lang=\"ES-AR\">contestó tocándose la\r\nmente con el dedo</span>-. <span lang=\"ES-AR\">¡Años llevo preparando esto y\r\nnadie ni nada me va a detener! </span>–s<span lang=\"ES-AR\">u voz se volvió grave, casi demoníaca.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Recycled bramó con toda su furia y lanzo un\r\nespadazo al pecho de Random. Fue lo último que hizo antes de que su cuerpo se\r\npetrificara para siempre.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<br>\r\n\r\n\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><o:p>&nbsp;</o:p></span>&nbsp;</div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<b style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-AR\">ANTES<o:p></o:p></span></u></b></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<b style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-AR\"><o:p><span style=\"text-decoration: none;\"><br></span></o:p></span></u></b></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">IV<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">El atardecer se mojaba con una fuerte\r\nllovizna, crepitante y continúa, acompañada de una fantasmal neblina que dejaba\r\ncaer su velo denso sobre las profundidades de los Bosques de Lifo, adormeciendo\r\nasí, hasta la más mínima luz de vida.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Los toboganes de agua que se formaban por\r\nla cabellera azabache de Nebula no le interrumpían en absoluto el cumplimiento\r\nde su ronda de vigilancia. Quieto y con una palidez ausente, agudizaba sus\r\nsentidos en busca de cualquier enemigo que amenazara con atacar el apogeo de\r\nlos dragones, el castillo de Casa Atreide.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Un relámpago ciego cicatrizo las nubes\r\nhaciendo brillar por un instante la armadura de un extraño a lo lejos. Nebula\r\nlo percibió por el rabillo del ojo, desenfundo entonces su espada suprema y\r\ncorrió en saltos por entre las raíces que sobresalían entre todo el barro\r\necléctico que antes era tierra firme.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Cuando exploto el trueno, Nebula yacía con\r\nlos tobillos hundidos sobre el pantano, observando a un sujeto embarrado de\r\npies a cabezas que se arrastraba con dificultad por el lodo. <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Nebula tomo su espada y la llevo hasta el\r\ncuello del desconocido. Este, al verlo, le sonrió.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¡Hazlo! </span>–desafió el\r\nhombre<span lang=\"ES-AR\">jadeando</span>-. <span lang=\"ES-AR\">¡Pero me sacarías\r\nmás provecho manteniéndome vivo!<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Una cruel sonrisa surgió del rostro de\r\nNebula. Sus ojos le brillaban instintivos, cual serpiente luego de acorralar a\r\nsu presa.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¿De verdad? </span>-<span lang=\"ES-AR\">le preguntó Nebula mostrándole su lengua cazadora.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Pero un momento antes antes de hundir su\r\nespada el ruido de un agudo relinche de caballos llamo su atención. <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">A lo lejos se podía sentir un temblor de\r\ntambores, un chapoteo producido por el galope de caballos que cada vez se oían\r\nmás y más cercanos.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Ya vienen –dijó el hombre temblando.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">La sonrisa de Nebula se borró\r\ninmediatamente y una repentina furia le hirvió la sangre.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<a name=\"more\"></a><br>\r\n\r\n\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">V<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Okey, okey... Te doy 63 esquirlas, dos fresas y unos cinco hechizos\r\nde Falsas enredaderas a cambio de tus Botas de Escamas de Dragón ¿Qué te\r\nparece? </span>-<span lang=\"ES-AR\">ofreció Fujitsu amontonando los pedacitos de diamantes sobre el\r\nmesón de madera.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Bueno... La verdad que todas tus ofertas en Partida 4 no han sido\r\nmuy convincentes y esta que me acabas de hacer es sin duda, la peor de todas,\r\nsobre todo porque no podemos hacer trueques con<span style=\"mso-spacerun: yes;\">&nbsp;\r\n</span>hechizos </span>–r<span lang=\"ES-AR\">espondió Padfoot negándole con la cabeza.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¡Ja! Que no se puede... ¿Y por qué no? </span>–espetó <span lang=\"ES-AR\">Fujitsu\r\nagitado.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Padfoot levanto los hombros sin saber\r\nexplicarle el porqué.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">La chimenea ardía con gusto mientras en los\r\nventanales chocaba el vestigio de la fría tormenta. La sala común de Casa\r\nAtreide era hogareña y estaba repleta de barriles de cerveza y vino,\r\nprovisiones más que suficientes para calmar la sed de camello de sus integrantes...\r\nal menos por unos días.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">La puerta del salón se abrió de golpe. Era Nebula,\r\nquien llevaba a rastras el cuerpo del hombre embarrado. Lo arrojó sobre las\r\nalfombras al tiempo en que Fujitsu y Padfoot se ponían en guardia.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Pero... ¿Qué es todo ese ruido? </span>–p<span lang=\"ES-AR\">reguntó Recycled\r\ndespertándose de su siesta en el sofá.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Me vieron... Los jinetes me vieron, ya vienen para acá </span>–d<span lang=\"ES-AR\">ijó Nebula respirando\r\nagitadamente.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Aggg... </span>–g<span lang=\"ES-AR\">ruño el hombre embarrado tomándose el abdomen, un mancha de sangre\r\ncomenzaba a expandirse sin freno a través de su coraza. <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Escuchen… Si lo están buscando debe ser por algo importante, eso ya\r\nlo averiguaremos más tarde, por el momento...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Nebula fue interrumpido por los golpes en\r\nla puerta. Los jinetes habían llegado.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Intentaré negociar con ellos, a ver que les puedo sacar. Recycled,\r\ntú llévatelo abajo, a la mazmorra...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Con dificultad Recycled logró arrastrarlo\r\npor las escaleras.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Nebula abrió la puerta un poco y observo a\r\nlos dos caballeros de capaz celestes tan mojados como lo estaba el mismo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">No son bienvenidos por estos lados </span>–musitó<span lang=\"ES-AR\"> Nebula\r\nseriamente.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Pues es una pena... </span>–c<span lang=\"ES-AR\">omentó Redwar clavándole su mirada inmóvil</span>-.<span lang=\"ES-AR\"> Porque Melegaunt y\r\nyo nos sentimos como en casa.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">VI<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Todos se sentaron en la mesa a beber\r\ncerveza.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Excelente producción, no tan buena como la que hacemos en Patagonia,\r\npero sirve </span>–d<span lang=\"ES-AR\">ijó Redwar arrugando su nariz</span>-. <span lang=\"ES-AR\">Ahora bien, antes de\r\nque empiece a hacer las cosas por las malas, les aconsejo que llamen a su líder\r\npara ver si podemos hacerlas por las buenas...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Irwyng está descompuesto </span>–comentó<span lang=\"ES-AR\"> Fujitsu rápidamente y luego\r\nagregó:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Le dijimos que no tomara tantos batidos de plátano, pero... él es\r\nalgo testarudo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Melegaunt metió la mano en su abrigo y saco\r\nun pergamino el cual extendió sobre la mesa.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">El hombre al que perseguimos es un prófugo de la justicia, su nombre\r\nes Random, estoy seguro de que les sonara de algún lado.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Claro... ¿no es el que se dedica a hacer concursos de relatos y\r\nacompaña a vender galletas a los Boy Scaout? </span>-<span lang=\"ES-AR\">preguntó Padfoot.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Sí, pero ese no es el Random que estamos buscando nosotros...</span> –aclaró Melegaunt.<span lang=\"ES-AR\"><o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¿A qué te refieres? </span>–p<span lang=\"ES-AR\">reguntó Fujitsu.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Demasiada información…</span>–i<span lang=\"ES-AR\">nterrumpió Redwar.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n- <span lang=\"ES-AR\">¡No les diremos nada hasta que nos lo cuenten todo! </span>-<span lang=\"ES-AR\">amenazó Nebula\r\ngolpeando la mesa con su palma.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Redwar suspiró presionando su paciencia con\r\nlos puños y explicó:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Como dice Melegaunt, el Random que perseguimos no es el que\r\npertenece a esta partida, sino a otra.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Padfoot y Fujitsu se echaron a reír.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿Os da risa? </span>–l<span lang=\"ES-AR\">es preguntó Redwar proclamando de nuevo al silencio</span>-. <span lang=\"ES-AR\">Este Random proviene\r\nde alguna de las partidas del antiguo Lifo... nos supera a todos por cientos de\r\nniveles y tiene un equipamiento que lo hace invencible. Si no lo detenemos\r\nahora, quien sabe lo que podría hacer...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Pero… No se puede viajar entre las partidas </span>–masculló<span lang=\"ES-AR\"> Fujitsu en\r\ntono burlón</span>-. <span lang=\"ES-AR\">¿O si se puede?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Claro que no, al menos no se podía… aún no sabemos cómo consiguió\r\nRandom hacer tal hazaña, sospechamos que algo tiene que ver con el “Mapa\r\nPortal” <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿Y suponiendo que sea verdad, como piensan detenerlo? –preguntó\r\nNebula–. ¿A caso no es invencible según ustedes?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Dado que Sora aún está de exámenes me toca a mí hacer el trabajo\r\nsucio, no cuento con los poderes para devolverlo a su partida, por lo que la\r\núnica forma de que salga de nuestro mundo es eliminándolo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Los miembros de Casa Atreide se miraron\r\nentre sí.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">No vale la pena que intenten encubrirlo, les prometemos que si nos\r\ndicen donde lo esconden no tendrán problemas alguno con nosotros ni con nuestro\r\nclan </span>-<span lang=\"ES-AR\">dijó Melegaunt.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Ya veo... –comenzó a decir Nebula</span>–,<span lang=\"ES-AR\"> lo que pasa es que\r\ntenemos un pequeño problema, ocurre que yo prefiero tener a un loco prófugo en\r\nnuestro hogar antes que tener que seguir las órdenes de dos payasos. Por lo\r\nque, a menos que nos den algo que valga la pena, se les va a complicar la\r\nsituación.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Melegaunt busco entre su capa y arrojo un\r\nsaco sobre la mesa.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">12 joyas... ¿qué les parece?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Puff... Ni te acercas </span>–respondió\r\n<span lang=\"ES-AR\">Nebula con asco.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Pero, Nebula, 12 joyas están bien... serian dos para cada uno </span>–indicó<span lang=\"ES-AR\"> Fujitsu.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">No... No es suficiente.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿A qué te refieres con eso de que, si no te damos algo que valga la\r\npena, se nos va a complicar la estancia? –preguntó Redwar con la mirada puesta\r\nen su cerveza.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">A que terminaran como abono para los gusanos de nuestra mazmorra.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\"> ¿Allí lo escondes verdad? ¿en la mazmorra? </span>–preguntó<span lang=\"ES-AR\"> Redwar\r\nbebiendo un sorbo</span>-. <span lang=\"ES-AR\">Entonces... ya no necesito nada más de ustedes.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">El rostro de Nebula se desfiguro.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">¡AHORA! </span>–g<span lang=\"ES-AR\">ritó Nebula</span>–.\r\n<span lang=\"ES-AR\">¡ATAQUEN!<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Tanto él como Padfoot y Fujitsu\r\ndesenfundaron sus espadas y soltaron un grito de guerra, pero no pasó nada más,\r\nallí se quedaron, quietos como estatuas, Redwar chasqueo los dedos de sus manos\r\ny los tres se convirtieron en polvo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"line-height: normal; text-align: justify;\">\r\n–<span lang=\"ES-AR\">¡Pero Redwar! ¡Sabes los problemas\r\nque tendrás cuando se sepa que...! –dijó Melegaunt desesperado.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"line-height: normal; text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">-¿Qué cosa? ¿El abuso del poder? </span>-<span lang=\"ES-AR\">preguntó Redwar\r\nenojado</span>-. <span lang=\"ES-AR\">Si no resolvemos el tema de Random te aseguro que será el fin de\r\nLifo, poco importa lo que me pueda pasar a mí...<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Ambos visualizaron las escaleras\r\ndescendentes.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">-Está bien... Terminemos con esto </span>–d<span lang=\"ES-AR\">ijó Melegaunt tomando\r\nsu bolsa con joyas.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><o:p><br></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<b style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-AR\">DESPUÉS<o:p></o:p></span></u></b></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<span lang=\"ES-AR\">VII<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Random subió por las escaleras con\r\ndificultad hasta llegar a la sala común de Casa Atreide.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Alrededor de su cuerpo le rodeaba la capa\r\nde Patagonia que cubría el profundo corte en el pecho hecho por Recycled.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Mientras caminaba hacia la puerta escuchó\r\nel ruido de una cisterna de inodoro cantando <i style=\"mso-bidi-font-style: normal;\">\"Lo que el agua se llevó\" </i>y luego alguien llego a la\r\nsala.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n-<span lang=\"ES-AR\">Ay... No volveré a tomar batidos de plátano en mi vida… ¡Hey!\r\n¡Random! </span>-<span lang=\"ES-AR\">dijó Irwyng sobándose el estómago</span>-. <span lang=\"ES-AR\">¿En qué momento\r\nllegaste? <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">Random se quedó helado, pensando en cómo\r\nresponder.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">-Oh... ¡No me digas que vienes a traerme el\r\nresultado de los relatos Liferos! ¡Me muero de emoción! </span>-<span lang=\"ES-AR\">festejó Irwyng ansioso</span>-. <span lang=\"ES-AR\">Por cierto, ¿Te\r\nencuentras bien? Te vez un poco arruinado…<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\">-Emmm ¡Sí! Si claro, a eso vine... y\r\nrespecto a mi apariencia… ya sabes, los años no vienen solos</span>-<span lang=\"ES-AR\">respondió Random entre\r\nrisas</span>-. <span lang=\"ES-AR\">Pero... ¿Qué te parece si antes de ver los resultados del evento\r\nhacemos un brindis?<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span lang=\"ES-AR\"><br></span></div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n<div style=\"clear: both;\"></div>\r\n</div>');
INSERT INTO `relatos` (`id`, `autor`, `partida`, `titulo`, `texto`) VALUES
(4, 'Xan', 'Partida 4', 'Ezio', '<div class=\"post-body entry-content\" id=\"post-body-4220293137827489197\" itemprop=\"description articleBody\">\r\n<br>\r\n<div style=\"text-align: center;\">\r\n<b><u><br></u></b></div>\r\n<div style=\"text-align: center;\">\r\n<b><u><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\"Ezio\"</span></u></b></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\nMi nombre es Ezio, nací en un pueblo pobre al norte de Roma, hijo de nadie y hermano de todos aquellos que al igual que yo, estaban solos. Las guerras, conquistas y&nbsp; el hambre, dejaban a muchos niños sin alguien que pudiera darles la atención que se merecen.</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; text-align: justify;\">Desde siempre&nbsp; amé las aventuras, conocer lugares nuevos, robar pertenencias de la gente y lanzarme hacia lo desconocido sin importar que hubiese por delante. Ser tan temerario a menudo solía traerme problemas, pero también supo darme las mejores experiencias.&nbsp;</span><span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Gracias a ello conocí a Cornelius Cicero, un hombre de aproximadamente 28 años, era muy alto y tenia un porte imponente, poseía un rostro que demostraba dureza y rigidez, pero conmigo demostraba cierta calidez, o al menos eso me gustaba pensar.</span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Cornelius me enseñó a esgrimir espadas y a luchar durante todo el tiempo que cuido de mi, fue uno de los obstáculos más duros que tuve que atravesar en mi infancia...¡Ese hijo de perra no se contenía nunca!. Supe pasar días en cama hasta recuperarme del todo, aunque siempre supe que era por mi propio bien, que me preparaba para el futuro.</span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Además del combate, me enseño lo básico de la lectura y escritura, repitiéndome a menudo que un caballero&nbsp; debe de usar la pluma con la misma gracia y elegancia que su espada.</span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">El se hizo cargo de mí hasta alcanzar los 18 años, edad en la que decidí dejar el pueblo y buscar mi lugar en el mundo. Aunque no sin antes recomendarme algo especial, que podría saciar mis ansias de aventura; las islas del Jqahack. Estas islas quedaban al oeste, pasando las colinas carmesí (nombradas así por la ultima guerra que se llevó a cabo allí, que literalmente las tiñó de rojo), donde se rumorea que hay unas ruinas antiguas y misterios que nadie pudo resolver.</span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; text-align: justify;\">Sonreí y escuche atento todo lo que tenía para contarme, luego emprendí mi viaje.</span><span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Fueron unos meses muy duros y agotadores pero finalmente llegue a una de las ruinas. En ésta había una simbología muy marcada hacia un dios en especial, Apolo, dios del Sol, la lógica, y la razón. Las ruinas estaban llenas de peligros, criaturas temibles que sólo nombran en las leyendas, y un suelo que se derrumbaba bajo mis pies, pero ni si quiera eso fue capaz de mermar mi determinación. Luego de explorar durante horas,&nbsp; un poco decepcionado por no haber encontrado mas que objetos polvorientos e inútiles, caí de rodillas, cansado y abatido frente a una estatua del gran Apolo. Hundido en mis pensamientos cerré los ojos y percibí un susurro. Fue una sensación extraña, en un principio creí que mi mente me jugaba una mala pasada, pero al abrir los ojos vi una luz ínfima reflejada sobre mi mano, y al buscar su fuente, la vi.&nbsp;</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">La espada de la estatua no era de roca sólida, sólo estaba cubierta con ella, y a partir de un pedazo faltante pude ver su resplandor dorado. Era una espada corta tan bella como el mismísimo amanecer, \"erastis tou iliou\" tenia inscripto en un costado, que significa \"amante del sol\".&nbsp;</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Mis manos comenzaron a temblar de la emoción e hice lo que pude para ahogar un grito que quería escaparse de mi boca al tenerla en mis manos. Era magnífica, una verdadera obra de arte.&nbsp;</span></div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Salí de las ruinas mas motivado que nunca, con aires renovados y mis esperanzas en lo mas alto del cielo. No podía parar allí.</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Me tome unos días para buscar un pueblo donde reabastecerme y comenzar la búsqueda de mi próximo objetivo, ¡Podría haber mas tesoros ocultos!</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nNo miento al decir que me pasaba horas admirando la belleza de la espada, y que estas parecían sólo minutos. Era como si cada vez que me detenía a mirarla, descubría algo nuevo que no había visto jamás, era hipnotizante.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nDespués de descansar un par de días y recuperar mis fuerzas y energías, retome el viaje por las islas.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nAl cabo de una semana encontré un templo en otra de las islas, aunque a diferencia de la expedición anterior, ésta era mucho&nbsp; mas tétrica y oscura, donde el aire era mas pesado&nbsp; y había como una bruma alrededor.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nLogré&nbsp; adentrarme en el templo y vague en él hasta quedarme sin antorchas, no había absolutamente nada en él. Había apostado todo a encontrar algo, y a costa de eso perdí mi única iluminación, quede en una oscuridad inmensa y un silencio aterrador. Me moví a ciegas hasta llegar a una sala, tenia su entrada derrumbada y un frío&nbsp; que provenía desde dentro que se calaba en los huesos.&nbsp;</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nIntrigado comencé&nbsp; a abrirme camino hasta ingresar en ella. Dentro vi un altar, con lo que parecía ser un objeto completamente negro sobre ella&nbsp; y&nbsp; debajo en la base, una inscripción&nbsp; tallada a modo de plegaria.</div>\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><i><br></i></span></div>\r\n<i><span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span></i><br>\r\n<div style=\"text-align: justify;\">\r\n<i><span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\"Si es lícito para mí honrar con ruegos</span></i></div>\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span></i>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">a la invisible diosa y a ti,</span></span></i></div>\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span></i>\r\n<div style=\"text-align: justify;\">\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Señor de los que habitan la noche,</span></span></i></div>\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nAidoneo, Aidoneo, te suplico</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nque sin sufrimiento y libre de un final doliente</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nllegue el extranjero</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nabajo, al llano oculto de los muertos</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\ny a la morada estigia.</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nPues si inmerecidamente pena tras pena</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nle sobrevenían,</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nque un genio justo ahora lo enaltezca.</div>\r\n</span></span></i><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><i><br></i></span></div>\r\n<i><span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span></i><br>\r\n<div style=\"text-align: justify;\">\r\n<i><span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Oh, diosas ctónicas y cuerpo bestial</span></i></div>\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span></i>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">invulnerable, que en las puertas</span></span></i></div>\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span></i>\r\n<div style=\"text-align: justify;\">\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">hospitalarias</span></span></i></div>\r\n<i><span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nreposa y gruñe, y desde la cavernas</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nes, según se cuenta,</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nguardián indomable en el Hades;</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nesto, oh hijo de la Tierra y el Tártaro,</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nsuplico: un descenso impoluto</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\npara el extranjero que se encamina</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\na los llanos subterráneos de los muertos.&nbsp;</div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nA ti, te invoco a ti: el sueño eterno.\"</div>\r\n</span></span></i><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Casi sin darme cuenta, mientras leía&nbsp; la plegaria, se me hizo imposible no tomar en mis manos el objeto que estaba que estaba sobre el altar. Era una espada.</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Era bella, oscura como la noche y parecía que ese color&nbsp; tan oscuro&nbsp; escondía&nbsp; una infinidad de secretos.</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nA diferencia&nbsp; de la otra, ésta&nbsp; no tenia ninguna inscripción&nbsp; que pudiese leer, solo tenia unos símbolos&nbsp; raros y mínimos por doquier.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nLa tomé&nbsp; y salí&nbsp; del templo, aunque sentía por dentro una ansiedad que no podía&nbsp; expresar en palabras, pero es algo que ignore en su momento.&nbsp;</div>\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Regrese&nbsp; a mi pueblo natal 2 meses después&nbsp; de mi partida, sólo&nbsp; para encontrarme con que Cornelius se había ido y nadie sabia su paradero.</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Algo me tenía inquieto, hasta que me cruce con una anciana sabia del pueblo, que si bien es ciega, supo de inmediato que algo no estaba bien conmigo.&nbsp;</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">- \" Tu mente parece nublada, joven. \"- Dijo, agarrándome del antebrazo. -\"En tus manos llevas algo que eres incapaz de comprender, pero al llegar el momento, ruego por el bien de todos los que te rodean que lo hagas. Deberás tomar una decisión hijo, una que cambiará todo lo que conoces, de una forma u otra.\"- Soltó mi brazo y antes de que pudiese hacerle alguna de las miles de preguntas que rondaban por mi cabeza, desapareció entre una multitud de personas.</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Pasaron los meses y lo único en lo que podía pensar era aquella frase de esa anciana... ¿Que habrá querido decir? ¿Habrán sido sólo delirios? ¿O hay algo más que no estoy viendo?.</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nEl tiempo pasó y con ello sucedió el primer acontecimiento. Durante una expedición a las montañas heladas, me vi a mi mismo sobre un bárbaro, con mi espada oscura enterrada en su pecho... -\"Pero, ¡No fue mi intención! ¡¿Porqué tuvo que molestarme?!.\" - Grité a la nada. - \"No quise matarlo, lo juro, ¡Sólo quería asustarlo y que me deje en paz!.\"</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nMi cabeza dolía y los recuerdos del combate se hacían borrosos y difusos, ni si quiera sé de donde había salido aquel bárbaro.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nLa ocurrencia de estos \"accidentes\" se fue incrementando, cada vez eran más y más frecuentes, cada vida que tomaba hacia que fuera mas fácil tomar la siguiente. Animales, ladrones, bárbaros e idiotas que no conocen su lugar fueron cayendo como moscas a mis pies. Casi sin darme cuenta había dejado de utilizar aquella hermosa espada brillante, la tenia envainada, juntando polvo y haciendo caso omiso a su existencia.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nEn el pueblo puedo notar que los rumores se han esparcido, lo se por su forma de mirar, hablan a mis espaldas, quieren que me vaya, quieren sacarme de aquí, pero todos están muy asustados como para hacer algo.</div>\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Estoy cada vez más y más frustrado. Deberían darme las gracias por acabar con la escoria que había en el pueblo, no evitarme.</span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Mientras caminaba sentí un dolor agudo en mi hombro, mi experiencia en combate me hizo darme cuenta al instante: Me habían atacado.</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Desenvaine la espada oscura y al darme vuelta, la deje caer como un rayo sobre mi oponente, abriéndolo casi de par en par.&nbsp;</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nA ver su cuerpo en el suelo bañado en sangre, suelto mis armas y me arrodillo junto a él....Era Cornelius.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\n-\"Me sorprende lo fuerte que te has convertido\"- toce, ensangrentado. -\"pero...ya no te reconozco...para mi el joven Ezio murió en aquella ruina, no se quien er-es\". -dijo mientras lanzaba su último suspiro.</div>\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Al levantar la vista me vi rodeado de personas, observando con desprecio, temor, odio y con tristeza. Yo ya no pertenecía a ese lugar.&nbsp;</span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span></span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\"><br></span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"></span></span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">Deje la espada en el suelo y corrí hasta desplomarme. Corría de la gente, de sus miradas, del dolor que sentía en mi pecho que me impedía respirar, de todos mis errores, de mi mismo.&nbsp;</span></span></div>\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><span style=\"background-color: #EEEEEE; color: #222222;\">\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nAl despertarme en un claro, la vi, oscura como la noche y todavía brillando por la sangre de Cornelio, estaba al lado mío. Mi corazón casi se escapa de mi pecho y un escalofrío recorrió todo mi cuerpo. En ese momento entendí todo, había que destruirla cuanto antes.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nMe dirigí al templo de Hades, ya que allí se encontraban algunos de los sacerdotes más fuertes que existían en ese entonces e implore que me ayuden.</div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\nDespués de realizar un ritual durante horas en el que incluían diferentes especias, flores secas, inciensos, unas velas oscuras con llamas azules y un poco de mi sangre; pudimos destruirla en pedazos.</div>\r\n</span></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif; font-size: xx-small;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"></span><br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Pasaron 20 años de aquel fatídico día. Logré volver a una vida normal, me asenté en Vulcan y formé una hermosa familia. Hasta que un dia, recostado bajo un viejo roble mientras mis niños corrían por los campos, recordé todos esos momentos que viví y mi espada dorada, la que solía distraerme por tanto tiempo. Decidí buscarla para contarles una historia a mis hijos, pero al desenvainarla, mi rostro se puso pálido, mis manos comenzaron a temblar, y dejaron caer al suelo una espada negra como la brea.</span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<br>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span>\r\n<div style=\"text-align: justify;\">\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\"><br></span></div>\r\n<span style=\"background-color: #EEEEEE; color: #222222; font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">\r\n</span><span style=\"background-color: #EEEEEE; color: #222222;\"><div style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;arial&quot; , &quot;helvetica&quot; , sans-serif;\">Al levantar la cabeza no había nadie. Estaba sólo en el templo, frente al altar donde la había encontrado.</span></div>\r\n<div style=\"text-align: justify;\">\r\n<br></div>\r\n<div style=\"font-family: arial, helvetica, sans-serif; font-size: small; text-align: justify;\">\r\n<div style=\"text-align: center;\">\r\nEzio</div>\r\n</div>\r\n<div style=\"font-family: arial, helvetica, sans-serif; font-size: small; text-align: justify;\">\r\n<br></div>\r\n<div style=\"font-family: arial, helvetica, sans-serif; font-size: small; text-align: justify;\">\r\n<div class=\"separator\" style=\"clear: both; text-align: center;\">\r\n<a href=\"img/imgrelatos/img1.jpg\" imageanchor=\"1\" style=\"margin-left: 1em; margin-right: 1em;\"><img data-original-height=\"1541\" data-original-width=\"1000\" src=\"img/imgrelatos/img1.jpg\" width=\"207\" height=\"320\" border=\"0\"></a></div>\r\n<br>\r\n<br>\r\n<br>\r\n<div style=\"text-align: center;\">\r\nCornelius</div>\r\n<div style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"separator\" style=\"clear: both; text-align: center;\">\r\n<a href=\"img/imgrelatos/img2.jpg\" imageanchor=\"1\" style=\"margin-left: 1em; margin-right: 1em;\"><img data-original-height=\"1424\" data-original-width=\"812\" src=\"img/imgrelatos/img2.jpg\" width=\"182\" height=\"320\" border=\"0\"></a></div>\r\n<br>\r\n<br>\r\n<div style=\"text-align: center;\">\r\nEspadas</div>\r\n<div style=\"text-align: center;\">\r\n<br></div>\r\n<div class=\"separator\" style=\"clear: both; text-align: center;\">\r\n<a href=\"img/imgrelatos/img3.jpg\" imageanchor=\"1\" style=\"margin-left: 1em; margin-right: 1em;\"><img data-original-height=\"1600\" data-original-width=\"900\" src=\"img/imgrelatos/img3.jpg\" width=\"180\" height=\"320\" border=\"0\"></a></div>\r\n<br>\r\n<div class=\"separator\" style=\"clear: both; text-align: center;\">\r\n<a href=\"img/imgrelatos/img4.jpg\" imageanchor=\"1\" style=\"margin-left: 1em; margin-right: 1em;\"><img data-original-height=\"1600\" data-original-width=\"900\" src=\"img/imgrelatos/img4.jpg\" width=\"180\" height=\"320\" border=\"0\"></a></div>\r\n<br></div>\r\n</span>\r\n<div style=\"clear: both;\"></div>\r\n</div>');
INSERT INTO `relatos` (`id`, `autor`, `partida`, `titulo`, `texto`) VALUES
(5, 'Fawkes', 'Partida 4', 'Batalla Interestelar', '<div class=\"post-body entry-content\" id=\"post-body-3971946311631376942\" itemprop=\"description articleBody\">\r\n<br>\r\n<div style=\"text-align: center;\">\r\n<b><u><br></u></b></div>\r\n<div style=\"text-align: center;\">\r\n<b><u><br></u></b></div>\r\n<div style=\"text-align: center;\">\r\n<b><u>\"Batalla Interestelar\"</u></b></div>\r\n<div style=\"text-align: center;\">\r\n<b><u><br></u></b></div>\r\n<div style=\"text-align: center;\">\r\n<b><u><br></u></b></div>\r\n<br>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Hace 150 años, la ciudad\r\nde Bravos que tenía bajo su control el 95% del continente de Lifo, se dispuso a\r\nconquistar el último bastión de este continente, que no era otro que la ciudad\r\nde Patagonia, conocida por sus grandes eruditos que a la vez eran grandísimos\r\nguerreros, y lo que empezó siendo una guerra entre dos ciudades, acabó siendo\r\nla batalla más importante y decisiva del continente de Lifo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Después de muchos\r\npreparativos, pulir estrategias, construir armas y armaduras, entrenar mascotas\r\ny preparar pociones y hechizos, los guereros de Bravos desfilaron camino a\r\nPatagonia. Estos grandes guerreros estaban liderados por Random, un gran líder\r\nque aún no conocía la derrota en batalla, era alto, robusto y muy ágil,\r\natributos que normalmente son opuestos, pero que Random tenía y lo hacían\r\ntemibles, su mascota era un oso panda con gran poder apodado Viktor el\r\nDespiadado, que le acompañaba en todas sus batallas. El segundo al mando era\r\nVegener, otro gran guerrero y mano derecha de Random, un gran estratega que\r\nsiempre ideaba las mejores estrategias que daban las victorias a Bravos. Por\r\ndebajo de estos dos guerreros, se encontraban en el mismo rango los generales\r\nMemorex, conocido por su poca paciencia, su desparpajo y su fogosidad en plena\r\nbatalla, Xan, conocido por su compañerismo y no dejar atrás a ningún compañero\r\ny Aragon, un gran guerrero con una fuerza descomunal. Todo esto, sumado al gran\r\nnúmero de soldados con los que contaba Bravos, los hacía tener la mayor fuerza\r\nmilitar de todo el continente y por tanto, conquistaron todas las ciudades sin\r\nmayor esfuerzo. Una vez preparado todo, los guerreros marcharon sin pausa hacia\r\nPatagonia.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Mientras tanto en\r\nPatagonia, ya estaban preparados para defenderse del ataque de Bravos. Habían\r\ncolocado trampas en un perímetro de 2 kilómetros a la redonda de la ciudad,\r\nhabían elaborado las mejores pociones que su druida conocía (y eran las mejores\r\nde todo el continente), sus mejores hechiceros estaban preparados con los\r\nmejores hechizos, ya que acababan de descifrar el grimorio del caos, y este\r\nescondía en su interior los hechizos más poderosos del mundo entero. La ciudad\r\nde Patagonia, era conocida por ser la ciudad más moderna de todo el continente\r\ny la que más eruditos tenía. El erudito líder era el gran Vodianoi, no era el\r\nmás inteligente de todos, pero si el que más equilibrada tenía la balanza\r\nguerrero/erudito, por eso era el más indicado para liderar esta ciudad. El\r\nsegundo de abordo era Melegaunt, Mele para los amigos, era el más inteligente\r\nde todos, su principal trabajo era descifrar runas antiguas para conocer mejor\r\nel pasado de Lifo. El general de batalla era Redwar, que no tenía nada que\r\nenvidiar a Random, era frío como el hielo y no le temblaba el pulso lo más\r\nmínimo a la hora de matar en una batalla.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Después de cinco días de\r\nmarcha, por fin los guerreros de Bravos empezaron a deslumbrar la ciudad de\r\nPatagonia, una vez llegaron a la cima de una leve colina, Random levantó el\r\npuño y mandó parar a sus tropas para examinar el terreno y decidió montar ahí\r\nel campamento de guerra, que se situaba cerca de los dos kilómetros de la\r\nciudad. Una vez montado el campamento los altos rangos se reunieron en la\r\ntienda principal para empezar a planificar estrategias para asaltar la ciudad.\r\nMientras tanto, los patagones ya estaban completamente preparados para la\r\nofensiva de Bravos, tenían plena confianza en las trampas que habían colocado,\r\ny una vez consiguieran llegar a la ciudad, sus tropas estarían bastante\r\nmermadas, ya que estas trampas eran indetectables. <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Antes de que comenzara la\r\nbatalla, Vodianoi se dirigió al edificio de investigación para visitar a\r\nMelegaunt, el cual estaba absorto en descifrar unas runas <span style=\"mso-tab-count: 1;\">&nbsp; </span>que había conseguido hace poco y que creía que\r\neran de vital importancia, ya que suponía que se trataba de una profecía:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">-¡Mele!- exclamó Vodianoi\r\n– tendrías que estar preparándote para la batalla.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Tendréis que empezar\r\nsin mi – dijo Mele con voz distante, ya que no prestaba mucha atención a lo que\r\ndecía Vodianoi- estoy demasiado ocupado con estas runas, ya he traducido la\r\nmitad y lo que he descubierto hace que tenga que descifrar el resto lo antes\r\nposible-<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Si Vodianoi no tenía\r\nbastantes preocupaciones debido a la batalla que estaba por comenzar, las\r\npalabras de Mele no hicieron más que aumentar dicha preocupación.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Está bien, termina con\r\neso y únete a la batalla en cuanto puedas, necesitamos a todos los guerreros\r\nposibles- dijo con voz firme Vodianoi.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">En la colina, los\r\nguerreros de Bravos se disponían avanzar hacia Patagonia. De avanzadilla iban\r\nlos guerreros más inexpertos, ya que intuían que iban haber demasiadas trampas\r\nen el camino y era importante que los grandes guerreros no sufrieran ninguna\r\nherida en el trayecto hacia la ciudad. Avanzaron quinientos metros y de\r\nrepente, se iluminó una zona del terreno y empezaron aparecer enredaderas\r\natrapando a una veintena de guerreros, estrangulándolos, los gritos de dolor se\r\ndebían de escuchar hasta en la ciudad, inmediatamente intentaron cortar las\r\nenredaderas pero ya era demasiado tarde, todos los soldados que había atrapado\r\nestaban muertos. Una vez superado, siguieron avanzando, esta vez, todos los\r\nsoldados que iban en cabeza no dejaban de mirar de un lado a otro, nerviosos,\r\nsudando a más no poder, y hasta a algunos se le podía notar el temblor en las\r\nmanos. Cada vez estaban más cerca de la ciudad, no se lo podían creer solo\r\nhabían caído en una trampa, ya deslumbraban los muros de la ciudad cuando se\r\nvolvió a iluminar y los veinte guerreros de primera línea quedaron totalmente\r\ncongelados, e inmediatamente empezaron a caer bolas fuegos rompiendo los\r\ncuerpos congelados de los guerreros. Esta última trampa hizo que todos los\r\nguerreros se frenaran en seco y empezaran a mirarse los unos a los otros,\r\ncompletamente inmovilizados, no sabían que hacer, si correr, quedarse quietos,\r\nestaban completamente atemorizados, entonces Random, con paso firme, se\r\nadelantó a todo el pelotón, se puso en cabeza y empezó a caminar, este gesto\r\nhizo que todos los soldados recobraran la confianza en ellos mismos y siguieron\r\nsin dudar a su líder. Después de cuatro horas intensas para recorrer los\r\nescasos dos kilómetros que separaban el campamento de la ciudad, por fin\r\nconsiguieron llegar a los muros, pero otra sorpresa les esperaba allí.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Una vez llegaron a los\r\nmuros de la ciudad, los guerreros de Bravos estaban rebosantes de confianza, ya\r\nque habían perdido menos hombres en el camino de los que pensaban, pero una vez\r\nallí, recorrieron con la mirada los altos muros y vieron en la cima de ellos a\r\nlos hechiceros de la ciudad.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">-¡Ahora!- gritó el\r\nhechicero jefe.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Todos los hechiceros,\r\nlevantaron sus báculos al mismo tiempo y golpearon el muro, el cual se iluminó\r\ncon un destello blanco y empezaron a salir del muro esqueletos veloces que se\r\nmovían a una velocidad sobrehumana, atacando sin ninguna piedad a los guerreros\r\nde Bravos, uno tras otro iban cayendo, se defendían como podían, ya que apenas\r\nllegaban a verlos pero poco a poco los esqueletos iban cayendo. Random y\r\nVegener cansados de ver la escena entraron en acción junto a sus mascotas y\r\naunque recibiendo varios golpes y estocadas, consiguieron reducir a todos los\r\nesqueletos. Una vez terminado este ataque, los hechiceros volvieron agitar los\r\nbáculos y la tierra donde se hallaban los guerreros de Bravos empezó a temblar,\r\na resquebrajarse y por último a hundirse, uno tras otro los soldados iban\r\ncayendo, a base de empujones los soldados que estaban más cercanos al muro\r\nintentaban desesperadamente volver hacia atrás y huir, pero todos acaban siendo\r\nvíctimas del hechizo. Finalmente, los guerreros de Bravos decidieron volver al\r\ncampamento para reorganizarse y preparar otra ofensiva.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Después de la primera\r\nofensiva de Bravos, siguieron muchas más, todas ellas sin éxito alguno, pero no\r\nse rendían a pesar de que su ejército, ofensiva tras ofensiva iba menguándose.\r\nY así pasaron dos largos años de guerra, hasta que una noche cambió todo por\r\ncompleto.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Eran las seis de la\r\nmadrugada, la noche estaba llegando a su fin y el sol estaba a punto de asomar\r\npor las colinas del este. De repente, se empezaron a escuchar gritos\r\ndesgarradores, espadas y como si algo sobrevolara el campamento. Al salir todos\r\nlos altos cargos fuera de sus tiendas, no podían creer lo que veían sus ojos,\r\nel campamento estaba arrasado por un fuego azul, todo el ejercito yacía sobre\r\nel suelo teñido de rojo, y de entre las llamas se empezó a deslumbrar una\r\nfigura que no parecía de este mundo, llevaba una armadura muy extraña pero que\r\njunto al yelmo intimidaba solo de mirar, el escudo era de un cristal azulado y\r\nportaba un hacha de color añil de gran poder, y junto a este guerrero se\r\nencontraba volando un dragón de color azul cuya cara estaba tapada por una\r\ncalavera. Una vez el extraño individuo se paró de ellos, empezó hablar:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">-¿ Vosotros sois lo\r\n“grandes” guerreros de Bravos?- preguntó. Entonces Random dio un paso al\r\nenfrente y se dirigió a él:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Si, somos nosotros,\r\n¿quién eres y que quieres de nosotros? – le contestó.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Mi nombre es Xilok, y\r\nsoy más conocido en todo el universo como Xilok el despiadado. He destruido\r\ntodas las ciudades que me he encontrado a mi paso y conforme las iba\r\ndestruyendo una a una, lo único que escuchaba era que esta ciudad estaba bajo\r\nel dominio de los guerreros de Bravos y bla bla bla- dijo Xilok con arrogancia.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Ante estas declaraciones,\r\ntodos se quedaron estupefactos, no podían creer lo que estaban oyendo, todas\r\nlas ciudades estaban destruidas, todo lo que habían hecho y todo el trabajo que\r\nles había costado conquistarlas había sido en vano, pero antes de que pudieran\r\nresponder a Xilok, este se les adelantó:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Todos estos guerreros\r\nque veis en el suelo, estaban más preocupados por huir y esconderse que por\r\nluchar conmigo, “grandes guerreros” que irónico – empezó a soltar una carcajada\r\ny acto seguido – ahora voy acabar con todos vosotros y con esa ciudad que se ve\r\nal fondo, ¡preparaos malditos!-<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Justo al acabar de\r\nhablar, se dirigió sin dilación hacia ellos, todos sacaron inmediatamente sus\r\narmas y empezaron a defenderse como podían, sus ataques eran muy poderosos,\r\nmucho más de lo que habían visto nunca. Random se dirigió hace él, y empezó a intercambiar\r\ngolpes, a pesar de que Random era una gran guerrero y tenía mucho poder, sabía\r\nque su espada suprema no era rival para esa hacha, tenía un poder descomunal,\r\nentonces Vegener, Memorex, Xan y Aragon rodearon a Xilok y lo atacaron a la\r\npar, este se agachó y empezó a girar sobre si mimo estirando el brazo y\r\nhaciendo una onda de color azul que hizo que todos salieran despedidos hacia\r\natrás. Sabían que su única esperanza era huir a Patagonia pero no sabían cómo\r\nescapar de esa situación, entonces Aragon dijo:<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Escapar hacia Patagonia\r\ny contadles lo que ha pasado aquí, ellos seguro que encuentran una forma de\r\nvencerle, corred y yo lo entretendré todo lo que pueda- dijo Aragon totalmente\r\nconvencido.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Pero Aragon…no\r\npuedes…tenemos que permanecer todos juntos- dijo con voz entrecortada Xan.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Está decidido Xan,\r\n¡corred! – terminó de decir Aragon.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Al ver la cara de Aragon\r\ntotalmente convencido, todos corrieron hacia Patagonia, una vez llegaron a los\r\nmuros de la ciudad, alzaron la bandera blanca y pidieron poder entrar en la\r\nciudad, los líderes de la ciudad que estaban en los muros observando todo lo\r\nque había ocurrido en el campamento de Bravos, accedieron a dejarles entrar.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Muchas gracias por este\r\ngesto hacia nosotros – dijo Random, estrechándole la mano a Vodianoi.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- No hay de que, estamos\r\nal tanto de lo que ha ocurrido en vuestro campamento, y si queremos vencer a\r\neste nuevo enemigo, necesitaremos toda la ayuda posible, así que muertos no nos\r\nserviríais de nada – le dijo Vodianoi con voz seria.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Disculpe – dijo Xan\r\ninterrumpiendo la conversación – si estaban observando lo que pasaba, ¿saben si\r\nAragon está bien?-<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Lo siento mucho, pero\r\nAragon murió a manos del guerrero de las estrellas e inmediatamente el guerrero\r\ndesapareció con los primeros rayos de sol – dijo con voz triste Vodianoi.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Aunque eran guerreros y\r\nestaban acostumbrados a la muerte, no pudieron evitar derramar alguna que otra\r\nlágrima.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- ¿Guerrero de las\r\nestrellas? – preguntó Vegener sorprendido – nos ha dicho que se llamaba Xilok\r\nel despiadado. <o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Seguidme, tenemos que\r\nenseñaros algo – dijo Vodianoi, mientras iniciaba el paso hacia el centro de la\r\nciudad.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Vodianoi dirigió a los\r\nguerreros de Bravos al edificio central de la ciudad, donde Melegaunt estudiaba\r\nlas runas antiguas y hacía sus hallazgos científicos. La sala era muy luminosa\r\na pesar de ser subterránea, estaba llena de estanterías repletas de libros\r\nantiguos y polvorientos, en el centro de la sala se hallaba el tronco de un\r\nárbol que atravesaba completamente las cinco plantas que tenía el edificio.\r\nSentado en una mesa se encontraron con Melegaunt que cuando se percató de la\r\npresencia de todos, se levantó y se dirigió hacia ellos.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Buenos días, no hay\r\ntiempo que perder- empezó a decir algo inquieto – tenemos poco tiempo y tenemos\r\nque actuar ya. Hace dos meses descifré una runa encontrada en una de las\r\nexploraciones a la luna Aio, y ella decía lo siguiente “El guerrero de las estrellas\r\nllegará y destruirá todo lo que encuentre a su paso desde la puesta hasta la\r\nsalida de la estrella brillante y el único guerrero capaz de plantarle cara\r\nserá aquel que consiga tener en su poder el equipo adimensional” – dijo sin\r\ncoger ni una pizca de aire.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- ¿Y esto que tiene que\r\nver con nosotros? – Preguntó Vegener.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Tiene que ver, que\r\nnecesitamos a los mejores soldados para conseguir los objetos que necesitamos.\r\nYa he obtenido todas las recetas alquimistas para conseguir fabricar el equipo\r\nadimensional, pero nos falta material, y ahí es donde entráis vosotros- cogió\r\naire y siguió explicando- necesitamos que un amuleto supremo que se encuentra\r\nen la cordillera helada y la cima nevada, la espada suprema, que está en\r\nposesión de Random, unas botas aladas, que por lo que he podido investigar se\r\nencuentran en algún lugar de las puertas del infierno. La coraza mitológica\r\nreal y las perneras reales se encuentran en el Reino Celestial y por último el\r\nescudo y el yelmo maldito ahí que ir a buscarlos al Purgatorio. Tenemos todos\r\nlos mapas para buscar estos objetos, lo que estamos es justo de grandes\r\nguerreros para ir a buscarlos-<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">-Mele, se te olvida algo\r\nmás, ¿no?- le dijo Vodianoi inclinando la cabeza<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">- Cierto, aunque la runa\r\nno lo menciona, con mis investigaciones he podido averiguar que en el planeta\r\nAeron, se encuentra un ser llamado Óculo que derrotaría en un abrir y cerrar de\r\nojos al dragón glacial de Xilok, pero es el viaje más arriesgado de todos-<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Después de varias horas\r\ndebatiendo y discutiendo, acordaron que Random viajaría al Purgatorio a por el\r\nescudo y el yelmo, Vegener se dirigiría al Reino Celestial a por la coraza y\r\nlas perneras, Xan bajaría a las puertas del infierno a por las botas y Memorex\r\niría a la cordillera helada y a la cima nevada a por el amuleto, mientras\r\nRedwar se aventuraría en el Planeta Aeron para conseguir capturar al Óculo.<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">Continuará…<o:p></o:p></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\"><br></span></div>\r\n<div class=\"MsoNormal\" style=\"text-align: justify;\">\r\n<span style=\"font-family: &quot;Times New Roman&quot;,serif; font-size: 12.0pt; line-height: 115%;\">By: Fawkes.<o:p></o:p></span></div>\r\n<br>\r\n<div style=\"clear: both;\"></div>\r\n</div>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `silencio`
--

CREATE TABLE `silencio` (
  `id` int(11) NOT NULL,
  `string` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `stringip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `isip` int(1) NOT NULL,
  `autor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `motivo` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `eliminado` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `horapuesto` int(20) NOT NULL,
  `horafin` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sorteos`
--

CREATE TABLE `sorteos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `oro` int(11) NOT NULL DEFAULT 0,
  `nivelmin` int(11) NOT NULL DEFAULT 0,
  `ganador` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fechalimite` int(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `textos`
--

CREATE TABLE `textos` (
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `texto` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene`
--

CREATE TABLE `tiene` (
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(10) NOT NULL,
  `usado` int(1) NOT NULL DEFAULT 0,
  `insignia` int(1) NOT NULL DEFAULT 0,
  `encantamiento` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienelogros`
--

CREATE TABLE `tienelogros` (
  `editar` int(11) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(14) NOT NULL,
  `fecha` int(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienemascotas`
--

CREATE TABLE `tienemascotas` (
  `id` int(11) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombremascota` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apodo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` int(20) NOT NULL,
  `experiencia` int(20) NOT NULL,
  `usado` int(1) NOT NULL,
  `acariciado` int(14) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienetitulos`
--

CREATE TABLE `tienetitulos` (
  `editar` int(11) NOT NULL,
  `nombrejug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(14) NOT NULL,
  `usado` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

CREATE TABLE `titulos` (
  `id` int(14) NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fondo` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `estilo` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `sombra` int(1) NOT NULL DEFAULT 1,
  `borde` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '2px solid #AAAAAA',
  `posicion` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `titulos`
--

INSERT INTO `titulos` (`id`, `descripcion`, `color`, `fondo`, `estilo`, `sombra`, `borde`, `posicion`) VALUES
(1, 'Jornalero', '#C27200', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(2, 'Capataz', '#DAAE6F', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(3, 'Jefe', '#349FDE', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(4, ', el trabajador dedicado', '#A9BE80', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(5, ', el adicto al trabajo', '#A3CE45', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(6, 'Gladiador', '#F03601', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(7, 'Explorador amateur', '#A4A4A4', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(8, 'Explorador ardiente', '#FF683E', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(9, 'Explorador glacial', '#3EC9FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(10, 'Explorador del cosmos', '#B860FB', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(11, 'Explorador universal', '#9073FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(12, 'Lector casual', '#D57201', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(13, ', el devoralibros', '#FF9C2A', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(14, ', la rata de biblioteca', '#C9A100', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(15, ', el fabricante novato', '#616CFF', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(16, ', el fabricante experto', '#58FFFC', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(17, 'Lifabricante', '#FF556B', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(18, 'Chef', '#AFAFAF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(19, 'Animalista común', '#00B813', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(20, 'Animalista poco común', '#3355FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(21, 'Animalista raro', 'darkorange', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(22, 'Animalista épico', 'red', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(23, 'Animalista legendario', '#AA29FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(24, 'Animalista único', '#00E1D9', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(25, 'Mamá Pollo', '#FE87FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(26, ', el Guardián de la fauna', '#4CFF79', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(27, 'Granjero', '#DACF00', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(28, 'Leñador', '#06BF00', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(29, 'Bruto', '#FF0000', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(30, 'Caballero', '#7AC1FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(31, 'General', '#FFCD57', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(32, ', la leyenda viva', '#FF5100', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(33, ', el discípulo de Merasmus', '#D300EA', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(34, 'Xilokiller', '#CC303F', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(35, 'Míster Lifo', '#FF00BC', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(36, 'Admin', 'lightblue', '#575757', 'none', 1, '2px solid #AAAAAA', 0),
(37, 'Admin', '#E00092', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(38, 'Admin', '#73B5FF', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(39, 'Hermano del bosque', '#8BEC24', '#7C5528', 'none', 1, '2px solid #AAAAAA', 0),
(40, 'Quevediano', '#781304', '#A67F43', 'bold', 1, '2px solid #AAAAAA', 0),
(41, 'Gongorino', '#120A03', '#A67F43', 'bold', 1, '2px solid #AAAAAA', 0),
(42, 'Experto en plátanos', '#1700B3', '#FFE323', 'bold', 0, '2px solid #AAAAAA', 0),
(43, 'Moderador', 'Yellow', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(44, ' el despiadado', '#00E3C5', '#000000', 'none', 1, '2px solid #AAAAAA', 1),
(45, ' I, Rey de la colina', '#FAF896', '#C24309', 'bold', 1, '2px inset #A87818', 1),
(46, ' I, Maestro de gremio', '#FAF896', '#096EC2', 'bold', 1, '2px inset #181EA8', 1),
(47, ' I, la Destripahombres', '#FA9696', '#5F0101', 'bold', 1, '2px outset #F6F6F6', 1),
(48, ' I, Chef Real', '#ECE015', '#5D00A9', 'bold', 1, '3px ridge #e8d62f', 1),
(49, 'Mano derecha', '#AFFFB0', '#007502', 'bold', 1, '2px outset #8C009E', 0),
(50, 'Caótico', '#AD8ADB', '#3D0082', 'bold', 1, '2px ridge #DB3339', 0),
(51, 'Encantador novato', '#FF1CD0', '#000000', 'none', 1, '2px solid #AAAAAA', 0),
(52, 'Brujo', '#8D38A7', '#274544', 'bold', 1, '2px solid #AAAAAA', 0),
(53, 'Proscrito', '#E3D13B', '#680E00', 'bold', 1, '2px solid #FFFFFF', 0),
(54, 'Ascendido', '#35E1FD', '#333333', 'none', 1, 'none', 0),
(55, 'Celestial', '#D0D500', '#417FFB', 'bold', 1, '3px ridge #FFD500', 0),
(56, ', el Arcano', '#E68FDE', '#222222; background-image: url(//img.lifo.es/img/sparks_effect.gif)', 'bold', 1, '3px ridge #7D42AD', 1),
(57, 'Asesino de naranjas', '#eb961c', '#111111', 'bold', 1, '2px solid #eb961c', 0),
(58, 'Asesino del asesino de naranjas', '#F65411', '#111111', 'bold', 1, '2px solid #F65411', 0),
(59, 'Asesino del asesino del asesino de naranjas', '#C62604', '#111111', 'bold', 1, '2px solid #C62604', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `segundos` int(14) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `puntos` int(20) NOT NULL,
  `oro` bigint(30) NOT NULL,
  `premium` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`segundos`, `nombre`, `puntos`, `oro`, `premium`) VALUES
(600, '10 minutos / 100 exp / 10 oro', 100, 10, 0),
(602, '*premium* 10 minutos / 100 exp / 20 oro', 100, 20, 1),
(1200, '20 minutos / 199 exp / 20 oro', 199, 20, 0),
(1202, '*premium* 20 minutos / 200 exp / 40 oro', 200, 40, 1),
(1800, '30 minutos / 295 exp / 29 oro', 295, 29, 0),
(1802, '*premium* 30 minutos / 300 exp / 60 oro', 300, 60, 1),
(2400, '40 minutos / 385 exp / 38 oro', 385, 38, 0),
(2402, '*premium* 40 minutos / 400 exp / 80 oro', 400, 80, 1),
(3000, '50 minutos / 470 exp / 47 oro', 470, 47, 0),
(3002, '*premium* 50 minutos / 500 exp / 100 oro', 500, 100, 1),
(3600, '1 hora / 550 exp / 56 oro', 550, 56, 0),
(3602, '*premium* 1 hora / 600 exp / 120 oro', 600, 120, 1),
(7200, '2 horas / 1090 exp / 110 oro', 1090, 110, 0),
(7202, '*premium* 2 horas / 1200 exp / 240 oro', 1200, 240, 1),
(10800, '3 horas / 1630 exp / 163 oro', 1630, 163, 0),
(10802, '*premium* 3 horas / 1800 exp / 360 oro', 1800, 360, 1),
(14400, '4 horas / 2170 exp / 217 oro', 2170, 217, 0),
(14402, '*premium* 4 horas / 2400 exp / 480 oro', 2400, 480, 1),
(18000, '5 horas / 2710 exp / 271 oro', 2710, 271, 0),
(18002, '*premium* 5 horas / 3000 exp / 600 oro', 3000, 600, 1),
(21600, '6 horas / 3250 exp / 325 oro', 3250, 325, 0),
(21602, '*premium* 6 horas / 3600 exp / 720 oro', 3600, 720, 1),
(25200, '7 horas / 3790 exp / 379 oro', 3790, 379, 0),
(25202, '*premium* 7 horas / 4200 exp / 840 oro', 4200, 840, 1),
(28800, '8 horas / 4330 exp / 433 oro', 4330, 433, 0),
(28802, '*premium* 8 horas / 4800 exp / 960 oro', 4800, 960, 1),
(36000, '10 horas / 5400 exp / 542 oro', 5400, 542, 0),
(36002, '*premium* 10 horas / 6000 exp / 1200 oro', 6000, 1200, 1),
(43202, '*premium* 12 horas / 7000 exp / 1440 oro', 7000, 1440, 1),
(64802, '*premium* 18 horas / 10000 exp / 2160 oro', 10000, 2160, 1),
(86402, '*premium* 24 horas / 13000 exp / 2880 oro', 13000, 2880, 1),
(604802, '*premium* 1 semana / 86000 exp / 20000 oro', 86000, 20000, 1),
(1209602, '*premium* 2 semanas / 163000 exp / 35000 oro', 163000, 35000, 1),
(1814402, '*premium* 3 semanas / 235000 exp / 50000 oro', 235000, 50000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trueques`
--

CREATE TABLE `trueques` (
  `idtrueque` int(14) NOT NULL,
  `inicia` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `recibe` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ultimocambio` int(1) NOT NULL,
  `tiempo` int(14) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votacion`
--

CREATE TABLE `votacion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `hasta` int(14) NOT NULL,
  `cerrado` int(1) NOT NULL DEFAULT 0,
  `mostrar` int(1) NOT NULL DEFAULT 1,
  `opciones` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votado`
--

CREATE TABLE `votado` (
  `id` int(11) NOT NULL,
  `idvotacion` int(11) NOT NULL,
  `nombrejug` varchar(30) NOT NULL,
  `eleccion` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `baneado`
--
ALTER TABLE `baneado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clandata`
--
ALTER TABLE `clandata`
  ADD PRIMARY KEY (`nombrejug`,`clan`);

--
-- Indices de la tabla `claninsignia`
--
ALTER TABLE `claninsignia`
  ADD PRIMARY KEY (`clan`),
  ADD UNIQUE KEY `insignia` (`insignia`);

--
-- Indices de la tabla `conoce`
--
ALTER TABLE `conoce`
  ADD PRIMARY KEY (`editar`);

--
-- Indices de la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contienenombreobj` (`nombreobj`),
  ADD KEY `contieneresultado` (`resultado`);

--
-- Indices de la tabla `contiene_cofre`
--
ALTER TABLE `contiene_cofre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encantamientos`
--
ALTER TABLE `encantamientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `exploracion`
--
ALTER TABLE `exploracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `forohebras`
--
ALTER TABLE `forohebras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `foromensajes`
--
ALTER TABLE `foromensajes`
  ADD PRIMARY KEY (`idmensaje`);

--
-- Indices de la tabla `ganadores`
--
ALTER TABLE `ganadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredienteresultado` (`resultado`),
  ADD KEY `ingredientenombreobj` (`nombreobj`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`nombrejug`);

--
-- Indices de la tabla `logros`
--
ALTER TABLE `logros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`nombremascota`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idmensaje`);

--
-- Indices de la tabla `mensajescopy`
--
ALTER TABLE `mensajescopy`
  ADD PRIMARY KEY (`idmensaje`);

--
-- Indices de la tabla `monstruos`
--
ALTER TABLE `monstruos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`nombreobj`),
  ADD UNIQUE KEY `img` (`img`),
  ADD KEY `objetostipo` (`tipo`),
  ADD KEY `objetosimg` (`img`),
  ADD KEY `objetosnivelcomprar` (`nivelcomprar`),
  ADD KEY `objetosnivelencontrar` (`nivelencontrar`),
  ADD KEY `objetosniveluso` (`niveluso`),
  ADD KEY `objetosvalor` (`valor`),
  ADD KEY `objetosprot` (`prot`),
  ADD KEY `objetosataq` (`ataq`);

--
-- Indices de la tabla `ofertasambulante`
--
ALTER TABLE `ofertasambulante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ofertasesp`
--
ALTER TABLE `ofertasesp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recetasresultado` (`resultado`),
  ADD KEY `recetastipo` (`tipo`),
  ADD KEY `recetasdificultadhacer` (`dificultadhacer`);

--
-- Indices de la tabla `relatos`
--
ALTER TABLE `relatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `silencio`
--
ALTER TABLE `silencio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sorteos`
--
ALTER TABLE `sorteos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `textos`
--
ALTER TABLE `textos`
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tiene`
--
ALTER TABLE `tiene`
  ADD PRIMARY KEY (`nombrejug`,`nombreobj`,`encantamiento`) USING BTREE;

--
-- Indices de la tabla `tienelogros`
--
ALTER TABLE `tienelogros`
  ADD PRIMARY KEY (`editar`);

--
-- Indices de la tabla `tienemascotas`
--
ALTER TABLE `tienemascotas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tienetitulos`
--
ALTER TABLE `tienetitulos`
  ADD PRIMARY KEY (`editar`);

--
-- Indices de la tabla `titulos`
--
ALTER TABLE `titulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`segundos`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `trueques`
--
ALTER TABLE `trueques`
  ADD PRIMARY KEY (`idtrueque`);

--
-- Indices de la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votado`
--
ALTER TABLE `votado`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `baneado`
--
ALTER TABLE `baneado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conoce`
--
ALTER TABLE `conoce`
  MODIFY `editar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contiene`
--
ALTER TABLE `contiene`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT de la tabla `contiene_cofre`
--
ALTER TABLE `contiene_cofre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `encantamientos`
--
ALTER TABLE `encantamientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `exploracion`
--
ALTER TABLE `exploracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=685;

--
-- AUTO_INCREMENT de la tabla `forohebras`
--
ALTER TABLE `forohebras`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `foromensajes`
--
ALTER TABLE `foromensajes`
  MODIFY `idmensaje` int(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ganadores`
--
ALTER TABLE `ganadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=705;

--
-- AUTO_INCREMENT de la tabla `logros`
--
ALTER TABLE `logros`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idmensaje` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajescopy`
--
ALTER TABLE `mensajescopy`
  MODIFY `idmensaje` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `monstruos`
--
ALTER TABLE `monstruos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ofertasambulante`
--
ALTER TABLE `ofertasambulante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `ofertasesp`
--
ALTER TABLE `ofertasesp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT de la tabla `relatos`
--
ALTER TABLE `relatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `silencio`
--
ALTER TABLE `silencio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sorteos`
--
ALTER TABLE `sorteos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tienelogros`
--
ALTER TABLE `tienelogros`
  MODIFY `editar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tienemascotas`
--
ALTER TABLE `tienemascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tienetitulos`
--
ALTER TABLE `tienetitulos`
  MODIFY `editar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `titulos`
--
ALTER TABLE `titulos`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `trueques`
--
ALTER TABLE `trueques`
  MODIFY `idtrueque` int(14) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `votacion`
--
ALTER TABLE `votacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `votado`
--
ALTER TABLE `votado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
