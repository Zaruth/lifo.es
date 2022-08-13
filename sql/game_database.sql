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
(245, 'Manual de prensado', 'Leche de coco', 40),
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
(244, 'Receta: Amuleto de otra era', 'Amuleto de otra era', 0),
(246, 'Recetario de batidos', 'Jarra de batido de coco', 10);

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
  `vida` int(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `encantamientos`
--

INSERT INTO `encantamientos` (`id`, `nombreobj`, `img`, `niveluso`, `prot`, `ataq`, `vida`) VALUES
(1, 'Hechizo: Caos', 'pcnn', 80, 0, 100, 0),
(2, 'Hechizo: Aniquilación', 'pcnr', 70, 0, 45, 0),
(3, 'Hechizo: Horda fantasmal', 'phf', 62, 20, 20, 0),
(4, 'Hechizo: Invocación divina', 'phe', 61, 12, 33, 0),
(5, 'Hechizo: Coraje divino', 'phd', 60, 10, 24, 0),
(6, 'Hechizo: Materialización fantasmal', 'pmf', 53, 10, 20, 0),
(7, 'Hechizo: Furia caótica', 'pcna', 50, 0, 26, 0),
(8, 'Hechizo: Monstruosidad', 'pne', 50, 0, 26, 0),
(9, 'Hechizo: Lanzador de clavos fantasmal', 'plcf', 47, 0, 22, 0),
(10, 'Hechizo: Esqueleto veloz', 'pnd', 47, 0, 22, 0),
(11, 'Hechizo: Desorden de la realidad', 'pcnz', 44, 0, 20, 0),
(12, 'Hechizo: Congelar alma', 'pcca', 42, 0, 20, 0),
(13, 'Hechizo: Devastación vudú', 'hve', 44, 0, 19, 110),
(14, 'Hechizo: Paradoja temporal', 'pcan', 39, 5, 13, 0),
(15, 'Hechizo: Invocación fantasmal', 'pif', 40, 0, 18, 0),
(16, 'Hechizo: Reflejo fantasmal', 'prf', 40, 18, 0, 0),
(17, 'Hechizo: Desatar infierno', 'pcrn', 39, 0, 18, 0),
(18, 'Hechizo: Calavera voladora', 'pnc', 39, 0, 18, 0),
(19, 'Hechizo: Velocidad', 'pcar', 35, 7, 9, 0),
(20, 'Hechizo: Dragón de energía', 'pcbv', 35, 0, 16, 0),
(21, 'Hechizo: Aura divina', 'phc', 35, 16, 0, 0),
(22, 'Hechizo: Inflingir enfermedad', 'pcnb', 37, 0, 15, 0),
(23, 'Hechizo: Terremoto', 'pcvr', 31, 0, 14, 90),
(24, 'Hechizo: Enredaderas protectoras', 'pcva', 31, 14, 0, 80),
(25, 'Hechizo: Confusión vudú', 'hvd', 33, 14, 0, 100),
(26, 'Hechizo: Ayudante putrefacto', 'pnb', 33, 0, 14, 0),
(27, 'Hechizo: Poder elemental del hielo', 'pccr', 31, 7, 7, 0),
(28, 'Hechizo: Guerrero ilusorio', 'pcgi', 31, 6, 8, 0),
(29, 'Hechizo: Llamada a la naturaleza', 'pcvv', 30, 4, 9, 70),
(30, 'Hechizo: Criatura de energía', 'pcbz', 28, 0, 12, 0),
(31, 'Hechizo: Ayudante de huesos', 'pna', 28, 0, 12, 0),
(32, 'Hechizo: Levitación', 'pcle', 28, 12, 0, 0),
(33, 'Hechizo: Soplo divino', 'phb', 28, 12, 0, 0),
(34, 'Hechizo: Presentir', 'pcav', 23, 10, 0, 0),
(35, 'Hechizo: Bendición', 'pha', 20, 10, 0, 0),
(36, 'Hechizo: Poder elemental del fuego', 'pcrv', 24, 5, 5, 0),
(37, 'Hechizo: Gran variación del tiempo', 'pcaa', 20, 4, 5, 0),
(38, 'Hechizo: Locura', 'pclo', 22, 3, 6, 0),
(39, 'Hechizo: Enredaderas', 'pcvc', 20, 2, 6, 50),
(40, 'Hechizo: Ceguera vudú', 'hvc', 22, 0, 8, 60),
(41, 'Hechizo: Asfixia', 'pcba', 20, 0, 8, 0),
(42, 'Hechizo: Aura de hielo', 'pccv', 18, 7, 0, 0),
(43, 'Hechizo: Rayo de fuego', 'pcra', 18, 0, 7, 0),
(44, 'Hechizo: Control vudú', 'hvb', 20, 0, 7, 40),
(45, 'Hechizo: Rayo de hielo', 'pccm', 16, 0, 6, 0),
(46, 'Hechizo: Variación del tiempo', 'pcab', 12, 2, 3, 0),
(47, 'Hechizo: Falso eclipse', 'pce', 14, 5, 0, 0),
(48, 'Hechizo: Heridas cicatrizantes', 'pcvb', 14, 5, 0, 20),
(49, 'Hechizo: Aura de fuego', 'pcrz', 14, 5, 0, 0),
(50, 'Hechizo: Herida vudú', 'hva', 16, 0, 5, 30),
(51, 'Hechizo: Bola de fuego', 'pcrb', 12, 0, 4, 0),
(52, 'Hechizo: Telekinesia', 'pcbr', 12, 0, 4, 0),
(53, 'Hechizo: Falsas enredaderas', 'pcen', 12, 0, 4, 10),
(54, 'Hechizo: Fortaleza', 'pcbc', 9, 3, 0, 0),
(55, 'Hechizo: Bola de hielo', 'pccb', 9, 0, 3, 0),
(56, 'Hechizo: Falsa niebla', 'pcno', 9, 3, 0, 0),
(57, 'Hechizo: Falsa neblina', 'pcn', 7, 2, 0, 0),
(58, 'Hechizo: Misil mágico', 'pmm', 5, 0, 1, 0),
(59, 'Hechizo: Destello', 'pd', 5, 1, 0, 0),
(60, 'Hechizo: Fuego sagrado', 'phfs', 37, 15, 0, 0),
(61, 'Hechizo: Justicia divina', 'phjd', 44, 20, 0, 0),
(62, 'Hechizo: Aura celestial', 'phac', 50, 26, 0, 0),
(63, 'Hechizo: Bastión', 'phba', 70, 45, 0, 0),
(64, 'Hechizo: Juicio final', 'phjf', 80, 100, 0, 0),
(65, 'Hechizo: Ciclo infinito', 'phci', 110, 30, 80, 50),
(66, 'Hechizo: Igualdad', 'phig', 120, 75, 1, 130),
(67, 'Hechizo: Tiempo muerto', 'phtm', 130, 150, 10, 10),
(68, 'Hechizo: Trinidad', 'phtr', 140, 70, 70, 70),
(69, 'Hechizo: Dominación', 'phdo', 150, -50, 200, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuentros`
--

CREATE TABLE `encuentros` (
  `nombrejug` varchar(30) NOT NULL,
  `mapa` varchar(250) NOT NULL,
  `ganados` int(11) NOT NULL DEFAULT 0,
  `totales` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encuentros`
--

INSERT INTO `encuentros` (`nombrejug`, `mapa`, `ganados`, `totales`) VALUES
('Nolo', 'Mapa: Campos de Lifo', 82, 91),
('Healek', 'Mapa: Campos de Lifo', 2, 7),
('Donbore', 'Mapa: Campos de Lifo', 2, 7),
('Enzo', 'Mapa: Campos de Lifo', 57, 60),
('Ornitorrinco', 'Mapa: Campos de Lifo', 32, 33),
('Pipi', 'Mapa: Campos de Lifo', 16, 20),
('Chinchuling', 'Mapa: Campos de Lifo', 25, 35),
('Memeli', 'Mapa: Campos de Lifo', 7, 20),
('Thunder', 'Mapa: Campos de Lifo', 27, 38),
('Irwyng', 'Mapa: Campos de Lifo', 58, 62),
('Warlock', 'Mapa: Campos de Lifo', 76, 84),
('Endless', 'Mapa: Campos de Lifo', 47, 53),
('Mandolin', 'Mapa: Campos de Lifo', 14, 27),
('Demente', 'Mapa: Campos de Lifo', 45, 49),
('Canon', 'Mapa: Campos de Lifo', 62, 64),
('Davidcurssi', 'Mapa: Campos de Lifo', 69, 77),
('Tutodi', 'Mapa: Campos de Lifo', 65, 75),
('Skamati', 'Mapa: Campos de Lifo', 54, 61),
('Nanty', 'Mapa: Campos de Lifo', 6, 11),
('Random', 'Mapa: Campos de Lifo', 32, 37),
('Nentsu', 'Mapa: Campos de Lifo', 30, 35),
('Eldest', 'Mapa: Campos de Lifo', 5, 12),
('Darkasten', 'Mapa: Campos de Lifo', 6, 13),
('Eleflow', 'Mapa: Campos de Lifo', 40, 42),
('Logangrimnar', 'Mapa: Campos de Lifo', 28, 30),
('Daniel', 'Mapa: Campos de Lifo', 98, 101),
('Frermast', 'Mapa: Campos de Lifo', 15, 17),
('Chuppetin', 'Mapa: Campos de Lifo', 24, 26),
('Nolox', 'Mapa: Campos de Lifo', 88, 91),
('Yopro', 'Mapa: Campos de Lifo', 10, 11),
('Myth', 'Mapa: Campos de Lifo', 27, 29),
('Sully', 'Mapa: Campos de Lifo', 80, 85),
('Team', 'Mapa: Campos de Lifo', 34, 37),
('Recycled', 'Mapa: Campos de Lifo', 6, 6),
('Leandro', 'Mapa: Campos de Lifo', 8, 14),
('Casio', 'Mapa: Campos de Lifo', 30, 32),
('Leandroblanque', 'Mapa: Campos de Lifo', 4, 9),
('Stonemast', 'Mapa: Campos de Lifo', 49, 53),
('Armando', 'Mapa: Campos de Lifo', 2, 4),
('Blanqueta', 'Mapa: Campos de Lifo', 13, 15),
('Carxofa', 'Mapa: Campos de Lifo', 9, 13),
('Aeris', 'Mapa: Campos de Lifo', 61, 73),
('Elyorsher', 'Mapa: Campos de Lifo', 4, 6),
('Qzz', 'Mapa: Campos de Lifo', 26, 26),
('Yozuri', 'Mapa: Campos de Lifo', 3, 4),
('Cosmicwolf', 'Mapa: Campos de Lifo', 22, 23),
('Canon', 'Mapa: Bosques de Lifo', 53, 75),
('Random', 'Mapa: Bosques de Lifo', 95, 117),
('Bluey', 'Mapa: Campos de Lifo', 68, 69),
('Eleflow', 'Mapa: Bosques de Lifo', 56, 77),
('Arwen', 'Mapa: Campos de Lifo', 82, 83),
('Pipi', 'Mapa: Bosques de Lifo', 26, 52),
('Warlock', 'Mapa: Bosques de Lifo', 89, 108),
('Legemd', 'Mapa: Campos de Lifo', 67, 67),
('Nolo', 'Mapa: Bosques de Lifo', 87, 123),
('Chinchuling', 'Mapa: Bosques de Lifo', 79, 127),
('Thunder', 'Mapa: Bosques de Lifo', 73, 99),
('Daniel', 'Mapa: Bosques de Lifo', 66, 69),
('Mandolin', 'Mapa: Bosques de Lifo', 95, 151),
('Irwyng', 'Mapa: Bosques de Lifo', 38, 53),
('Redwars', 'Mapa: Campos de Lifo', 50, 53),
('Demente', 'Mapa: Bosques de Lifo', 81, 106),
('Enzo', 'Mapa: Bosques de Lifo', 48, 72),
('Legend', 'Mapa: Campos de Lifo', 87, 90),
('Chuskull', 'Mapa: Campos de Lifo', 78, 78),
('Tutodi', 'Mapa: Bosques de Lifo', 119, 152),
('Nentsu', 'Mapa: Bosques de Lifo', 39, 55),
('Thor', 'Mapa: Campos de Lifo', 75, 75),
('Odin', 'Mapa: Campos de Lifo', 67, 67),
('Eldest', 'Mapa: Bosques de Lifo', 15, 26),
('Darkasten', 'Mapa: Bosques de Lifo', 15, 34),
('Healek', 'Mapa: Bosques de Lifo', 2, 3),
('Myth', 'Mapa: Bosques de Lifo', 79, 87),
('Stonemast', 'Mapa: Bosques de Lifo', 0, 6),
('Odin', 'Mapa: Bosques de Lifo', 71, 91),
('Team', 'Mapa: Bosques de Lifo', 39, 57),
('Adan', 'Mapa: Campos de Lifo', 2, 4),
('Armando', 'Mapa: Bosques de Lifo', 2, 6),
('Pety', 'Mapa: Campos de Lifo', 57, 61),
('Legend', 'Mapa: Bosques de Lifo', 186, 191),
('Cosmicwolf', 'Mapa: Bosques de Lifo', 80, 115),
('Endless', 'Mapa: Bosques de Lifo', 79, 107),
('Garp', 'Mapa: Campos de Lifo', 5, 6),
('Lucardi', 'Mapa: Campos de Lifo', 9, 9),
('Siruk', 'Mapa: Bosques de Lifo', 38, 44),
('Siruk', 'Mapa: Campos de Lifo', 2, 2),
('Logangrimnar', 'Mapa: Bosques de Lifo', 17, 28),
('Chuskull', 'Mapa: Bosques de Lifo', 145, 174),
('Carxofa', 'Mapa: Bosques de Lifo', 5, 8),
('Ornitorrinco', 'Mapa: Bosques de Lifo', 31, 50),
('Thor', 'Mapa: Bosques de Lifo', 63, 90),
('Sully', 'Mapa: Bosques de Lifo', 45, 61),
('Casio', 'Mapa: Bosques de Lifo', 37, 51),
('Chuppetin', 'Mapa: Bosques de Lifo', 46, 53),
('Frermast', 'Mapa: Bosques de Lifo', 196, 233),
('Ayax', 'Mapa: Campos de Lifo', 52, 60),
('Arwen', 'Mapa: Bosques de Lifo', 48, 58),
('Nolox', 'Mapa: Bosques de Lifo', 270, 285),
('Nicetastic', 'Mapa: Campos de Lifo', 10, 12),
('Qzz', 'Mapa: Bosques de Lifo', 120, 137),
('Memeli', 'Mapa: Bosques de Lifo', 0, 2),
('Pety', 'Mapa: Bosques de Lifo', 103, 144),
('Quito', 'Mapa: Campos de Lifo', 23, 34),
('Random', 'Mapa: Cueva de la plata', 73, 90),
('Redwars', 'Mapa: Bosques de Lifo', 89, 122),
('Nilo', 'Mapa: Campos de Lifo', 22, 32),
('Davidcurssi', 'Mapa: Bosques de Lifo', 34, 45),
('Eleflow', 'Mapa: Cueva de la plata', 57, 82),
('Bluey', 'Mapa: Bosques de Lifo', 6, 9),
('Nolo', 'Mapa: Cueva de la plata', 88, 107),
('Aeris', 'Mapa: Bosques de Lifo', 50, 66),
('Thunder', 'Mapa: Cueva de la plata', 85, 125),
('Blanqueta', 'Mapa: Bosques de Lifo', 6, 7),
('Chinchuling', 'Mapa: Cueva de la plata', 69, 92),
('Warlock', 'Mapa: Cueva de la plata', 91, 122),
('Ayax', 'Mapa: Bosques de Lifo', 64, 85),
('Eldest', 'Mapa: Cueva de la plata', 0, 11),
('Canon', 'Mapa: Cueva de la plata', 98, 138),
('Quito', 'Mapa: Bosques de Lifo', 17, 33),
('Balder', 'Mapa: Campos de Lifo', 30, 30),
('Odin', 'Mapa: Cueva de la plata', 22, 38),
('Battousai', 'Mapa: Campos de Lifo', 27, 28),
('Donbore', 'Mapa: Bosques de Lifo', 0, 1),
('Nicetastic', 'Mapa: Bosques de Lifo', 120, 149),
('Alvarecillo', 'Mapa: Bosques de Lifo', 0, 1),
('Lucardi', 'Mapa: Bosques de Lifo', 22, 26),
('Vortex', 'Mapa: Bosques de Lifo', 13, 22),
('Uriel', 'Mapa: Campos de Lifo', 29, 35),
('Nilo', 'Mapa: Bosques de Lifo', 9, 15),
('Pety', 'Mapa: Cueva de la plata', 30, 41),
('Legemd', 'Mapa: Bosques de Lifo', 107, 133),
('Cosmicwolf', 'Mapa: Cueva de la plata', 65, 75),
('Nolo', 'Mapa: Gruta helada', 113, 177),
('Enzo', 'Mapa: Cueva de la plata', 67, 95),
('Irwyng', 'Mapa: Cueva de la plata', 40, 58),
('Sully', 'Mapa: Cueva de la plata', 1, 3),
('Tutodi', 'Mapa: Cueva de la plata', 12, 30),
('Darkasten', 'Mapa: Cueva de la plata', 0, 4),
('Skayripa', 'Mapa: Campos de Lifo', 22, 25),
('Chinchuling', 'Mapa: Gruta helada', 23, 44),
('Demente', 'Mapa: Cueva de la plata', 5, 9),
('Quito', 'Mapa: Cueva de la plata', 27, 42),
('Thunder', 'Mapa: Gruta helada', 29, 70),
('Nolo', 'Mapa: Mina de oro', 58, 82),
('Endless', 'Mapa: Cueva de la plata', 2, 7),
('Canon', 'Mapa: Gruta helada', 12, 23),
('Casio', 'Mapa: Cueva de la plata', 23, 32),
('Casio', 'Mapa: Gruta helada', 7, 18),
('Cosmicwolf', 'Mapa: Gruta helada', 47, 73),
('Balboa', 'Mapa: Campos de Lifo', 51, 53),
('Lucardi', 'Mapa: Cueva de la plata', 17, 33),
('Legend', 'Mapa: Cueva de la plata', 5, 6),
('Chuppetin', 'Mapa: Cueva de la plata', 12, 13),
('Balder', 'Mapa: Bosques de Lifo', 25, 34),
('Nicetastic', 'Mapa: Cueva de la plata', 22, 43),
('Uriel', 'Mapa: Bosques de Lifo', 115, 140),
('Davidcurssi', 'Mapa: Cueva de la plata', 0, 2),
('Vortex', 'Mapa: Campos de Lifo', 2, 2),
('Myth', 'Mapa: Gruta helada', 0, 1),
('Otaguilles', 'Mapa: Campos de Lifo', 51, 55),
('Frermast', 'Mapa: Cueva de la plata', 283, 332),
('Nolox', 'Mapa: Cueva de la plata', 3, 5),
('Irwyng', 'Mapa: Gruta helada', 20, 29),
('Legemd', 'Mapa: Cueva de la plata', 1, 2),
('Enzo', 'Mapa: Gruta helada', 12, 26),
('Irwyng', 'Mapa: Mina de oro', 32, 49),
('Team', 'Mapa: Cueva de la plata', 9, 11),
('Mandolin', 'Mapa: Cueva de la plata', 48, 62),
('Random', 'Mapa: Gruta helada', 56, 99),
('Siruk', 'Mapa: Cueva de la plata', 13, 27),
('Adan', 'Mapa: Bosques de Lifo', 1, 1),
('Redwars', 'Mapa: Cueva de la plata', 45, 56),
('Myth', 'Mapa: Cueva de la plata', 0, 4),
('Ayax', 'Mapa: Cueva de la plata', 37, 52),
('Yumeko', 'Mapa: Campos de Lifo', 15, 16),
('Frermast', 'Mapa: Gruta helada', 159, 188),
('Nentsu', 'Mapa: Cueva de la plata', 0, 2),
('Thor', 'Mapa: Cueva de la plata', 18, 23),
('Casio', 'Mapa: Mina de oro', 52, 106),
('Blanqueta', 'Mapa: Cueva de la plata', 0, 3),
('Mythx', 'Mapa: Campos de Lifo', 13, 13),
('Frermast', 'Mapa: Mina de oro', 14, 31),
('Leandro', 'Mapa: Bosques de Lifo', 4, 5),
('Qzz', 'Mapa: Cueva de la plata', 98, 128),
('Random', 'Mapa: Mina de oro', 38, 45),
('Warlock', 'Mapa: Gruta helada', 8, 13),
('Otaguilles', 'Mapa: Bosques de Lifo', 51, 62),
('Pety', 'Mapa: Gruta helada', 26, 39),
('Team', 'Mapa: Gruta helada', 33, 37),
('Irwyng', 'Mapa: Laberinto de hielo', 41, 65),
('Pety', 'Mapa: Mina de oro', 25, 42),
('Daniel', 'Mapa: Gruta helada', 31, 39),
('Nolo', 'Mapa: Laberinto de hielo', 67, 80),
('Canon', 'Mapa: Mina de oro', 23, 35),
('Irwyng', 'Mapa: Descenso profundo', 13, 43),
('Canon', 'Mapa: Laberinto de hielo', 39, 41),
('Balder', 'Mapa: Cueva de la plata', 6, 13),
('Redwars', 'Mapa: Gruta helada', 53, 83),
('Ayax', 'Mapa: Gruta helada', 20, 50),
('Frermast', 'Mapa: Laberinto de hielo', 81, 92),
('Eleflow', 'Mapa: Mina de oro', 29, 45),
('Balboa', 'Mapa: Bosques de Lifo', 5, 11),
('Nanty', 'Mapa: Bosques de Lifo', 6, 7),
('Blanqueta', 'Mapa: Gruta helada', 1, 5),
('Gamito', 'Mapa: Campos de Lifo', 18, 21),
('Pety', 'Mapa: Laberinto de hielo', 84, 108),
('Arwen', 'Mapa: Cueva de la plata', 22, 29),
('Mandolin', 'Mapa: Gruta helada', 60, 91),
('Team', 'Mapa: Mina de oro', 47, 62),
('Tyr', 'Mapa: Campos de Lifo', 17, 18),
('Chinchuling', 'Mapa: Montaña helada', 0, 2),
('Thor', 'Mapa: Gruta helada', 7, 11),
('Cosmicwolf', 'Mapa: Mina de oro', 22, 29),
('Yumeko', 'Mapa: Bosques de Lifo', 0, 1),
('Thunder', 'Mapa: Mina de oro', 34, 66),
('Rayden', 'Mapa: Campos de Lifo', 74, 84),
('Zeross', 'Mapa: Campos de Lifo', 37, 40),
('Warlock', 'Mapa: Mina de oro', 5, 9),
('Nicetastic', 'Mapa: Gruta helada', 12, 17),
('Dshadow', 'Mapa: Campos de Lifo', 10, 11),
('Chinchuling', 'Mapa: Mina de oro', 31, 40),
('Casio', 'Mapa: Laberinto de hielo', 98, 106),
('Canon', 'Mapa: Montaña helada', 5, 12),
('Canon', 'Mapa: Descenso profundo', 25, 31),
('Enzo', 'Mapa: Mina de oro', 0, 1),
('Nicetastic', 'Mapa: Mina de oro', 8, 12),
('Eleflow', 'Mapa: Gruta helada', 8, 10),
('Arwen', 'Mapa: Gruta helada', 8, 12),
('Uriel', 'Mapa: Cueva de la plata', 24, 30),
('Nanty', 'Mapa: Cueva de la plata', 0, 1),
('Qzz', 'Mapa: Gruta helada', 130, 145),
('Odin', 'Mapa: Gruta helada', 3, 7),
('Pety', 'Mapa: Descenso profundo', 12, 36),
('Arwen', 'Mapa: Laberinto de hielo', 107, 150),
('Daniel', 'Mapa: Cueva de la plata', 27, 29),
('Nicetastic', 'Mapa: Laberinto de hielo', 9, 9),
('Legend', 'Mapa: Gruta helada', 1, 1),
('Yozuri', 'Mapa: Bosques de Lifo', 2, 2),
('Nicetastic', 'Mapa: Descenso profundo', 64, 80),
('Ayax', 'Mapa: Laberinto de hielo', 71, 92),
('Tyr', 'Mapa: Bosques de Lifo', 2, 5),
('Quito', 'Mapa: Gruta helada', 32, 62),
('Uriel', 'Mapa: Gruta helada', 24, 36),
('Nolo', 'Mapa: Descenso profundo', 69, 109),
('Lucardi', 'Mapa: Gruta helada', 3, 4),
('Maverik', 'Mapa: Campos de Lifo', 34, 34),
('Leandroblanque', 'Mapa: Bosques de Lifo', 2, 3),
('Rayden', 'Mapa: Bosques de Lifo', 52, 67),
('Casio', 'Mapa: Montaña helada', 5, 15),
('Nicetastic', 'Mapa: Montaña helada', 19, 31),
('Daniel', 'Mapa: Mina de oro', 35, 38),
('Thunder', 'Mapa: Laberinto de hielo', 51, 72),
('Uriel', 'Mapa: Laberinto de hielo', 89, 107),
('Warlock', 'Mapa: Descenso profundo', 16, 22),
('Canon', 'Mapa: Inframundo', 317, 339),
('Thunder', 'Mapa: Descenso profundo', 28, 68),
('Warlock', 'Mapa: Laberinto de hielo', 56, 66),
('Equipo', 'Mapa: Campos de Lifo', 9, 9),
('Paketostes', 'Mapa: Campos de Lifo', 23, 27),
('Draven', 'Mapa: Campos de Lifo', 21, 27),
('Skamati', 'Mapa: Bosques de Lifo', 2, 3),
('Chinchuling', 'Mapa: Laberinto de hielo', 61, 81),
('Team', 'Mapa: Laberinto de hielo', 78, 86),
('Lucardi', 'Mapa: Laberinto de hielo', 33, 42),
('Yopro', 'Mapa: Bosques de Lifo', 17, 17),
('Legend', 'Mapa: Mina de oro', 4, 4),
('Pety', 'Mapa: Montaña helada', 4, 13),
('Pety', 'Mapa: Cordillera helada', 29, 37),
('Gamito', 'Mapa: Bosques de Lifo', 29, 41),
('Dshadow', 'Mapa: Bosques de Lifo', 3, 5),
('Irwyng', 'Mapa: Montaña helada', 6, 19),
('Roland', 'Mapa: Campos de Lifo', 0, 1),
('Aeris', 'Mapa: Cueva de la plata', 7, 11),
('Quito', 'Mapa: Mina de oro', 33, 54),
('Random', 'Mapa: Montaña helada', 0, 2),
('Eleflow', 'Mapa: Laberinto de hielo', 41, 49),
('Team', 'Mapa: Descenso profundo', 7, 17),
('Uriel', 'Mapa: Montaña helada', 2, 12),
('Quito', 'Mapa: Laberinto de hielo', 119, 154),
('Nentsu', 'Mapa: Mina de oro', 1, 1),
('Carxofa', 'Mapa: Gruta helada', 0, 2),
('Quito', 'Mapa: Descenso profundo', 2, 13),
('Chinchuling', 'Mapa: Descenso profundo', 37, 53),
('Casio', 'Mapa: Descenso profundo', 3, 3),
('Irwyng', 'Mapa: Cordillera helada', 5, 19),
('Otaguilles', 'Mapa: Cueva de la plata', 22, 30),
('Casio', 'Mapa: Cordillera helada', 65, 123),
('Canon', 'Mapa: Cordillera helada', 1, 1),
('Cosmicwolf', 'Mapa: Laberinto de hielo', 38, 39),
('Quito', 'Mapa: Montaña helada', 0, 4),
('Nicetastic', 'Mapa: Inframundo', 218, 235),
('Pety', 'Mapa: Inframundo', 223, 248),
('Nolo', 'Mapa: Montaña helada', 53, 173),
('Random', 'Mapa: Laberinto de hielo', 51, 56),
('Nolo', 'Mapa: Cordillera helada', 5, 47),
('Dshadow', 'Mapa: Cueva de la plata', 0, 2),
('Legend', 'Mapa: Laberinto de hielo', 3, 3),
('Paketostes', 'Mapa: Bosques de Lifo', 5, 8),
('Warlock', 'Mapa: Inframundo', 106, 143),
('Siruk', 'Mapa: Gruta helada', 7, 8),
('Uriel', 'Mapa: Mina de oro', 1, 1),
('Armando', 'Mapa: Cueva de la plata', 1, 1),
('Carxofa', 'Mapa: Cueva de la plata', 1, 1),
('Thunder', 'Mapa: Montaña helada', 10, 30),
('Cosmicwolf', 'Mapa: Montaña helada', 1, 8),
('Cosmicwolf', 'Mapa: Descenso profundo', 40, 70),
('Siruk', 'Mapa: Mina de oro', 10, 14),
('Ayax', 'Mapa: Mina de oro', 23, 30),
('Siruk', 'Mapa: Laberinto de hielo', 14, 27),
('Lucardi', 'Mapa: Montaña helada', 0, 8),
('Team', 'Mapa: Montaña helada', 0, 4),
('Chuppetin', 'Mapa: Gruta helada', 2, 5),
('Team', 'Mapa: Cordillera helada', 0, 1),
('Vortex', 'Mapa: Cueva de la plata', 6, 14),
('Skayripa', 'Mapa: Bosques de Lifo', 1, 3),
('Draven', 'Mapa: Bosques de Lifo', 6, 12),
('Eleflow', 'Mapa: Descenso profundo', 44, 57),
('Ornitorrinco', 'Mapa: Laberinto de hielo', 0, 1),
('Redwars', 'Mapa: Mina de oro', 26, 28),
('Rayden', 'Mapa: Cueva de la plata', 60, 72),
('Sora', 'Mapa: Campos de Lifo', 1, 1),
('Maverik', 'Mapa: Bosques de Lifo', 24, 26),
('Eleflow', 'Mapa: Montaña helada', 15, 56),
('Adan', 'Mapa: Cueva de la plata', 1, 1),
('Uriel', 'Mapa: Descenso profundo', 56, 70),
('Zeross', 'Mapa: Bosques de Lifo', 20, 28),
('Healek', 'Mapa: Gruta helada', 1, 1),
('Redwars', 'Mapa: Descenso profundo', 23, 55),
('Irwyng', 'Mapa: Inframundo', 7, 15),
('Garp', 'Mapa: Bosques de Lifo', 1, 1),
('Random', 'Mapa: Descenso profundo', 0, 2),
('Siruk', 'Mapa: Montaña helada', 0, 1),
('Daniel', 'Mapa: Descenso profundo', 7, 13),
('Lucardi', 'Mapa: Mina de oro', 11, 12),
('Frermast', 'Mapa: Descenso profundo', 23, 28),
('Daniel', 'Mapa: Inframundo', 0, 6),
('Frermast', 'Mapa: Montaña helada', 0, 2),
('Ignaciog', 'Mapa: Campos de Lifo', 8, 11),
('Casio', 'Mapa: Inframundo', 94, 116),
('Lucardi', 'Mapa: Descenso profundo', 1, 8),
('Gamito', 'Mapa: Cueva de la plata', 0, 2),
('Nicetastic', 'Mapa: Cordillera helada', 2, 5),
('Cosmicwolf', 'Mapa: Cordillera helada', 0, 2),
('Siruk', 'Mapa: Descenso profundo', 0, 4),
('Thunder', 'Mapa: Inframundo', 50, 54),
('Eleflow', 'Mapa: Cordillera helada', 0, 2),
('Nolo', 'Mapa: Inframundo', 19, 77),
('Uriel', 'Mapa: Inframundo', 75, 87),
('Cosmicwolf', 'Mapa: Inframundo', 0, 1),
('Otaguilles', 'Mapa: Gruta helada', 27, 32),
('Ignaciog', 'Mapa: Bosques de Lifo', 16, 33),
('Chuppetin', 'Mapa: Mina de oro', 2, 4),
('Manchita', 'Mapa: Campos de Lifo', 2, 2),
('Manchita', 'Mapa: Bosques de Lifo', 4, 6),
('Chuppetin', 'Mapa: Descenso profundo', 0, 3),
('Lucardi', 'Mapa: Inframundo', 0, 1),
('Nolox', 'Mapa: Gruta helada', 1, 1),
('Legend', 'Mapa: Cordillera helada', 0, 1),
('Redwars', 'Mapa: Laberinto de hielo', 1, 1),
('Thor', 'Mapa: Mina de oro', 2, 2),
('Otaguilles', 'Mapa: Laberinto de hielo', 3, 3),
('Balboa', 'Mapa: Cueva de la plata', 0, 1),
('Borik', 'Mapa: Campos de Lifo', 0, 2),
('Otaguilles', 'Mapa: Montaña helada', 0, 1),
('Rayden', 'Mapa: Gruta helada', 3, 3);

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
(664, 'Mapa: Cima nevada', 'Corazón de la montaña', 500, 0);

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
  `nombre` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
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
(708, 'Jarra de batido de coco', 'Azúcar', 1),
(707, 'Jarra de batido de coco', 'Jarra de leche', 1),
(706, 'Jarra de batido de coco', 'Leche de coco', 1),
(705, 'Leche de coco', 'Coco', 1),
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
(645, 'Ballesta sabia', 'Esencia viva', 5),
(646, 'Ballesta', 'Esencia viva', 2),
(647, 'Lanzaclavos', 'Esencia viva', 1),
(648, 'Escudo lanzaagujas', 'Esencia viva', 1),
(649, 'Escudo lanzaclavos', 'Esencia viva', 1),
(650, 'Escudo pegajoso permanente', 'Esencia viva', 1),
(651, 'Escudo pegajoso', 'Esencia viva', 1),
(652, 'Ballesta de energía', 'Esencia viva', 10),
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
  `noencuentrohasta` int(14) NOT NULL DEFAULT 0,
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
(56, 'Camino al cielo', 'Asciende 5 veces.', 10, 55, NULL, 1),
(57, 'Nacido para el combate', 'Gana 100 encuentros.', 10, NULL, NULL, 0),
(58, 'Resolutor de conflictos', 'Gana 1000 encuentros.', 20, 62, NULL, 0),
(59, 'Embajador de la pesadilla', 'Gana 10000 encuentros.', 25, 63, NULL, 0),
(60, '10 hechizos para gobernarlos a todos', 'Ten 10 encantamientos distintos equipados.', 10, 64, NULL, 0);

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
('Golem de piedra', 'Golem de piedra', 'mgp', 'Piedra decorada', 0, 0, 0, 6, 6, 0, 10, 10, 1, 10),
('Dragón de huesos', 'Dragón de huesos', 'mra', 'Hechizo: Calavera voladora', 10, 10, 0, 5, 5, 0, 20, 8, 1, 10),
('Escorpión', 'Escorpión', 'mrb', 'Hechizo: Inflingir enfermedad', 15, 4, 0, 6, 3, 0, 12, 8, 1, 13),
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
  `mapa` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oro` int(255) NOT NULL DEFAULT 0,
  `exp` int(255) NOT NULL DEFAULT 0,
  `posibilidad` int(11) NOT NULL DEFAULT 1,
  `ataque` int(11) NOT NULL DEFAULT 0,
  `proteccion` int(11) NOT NULL DEFAULT 0,
  `vida` int(11) NOT NULL DEFAULT 0,
  `reduccion` float NOT NULL DEFAULT 10,
  `absorcion` float NOT NULL DEFAULT 0,
  `evasion` float NOT NULL DEFAULT 10,
  `critico` float NOT NULL DEFAULT 5,
  `dcritico` float NOT NULL DEFAULT 50,
  `parmadura` float NOT NULL DEFAULT 0,
  `espinas` float NOT NULL DEFAULT 0,
  `vampirismo` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `monstruos`
--

INSERT INTO `monstruos` (`id`, `nombre`, `img`, `nivel`, `mapa`, `oro`, `exp`, `posibilidad`, `ataque`, `proteccion`, `vida`, `reduccion`, `absorcion`, `evasion`, `critico`, `dcritico`, `parmadura`, `espinas`, `vampirismo`) VALUES
(1, 'Ratón', 'criaturas/moraton', 1, 'Mapa: Campos de Lifo', 10, 10, 5, 10, 10, 120, 10, 0, 5, 5, 50, 0, 0, 0),
(2, 'Rata', 'criaturas/morata', 3, 'Mapa: Campos de Lifo', 15, 20, 3, 15, 10, 175, 10, 0, 5, 5, 50, 0, 0, 0),
(3, 'Rata Enorme', 'criaturas/moratagigante', 5, 'Mapa: Campos de Lifo', 25, 45, 2, 35, 10, 230, 10, 0, 5, 5, 50, 0, 0, 0),
(4, 'Araña', 'criaturas/moarana', 8, 'Mapa: Bosques de Lifo', 50, 75, 5, 45, 10, 250, 10, 0, 5, 5, 50, 0, 0, 0),
(5, 'Jabalí', 'criaturas/mojabali', 9, 'Mapa: Bosques de Lifo', 100, 125, 3, 60, 10, 360, 10, 0, 5, 5, 50, 0, 0, 0),
(6, 'Espíritu del bosque', 'criaturas/moespiritubosque', 11, 'Mapa: Bosques de Lifo', 150, 200, 2, 40, 10, 400, 30, 0, 5, 5, 50, 0, 0, 0),
(7, 'Caballero helado', 'criaturas/mocaballerohelado', 15, NULL, 500, 500, 0, 50, 10, 450, 10, 0, 10, 5, 75, 0, 0, 0),
(8, 'Pila de huesos maldita', 'criaturas/mopiladehuesos', 13, 'Mapa: Cueva de la plata', 200, 300, 5, 50, 10, 500, 15, 0, 5, 5, 50, 0, 0, 0),
(9, 'Murciélago', 'criaturas/momurcielago', 15, 'Mapa: Cueva de la plata', 250, 330, 3, 45, 10, 400, 10, 0, 40, 5, 50, 0, 0, 5),
(10, 'Minero maldito', 'criaturas/momineromaldito', 17, 'Mapa: Cueva de la plata', 325, 380, 2, 45, 10, 600, 10, 0, 10, 20, 100, 0, 0, 0),
(11, 'Vamporo helado', 'criaturas/movamporohelado', 19, 'Mapa: Gruta helada', 400, 430, 5, 55, 10, 550, 10, 0, 10, 10, 50, 0, 0, 10),
(12, 'Roca helada viviente', 'criaturas/morocaheladaviviente', 22, 'Mapa: Gruta helada', 450, 465, 3, 55, 10, 600, 15, 0, 20, 10, 75, 0, 0, 0),
(13, 'Oso gélido', 'criaturas/moosogelido', 24, 'Mapa: Gruta helada', 500, 500, 2, 65, 10, 650, 20, 0, 20, 20, 100, 0, 0, 0),
(14, 'Asesino de dragones', 'criaturas/moasesinodedragones', 20, NULL, 800, 800, 0, 60, 10, 800, 20, 0, 20, 30, 100, 0, 0, 0),
(15, 'Roca viviente de oro', 'criaturas/morocavivientedeoro', 26, 'Mapa: Mina de oro', 600, 525, 5, 55, 10, 580, 10, 0, 10, 15, 75, 0, 0, 0),
(16, 'Esqueleto maldito', 'criaturas/moesqueletomaldito', 28, 'Mapa: Mina de oro', 630, 565, 3, 55, 100, 625, 15, 0, 20, 10, 75, 0, 5, 0),
(17, 'Espíritu del minero', 'criaturas/mominerofantasmal', 31, 'Mapa: Mina de oro', 680, 500, 2, 70, 10, 680, 25, 0, 0, 20, 100, 0, 0, 0),
(18, 'Slime gélido', 'criaturas/moslimegelido', 33, 'Mapa: Laberinto de hielo', 755, 650, 5, 70, 10, 670, 20, 0, 10, 10, 20, 0, 0, 0),
(19, 'Golem de hielo', 'criaturas/mogolemhielo', 35, 'Mapa: Laberinto de hielo', 850, 715, 3, 76, 200, 710, 5, 0, 10, 10, 20, 0, 5, 0),
(20, 'Centinela gélido', 'criaturas/mocentinelagelido', 37, 'Mapa: Laberinto de hielo', 945, 740, 2, 80, 10, 728, 5, 0, 0, 20, 10, 0, 5, 3),
(21, 'Murfol', 'criaturas/momurfol', 35, 'Mapa: Descenso profundo', 795, 680, 5, 80, 10, 690, 20, 0, 10, 10, 50, 5, 0, 10),
(22, 'Roca viva', 'criaturas/morocaviva', 37, 'Mapa: Descenso profundo', 890, 745, 3, 90, 200, 736, 25, 0, 10, 5, 20, 0, 10, 0),
(23, 'Observador', 'criaturas/moobservador', 39, 'Mapa: Descenso profundo', 945, 770, 2, 100, 10, 768, 5, 0, 10, 50, 30, 5, 0, 20),
(24, 'Guerrero enano congelado', 'criaturas/moguerreroenanocong', 40, 'Mapa: Montaña helada', 960, 730, 5, 96, 100, 740, 25, 0, 10, 10, 50, 5, 10, 10),
(25, 'Esqueleto gélido', 'criaturas/moesqueletogelido', 44, 'Mapa: Montaña helada', 1000, 795, 3, 105, 100, 800, 25, 0, 10, 5, 20, 0, 20, 35),
(26, 'Caballero de plata', 'criaturas/mocaballerodeplata', 48, 'Mapa: Montaña helada', 1046, 835, 2, 111, 100, 830, 20, 5, 10, 50, 30, 30, 25, 5),
(27, 'Gladiador de la arena', 'criaturas/mogladiadordelaarena', 40, NULL, 1200, 1000, 0, 110, 100, 1000, 20, 0, 0, 10, 100, 30, 0, 0),
(28, 'Hielo de almas', 'criaturas/mohielodealmas', 52, 'Mapa: Cordillera helada', 1050, 780, 5, 100, 100, 500, 40, 0, 10, 50, 100, 10, 0, 35),
(29, 'Lagarto helado', 'criaturas/molagartohelado', 56, 'Mapa: Cordillera helada', 1100, 845, 3, 110, 100, 850, 10, 0, 10, 5, 50, 10, 25, 0),
(30, 'Espíritu helado', 'criaturas/moespirituhelado', 58, 'Mapa: Cordillera helada', 1150, 900, 2, 70, 100, 880, 0, 0, 60, 5, 50, 0, 30, 0),
(31, 'Vamporo terroso', 'criaturas/movamporoterroso', 52, 'Mapa: Inframundo', 1050, 780, 5, 100, 100, 780, 5, 0, 10, 50, 100, 10, 0, 25),
(32, 'Terráneo', 'criaturas/moterraneo', 56, 'Mapa: Inframundo', 1100, 845, 3, 117, 100, 850, 10, 0, 10, 5, 50, 10, 20, 0),
(33, 'Infragolem', 'criaturas/moinfragolem', 59, 'Mapa: Inframundo', 1150, 950, 2, 45, 100, 920, 20, 0, 0, 5, 50, 50, 50, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monstruos_loot`
--

CREATE TABLE `monstruos_loot` (
  `idmonstruo` int(11) NOT NULL,
  `nombreobj` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `posibilidad` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `monstruos_loot`
--

INSERT INTO `monstruos_loot` (`idmonstruo`, `nombreobj`, `cantidad`, `posibilidad`) VALUES
(6, 'Esencia viva', 1, 10),
(10, 'Esencia viva', 1, 50),
(13, 'Esencia viva', 1, 100),
(17, 'Esencia viva', 1, 100),
(20, 'Esencia viva', 1, 100),
(23, 'Esencia viva', 1, 100),
(26, 'Esencia viva', 1, 100),
(30, 'Esencia viva', 1, 500),
(33, 'Esencia viva', 1, 500);

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
  `set` int(11) NOT NULL DEFAULT 0,
  `pasivas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `texto` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `objetos`
--

INSERT INTO `objetos` (`nombreobj`, `tipo`, `img`, `nivelcomprar`, `nivelencontrar`, `niveluso`, `valor`, `prot`, `ataq`, `vida`, `posibilidad`, `puntosencontrar`, `usos`, `set`, `pasivas`, `texto`, `descripcion`) VALUES
('Ballesta sabia', 'Artilugio', 'bals', 0, 0, 35, 160000, 0, 60, 0, 0, 0, 0, 0, '', NULL, NULL),
('Martillo de guerra del averno', 'Arma', 'mgav', 0, 39, 39, 10000000, 1, 62, 0, 20, 140000, 0, 11, '', NULL, NULL),
('Martillo de guerra celestial', 'Arma', 'mgcel', 0, 39, 39, 10000000, 19, 44, 0, 20, 130000, 0, 10, '', NULL, NULL),
('Mandoble de lava', 'Arma', 'eest', 0, 39, 36, 6000000, 17, 43, 0, 30, 90000, 0, 0, '', NULL, NULL),
('Espada del averno', 'Arma', 'eav', 0, 36, 33, 2000000, 15, 42, 0, 30, 72000, 0, 11, '', NULL, NULL),
('Espada celestial', 'Arma', 'ecel', 0, 34, 33, 2000000, 17, 40, 0, 50, 67000, 0, 10, '', NULL, NULL),
('Hacha del averno', 'Arma', 'haver', 0, 32, 30, 1000000, 14, 41, 0, 80, 60000, 0, 11, '', NULL, NULL),
('Hacha celestial', 'Arma', 'hcels', 0, 30, 30, 1000000, 16, 39, 0, 90, 56000, 0, 10, '', NULL, NULL),
('Daga del averno', 'Arma', 'dav', 0, 32, 30, 450000, 5, 27, 0, 70, 35000, 0, 11, '', NULL, NULL),
('Daga celestial', 'Arma', 'dcel', 0, 30, 30, 450000, 7, 25, 0, 90, 30000, 0, 10, '', NULL, NULL),
('Espada de fuego mágico', 'Arma', 'efm', 0, 28, 26, 650000, 14, 39, 0, 500, 47000, 0, 7, '', NULL, NULL),
('Cuchilla eterea', 'Arma', 'ceth', 0, 25, 27, 20000, 1, 62, 0, 500, 10000, 1, 13, '', NULL, NULL),
('Espada encantada', 'Arma', 'eet', 0, 25, 23, 330000, 12, 35, 0, 500, 43000, 0, 0, '', NULL, NULL),
('Maza de la oscuridad', 'Arma', 'menc', 0, 25, 22, 360000, 15, 32, 0, 200, 45000, 0, 6, '', NULL, NULL),
('Daga de cristal luminoso', 'Arma', 'dcl', 0, 22, 20, 222000, 0, 35, 0, 300, 25000, 0, 0, '', NULL, NULL),
('Guadaña de hielo', 'Arma', 'guah', 0, 21, 19, 260000, 7, 33, 0, 2000, 29000, 0, 3, '', NULL, NULL),
('Mandoble', 'Arma', 'mplat', 0, 22, 20, 255000, 14, 35, 0, 200, 36000, 0, 0, '', NULL, NULL),
('Guadaña', 'Arma', 'guag', 0, 20, 18, 190000, 7, 32, 0, 2000, 28000, 0, 0, '', NULL, NULL),
('Espada de la corona', 'Arma', 'ere', 0, 20, 16, 150000, 9, 29, 0, 2000, 28000, 0, 5, '', NULL, NULL),
('Martillo de guerra', 'Arma', 'mguer', 0, 16, 13, 105000, 6, 29, 0, 5000, 16000, 0, 0, '', NULL, NULL),
('Daga de fuego mágico', 'Arma', 'dfm', 0, 17, 17, 13000, 6, 18, 0, 400, 20000, 0, 7, '', NULL, NULL),
('Espada de hielo', 'Arma', 'hlo', 0, 14, 12, 25000, 3, 22, 0, 5000, 1300, 0, 3, '', NULL, NULL),
('Maza de monje', 'Arma', 'mmon', 0, 12, 10, 67000, 10, 17, 0, 1200, 1800, 0, 0, '', NULL, NULL),
('Espada de oro', 'Arma', 'esoro', 0, 10, 6, 32000, 6, 19, 0, 500, 1000, 0, 2, '', NULL, NULL),
('Hacha doble', 'Arma', 'hdob', 1, 14, 10, 8700, 4, 19, 0, 7000, 600, 0, 0, '', NULL, NULL),
('Sable', 'Arma', 'sab', 1, 10, 8, 7000, 4, 17, 0, 10000, 500, 0, 0, '', NULL, NULL),
('Hacha de bárbaro', 'Arma', 'hbar', 0, 8, 11, 12000, 5, 19, 0, 7000, 700, 0, 0, '', NULL, NULL),
('Espada de bárbaro', 'Arma', 'esbar', 0, 8, 6, 4000, 5, 16, 0, 10000, 600, 0, 0, '', NULL, NULL),
('Ballesta', 'Artilugio', 'bal', 0, 0, 12, 12000, 0, 35, 0, 0, 0, 0, 0, '', NULL, NULL),
('Estrella del alba', 'Arma', 'mst', 1, 12, 7, 3500, 2, 16, 0, 6000, 800, 0, 0, '', NULL, NULL),
('Daga de diente de dragon', 'Arma', 'ddd', 0, 7, 3, 800, 6, 4, 0, 1000, 600, 0, 4, '', NULL, NULL),
('Hacha de leñador', 'Arma', 'hlen', 1, 5, 5, 1100, 4, 10, 0, 12000, 300, 0, 0, '', NULL, NULL),
('Maza de oro', 'Arma', 'mazor', 0, 10, 6, 14000, 3, 19, 0, 1000, 1500, 0, 2, '', NULL, NULL),
('Maza', 'Arma', 'maz', 1, 5, 5, 1000, 1, 13, 0, 11000, 350, 0, 0, '', NULL, NULL),
('Espada curva', 'Arma', 'escur', 0, 6, 4, 900, 3, 10, 0, 3000, 400, 0, 0, '', NULL, NULL),
('Espada larga', 'Arma', 'esplg', 1, 6, 4, 700, 4, 8, 0, 10000, 300, 0, 0, '', NULL, NULL),
('Daga de oro', 'Arma', 'doro', 0, 10, 6, 6000, 5, 16, 0, 1000, 1000, 0, 2, '', NULL, NULL),
('Lanzaclavos', 'Artilugio', 'plc', 0, 0, 8, 2000, 0, 14, 0, 0, 0, 0, 0, '', NULL, NULL),
('Espada', 'Arma', 'espp', 1, 6, 3, 300, 3, 5, 0, 20000, 200, 0, 0, '', NULL, NULL),
('Hacha de hueso', 'Arma', 'hh', 0, 2, 2, 2000, 4, 9, 0, 400, 1000, 0, 0, '', NULL, NULL),
('Espada roma', 'Arma', 'esrom', 0, 2, 2, 100, 4, 2, 0, 10000, 100, 0, 0, '', NULL, NULL),
('Daga de jade', 'Arma', 'dja', 0, 4, 2, 600, 3, 7, 0, 5000, 300, 0, 0, '', NULL, NULL),
('Daga de cobre', 'Arma', 'dcob', 0, 2, 1, 300, 3, 3, 0, 5000, 100, 0, 0, '', NULL, NULL),
('Espada corta', 'Arma', 'ecor', 1, 5, 1, 100, 2, 3, 0, 20000, 100, 0, 0, '', NULL, NULL),
('Daga', 'Arma', 'dco', 1, 3, 1, 40, 1, 2, 0, 20000, 30, 0, 0, '', NULL, NULL),
('Cuchillo de carnicero', 'Arma', 'cuc', 1, 2, 1, 20, 0, 2, 0, 35000, 20, 0, 0, '', NULL, NULL),
('Cuchillo', 'Arma', 'cupeq', 1, 1, 1, 10, 0, 1, 0, 30000, 10, 0, 0, '', NULL, NULL),
('Espada de atrezzo', 'Arma', 'eatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo celestial', 'Escudo', 'edcel', 0, 37, 33, 4000000, 37, 0, 0, 50, 100000, 0, 10, '', NULL, NULL),
('Escudo del averno', 'Escudo', 'edav', 0, 35, 33, 4000000, 30, 7, 0, 60, 90000, 0, 11, '', NULL, NULL),
('Escudo pensante', 'Escudo', 'epens', 0, 30, 29, 2000000, 21, 14, 0, 100, 70000, 0, 0, '', NULL, NULL),
('Escudo del guardián', 'Escudo', 'edpos', 0, 25, 22, 1200000, 21, 12, 0, 100, 60000, 0, 8, '', NULL, NULL),
('Escudo de fuego mágico', 'Escudo', 'esfm', 0, 23, 21, 780000, 20, 11, 0, 500, 40000, 0, 7, '', NULL, NULL),
('Escudo de vampiro', 'Escudo', 'evamp', 0, 22, 20, 625000, 23, 7, 0, 500, 20000, 0, 0, '', NULL, NULL),
('Escudo perdido de la orden', 'Escudo', 'edord', 0, 20, 25, 400000, 29, 0, 0, 20, 90000, 0, 0, '', NULL, NULL),
('Escudo del oráculo', 'Escudo', 'eorac', 0, 20, 16, 400000, 24, 4, 0, 1000, 10000, 0, 0, '', NULL, NULL),
('Escudo de camaleón', 'Escudo', 'ecml', 0, 17, 14, 260000, 24, 0, 0, 2000, 3000, 0, 0, '', NULL, NULL),
('Escudo de escamas de dragón', 'Escudo', 'eedd', 0, 15, 10, 180000, 20, 0, 0, 5000, 1000, 0, 4, '', NULL, NULL),
('Escudo del invocador', 'Escudo', 'einv', 0, 15, 11, 180000, 18, 2, 0, 3000, 1500, 0, 0, '', NULL, NULL),
('Escudo del observador', 'Escudo', 'eobs', 0, 13, 9, 67000, 16, 0, 0, 300, 1000, 0, 0, '', NULL, NULL),
('Escudo de oro', 'Escudo', 'eoro', 0, 10, 6, 47000, 14, 0, 0, 1000, 2000, 0, 2, '', NULL, NULL),
('Escudo de la naturaleza', 'Escudo', 'eont', 0, 10, 6, 16000, 12, 0, 0, 5000, 600, 0, 0, '', NULL, NULL),
('Escudo de guardia', 'Escudo', 'egrn', 0, 7, 5, 6400, 10, 0, 0, 10000, 400, 0, 0, '', NULL, NULL),
('Escudo de hielo', 'Escudo', 'ehil', 0, 8, 5, 4500, 9, 0, 0, 10000, 300, 0, 3, '', NULL, NULL),
('Escudo bárbaro', 'Escudo', 'ebar', 0, 6, 3, 4000, 8, 1, 0, 10000, 200, 0, 0, '', NULL, NULL),
('Escudo lanzaagujas', 'Artilugio', 'ela', 0, 0, 4, 700, 0, 10, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo lanzaclavos', 'Artilugio', 'elc', 0, 0, 4, 500, 2, 7, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo pegajoso permanente', 'Artilugio', 'epega', 0, 0, 3, 3200, 14, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo pegajoso', 'Artilugio', 'epeg', 0, 0, 2, 710, 7, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo de placas', 'Escudo', 'epla', 1, 6, 2, 3500, 7, 0, 0, 20000, 100, 0, 0, '', NULL, NULL),
('Escudo con pinchos', 'Escudo', 'ep', 1, 3, 2, 1050, 5, 1, 0, 20000, 50, 0, 0, '', NULL, NULL),
('Escudo de hierro', 'Escudo', 'emet', 1, 2, 1, 100, 5, 0, 0, 25000, 20, 0, 0, '', NULL, NULL),
('Escudo de madera', 'Escudo', 'em', 1, 1, 1, 50, 4, 0, 0, 30000, 10, 0, 0, '', NULL, NULL),
('Escudo militar de atrezzo', 'Escudo', 'esmatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo de atrezzo', 'Escudo', 'esatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Botas celestiales', 'Botas', 'botpp', 0, 32, 30, 4000000, 3, 2, 0, 100, 75000, 0, 10, '', NULL, NULL),
('Botas del averno', 'Botas', 'botav', 0, 30, 30, 4000000, 3, 2, 0, 100, 70000, 0, 11, '', NULL, NULL),
('Botas de la oscuridad', 'Botas', 'botos', 0, 20, 15, 1600000, 3, 1, 0, 100, 10000, 0, 6, '', NULL, NULL),
('Botas de oro', 'Botas', 'boto', 0, 10, 6, 390000, 3, 0, 0, 100, 1000, 0, 2, '', NULL, NULL),
('Botas de escamas de dragón', 'Botas', 'botpd', 0, 15, 10, 880000, 3, 0, 0, 100, 500, 0, 4, '', NULL, NULL),
('Botas de infantería', 'Botas', 'botinf', 0, 15, 14, 80000, 2, 1, 0, 100, 400, 0, 0, '', NULL, NULL),
('Botas de acero', 'Botas', 'botar', 1, 5, 1, 1000, 1, 1, 0, 10000, 150, 0, 0, '', NULL, NULL),
('Botas forradas', 'Botas', 'botf', 1, 1, 1, 300, 2, 0, 0, 20000, 15, 0, 0, '', NULL, NULL),
('Botas de cuero', 'Botas', 'botl', 1, 1, 1, 30, 1, 0, 0, 30000, 10, 0, 0, '', NULL, NULL),
('Coraza del averno', 'Coraza', 'cbaver', 0, 39, 39, 9000000, 22, 6, 0, 40, 175000, 0, 11, '', NULL, NULL),
('Coraza celestial', 'Coraza', 'cril', 0, 39, 39, 9000000, 28, 0, 0, 60, 150000, 0, 10, '', NULL, NULL),
('Coraza de fuego mágico', 'Coraza', 'cfm', 0, 25, 23, 2000000, 22, 4, 0, 500, 40000, 0, 7, '', NULL, NULL),
('Coraza de la oscuridad', 'Coraza', 'cosco', 0, 22, 20, 1400000, 21, 3, 0, 1500, 30000, 0, 6, '', NULL, NULL),
('Coraza encantada', 'Coraza', 'core', 0, 19, 17, 700000, 21, 0, 0, 2000, 13000, 0, 0, '', NULL, NULL),
('Coraza de caparazón', 'Coraza', 'cpes', 0, 17, 15, 500000, 19, 0, 0, 3000, 9000, 0, 0, '', NULL, NULL),
('Coraza de escamas de dragón', 'Coraza', 'ced', 0, 15, 10, 300000, 17, 0, 0, 3000, 5000, 0, 4, '', NULL, NULL),
('Coraza de la corona', 'Coraza', 'ccor', 0, 13, 11, 47000, 16, 0, 0, 5000, 4500, 0, 5, '', NULL, NULL),
('Coraza de hielo', 'Coraza', 'chie', 0, 11, 8, 36000, 15, 0, 0, 5000, 4000, 0, 3, '', NULL, NULL),
('Coraza desmontable de oro', 'Coraza', 'coro', 0, 10, 6, 25000, 14, 0, 0, 500, 7000, 0, 2, '', NULL, NULL),
('Coraza de cota de mallas', 'Coraza', 'ccm', 0, 12, 10, 17000, 13, 0, 0, 5000, 1000, 0, 0, '', NULL, NULL),
('Coraza de batalla', 'Coraza', 'cbt', 0, 7, 5, 12000, 10, 2, 0, 9000, 500, 0, 1, '', NULL, NULL),
('Coraza desmontable', 'Coraza', 'cdes', 1, 7, 3, 3000, 10, 0, 0, 10000, 400, 0, 0, '', NULL, NULL),
('Coraza de placas', 'Coraza', 'cpl', 1, 4, 2, 580, 8, 0, 0, 20000, 200, 0, 0, '', NULL, NULL),
('Coraza de cuero reforzado', 'Coraza', 'ccr', 1, 3, 1, 260, 5, 0, 0, 10000, 100, 0, 0, '', NULL, NULL),
('Coraza de cuero', 'Coraza', 'corc', 1, 1, 1, 90, 3, 0, 0, 20000, 30, 0, 0, '', NULL, NULL),
('Chaleco de cuero', 'Coraza', 'cc', 1, 1, 1, 20, 1, 0, 0, 20000, 10, 0, 0, '', NULL, NULL),
('Coraza de atrezzo', 'Coraza', 'catr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Coraza militar de atrezzo', 'Coraza', 'cmatr', 0, 0, 1, 2000, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Perneras del averno', 'Perneras', 'qcbaver', 0, 39, 39, 8000000, 18, 6, 0, 40, 175000, 0, 11, '', NULL, NULL),
('Perneras celestiales', 'Perneras', 'qcril', 0, 39, 39, 8000000, 24, 0, 0, 60, 150000, 0, 10, '', NULL, NULL),
('Perneras de fuego mágico', 'Perneras', 'qcfm', 0, 25, 23, 2100000, 17, 4, 0, 500, 40000, 0, 7, '', NULL, NULL),
('Perneras de la oscuridad', 'Perneras', 'qcosco', 0, 22, 20, 1300000, 16, 3, 0, 1500, 30000, 0, 6, '', NULL, NULL),
('Perneras encantadas', 'Perneras', 'qcore', 0, 19, 17, 800000, 16, 0, 0, 2000, 13000, 0, 0, '', NULL, NULL),
('Perneras de caparazón', 'Perneras', 'qcpes', 0, 17, 15, 400000, 14, 0, 0, 3000, 9000, 0, 0, '', NULL, NULL),
('Perneras de escamas de dragón', 'Perneras', 'qced', 0, 15, 10, 200000, 13, 0, 0, 3000, 5000, 0, 4, '', NULL, NULL),
('Perneras de la corona', 'Perneras', 'qccor', 0, 13, 11, 100000, 12, 0, 0, 5000, 4500, 0, 5, '', NULL, NULL),
('Perneras de hielo', 'Perneras', 'qchie', 0, 11, 8, 50000, 10, 0, 0, 5000, 4000, 0, 3, '', NULL, NULL),
('Perneras desmontables de oro', 'Perneras', 'qcoro', 0, 10, 6, 30000, 8, 0, 0, 500, 7000, 0, 2, '', NULL, NULL),
('Perneras de cota de mallas', 'Perneras', 'qccm', 0, 12, 10, 17000, 7, 0, 0, 5000, 1000, 0, 0, '', NULL, NULL),
('Perneras de batalla', 'Perneras', 'qcbt', 0, 7, 5, 15000, 5, 2, 0, 9000, 500, 0, 1, '', NULL, NULL),
('Perneras desmontables', 'Perneras', 'qcdes', 1, 7, 3, 4000, 5, 0, 0, 10000, 400, 0, 0, '', NULL, NULL),
('Perneras de placas', 'Perneras', 'qcpl', 1, 4, 2, 780, 3, 0, 0, 20000, 200, 0, 0, '', NULL, NULL),
('Perneras de cuero reforzado', 'Perneras', 'qccr', 1, 3, 1, 260, 2, 0, 0, 10000, 100, 0, 0, '', NULL, NULL),
('Perneras de cuero', 'Perneras', 'qcc', 1, 1, 1, 20, 1, 0, 0, 20000, 10, 0, 0, '', NULL, NULL),
('Yelmo celestial', 'Yelmo', 'ycel', 0, 31, 30, 3000000, 25, 0, 0, 30, 92000, 0, 10, '', NULL, NULL),
('Casco del averno', 'Yelmo', 'caver', 0, 30, 30, 3000000, 18, 7, 0, 40, 80000, 0, 11, '', NULL, NULL),
('Yelmo etereo', 'Yelmo', 'ceter', 0, 29, 29, 20000, 22, 3, 0, 3000, 8000, 1, 13, '', NULL, NULL),
('Yelmo de fuego mágico', 'Yelmo', 'yfm', 0, 28, 25, 1400000, 19, 4, 0, 1500, 40000, 0, 7, '', NULL, NULL),
('Yelmo encantado', 'Yelmo', 'yenc', 0, 25, 23, 900000, 20, 0, 0, 1500, 30000, 0, 0, '', NULL, NULL),
('Yelmo de la corona', 'Yelmo', 'cccor', 0, 18, 16, 200000, 18, 0, 0, 2000, 16400, 0, 5, '', NULL, NULL),
('Casco pesado', 'Yelmo', 'ypes', 0, 16, 13, 78000, 15, 0, 0, 2000, 10000, 0, 0, '', NULL, NULL),
('Yelmo de guerrero', 'Yelmo', 'cguer', 0, 15, 13, 52000, 13, 1, 0, 2300, 7400, 0, 0, '', NULL, NULL),
('Casco de cota de mallas', 'Yelmo', 'cccm', 0, 14, 12, 45000, 13, 0, 0, 3000, 6000, 0, 0, '', NULL, NULL),
('Casco de escamas de dragón', 'Yelmo', 'cced', 0, 12, 10, 50000, 12, 0, 0, 2000, 7000, 0, 4, '', NULL, NULL),
('Yelmo de oro', 'Yelmo', 'yoro', 0, 10, 6, 35000, 11, 0, 0, 1000, 4000, 0, 2, '', NULL, NULL),
('Yelmo de batalla', 'Yelmo', 'ybt', 0, 9, 7, 26000, 9, 2, 0, 4000, 900, 0, 1, '', NULL, NULL),
('Yelmo de hielo', 'Yelmo', 'chil', 0, 9, 6, 18000, 9, 0, 0, 5000, 600, 0, 3, '', NULL, NULL),
('Yelmo con celada', 'Yelmo', 'ccel', 0, 7, 4, 8000, 8, 0, 0, 15000, 300, 0, 0, '', NULL, NULL),
('Yelmo de infantería', 'Yelmo', 'yinf', 1, 10, 3, 3000, 6, 0, 0, 10000, 200, 0, 0, '', NULL, NULL),
('Casco de placas', 'Yelmo', 'cpla', 1, 6, 2, 600, 5, 0, 0, 10000, 400, 0, 0, '', NULL, NULL),
('Casco cerrado de hierro', 'Yelmo', 'chc', 1, 6, 2, 240, 3, 0, 0, 10000, 200, 0, 0, '', NULL, NULL),
('Casco de hierro', 'Yelmo', 'ch', 1, 3, 1, 120, 2, 0, 0, 20000, 100, 0, 0, '', NULL, NULL),
('Casco de cuero', 'Yelmo', 'ccu', 1, 1, 1, 30, 1, 0, 0, 30000, 10, 0, 0, '', NULL, NULL),
('Amuleto celestial', 'Amuleto', 'amc', 0, 31, 30, 170000, 4, 2, 15, 10, 110000, 0, 10, '', NULL, NULL),
('Amuleto del averno', 'Amuleto', 'ama', 0, 32, 30, 150000, 3, 3, 15, 20, 100000, 0, 11, '', NULL, NULL),
('Collar protector etereo', 'Amuleto', 'cetr', 0, 1, 10, 6000, 12, 0, 30, 200, 1000, 1, 13, '', NULL, NULL),
('Amuleto de ataque', 'Amuleto', 'aat', 0, 10, 12, 3000, 0, 3, 10, 500, 800, 0, 0, '', NULL, NULL),
('Amuleto de la vida', 'Amuleto', 'avid', 0, 10, 12, 3000, 0, 0, 20, 500, 800, 0, 0, '', NULL, NULL),
('Collar protector de oro', 'Amuleto', 'cpro', 0, 1, 4, 1000, 1, 0, 10, 500, 500, 0, 2, '', NULL, NULL),
('Collar protector', 'Amuleto', 'cprot', 0, 1, 5, 500, 1, 0, 5, 500, 300, 0, 0, '', NULL, NULL),
('Collar de la suerte', 'Amuleto', 'csrt', 0, 1, 1, 50, 0, 0, 10, 500, 100, 0, 0, '', NULL, NULL),
('Pócima de agua del sino', 'Poción', 'ppphh', 0, 34, 1, 120000, 24, 24, 0, 50, 9000, 1, 0, '', NULL, NULL),
('Frasco de agua del sino', 'Poción', 'pfphh', 0, 29, 1, 60000, 18, 18, 0, 100, 6000, 1, 0, '', NULL, NULL),
('Vial de agua del sino', 'Poción', 'pvphh', 0, 25, 1, 30000, 12, 12, 0, 200, 3000, 1, 0, '', NULL, NULL),
('Pócima de onyx líquido', 'Poción', 'pppny', 0, 24, 1, 15000, 24, 0, 0, 500, 900, 1, 0, '', NULL, NULL),
('Frasco de onyx líquido', 'Poción', 'pfpny', 0, 19, 1, 10000, 18, 0, 0, 1000, 600, 1, 0, '', NULL, NULL),
('Vial de onyx líquido', 'Poción', 'pvpny', 0, 15, 1, 5000, 12, 0, 0, 2000, 300, 1, 0, '', NULL, NULL),
('Pócima de agua de los deseos', 'Poción', 'pppch', 0, 24, 1, 15000, 0, 24, 0, 500, 900, 1, 0, '', NULL, NULL),
('Frasco de agua de los deseos', 'Poción', 'pfpch', 0, 19, 1, 10000, 0, 18, 0, 1000, 600, 1, 0, '', NULL, NULL),
('Vial de agua de los deseos', 'Poción', 'pvpch', 0, 15, 1, 5000, 0, 12, 0, 2000, 300, 1, 0, '', NULL, NULL),
('Pócima de agua de la justicia', 'Poción', 'ppj', 0, 14, 1, 6000, 8, 8, 0, 3000, 130, 1, 0, '', NULL, NULL),
('Frasco de agua de la justicia', 'Poción', 'pfj', 0, 9, 1, 3000, 4, 4, 0, 4000, 110, 1, 0, '', NULL, NULL),
('Vial de agua de la justicia', 'Poción', 'pvj', 0, 5, 1, 1000, 2, 2, 0, 10000, 80, 1, 0, '', NULL, NULL),
('Pócima de polen de hidra', 'Poción', 'ppphi', 0, 14, 1, 4000, 10, 0, 0, 3000, 120, 1, 0, '', NULL, NULL),
('Frasco de polen de hidra', 'Poción', 'pfphi', 0, 9, 1, 2000, 7, 0, 0, 4000, 100, 1, 0, '', NULL, NULL),
('Vial de polen de hidra', 'Poción', 'pvphi', 0, 5, 1, 1000, 4, 0, 0, 10000, 80, 1, 0, '', NULL, NULL),
('Pócima de sangre de dragón', 'Poción', 'ppsd', 0, 14, 1, 4000, 0, 10, 0, 3000, 120, 1, 0, '', NULL, NULL),
('Frasco de sangre de dragón', 'Poción', 'pfsd', 0, 9, 1, 2000, 0, 7, 0, 4000, 100, 1, 0, '', NULL, NULL),
('Vial de sangre de dragón', 'Poción', 'pvsd', 0, 5, 1, 1000, 0, 4, 0, 10000, 80, 1, 0, '', NULL, NULL),
('Pócima de savia de hidra', 'Poción', 'ppshi', 0, 1, 1, 700, 3, 0, 0, 10000, 60, 1, 0, '', NULL, NULL),
('Frasco de savia de hidra', 'Poción', 'pfshi', 0, 1, 1, 450, 2, 0, 0, 10000, 40, 1, 0, '', NULL, NULL),
('Vial de savia de hidra', 'Poción', 'pvshi', 0, 1, 1, 200, 1, 0, 0, 10000, 20, 1, 0, '', NULL, NULL),
('Pócima de sangre de heroe', 'Poción', 'ppsh', 0, 1, 1, 700, 0, 3, 0, 10000, 60, 1, 0, '', NULL, NULL),
('Frasco de sangre de heroe', 'Poción', 'pfsh', 0, 1, 1, 450, 0, 2, 0, 10000, 40, 1, 0, '', NULL, NULL),
('Vial de sangre de heroe', 'Poción', 'pvsh', 0, 1, 1, 200, 0, 1, 0, 10000, 20, 1, 0, '', NULL, NULL),
('Preparado casero de fuerza', 'Poción', 'ppf', 1, 1, 1, 200, 0, 1, 0, 10000, 10, 1, 0, '', NULL, NULL),
('Preparado casero de agilidad', 'Poción', 'ppa', 1, 1, 1, 200, 1, 0, 0, 10000, 10, 1, 0, '', NULL, NULL),
('Espada suprema', 'Arma', 'rres', 0, 69, 69, 120000000, 8, 78, 0, 5, 300000, 0, 0, '', NULL, NULL),
('Espada maldita', 'Arma', 'rrem', 0, 65, 69, 100000000, 10, 75, 0, 5, 280000, 0, 0, '', NULL, NULL),
('Sable del maestro artesano', 'Arma', 'rrsma', 0, 69, 69, 90000000, 13, 72, 0, 15, 240000, 0, 18, '', NULL, NULL),
('Espada mitológica', 'Arma', 'ref', 0, 69, 69, 80000000, 22, 62, 0, 30, 180000, 0, 0, '', NULL, NULL),
('Espada de la luz', 'Arma', 'rehe', 0, 69, 65, 70000000, 21, 61, 0, 50, 160000, 0, 0, '', NULL, NULL),
('Hacha maldita', 'Arma', 'rrhma', 0, 69, 65, 70000000, 11, 71, 0, 10, 220000, 0, 0, '', NULL, NULL),
('Espada curva artesanal', 'Arma', 'rreca', 0, 68, 66, 65000000, 20, 61, 0, 50, 160000, 0, 0, '', NULL, NULL),
('Hacha encantada', 'Arma', 'rrhe', 0, 66, 65, 65000000, 16, 65, 0, 30, 170000, 0, 0, '', NULL, NULL),
('Espada gigante', 'Arma', 'regig', 0, 64, 61, 50000000, 20, 60, 0, 70, 120000, 0, 0, '', NULL, NULL),
('Espada del maestro artesano', 'Arma', 'remar', 0, 62, 59, 39000000, 20, 57, 0, 150, 100000, 0, 18, '', NULL, NULL),
('Maza equilibrada', 'Arma', 'rmeq', 0, 59, 56, 32000000, 20, 54, 0, 200, 90000, 0, 0, '', NULL, NULL),
('Sable real', 'Arma', 'rrsr', 0, 59, 55, 32500000, 15, 59, 0, 100, 120000, 0, 21, '', NULL, NULL),
('Mandoble artesanal', 'Arma', 'rrmd', 0, 57, 55, 28000000, 25, 48, 0, 300, 90000, 0, 0, '', NULL, NULL),
('Cimitarra artesanal', 'Arma', 'rcim', 0, 55, 53, 25000000, 20, 52, 0, 300, 80000, 0, 0, '', NULL, NULL),
('Espada rúnica', 'Arma', 'rrer', 0, 55, 51, 26000000, 15, 57, 0, 400, 75000, 0, 0, '', NULL, NULL),
('Espada artesanal', 'Arma', 'rreq', 0, 55, 51, 23000000, 15, 56, 0, 500, 65000, 0, 0, '', NULL, NULL),
('Ballesta de energía', 'Artilugio', 'bale', 0, 0, 35, 32000000, 0, 85, 0, 0, 0, 0, 0, '', NULL, NULL),
('Cetro encantado', 'Arma', 'rcen', 0, 53, 51, 20000000, 10, 60, 0, 100, 100000, 0, 0, '', NULL, NULL),
('Hacha del guardián', 'Arma', 'rhg', 0, 52, 50, 18000000, 14, 55, 0, 400, 65000, 0, 8, '', NULL, NULL),
('Martillo de hueso de gigante', 'Arma', 'rmh', 0, 50, 47, 14000000, 17, 51, 0, 700, 60000, 0, 0, '', NULL, NULL),
('Martillo de guerra sagrado', 'Arma', 'rrmgs', 0, 49, 47, 14500000, 14, 54, 0, 500, 70000, 0, 15, '', NULL, NULL),
('Espada del heroe', 'Arma', 'rreh', 0, 50, 48, 14000000, 21, 47, 0, 300, 75000, 0, 17, '', NULL, NULL),
('Daga rúnica', 'Arma', 'rrdr', 0, 49, 46, 13200000, 18, 49, 0, 500, 60000, 0, 0, '', NULL, NULL),
('Espada equilibrada', 'Arma', 'req', 0, 50, 46, 13000000, 20, 47, 0, 800, 55000, 0, 0, '', NULL, NULL),
('Maza de hechicero', 'Arma', 'rmzh', 0, 48, 45, 10000000, 21, 46, 0, 1000, 50000, 0, 0, '', NULL, NULL),
('Espada extraña dorada', 'Arma', 'rreeo', 0, 47, 42, 9000000, 15, 50, 0, 600, 40000, 0, 0, '', NULL, NULL),
('Cetro druida de los elementos', 'Arma', 'rrce', 0, 47, 47, 11000000, 35, 30, 0, 100, 80000, 0, 0, '', NULL, NULL),
('Espada protectora', 'Arma', 'rrep', 0, 48, 44, 9000000, 26, 39, 0, 300, 70000, 0, 0, '', NULL, NULL),
('Hacha vikinga', 'Arma', 'rhv', 0, 46, 44, 8500000, 17, 48, 0, 1300, 30000, 0, 0, '', NULL, NULL),
('Hacha de coral', 'Arma', 'rrhc', 0, 46, 42, 10000000, 7, 58, 0, 300, 80000, 0, 0, '', NULL, NULL),
('Maza rúnica', 'Arma', 'rrmc', 0, 45, 43, 8000000, 12, 52, 0, 1000, 32000, 0, 0, '', NULL, NULL),
('Daga ceremonial', 'Arma', 'rdcer', 0, 44, 42, 7000000, 19, 45, 0, 1500, 25000, 0, 14, '', NULL, NULL),
('Cuchilla robaalmas', 'Arma', 'rrcr', 0, 42, 40, 8000000, 2, 60, 0, 35, 50000, 0, 0, '', NULL, NULL),
('Robaalmas espectral', 'Arma', 'raesp', 0, 42, 40, 8000000, 1, 60, 0, 50, 45000, 0, 12, '', NULL, NULL),
('Martillo de guerra rúnico', 'Arma', 'rrmgr', 0, 44, 42, 6000000, 12, 47, 0, 300, 30000, 0, 0, '', NULL, NULL),
('Martillo del trueno', 'Arma', 'rmtru', 0, 44, 42, 5000000, 8, 50, 0, 70, 25000, 0, 0, '', NULL, NULL),
('Espada de la gárgola', 'Arma', 'rreg', 0, 43, 40, 6000000, 18, 41, 0, 1000, 25000, 0, 0, '', NULL, NULL),
('Hacha del nigromante', 'Arma', 'rrhg', 0, 43, 40, 5000000, 18, 40, 0, 1000, 25000, 0, 16, '', NULL, NULL),
('Hacha ceremonial', 'Arma', 'rhce', 0, 42, 40, 3000000, 10, 46, 0, 100, 25000, 0, 14, '', NULL, NULL),
('Hacha equilibrada', 'Arma', 'rheq', 0, 40, 38, 2000000, 14, 40, 0, 1500, 20000, 0, 0, '', NULL, NULL),
('Martillo rúnico', 'Arma', 'rrmar', 0, 39, 37, 1750000, 10, 44, 0, 1000, 20000, 0, 0, '', NULL, NULL),
('Sable de la oscuridad', 'Arma', 'rrso', 0, 38, 36, 1500000, 5, 50, 0, 800, 30000, 0, 6, '', NULL, NULL),
('Sable dorado', 'Arma', 'rrsd', 0, 36, 34, 1000000, 10, 45, 0, 1000, 24000, 0, 0, '', NULL, NULL),
('Espada extraña', 'Arma', 'rree', 0, 36, 29, 850000, 14, 40, 0, 1000, 22000, 0, 0, '', NULL, NULL),
('Martillo de hierro y madera', 'Arma', 'rrmm', 0, 10, 11, 14000, 7, 18, 0, 7000, 750, 0, 0, '', NULL, NULL),
('Martillo de madera', 'Arma', 'rrmr', 0, 7, 5, 3800, 7, 14, 0, 8000, 620, 0, 0, '', NULL, NULL),
('Escudo maldito', 'Escudo', 'remal', 0, 69, 69, 50000000, 52, 6, 0, 10, 120000, 0, 0, '', NULL, NULL),
('Escudo extraño', 'Escudo', 'ree', 0, 66, 60, 38000000, 35, 20, 0, 30, 100000, 0, 0, '', NULL, NULL),
('Escudo de protección', 'Escudo', 'rrea', 0, 64, 62, 36000000, 54, 0, 0, 80, 80000, 0, 0, '', NULL, NULL),
('Escudo giratorio', 'Escudo', 'regi', 0, 62, 60, 32000000, 39, 15, 0, 100, 60000, 0, 0, '', NULL, NULL),
('Escudo mitológico', 'Escudo', 'remi', 0, 60, 58, 28000000, 42, 11, 0, 100, 60000, 0, 0, '', NULL, NULL),
('Escudo arcano', 'Escudo', 'rearc', 0, 58, 54, 22000000, 42, 10, 0, 200, 50000, 0, 19, '', NULL, NULL),
('Escudo del maestro artesano', 'Escudo', 'rear', 0, 54, 52, 18000000, 44, 6, 0, 400, 33000, 0, 18, '', NULL, NULL),
('Escudo de los enanos', 'Escudo', 'reen', 0, 52, 50, 16000000, 49, 0, 0, 700, 30000, 0, 0, '', NULL, NULL),
('Escudo del heroe', 'Escudo', 'reh', 0, 50, 48, 12000000, 43, 5, 0, 500, 30000, 0, 17, '', NULL, NULL),
('Escudo sagrado', 'Escudo', 'resag', 0, 48, 47, 8000000, 42, 4, 0, 700, 23000, 0, 15, '', NULL, NULL),
('Escudo del geomante', 'Escudo', 'retal', 0, 46, 44, 6000000, 42, 0, 0, 800, 22000, 0, 9, '', NULL, NULL),
('Escudo del nigromante', 'Escudo', 'reng', 0, 44, 42, 4500000, 30, 9, 0, 1000, 20000, 0, 16, '', NULL, NULL),
('Escudo vikingo', 'Escudo', 'revik', 0, 44, 19, 3000000, 31, 2, 0, 300, 28000, 0, 0, '', NULL, NULL),
('Escudo completo', 'Escudo', 'recm', 0, 44, 42, 4000000, 38, 0, 0, 1600, 16000, 0, 0, '', NULL, NULL),
('Escudo ceremonial', 'Escudo', 'recer', 0, 42, 40, 3000000, 37, 0, 0, 1800, 16000, 0, 14, '', NULL, NULL),
('Escudo espectral', 'Escudo', 'reesp', 0, 42, 40, 3000000, 30, 7, 0, 2000, 15000, 0, 12, '', NULL, NULL),
('Escudo de infantería', 'Escudo', 'rresp', 0, 39, 38, 2900000, 35, 1, 0, 2000, 11000, 0, 0, '', NULL, NULL),
('Escudo de soldado', 'Escudo', 'rreso', 0, 38, 37, 2900000, 30, 6, 0, 2000, 11000, 0, 0, '', NULL, NULL),
('Escudo de batalla', 'Escudo', 'rreb', 0, 37, 35, 2700000, 28, 7, 0, 2000, 10000, 0, 0, '', NULL, NULL),
('Botas aladas', 'Botas', 'rbala', 0, 60, 45, 10000000, 0, 8, 0, 15, 250000, 0, 0, '', NULL, NULL),
('Botas extrañas', 'Botas', 'rbext', 0, 50, 40, 6000000, 3, 3, 0, 30, 150000, 0, 0, '', NULL, NULL),
('Botas espectrales', 'Botas', 'rbesp', 0, 42, 40, 3000000, 2, 2, 0, 100, 15000, 0, 12, '', NULL, NULL),
('Coraza mitológica real', 'Coraza', 'rracc', 0, 69, 69, 90000000, 42, 4, 0, 5, 220000, 0, 21, '', NULL, NULL),
('Coraza mitológica', 'Coraza', 'rag', 0, 69, 67, 80000000, 42, 2, 0, 10, 160000, 0, 0, '', NULL, NULL),
('Coraza real', 'Coraza', 'rracd', 0, 68, 66, 70000000, 40, 2, 0, 30, 140000, 0, 21, '', NULL, NULL),
('Coraza demoniaca', 'Coraza', 'rdem', 0, 64, 62, 50000000, 20, 20, 0, 100, 70000, 0, 20, '', NULL, NULL),
('Coraza arcana', 'Coraza', 'rar', 0, 58, 55, 30000000, 30, 7, 0, 200, 50000, 0, 19, '', NULL, NULL),
('Coraza del maestro artesano', 'Coraza', 'rmar', 0, 54, 51, 22000000, 28, 6, 0, 300, 40000, 0, 18, '', NULL, NULL),
('Coraza del heroe', 'Coraza', 'rher', 0, 50, 48, 16000000, 27, 5, 0, 500, 30000, 0, 17, '', NULL, NULL),
('Coraza del nigromante', 'Coraza', 'rrcg', 0, 48, 46, 14000000, 20, 10, 0, 300, 40000, 0, 16, '', NULL, NULL),
('Coraza sagrada', 'Coraza', 'rsag', 0, 48, 44, 12000000, 30, 1, 0, 700, 22000, 0, 15, '', NULL, NULL),
('Coraza completa', 'Coraza', 'rcom', 0, 44, 42, 8000000, 29, 0, 0, 1600, 17000, 0, 0, '', NULL, NULL),
('Coraza de caballería', 'Coraza', 'rrcc', 0, 45, 41, 9000000, 25, 5, 0, 600, 30000, 0, 0, '', NULL, NULL),
('Coraza del capitán', 'Coraza', 'rrca', 0, 44, 42, 6700000, 28, 0, 0, 600, 30000, 0, 0, '', NULL, NULL),
('Coraza ceremonial', 'Coraza', 'rcer', 0, 42, 40, 6600000, 27, 1, 0, 1800, 16200, 0, 14, '', NULL, NULL),
('Coraza espectral', 'Coraza', 'resp', 0, 42, 40, 6000000, 22, 5, 0, 2000, 15000, 0, 12, '', NULL, NULL),
('Coraza del geomante', 'Coraza', 'rrcgg', 0, 40, 39, 5700000, 26, 1, 0, 2000, 12000, 0, 9, '', NULL, NULL),
('Coraza de guardián', 'Coraza', 'rrcgu', 0, 38, 37, 5500000, 26, 0, 0, 2000, 10000, 0, 8, '', NULL, NULL),
('Perneras reales', 'Perneras', 'rrpr', 0, 69, 66, 48000000, 30, 2, 0, 30, 100000, 0, 21, '', NULL, NULL),
('Perneras demoniacas', 'Perneras', 'rpdem', 0, 65, 60, 35000000, 15, 15, 0, 100, 70000, 0, 20, '', NULL, NULL),
('Perneras arcanas', 'Perneras', 'rpar', 0, 58, 55, 25000000, 21, 8, 0, 200, 55000, 0, 19, '', NULL, NULL),
('Perneras del maestro artesano', 'Perneras', 'rpma', 0, 54, 52, 19000000, 21, 6, 0, 300, 45000, 0, 18, '', NULL, NULL),
('Perneras del heroe', 'Perneras', 'rpher', 0, 51, 49, 14000000, 20, 5, 0, 500, 35000, 0, 17, '', NULL, NULL),
('Perneras sagradas', 'Perneras', 'rpsag', 0, 48, 42, 10000000, 23, 1, 0, 1000, 25000, 0, 15, '', NULL, NULL),
('Perneras ceremoniales', 'Perneras', 'rpcer', 0, 42, 40, 5000000, 21, 1, 0, 1800, 16300, 0, 14, '', NULL, NULL),
('Perneras espectrales', 'Perneras', 'rpesp', 0, 42, 40, 5000000, 17, 5, 0, 2000, 15000, 0, 12, '', NULL, NULL),
('Perneras del geomante', 'Perneras', 'rrcpg', 0, 40, 39, 4700000, 21, 1, 0, 2000, 15000, 0, 9, '', NULL, NULL),
('Yelmo mitológico', 'Yelmo', 'rymit', 0, 69, 66, 34000000, 30, 4, 0, 40, 120000, 0, 0, '', NULL, NULL),
('Yelmo demoniaco', 'Yelmo', 'rydem', 0, 64, 61, 26000000, 16, 16, 0, 60, 80000, 0, 20, '', NULL, NULL),
('Yelmo maldito', 'Yelmo', 'rcmit', 0, 61, 59, 20000000, 28, 6, 0, 100, 70000, 0, 0, '', NULL, NULL),
('Yelmo arcano', 'Yelmo', 'ryar', 0, 58, 54, 14000000, 26, 6, 0, 200, 55000, 0, 19, '', NULL, NULL),
('Yelmo del maestro artesano', 'Yelmo', 'rcmar', 0, 54, 51, 11000000, 25, 4, 0, 400, 35000, 0, 18, '', NULL, NULL),
('Yelmo del heroe', 'Yelmo', 'rcher', 0, 50, 48, 7000000, 25, 2, 0, 500, 30000, 0, 17, '', NULL, NULL),
('Casco sagrado', 'Yelmo', 'rcsag', 0, 48, 45, 4500000, 24, 2, 0, 700, 25000, 0, 15, '', NULL, NULL),
('Casco vikingo', 'Yelmo', 'rcvik', 0, 44, 19, 3000000, 12, 8, 0, 400, 30000, 0, 0, '', NULL, NULL),
('Casco ceremonial', 'Yelmo', 'rycer', 0, 42, 40, 2900000, 22, 3, 0, 1500, 20000, 0, 14, '', NULL, NULL),
('Yelmo espectral', 'Yelmo', 'rcesp', 0, 42, 40, 2500000, 19, 5, 0, 2000, 15000, 0, 12, '', NULL, NULL),
('Casco orco', 'Yelmo', 'rrcp', 0, 42, 40, 2200000, 19, 4, 0, 2000, 10000, 0, 0, '', NULL, NULL),
('Amuleto supremo', 'Amuleto', 'ams', 0, 60, 60, 3000000, 5, 5, 30, 10, 180000, 0, 0, '', NULL, NULL),
('Amuleto de la protección', 'Amuleto', 'rrap', 0, 40, 40, 47000, 5, 0, 20, 100, 38000, 0, 0, '', NULL, NULL),
('Menú completo', 'Alimento', 'mcom', 0, 0, 1, 500000, 1400, 0, 0, 0, 0, 2, 0, '', NULL, 'Ración completa de alimentos.\r\nTe alimentará durante días.'),
('Ración de gambas', 'Alimento', 'rgrg', 0, 69, 1, 180000, 200, 0, 0, 400, 2000, 2, 0, '', NULL, 'Ración de deliciosos crustáceos marinos.'),
('Champiñón mágico', 'Alimento', 'rgchg', 0, 60, 1, 80000, 120, 0, 0, 500, 1000, 2, 0, '', NULL, 'Seta roja con motas blancas.\r\nAdvertencia: su consumo puede provocar alucinaciones.'),
('Yogur de frutas', 'Alimento', 'yogf', 0, 0, 1, 80000, 120, 0, 0, 0, 0, 2, 0, '', NULL, 'Delicioso yogur con frutos del bosque.\r\nA los niños les encanta.'),
('Jarra de bebida energética', 'Alimento', 'jbe', 0, 0, 1, 70000, 100, 0, 0, 0, 0, 2, 0, '', NULL, 'Bebida compuesta principálmente por zumos de frutas y cafeina.'),
('Champiñón verde', 'Alimento', 'rgchv', 0, 55, 1, 48000, 80, 0, 0, 3000, 700, 2, 0, '', NULL, 'Todo champiñón rojo, tiene su hermano champiñón verde.'),
('Champiñón', 'Alimento', 'rgch', 0, 50, 1, 38000, 60, 0, 0, 4000, 500, 2, 0, '', NULL, 'Champiñón anaranjado con la copa redondeada.\r\nMuy cotizado entre los seteros.'),
('Jarra de batido de fresa', 'Alimento', 'jbf', 0, 0, 1, 37000, 65, 0, 0, 0, 0, 2, 0, '', NULL, 'Ahora con un 37% de fruta.'),
('Filete de salmón', 'Alimento', 'rgfs', 0, 1, 1, 24000, 17, 0, 0, 4000, 300, 2, 0, '', NULL, 'Trozo de salmón de los rios de Lifo.'),
('Jarra de batido de cacao', 'Alimento', 'jbc', 0, 0, 1, 24000, 50, 0, 0, 0, 0, 2, 0, '', NULL, 'Leche, cacao y azucar.\r\nPerfecta combinación.'),
('Jarra de zumo de fresas', 'Alimento', 'jzf', 0, 0, 1, 24000, 50, 0, 0, 0, 0, 2, 0, '', NULL, 'Ahora con un 100% de fruta.'),
('Ración de fresas', 'Alimento', 'rgrf', 0, 40, 1, 19000, 43, 0, 0, 4000, 250, 2, 0, '', NULL, 'Fruta roja silvestre.\r\nSe puede encontrar en los bosques frondosos.'),
('Jarra de zumo de moras', 'Alimento', 'jzmo', 0, 0, 1, 19000, 43, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de moras silvestres.'),
('Ración de moras', 'Alimento', 'rgrm', 0, 35, 1, 16000, 37, 0, 0, 4000, 200, 2, 0, '', NULL, 'Ración de moras silvestres.\r\nSi las recoges demasiado pronto se amargán.'),
('Chocolate', 'Alimento', 'choco', 0, 0, 1, 20000, 37, 0, 0, 500, 300, 2, 0, '', NULL, 'Barra dulce de felicidad.\r\nContiene un 80% de cacao.'),
('Hamburguesa', 'Alimento', 'bur', 0, 0, 1, 19000, 37, 0, 0, 0, 0, 2, 0, '', NULL, 'Alimento áltamente calórico.\r\nNo lleva pepinillos.'),
('Jarra de zumo de cerezas', 'Alimento', 'jzce', 0, 0, 1, 16000, 37, 0, 0, 0, 0, 2, 0, '', NULL, 'Jarra de un dulce zumo de cerezas.'),
('Ensalada', 'Alimento', 'ens', 0, 0, 1, 10000, 30, 0, 0, 0, 0, 2, 0, '', NULL, 'Alimento compuesto por verduras frescas.'),
('Ración de cerezas', 'Alimento', 'rgrc', 0, 31, 1, 13000, 33, 0, 0, 4000, 170, 2, 0, '', NULL, 'Puñado de cerezas rojas.\r\nSon ácidas y dulces.'),
('Bizcocho', 'Alimento', 'rgbz', 0, 27, 1, 10000, 27, 0, 0, 5000, 150, 2, 0, '', NULL, 'Masa dulce recién horneada.'),
('Empanada', 'Alimento', 'rgem', 0, 27, 1, 10000, 27, 0, 0, 5000, 150, 2, 0, '', NULL, 'Masa salada horneada.\r\nPuede estar rellena de carne o pescado.'),
('Sopa de pollo y huevo', 'Alimento', 'sopp', 0, 0, 1, 9000, 25, 0, 0, 0, 0, 2, 0, '', NULL, 'Sopa caliente.\r\nPara los frios inviernos de Lifo.'),
('Jarra de zumo de sandía', 'Alimento', 'jzs', 0, 0, 1, 5000, 21, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo refrigerado de sandía.\r\nPerfecto para el verano de Lifo.'),
('Jarra de café con leche y azucar', 'Alimento', 'jacla', 0, 0, 1, 1600, 25, 0, 0, 0, 0, 2, 0, '', NULL, 'Aliménto rico en cafeina.\r\nTómese con moderación.'),
('Jarra de café con azucar', 'Alimento', 'jaca', 0, 0, 1, 3000, 24, 0, 0, 0, 0, 2, 0, '', NULL, 'Café sólo con azucar.'),
('Tortilla', 'Alimento', 'tor', 0, 0, 1, 4000, 25, 0, 0, 0, 0, 2, 0, '', NULL, 'Plato de huevo batido y cocinado en sartén.'),
('Pescado grande', 'Alimento', 'rgpg', 0, 25, 1, 4000, 16, 0, 0, 5000, 120, 2, 0, '', NULL, 'Gran pieza pescada en los mares de Lifo.'),
('Jarra de vino', 'Alimento', 'jv', 0, 0, 1, 4000, 20, 0, 0, 500, 120, 2, 0, '', NULL, 'Mosto de uva que ha madurado con el tiempo.'),
('Jarra de cerveza', 'Alimento', 'jc', 0, 0, 1, 4000, 20, 0, 0, 600, 120, 2, 0, '', NULL, 'Producto resultante del fermento de la cebada.\r\nContiene alcohol.'),
('Jarra de zumo de coco', 'Alimento', 'jzc', 0, 0, 1, 1500, 20, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de coco exprimido.\r\nSí, cocos exprimidos.'),
('Jarra de café con leche', 'Alimento', 'jacl', 0, 0, 1, 1000, 17, 0, 0, 0, 0, 2, 0, '', NULL, 'Café con leche, sin azucar añadido.'),
('Azúcar', 'Alimento', 'saz', 0, 0, 1, 2000, 20, 0, 0, 500, 100, 2, 0, '', NULL, 'Alimento dulce extraido de la remolacha o la caña de azucar.'),
('Jarra de mosto', 'Alimento', 'jm', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de uva a penas fermentado.\r\nCon el tiempo se convierte en vino.'),
('Jarra de café', 'Alimento', 'jac', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, 0, '', NULL, '100% café, 0% azucar'),
('Jarra de mosto de cebada', 'Alimento', 'jmc', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, 0, '', NULL, 'Bebida obtenida a partir del 1° fermento de cebada.'),
('Solomillo', 'Alimento', 'rgs', 0, 23, 1, 3200, 15, 0, 0, 6000, 150, 2, 0, '', NULL, 'Pedazo de carne jugoso.'),
('Frasco de aceite', 'Alimento', 'pfac', 0, 0, 1, 5000, 15, 0, 0, 0, 0, 2, 0, '', NULL, 'Producto obtenido al prensar las aceitunas.'),
('Sandía', 'Alimento', 'rgsn', 0, 21, 1, 2400, 14, 0, 0, 8000, 120, 2, 0, '', NULL, 'Fruta esférica verde acuosa con un interior rojo dulce.'),
('Palomitas de maiz', 'Alimento', 'pma', 0, 0, 1, 3000, 14, 0, 0, 0, 0, 2, 0, '', NULL, 'Aperitivo a base de maiz.'),
('Yogur', 'Alimento', 'yog', 0, 0, 1, 2500, 14, 0, 0, 0, 0, 2, 0, '', NULL, 'Produto agrio obtenido a partir del fermento de la leche.'),
('Ración de tostadas', 'Alimento', 'mantor', 0, 0, 1, 2000, 14, 0, 0, 0, 0, 2, 0, '', NULL, 'Rebanadas de pan caliente.'),
('Coco', 'Alimento', 'rgc', 0, 18, 1, 1900, 13, 0, 0, 8000, 100, 2, 0, '', NULL, 'Fruta esférica dura que crece en la cumbre de las palmeras.'),
('Calabaza', 'Alimento', 'rgcz', 0, 14, 1, 1500, 12, 0, 0, 8000, 80, 2, 0, '', NULL, 'Hortaliza esferica anaranjada.\r\nIdeal para purés.'),
('Jarra de batido de plátano', 'Alimento', 'jbp', 0, 0, 1, 1700, 30, 0, 0, 0, 0, 2, 0, '', NULL, 'Batido de platano y leche muy popular.\r\nA veces se usa como moneda de cambio.'),
('Jarra de zumo de tomate', 'Alimento', 'jzt', 0, 0, 1, 750, 10, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de ... ¿fruta o verdura?'),
('Jarra de zumo de zanahoria', 'Alimento', 'jzz', 0, 0, 1, 750, 10, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de hortaliza.\r\nSe puede usar para hacer tartas dulces.'),
('Jarra de zumo de remolacha', 'Alimento', 'jzza', 0, 0, 1, 750, 10, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de remolachas exprimidas.\r\nSe usa comúnmente para la fabricación de azucar.'),
('Sopa', 'Alimento', 'sop', 0, 0, 1, 800, 11, 0, 0, 0, 0, 2, 0, '', NULL, 'Caldo caliente.'),
('Queso', 'Alimento', 'rgq', 1, 6, 1, 750, 10, 0, 0, 2000, 60, 2, 0, '', NULL, 'Alimento a partir de la maduración de la cuajada de leche.'),
('Mantequilla', 'Alimento', 'man', 0, 0, 1, 650, 9, 0, 0, 0, 0, 2, 0, '', NULL, 'Obtenido a partir de la nata de la leche y sal.'),
('Pescado', 'Alimento', 'rgps', 1, 6, 1, 450, 9, 0, 0, 2000, 60, 2, 0, '', NULL, 'Criatura marina que habita los mares de Lifo.'),
('Uvas', 'Alimento', 'rgu', 1, 6, 1, 350, 8, 0, 0, 2000, 60, 2, 0, '', NULL, 'Fruta agria usada en la fabricación de zumos y vinos.'),
('Aceitunas', 'Alimento', 'pac', 0, 6, 1, 650, 8, 0, 0, 3000, 80, 2, 0, '', NULL, 'Alimento usado en la fabricación de aceites.'),
('Jarra de zumo de plátano', 'Alimento', 'jzpl', 0, 0, 1, 350, 8, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de plátanos.\r\nEs bastante denso.'),
('Jarra de zumo de naranja', 'Alimento', 'jzn', 0, 0, 1, 350, 8, 0, 0, 0, 0, 2, 0, '', NULL, '<i>Por la mañana oro,\r\npor la tarde plata y\r\npor la noche plomo</i>\r\n-Un desconocido-'),
('Barra de pan', 'Alimento', 'rgb', 1, 5, 1, 300, 7, 0, 0, 2000, 40, 2, 0, '', NULL, 'Masa de harina y agua horneada.'),
('Huevo cocido', 'Alimento', 'hco', 0, 0, 1, 300, 7, 0, 0, 0, 0, 2, 0, '', NULL, 'Huevo cocido listo para comer.'),
('Muslo de pollo', 'Alimento', 'rgmp', 1, 5, 1, 200, 6, 0, 0, 2000, 40, 2, 0, '', NULL, 'Trozo de una pata de pollo.'),
('Huevo', 'Alimento', 'rgh', 1, 4, 1, 100, 5, 0, 0, 2000, 40, 2, 0, '', NULL, 'Producto animal obtenido de las gallinas.'),
('Maiz', 'Alimento', 'rgma', 1, 3, 1, 60, 4, 0, 0, 2000, 30, 2, 0, '', NULL, 'Hortaliza amarilla que crece en espiga.'),
('Lechuga', 'Alimento', 'lec', 1, 3, 1, 60, 4, 0, 0, 2000, 30, 2, 0, '', NULL, 'Verdura verde rica en fibra.'),
('Jarra de zumo de manzana', 'Alimento', 'jzm', 0, 0, 1, 60, 4, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo dulce de manzana.\r\nIngrediente para batidos y pasteles de manzana.'),
('Zanahoria', 'Alimento', 'rgz', 1, 2, 1, 30, 3, 0, 0, 2000, 30, 2, 0, '', NULL, 'Hortaliza naranja alargada.'),
('Tomate', 'Alimento', 'rgt', 1, 2, 1, 30, 3, 0, 0, 2000, 15, 2, 0, '', NULL, '(¿Fruta/verdura?) plantada en los huertos de Lifo.\r\nEs rica en agua.'),
('Remolacha', 'Alimento', 'grr', 1, 2, 1, 30, 3, 0, 0, 2000, 15, 2, 0, '', NULL, 'Raiz a partir de la cuál se obtiene azucar.'),
('Jarra de zumo de pera', 'Alimento', 'jzp', 0, 0, 1, 30, 3, 0, 0, 0, 0, 2, 0, '', NULL, 'Zumo de pera.\r\nIdeal para purés de frutas.'),
('Naranja', 'Alimento', 'rgn', 1, 2, 1, 10, 2, 0, 0, 2000, 10, 2, 0, '', NULL, 'Fruta esférica narajan.\r\n<i>¿\"Naranja\" es por el color o por la fruta?</i>'),
('Plátano', 'Alimento', 'rgpl', 1, 1, 1, 10, 2, 0, 0, 2000, 10, 2, 0, '', NULL, 'Fruto tropical que crece en las palmeras.'),
('Jarra de leche', 'Alimento', 'jl', 1, 1, 1, 10, 2, 0, 0, 2000, 10, 2, 0, '', NULL, 'Producto animal obtenido a partir de vacas.'),
('Manzana', 'Alimento', 'rgm', 1, 1, 1, 5, 1, 0, 0, 2000, 5, 2, 0, '', NULL, 'Fruto rojo que crece en árboles.'),
('Pera', 'Alimento', 'rgp', 1, 1, 1, 5, 1, 0, 0, 2000, 5, 2, 0, '', NULL, 'Fruto verde rico en agua que crece en los árboles.'),
('Jarra de agua', 'Alimento', 'jag', 1, 1, 1, 5, 1, 0, 0, 2000, 5, 2, 0, '', NULL, 'Elemento base de la vida en Lifo.'),
('Cristal de invocación del poder', 'Recurso', 'icip', 0, 0, 1, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Pergamino en blanco del poder', 'Recurso', 'pvp', 0, 0, 1, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Cristal de invocación', 'Recurso', 'ici', 1, 0, 1, 100, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Pergamino en blanco', 'Recurso', 'pv', 1, 0, 1, 100, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Polvo del caos', 'Recurso', 'cca', 1, 0, 1, 300, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Polvo del fuego', 'Recurso', 'cfu', 1, 0, 1, 260, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Polvo de la energía', 'Recurso', 'cen', 1, 0, 1, 180, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Polvo del hielo', 'Recurso', 'chi', 1, 0, 1, 260, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Polvo del tiempo', 'Recurso', 'cti', 1, 0, 1, 280, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Polvo de la vida', 'Recurso', 'cvi', 1, 0, 1, 280, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Jarra de agua del mar', 'Recurso', 'jagm', 1, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Sal', 'Recurso', 'sal', 0, 0, 1, 10, 0, 0, 0, 500, 10, 4, 0, '', NULL, NULL),
('Vial de alcohol puro', 'Recurso', 'pvap', 0, 0, 1, 4000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Trigo', 'Recurso', 'rtr', 1, 0, 1, 700, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Cebada', 'Recurso', 'rtc', 1, 0, 1, 700, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Granos de café', 'Recurso', 'pacf', 1, 0, 1, 300, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Granos de cacao', 'Recurso', 'paca', 0, 1, 1, 300, 0, 0, 0, 2000, 40, 4, 0, '', NULL, NULL),
('Harina', 'Recurso', 'cha', 0, 0, 1, 150, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Levadura', 'Recurso', 'cle', 1, 0, 1, 350, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Cacao molido', 'Recurso', 'cm', 0, 0, 1, 600, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Café molido', 'Recurso', 'fm', 0, 0, 1, 350, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Frasco de vinagre', 'Recurso', 'pfv', 0, 0, 1, 5000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Hongo druida', 'Recurso', 'hdr', 0, 1, 1, 20, 0, 0, 0, 2000, 50, 4, 0, '', NULL, NULL),
('Trozo de flor de hidra', 'Recurso', 'tfh', 0, 1, 1, 600, 0, 0, 0, 2000, 100, 4, 0, '', NULL, NULL),
('Trozo de ala de dragón', 'Recurso', 'tad', 0, 1, 1, 600, 0, 0, 0, 2500, 100, 4, 0, '', NULL, NULL),
('Onyx', 'Recurso', 'oyx', 0, 1, 1, 2000, 0, 0, 0, 1500, 200, 4, 0, '', NULL, NULL),
('Roca de los deseos', 'Recurso', 'dd', 0, 1, 1, 2000, 0, 0, 0, 1500, 200, 4, 0, '', NULL, NULL),
('Llave del grimorio del caos', 'Recurso', 'gtc', 0, 40, 1, 2000000, 0, 0, 0, 200, 12000, 4, 0, '', NULL, NULL),
('Grimorio del caos cerrado', 'Recurso', 'lgccc', 0, 40, 1, 6000000, 0, 0, 0, 70, 20000, 4, 0, '', NULL, NULL),
('Mercurio', 'Recurso', 'cme', 0, 0, 1, 200000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Oro líquido', 'Recurso', 'cmo', 0, 0, 1, 400000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Planta de algodón', 'Recurso', 'pal', 1, 0, 1, 500, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Algodón', 'Recurso', 'al', 0, 0, 1, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Muñeco', 'Recurso', 'mun', 0, 0, 1, 3000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Venda', 'Recurso', 'ven', 0, 0, 1, 2000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Tronco de madera', 'Recurso', 'tron', 1, 0, 1, 200, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Tronco de madera sabia', 'Recurso', 'tronms', 0, 20, 1, 18000, 0, 0, 0, 1000, 200, 4, 0, '', NULL, NULL),
('Tablón de madera', 'Recurso', 'tabl', 0, 0, 1, 400, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Tablón de madera sabia', 'Recurso', 'tablms', 0, 0, 1, 40000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Savia', 'Recurso', 'salv', 0, 0, 1, 200, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Savia de madera sabia', 'Recurso', 'salvms', 0, 0, 1, 19000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Estatuilla de madera', 'Recurso', 'est', 0, 20, 1, 1000, 0, 0, 0, 2000, 200, 4, 0, '', NULL, NULL),
('Estatuilla de madera sabia', 'Recurso', 'estms', 0, 30, 1, 60000, 0, 0, 0, 600, 600, 4, 0, '', NULL, NULL),
('Hongo vudú', 'Recurso', 'honvud', 0, 10, 1, 200, 0, 0, 0, 2000, 200, 4, 0, '', NULL, NULL),
('Esporas', 'Recurso', 'esp', 0, 0, 1, 2000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Aguja', 'Recurso', 'aguj', 0, 0, 1, 3, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Pinturas', 'Recurso', 'pint', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Hierro líquido', 'Recurso', 'hli', 0, 0, 1, 300, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Clavo', 'Recurso', 'clav', 0, 0, 1, 5, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Lingote de hierro', 'Recurso', 'hlin', 0, 0, 1, 600, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Lingote de oro', 'Recurso', 'olin', 0, 20, 1, 500000, 0, 0, 0, 100, 5000, 4, 0, '', NULL, NULL),
('Mineral de mercurio', 'Recurso', 'minm', 0, 20, 1, 150000, 0, 0, 0, 500, 300, 4, 0, '', NULL, NULL),
('Mineral de oro', 'Recurso', 'mino', 0, 20, 1, 300000, 0, 0, 0, 300, 500, 4, 0, '', NULL, NULL),
('Mineral de hierro', 'Recurso', 'minh', 1, 10, 1, 200, 0, 0, 0, 2000, 20, 4, 0, '', NULL, NULL),
('Minerales variados', 'Recurso', 'minv', 1, 5, 1, 75, 0, 0, 0, 2000, 10, 4, 0, '', NULL, NULL),
('Vial de eter', 'Recurso', 'pvet', 0, 0, 1, 400, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Pegamento', 'Recurso', 'peg', 0, 0, 1, 700, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Espejo', 'Recurso', 'espj', 0, 0, 1, 250000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Espejo sabio', 'Recurso', 'esps', 0, 0, 1, 300000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Clavo de oro', 'Recurso', 'clavo', 0, 0, 1, 7500, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Aguja de oro', 'Recurso', 'agujo', 0, 0, 1, 4000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Herramientas de forja avanzada', 'Recurso', 'hfa', 0, 0, 1, 800, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Hueso', 'Recurso', 'hu', 0, 10, 1, 100, 0, 0, 0, 500, 20, 4, 0, '', NULL, NULL),
('Calavera', 'Recurso', 'cal', 0, 10, 1, 150, 0, 0, 0, 400, 50, 4, 0, '', NULL, NULL),
('Símbolo', 'Recurso', 'sm', 0, 30, 1, 10000, 0, 0, 0, 200, 800, 4, 0, '', NULL, NULL),
('Símbolo de oro', 'Recurso', 'smo', 0, 30, 1, 100000, 0, 0, 0, 30, 3000, 4, 0, '', NULL, NULL),
('Agua bendita', 'Recurso', 'ab', 0, 0, 1, 4, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Agua sagrada', 'Recurso', 'as', 0, 0, 1, 5000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Caja de portal dimensional', 'Recurso', 'cpd', 0, 70, 1, 25000000, 0, 0, 0, 4, 190000, 4, 0, '', NULL, NULL),
('Esfera del averno', 'Recurso', 'eava', 0, 0, 1, 50000000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Esfera celestial', 'Recurso', 'ecl', 0, 0, 1, 50000000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Carbón dulce', 'Alimento', 'carbond', 0, 0, 1, 0, 130, 0, 0, 0, 0, 2, 0, '', NULL, 'Regalo que reciben, en navidad, los usuarios que han sido malos durante el año.'),
('Carbón', 'Recurso', 'carbon', 0, 0, 1, 0, 1300, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Hechizo: Caos', 'Hechizo', 'pcnn', 0, 0, 80, 0, 0, 100, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Aniquilación', 'Hechizo', 'pcnr', 0, 0, 70, 0, 0, 45, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Horda fantasmal', 'Hechizo', 'phf', 0, 0, 62, 0, 20, 20, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Invocación divina', 'Hechizo', 'phe', 0, 0, 61, 0, 12, 33, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Coraje divino', 'Hechizo', 'phd', 0, 0, 60, 0, 10, 24, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Materialización fantasmal', 'Hechizo', 'pmf', 0, 0, 53, 0, 10, 20, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Furia caótica', 'Hechizo', 'pcna', 0, 0, 50, 0, 0, 26, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Monstruosidad', 'Hechizo', 'pne', 0, 0, 50, 0, 0, 26, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Lanzador de clavos fantasmal', 'Hechizo', 'plcf', 0, 0, 47, 0, 0, 22, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Esqueleto veloz', 'Hechizo', 'pnd', 0, 0, 47, 0, 0, 22, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Desorden de la realidad', 'Hechizo', 'pcnz', 0, 0, 44, 0, 0, 20, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Congelar alma', 'Hechizo', 'pcca', 0, 0, 42, 0, 0, 20, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Devastación vudú', 'Hechizo', 'hve', 0, 0, 44, 0, 0, 19, 110, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Paradoja temporal', 'Hechizo', 'pcan', 0, 0, 39, 0, 5, 13, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Invocación fantasmal', 'Hechizo', 'pif', 0, 0, 40, 0, 0, 18, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Reflejo fantasmal', 'Hechizo', 'prf', 0, 0, 40, 0, 18, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Desatar infierno', 'Hechizo', 'pcrn', 0, 0, 39, 0, 0, 18, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Calavera voladora', 'Hechizo', 'pnc', 0, 0, 39, 0, 0, 18, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Velocidad', 'Hechizo', 'pcar', 0, 0, 35, 0, 7, 9, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Dragón de energía', 'Hechizo', 'pcbv', 0, 0, 35, 0, 0, 16, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Aura divina', 'Hechizo', 'phc', 0, 0, 35, 0, 16, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Inflingir enfermedad', 'Hechizo', 'pcnb', 0, 0, 37, 0, 0, 15, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Terremoto', 'Hechizo', 'pcvr', 0, 0, 31, 0, 0, 14, 90, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Enredaderas protectoras', 'Hechizo', 'pcva', 0, 0, 31, 0, 14, 0, 80, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Confusión vudú', 'Hechizo', 'hvd', 0, 0, 33, 0, 14, 0, 100, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Ayudante putrefacto', 'Hechizo', 'pnb', 0, 0, 33, 0, 0, 14, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Poder elemental del hielo', 'Hechizo', 'pccr', 0, 0, 31, 0, 7, 7, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Guerrero ilusorio', 'Hechizo', 'pcgi', 0, 0, 31, 0, 6, 8, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Llamada a la naturaleza', 'Hechizo', 'pcvv', 0, 0, 30, 0, 4, 9, 70, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Criatura de energía', 'Hechizo', 'pcbz', 0, 0, 28, 0, 0, 12, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Ayudante de huesos', 'Hechizo', 'pna', 0, 0, 28, 0, 0, 12, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Levitación', 'Hechizo', 'pcle', 0, 0, 28, 0, 12, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Soplo divino', 'Hechizo', 'phb', 0, 0, 28, 0, 12, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Presentir', 'Hechizo', 'pcav', 0, 0, 23, 0, 10, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Bendición', 'Hechizo', 'pha', 0, 0, 20, 0, 10, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Poder elemental del fuego', 'Hechizo', 'pcrv', 0, 0, 24, 0, 5, 5, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Gran variación del tiempo', 'Hechizo', 'pcaa', 0, 0, 20, 0, 4, 5, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Locura', 'Hechizo', 'pclo', 0, 0, 22, 0, 3, 6, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Enredaderas', 'Hechizo', 'pcvc', 0, 0, 20, 0, 2, 6, 50, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Ceguera vudú', 'Hechizo', 'hvc', 0, 0, 22, 0, 0, 8, 60, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Asfixia', 'Hechizo', 'pcba', 0, 0, 20, 0, 0, 8, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Aura de hielo', 'Hechizo', 'pccv', 0, 0, 18, 0, 7, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Rayo de fuego', 'Hechizo', 'pcra', 0, 0, 18, 0, 0, 7, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Control vudú', 'Hechizo', 'hvb', 0, 0, 20, 0, 0, 7, 40, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Rayo de hielo', 'Hechizo', 'pccm', 0, 0, 16, 0, 0, 6, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Variación del tiempo', 'Hechizo', 'pcab', 0, 0, 12, 0, 2, 3, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Falso eclipse', 'Hechizo', 'pce', 0, 0, 14, 0, 5, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Heridas cicatrizantes', 'Hechizo', 'pcvb', 0, 0, 14, 0, 5, 0, 20, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Aura de fuego', 'Hechizo', 'pcrz', 0, 0, 14, 0, 5, 0, 0, 0, 0, 1, 0, '', NULL, NULL);
INSERT INTO `objetos` (`nombreobj`, `tipo`, `img`, `nivelcomprar`, `nivelencontrar`, `niveluso`, `valor`, `prot`, `ataq`, `vida`, `posibilidad`, `puntosencontrar`, `usos`, `set`, `pasivas`, `texto`, `descripcion`) VALUES
('Hechizo: Herida vudú', 'Hechizo', 'hva', 0, 0, 16, 0, 0, 5, 30, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Bola de fuego', 'Hechizo', 'pcrb', 0, 0, 12, 0, 0, 4, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Telekinesia', 'Hechizo', 'pcbr', 0, 0, 12, 0, 0, 4, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Falsas enredaderas', 'Hechizo', 'pcen', 0, 0, 12, 0, 0, 4, 10, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Fortaleza', 'Hechizo', 'pcbc', 0, 0, 9, 0, 3, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Bola de hielo', 'Hechizo', 'pccb', 0, 0, 9, 0, 0, 3, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Falsa niebla', 'Hechizo', 'pcno', 0, 0, 9, 0, 3, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Falsa neblina', 'Hechizo', 'pcn', 0, 0, 7, 0, 2, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Misil mágico', 'Hechizo', 'pmm', 0, 0, 5, 0, 0, 1, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Destello', 'Hechizo', 'pd', 0, 0, 5, 0, 1, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Arma adimensional', 'Arma', 'adima', 0, 0, 140, 0, 1, 140, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo adimensional', 'Escudo', 'adime', 0, 0, 120, 0, 70, 10, 0, 0, 0, 0, 0, '', NULL, NULL),
('Botas adimensionales', 'Botas', 'adimb', 0, 0, 85, 0, 0, 15, 0, 0, 0, 0, 0, '', NULL, NULL),
('Coraza adimensional', 'Coraza', 'adimc', 0, 0, 110, 0, 60, 5, 0, 0, 0, 0, 0, '', NULL, NULL),
('Perneras adimensionales', 'Perneras', 'adimp', 0, 0, 95, 0, 45, 2, 0, 0, 0, 0, 0, '', NULL, NULL),
('Yelmo adimensional', 'Yelmo', 'adimy', 0, 0, 100, 0, 45, 5, 0, 0, 0, 0, 0, '', NULL, NULL),
('Amuleto adimensional', 'Amuleto', 'adimm', 0, 0, 90, 0, 7, 7, 80, 0, 0, 0, 0, '', NULL, NULL),
('Tomo de la nigromancia', 'Libro', 'ln', 0, 40, 1, 1000000, 0, 120, 0, 300, 3000, 3, 0, '', NULL, NULL),
('Manual de preparativos clericales', 'Libro', 'lpc', 0, 32, 1, 800000, 0, 70, 0, 400, 2000, 3, 0, '', NULL, NULL),
('Tomo de la clerecía', 'Libro', 'lhc', 0, 40, 1, 1000000, 0, 120, 0, 300, 3000, 3, 0, '', NULL, NULL),
('Grimorio de alteración dimensional', 'Libro', 'lade', 0, 60, 1, 10000000, 0, 1500, 0, 50, 20000, 3, 0, '', NULL, NULL),
('Tomo de alteración dimensional aplicada', 'Libro', 'ladea', 0, 80, 1, 32000000, 0, 1600, 0, 10, 90000, 3, 0, '', NULL, NULL),
('Manual de creación de artilugios', 'Libro', 'lca', 0, 2, 1, 6000, 0, 10, 0, 2000, 120, 3, 0, '', NULL, NULL),
('Tomo de diseño de atrezzo', 'Libro', 'lda', 0, 12, 1, 26000, 0, 14, 0, 60, 6000, 3, 0, '', NULL, 'Este tomo contiene recetas para fabricar insignias para clanes.'),
('Manual de creación de artefactos', 'Libro', 'lcaa', 0, 38, 1, 490000, 0, 65, 0, 1000, 5000, 3, 0, '', NULL, NULL),
('Tomo de los preparativos vudú', 'Libro', 'lpv', 0, 35, 1, 300000, 0, 90, 0, 1000, 1000, 3, 0, '', NULL, NULL),
('Tomo de los hechizos vudú', 'Libro', 'lv', 0, 40, 1, 400000, 0, 120, 0, 1000, 1000, 3, 0, '', NULL, NULL),
('Manual de preparación de espejos', 'Libro', 'lpe', 0, 45, 1, 700000, 0, 30, 0, 1000, 2000, 3, 0, '', NULL, NULL),
('Grimorio del medium', 'Libro', 'lm', 0, 50, 1, 900000, 0, 150, 0, 700, 4000, 3, 0, '', NULL, NULL),
('Manual de forja de herramientas', 'Libro', 'lfh', 1, 15, 1, 5000, 0, 20, 0, 20, 100, 3, 0, '', NULL, NULL),
('Manual de carpintería', 'Libro', 'lc', 0, 10, 1, 10000, 0, 25, 0, 3000, 200, 3, 0, '', NULL, NULL),
('Manual de fundición', 'Libro', 'lf', 0, 15, 1, 15000, 0, 35, 0, 1500, 500, 3, 0, '', NULL, NULL),
('Manual de refinado', 'Libro', 'lr', 0, 20, 1, 25000, 0, 25, 0, 1000, 700, 3, 0, '', NULL, NULL),
('Tomo del gran druida', 'Libro', 'lgd', 0, 35, 1, 250000, 0, 85, 0, 700, 1000, 3, 0, '', NULL, NULL),
('Tomo avanzado del druida', 'Libro', 'lad', 0, 15, 1, 25000, 0, 45, 0, 200, 300, 3, 0, '', NULL, NULL),
('Tomo del control de la energía', 'Libro', 'lce', 0, 40, 1, 1000000, 0, 30, 0, 700, 1200, 3, 0, '', NULL, NULL),
('Recetario del gran gourmet', 'Libro', 'lgg', 0, 40, 1, 1000000, 0, 150, 0, 700, 1500, 3, 0, '', NULL, NULL),
('Tomo básico del druida', 'Libro', 'lbd', 1, 5, 1, 5000, 0, 15, 0, 2000, 100, 3, 0, '', NULL, NULL),
('Recetario del gourmet', 'Libro', 'lg', 0, 35, 1, 500000, 0, 100, 0, 1500, 1200, 3, 0, '', NULL, NULL),
('Recetario de cocina mágica avanzada', 'Libro', 'lcma', 0, 30, 1, 350000, 0, 80, 0, 1500, 770, 3, 0, '', NULL, NULL),
('Recetario de repostería mágica básica', 'Libro', 'lrb', 0, 22, 1, 150000, 0, 42, 0, 1500, 370, 3, 0, '', NULL, NULL),
('Recetario de cocina mágica básica', 'Libro', 'lcmb', 0, 20, 1, 200000, 0, 50, 0, 1500, 400, 3, 0, '', NULL, NULL),
('Libro de los secretos del café', 'Libro', 'lsc', 0, 22, 1, 100000, 0, 32, 0, 2000, 400, 3, 0, '', NULL, NULL),
('Recetario de batidos', 'Libro', 'lb', 0, 15, 1, 15000, 0, 12, 0, 4000, 300, 3, 0, '', NULL, NULL),
('Manual de prensado', 'Libro', 'lmp', 0, 16, 1, 45000, 0, 40, 0, 4000, 400, 3, 0, '', NULL, NULL),
('Manual de introducción a la magia', 'Libro', 'lim', 1, 1, 1, 5000, 0, 20, 0, 2000, 200, 3, 0, '', NULL, NULL),
('Manual de destilación', 'Libro', 'lmd', 0, 15, 1, 35000, 0, 35, 0, 4000, 300, 3, 0, '', NULL, NULL),
('Recetario de zumos de hortalizas', 'Libro', 'lzh', 1, 5, 1, 400, 0, 15, 0, 2000, 70, 3, 0, '', NULL, NULL),
('Recetario de zumos de frutas', 'Libro', 'lzf', 1, 5, 1, 1000, 0, 25, 0, 2000, 100, 3, 0, '', NULL, NULL),
('Manual de introducción al ilusionismo', 'Libro', 'li', 0, 10, 1, 10000, 0, 28, 0, 4000, 500, 3, 0, '', NULL, NULL),
('Grimorio de las ilusiones', 'Libro', 'lgi', 0, 20, 1, 200000, 0, 42, 0, 1200, 800, 3, 0, '', NULL, NULL),
('Grimorio de la energía', 'Libro', 'lge', 0, 30, 1, 300000, 0, 52, 0, 1500, 1000, 3, 0, '', NULL, NULL),
('Grimorio del fuego', 'Libro', 'lgf', 0, 35, 1, 340000, 0, 56, 0, 1500, 1000, 3, 0, '', NULL, NULL),
('Grimorio del hielo', 'Libro', 'lghh', 0, 40, 1, 360000, 0, 64, 0, 1500, 1000, 3, 0, '', NULL, NULL),
('Grimorio del tiempo', 'Libro', 'lght', 0, 42, 1, 450000, 0, 80, 0, 1200, 1200, 3, 0, '', NULL, NULL),
('Grimorio del caos', 'Libro', 'lgcc', 0, 0, 1, 16000000, 0, 800, 0, 0, 0, 3, 0, '', NULL, NULL),
('Grimorio de la vida', 'Libro', 'lgvv', 0, 45, 1, 1300000, 0, 150, 0, 1200, 1500, 3, 0, '', NULL, NULL),
('Hacha de Xilok', 'Arma', 'xar', 0, 0, 135, 250000000, 13, 100, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo de Xilok', 'Escudo', 'xes', 0, 0, 135, 250000000, 68, 10, 0, 0, 0, 0, 0, '', NULL, NULL),
('Botas de Xilok', 'Botas', 'xbo', 0, 0, 100, 250000000, 3, 13, 0, 0, 0, 0, 0, '', NULL, NULL),
('Coraza de Xilok', 'Coraza', 'xco', 0, 0, 120, 250000000, 55, 8, 0, 0, 0, 0, 0, '', NULL, NULL),
('Perneras de Xilok', 'Perneras', 'xpe', 0, 0, 100, 250000000, 40, 5, 0, 0, 0, 0, 0, '', NULL, NULL),
('Máscara de Xilok', 'Yelmo', 'xye', 0, 0, 131, 250000000, 42, 10, 0, 0, 0, 0, 0, '', NULL, NULL),
('Amuleto de Xilok', 'Amuleto', 'xam', 0, 0, 130, 250000000, 11, 11, 20, 0, 0, 0, 0, '', NULL, NULL),
('Bola de arbolito roja', 'Navidad', 'zbanr', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Bola de arbolito azul', 'Navidad', 'zbana', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Bola de arbolito verde', 'Navidad', 'zbanv', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Bola de arbolito amarilla', 'Navidad', 'zband', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Arbolito', 'Navidad', 'zar', 0, 0, 1, 20, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Estrella de arbolito', 'Navidad', 'zean', 0, 0, 1, 15, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Arbolito de navidad', 'Navidad', 'zarn', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Arbolito de navidad con regalos', 'Navidad', 'zarnr', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Libro de montaje de arbolitos', 'Navidad', 'zln', 0, 0, 1, 20, 0, 10, 0, 0, 0, 3, 0, '', NULL, NULL),
('Joya premium', 'Premium', 'rprem', 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, '', NULL, NULL),
('Manual de infusión de vida', 'Libro', 'rrrlo', 0, 1, 1, 0, 0, 15, 0, 0, 0, 3, 0, '', NULL, NULL),
('Estatua esmeralda', 'Recurso', 'rrrppa', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Gárgola esmeralda viviente', 'Mascota', 'rrrppat', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Ramas de bambú', 'Recurso', 'jrb', 0, 1, 1, 10000, 12, 0, 0, 5000, 100, 4, 0, '', NULL, NULL),
('Estatua rubí', 'Recurso', 'rrros', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Gárgola rubí viviente', 'Mascota', 'rrrost', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Jarra de miel', 'Alimento', 'jmi', 0, 1, 1, 10000, 17, 0, 0, 5000, 100, 2, 0, '', NULL, 'El alimento favorito de los osos amarillos.'),
('Mono', 'Mascota', 'sp', 1, 0, 1, 10000, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Buho', 'Mascota', 'mab', 0, 50, 1, 40000, 0, 0, 0, 500, 500, 6, 0, '', NULL, NULL),
('Cuervo', 'Mascota', 'mar', 0, 75, 1, 400000, 0, 0, 0, 100, 5000, 6, 0, '', NULL, NULL),
('Bufalo', 'Mascota', 'mac', 0, 10, 1, 10000, 0, 0, 0, 2500, 200, 6, 0, '', NULL, NULL),
('Pollo', 'Mascota', 'map', 1, 0, 1, 500, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Perro', 'Mascota', 'mag', 0, 70, 1, 100000, 0, 0, 0, 200, 6000, 6, 0, '', NULL, NULL),
('Gato', 'Mascota', 'mam', 0, 70, 1, 100000, 0, 0, 0, 200, 6000, 6, 0, '', NULL, NULL),
('Conejo', 'Mascota', 'marr', 0, 80, 1, 150000, 0, 0, 0, 300, 5000, 6, 0, '', NULL, NULL),
('Ordok', 'Mascota', 'mat', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Diablillo ígneo', 'Mascota', 'mazf', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Diablillo gélido', 'Mascota', 'mazh', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Aniquiladora Divina', 'Arma', 'rrree', 0, 180, 200, 750000000, 0, 300, 0, 2, 320000, 0, 0, '', NULL, NULL),
('Hacha de la devastación', 'Arma', 'rrrahc', 0, 170, 190, 650000000, 0, 250, 0, 3, 320000, 0, 0, '', NULL, NULL),
('Espada de la bondad', 'Arma', 'rrrgja', 0, 180, 180, 600000000, 30, 170, 0, 4, 320000, 0, 0, '', NULL, NULL),
('Hacha extraña', 'Arma', 'rrrhh', 0, 160, 175, 550000000, 0, 165, 0, 9, 320000, 0, 0, '', NULL, NULL),
('Gran espada curva', 'Arma', 'rrrecur', 0, 170, 170, 500000000, 65, 100, 0, 10, 320000, 0, 0, '', NULL, NULL),
('Gran hacha de la experiencia', 'Arma', 'rrrhase', 0, 165, 165, 360000000, 35, 100, 0, 30, 320000, 0, 0, '', NULL, NULL),
('Hacha de la experiencia', 'Arma', 'rrrju', 0, 155, 155, 260000000, 25, 100, 0, 300, 320000, 0, 0, '', NULL, NULL),
('Lanza tribal', 'Arma', 'rrrlanz', 0, 150, 150, 250000000, 15, 100, 0, 120, 150000, 0, 0, '', NULL, NULL),
('Hacha mitológica', 'Arma', 'rrrhd', 0, 145, 140, 225000000, 10, 100, 0, 220, 110000, 0, 0, '', NULL, NULL),
('Espada de hojas', 'Arma', 'rrrgh', 0, 140, 120, 200000000, 20, 87, 0, 60, 300000, 0, 0, '', NULL, NULL),
('Maza mecánica', 'Arma', 'rrrmpi', 0, 140, 130, 150000000, 50, 57, 0, 220, 100000, 0, 0, '', NULL, NULL),
('Tridente mitológico', 'Arma', 'wtrid', 0, 121, 121, 80000000, 24, 60, 0, 60, 100000, 0, 0, '', NULL, NULL),
('Lanza mitológica', 'Arma', 'warg', 0, 131, 131, 75000000, 18, 66, 0, 190, 60000, 0, 0, '', NULL, NULL),
('Maza elemental de hielo', 'Arma', 'rrrmel', 0, 110, 110, 5500000, 10, 70, 0, 110, 75000, 0, 3, '', NULL, NULL),
('Puñal de cristal de alma', 'Arma', 'rrrpun', 0, 100, 100, 22000000, 20, 50, 0, 1000, 35000, 0, 0, '', NULL, NULL),
('Sable de honor', 'Arma', 'rrrach', 0, 90, 90, 20000000, 10, 80, 0, 350, 55000, 0, 0, '', NULL, NULL),
('Defensor Demoniaco', 'Escudo', 'rrrm', 0, 180, 200, 750000000, 150, 0, 0, 2, 320000, 0, 20, '', NULL, NULL),
('Escudo arcaico', 'Escudo', 'rrrce', 0, 160, 160, 500000000, 100, 0, 0, 100, 31337, 0, 0, '', NULL, NULL),
('Escudo tribal', 'Escudo', 'rrrtr', 0, 140, 140, 225000000, 89, 1, 0, 200, 110000, 0, 0, '', NULL, NULL),
('Escudo templario', 'Escudo', 'wetem', 0, 120, 120, 100000000, 60, 6, 0, 300, 50000, 0, 0, '', NULL, NULL),
('Escudo de alma de dragón', 'Escudo', 'rrred', 0, 80, 80, 60000000, 41, 0, 0, 350, 40000, 0, 4, '', NULL, NULL),
('Cabeza del Mal', 'Yelmo', 'rrrym', 0, 180, 200, 750000000, 80, 0, 0, 2, 320000, 0, 0, '', NULL, NULL),
('Yelmo espiritual', 'Yelmo', 'rrrcef', 0, 170, 170, 650000000, 60, 0, 0, 40, 200000, 0, 0, '', NULL, NULL),
('Yelmo oscuro', 'Yelmo', 'rrrpoa', 0, 150, 150, 390000000, 46, 3, 0, 180, 110000, 0, 0, '', NULL, NULL),
('Yelmo poseído', 'Yelmo', 'wrra', 0, 130, 130, 150000000, 40, 6, 0, 300, 75000, 0, 0, '', NULL, NULL),
('Casco cortante', 'Yelmo', 'rrrcal', 0, 110, 110, 70000000, 32, 9, 0, 400, 50000, 0, 0, '', NULL, NULL),
('Estrella Polar', 'Amuleto', 'rrram', 0, 170, 200, 30000000, 12, 12, 45, 6, 320000, 0, 0, '', NULL, NULL),
('Pulpo', 'Alimento', 'wcal', 0, 23, 1, 5200, 18, 0, 0, 600, 150, 2, 0, '', NULL, 'Cefalópodo marino de los mares de Lifo.'),
('Túnica del Sol', 'Coraza', 'rrrctr', 0, 180, 200, 750000000, 100, 0, 0, 2, 320000, 0, 0, '', NULL, NULL),
('Coraza de capas', 'Coraza', 'rrrarm', 0, 160, 160, 700000000, 80, 0, 0, 120, 300000, 0, 0, '', NULL, NULL),
('Coraza ascendida', 'Coraza', 'rrrca', 0, 140, 140, 250000000, 60, 1, 0, 350, 150000, 0, 0, '', NULL, NULL),
('Cetro de invocación de dragones', 'Recurso', 'rrrvdr', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Tomo de los dragones', 'Libro', 'rrrgl', 0, 100, 1, 100000000, 0, 300, 0, 500, 50000, 3, 0, '', NULL, NULL),
('Dragón', 'Mascota', 'mad', 0, 0, 1, 100000000, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Amanecer', 'Arma', 'rrrram', 0, 250, 300, 3000000000, 0, 777, 0, 1, 500000, 0, 0, '', NULL, NULL),
('Devastador Demoniaco', 'Arma', 'rrrrdv', 0, 250, 275, 2000000000, 0, 666, 0, 1, 450000, 0, 20, '', NULL, NULL),
('Espadón templario', 'Arma', 'rrrret', 0, 200, 230, 1600000000, 50, 415, 0, 4, 420000, 0, 0, '', NULL, NULL),
('Hacha protectora', 'Arma', 'rrrrhp', 0, 220, 210, 1200000000, 300, 100, 0, 15, 150000, 0, 0, '', NULL, NULL),
('Espada de mithril', 'Arma', 'rrrrehm', 0, 230, 200, 1100000000, 150, 250, 0, 20, 40000, 0, 0, '', NULL, NULL),
('Gran hacha', 'Arma', 'rrrrgh', 0, 220, 220, 1600000000, 10, 399, 0, 6, 370000, 0, 0, '', NULL, NULL),
('Cuchillo trágico', 'Arma', 'rrrrct', 0, 160, 220, 1400000000, 0, 400, 0, 2, 400000, 0, 0, '', NULL, NULL),
('Sable pirata', 'Arma', 'rrrrp', 0, 200, 205, 900000000, 20, 360, 0, 7, 350000, 0, 0, '', NULL, NULL),
('Martillo de opresión', 'Arma', 'rrrrm', 0, 210, 200, 850000000, 50, 330, 0, 8, 340000, 0, 0, '', NULL, NULL),
('Vara de la muerte', 'Arma', 'rrrrv', 0, 200, 165, 1100000000, 0, 300, 0, 4, 350000, 0, 0, '', NULL, NULL),
('Sable de jade', 'Arma', 'rrrrj', 0, 200, 180, 650000000, 100, 150, 0, 10, 320000, 0, 0, '', NULL, NULL),
('Vara de la serpiente', 'Arma', 'rrrrvs', 0, 200, 160, 500000000, 100, 150, 0, 19, 80000, 0, 0, '', NULL, NULL),
('Extraño utensilio inutilizable', 'Recurso', 'rrrrarco', 0, 50, 1, 10000, 30, 0, 0, 1000, 100, 4, 0, '', NULL, NULL),
('Arma desconocida de amazona', 'Recurso', 'rrrrarcoa', 0, 50, 1, 10000, 30, 0, 0, 1000, 100, 4, 0, '', NULL, NULL),
('Botas dragón', 'Botas', 'bdr', 0, 180, 100, 650000000, 4, 17, 0, 20, 20000, 0, 0, '', NULL, NULL),
('Escudo de la orden del águila', 'Escudo', 'rrrrag', 0, 210, 230, 1200000000, 180, 20, 0, 2, 320000, 0, 0, '', NULL, NULL),
('Escudo de amazona', 'Escudo', 'rrrrea', 0, 210, 220, 850000000, 175, 0, 0, 7, 160000, 0, 0, '', NULL, NULL),
('Escudo de hueso', 'Escudo', 'rrrreh', 0, 200, 210, 750000000, 155, 0, 0, 10, 80000, 0, 0, '', NULL, NULL),
('Escudo de calaveras', 'Escudo', 'rrrrec', 0, 180, 180, 450000000, 130, 0, 0, 20, 40000, 0, 0, '', NULL, NULL),
('Coraza visceral', 'Coraza', 'rrrrcv', 0, 180, 180, 650000000, 90, 0, 0, 10, 40000, 0, 0, '', NULL, NULL),
('Coraza de amazona', 'Coraza', 'rrrrca', 0, 200, 160, 550000000, 70, 0, 0, 20, 25000, 0, 0, '', NULL, NULL),
('Perneras dragón', 'Perneras', 'rrrrpd', 0, 220, 200, 900000000, 60, 30, 0, 3, 250000, 0, 0, '', NULL, NULL),
('Perneras de amazona', 'Perneras', 'rrrrpa', 0, 180, 140, 88000000, 60, 0, 0, 20, 25000, 0, 0, '', NULL, NULL),
('Menú divino', 'Alimento', 'rrrrmd', 0, 200, 1, 50000000, 5000, 0, 0, 5, 200000, 2, 0, '', NULL, 'Alimento compuesto por manjares de otro mundo. Sólo para dioses.'),
('Amuleto templario', 'Amuleto', 'rrrrpt', 0, 230, 200, 70000000, 20, 23, 50, 2, 400000, 0, 0, '', NULL, NULL),
('Protector de almas', 'Amuleto', 'rrrrpda', 0, 180, 150, 18000000, 20, 0, 60, 5, 220000, 0, 0, '', NULL, NULL),
('Brillo del alba', 'Amuleto', 'rrrrba', 0, 120, 110, 12000000, 16, 0, 50, 9, 170000, 0, 0, '', NULL, NULL),
('Amuleto tétrico', 'Amuleto', 'rrrrat', 0, 100, 100, 9000000, 5, 9, 40, 13, 140000, 0, 0, '', NULL, NULL),
('Casco divino', 'Yelmo', 'rrrrccd', 0, 250, 250, 2000000000, 133, 33, 0, 1, 500000, 0, 0, '', NULL, NULL),
('Yelmo de cuernos de diablo', 'Yelmo', 'rrrrcd', 0, 240, 240, 1600000000, 105, 20, 0, 3, 350000, 0, 0, '', NULL, NULL),
('Diadema de la velocidad', 'Yelmo', 'rrrrddv', 0, 240, 240, 1300000000, 120, 0, 0, 10, 150000, 0, 0, '', NULL, NULL),
('Yelmo beato', 'Yelmo', 'rrrryb', 0, 230, 230, 1200000000, 105, 0, 0, 12, 150000, 0, 0, '', NULL, NULL),
('Yelmo de cuernos de minotauro', 'Yelmo', 'rrrrmin', 0, 230, 210, 1100000000, 60, 40, 0, 4, 350000, 0, 0, '', NULL, NULL),
('Yelmo de amazona', 'Yelmo', 'rrrryam', 0, 220, 210, 900000000, 90, 0, 0, 6, 200000, 0, 0, '', NULL, NULL),
('Diadema de duende', 'Yelmo', 'rrrrddu', 0, 210, 200, 800000000, 60, 25, 0, 3, 300000, 0, 0, '', NULL, NULL),
('Mascara del pánico', 'Yelmo', 'rrrrmp', 0, 180, 180, 700000000, 60, 5, 0, 20, 100000, 0, 0, '', NULL, NULL),
('Yelmo abierto', 'Yelmo', 'rrrrya', 0, 200, 200, 750000000, 80, 5, 0, 10, 130000, 0, 0, '', NULL, NULL),
('Cuadro de una croqueta', 'Recurso', 'rrrxa', 0, 12, 1, 30000, 0, 0, 0, 4, 200, 4, 0, '', NULL, NULL),
('Paisaje pintoresco', 'Recurso', 'rrrxb', 0, 12, 1, 30000, 0, 0, 0, 4, 200, 4, 0, '', NULL, NULL),
('Pintura de un yeti', 'Recurso', 'rrrxc', 0, 12, 1, 30000, 0, 0, 0, 4, 200, 4, 0, '', NULL, NULL),
('Mariposa de fuego', 'Recurso', 'rrrvmf', 0, 12, 1, 1500, 0, 0, 0, 12, 400, 4, 0, '', NULL, NULL),
('Mariposa de hielo', 'Recurso', 'rrrvmh', 0, 12, 1, 1500, 0, 0, 0, 12, 400, 4, 0, '', NULL, NULL),
('Símbolo sagrado', 'Recurso', 'rrrvsds', 0, 100, 1, 150000, 0, 0, 0, 4, 40000, 4, 0, '', NULL, NULL),
('Lámpara', 'Recurso', 'rrrla', 0, 130, 1, 180000, 0, 0, 0, 3, 80000, 4, 0, '', NULL, NULL),
('Tulipán', 'Recurso', 'rrrtu', 0, 10, 1, 100, 0, 0, 0, 30, 200, 4, 0, '', NULL, NULL),
('Rosa roja', 'Recurso', 'rrrrose', 0, 10, 1, 100, 0, 0, 0, 30, 200, 4, 0, '', NULL, NULL),
('Planta curativa', 'Recurso', 'rrrhu', 0, 10, 1, 12000, 0, 0, 0, 10, 20000, 4, 0, '', NULL, NULL),
('Jarrón decorado', 'Recurso', 'rrrj', 0, 180, 1, 120000, 0, 0, 0, 20, 10000, 4, 0, '', NULL, NULL),
('Globo de Lifo', 'Recurso', 'rrrge', 0, 200, 1, 1200000, 0, 0, 0, 5, 100000, 4, 0, '', NULL, NULL),
('Fruto tropical', 'Recurso', 'rrrfr', 0, 50, 1, 14000, 0, 0, 0, 50, 300, 4, 0, '', NULL, NULL),
('Corona', 'Recurso', 'rrrc', 0, 200, 1, 14000000, 0, 0, 0, 2, 300000, 4, 0, '', NULL, NULL),
('Cristal de magia', 'Recurso', 'rrrcv', 0, 80, 1, 100000, 0, 0, 0, 60, 2000, 4, 0, '', NULL, NULL),
('Esfera de cristal', 'Recurso', 'rrrbc', 0, 160, 1, 1000000, 0, 0, 0, 10, 200000, 4, 0, '', NULL, NULL),
('Polvo de estrellas', 'Recurso', 'rrrpm', 0, 140, 1, 800000, 0, 0, 0, 30, 40000, 4, 0, '', NULL, NULL),
('Piedra decorada', 'Recurso', 'rrrpma', 0, 1, 1, 50, 0, 0, 0, 5000, 400, 4, 0, '', NULL, NULL),
('Cofre del tesoro', 'Recurso', 'rrrts', 0, 230, 1, 100000000, 0, 0, 0, 2, 200000, 4, 0, '', NULL, NULL),
('Tomo del fuego', 'Recurso', 'rrrqr', 0, 200, 1, 750000000, 0, 0, 0, 8, 100000, 4, 0, '', NULL, NULL),
('Tomo del hielo', 'Recurso', 'rrrqa', 0, 200, 1, 750000000, 0, 0, 0, 8, 100000, 4, 0, '', NULL, NULL),
('Tomo de la vida', 'Recurso', 'rrrqv', 0, 230, 1, 1100000000, 0, 0, 0, 6, 200000, 4, 0, '', NULL, NULL),
('Tomo de la muerte', 'Recurso', 'rrrqg', 0, 230, 1, 1100000000, 0, 0, 0, 6, 200000, 4, 0, '', NULL, NULL),
('Tomo del tiempo', 'Recurso', 'rrrqam', 0, 230, 1, 1100000000, 0, 0, 0, 6, 200000, 4, 0, '', NULL, NULL),
('Tomo del control', 'Recurso', 'rrrqp', 0, 260, 1, 2200000000, 0, 0, 0, 3, 400000, 4, 0, '', NULL, NULL),
('Pergamino de encantamiento de cayados', 'Recurso', 'rrrp', 0, 100, 1, 200000, 0, 0, 0, 40, 28000, 4, 0, '', NULL, NULL),
('Pergamino de activación de varas', 'Recurso', 'rrrza', 0, 100, 1, 200000, 0, 0, 0, 20, 28000, 4, 0, '', NULL, NULL),
('Cayado del Archicanciller', 'Arma', 'rrrvoz', 0, 0, 200, 6000000000, 0, 888, 0, 0, 0, 0, 0, '', NULL, NULL),
('Vara activa', 'Arma', 'rrrveq', 0, 0, 200, 1600000000, 50, 400, 0, 0, 0, 0, 0, '', NULL, NULL),
('Vara de la gran serpiente', 'Arma', 'rrrvmd', 0, 0, 190, 1400000000, 100, 320, 0, 0, 0, 0, 0, '', NULL, NULL),
('Vara latente', 'Arma', 'rrrve', 0, 230, 200, 1100000000, 110, 210, 0, 20, 40000, 0, 0, '', NULL, NULL),
('Vara engarzada', 'Arma', 'rrrvh', 0, 220, 250, 1500000000, 120, 300, 0, 2, 400000, 0, 0, '', NULL, NULL),
('Bastón orbe', 'Arma', 'rrrvc', 0, 160, 220, 800000000, 175, 225, 0, 3, 200000, 0, 0, '', NULL, NULL),
('Cayado de fuego', 'Arma', 'rrrvob', 0, 260, 200, 950000000, 150, 240, 0, 1, 340000, 0, 0, '', NULL, NULL),
('Cayado de hielo', 'Arma', 'rrrvoa', 0, 260, 200, 950000000, 250, 140, 0, 1, 340000, 0, 3, '', NULL, NULL),
('Cayado de la vida', 'Arma', 'rrrvoc', 0, 0, 230, 1300000000, 250, 140, 0, 0, 0, 0, 0, '', NULL, NULL),
('Cayado de la muerte', 'Arma', 'rrrvon', 0, 0, 230, 1300000000, 50, 340, 0, 0, 0, 0, 0, '', NULL, NULL),
('Cayado del tiempo', 'Arma', 'rrrvod', 0, 0, 230, 1300000000, 150, 240, 0, 0, 0, 0, 0, '', NULL, NULL),
('Cayado del control', 'Arma', 'rrrvop', 0, 0, 260, 2600000000, 220, 220, 0, 0, 0, 0, 0, '', NULL, NULL),
('Báculo de defensa', 'Arma', 'rrrvhg', 0, 150, 150, 550000000, 115, 115, 0, 30, 190000, 0, 0, '', NULL, NULL),
('Cayado de talla mágica', 'Arma', 'rrrvom', 0, 0, 20, 20000, 8, 18, 0, 0, 0, 0, 0, '', NULL, NULL),
('Cayado', 'Arma', 'rrrvo', 0, 2, 2, 2000, 4, 9, 0, 400, 1000, 0, 0, '', NULL, NULL),
('Botas de la naturaleza', 'Botas', 'rrrbn', 0, 180, 120, 550000000, 4, 14, 0, 40, 10000, 0, 0, '', NULL, NULL),
('Escudo lagarto', 'Escudo', 'rrrvel', 0, 220, 230, 1000000000, 175, 10, 0, 3, 260000, 0, 0, '', NULL, NULL),
('Tomo de encantamiento de cayados', 'Libro', 'rrrql', 0, 180, 1, 144000000, 0, 500, 0, 20, 100000, 3, 0, '', NULL, NULL),
('Tomo de instrumentación mágica', 'Libro', 'rrrqs', 0, 200, 1, 244000000, 0, 1000, 0, 7, 500000, 3, 0, '', NULL, NULL),
('Tomo de mejora de varas', 'Libro', 'rrrqvv', 0, 200, 1, 200000000, 0, 800, 0, 8, 400000, 3, 0, '', NULL, NULL),
('Materia orgánica', 'Recurso', 'mup', 0, 1, 100, 10000, 0, 0, 0, 500, 200, 4, 0, '', NULL, NULL),
('Mutante XX', 'Mascota', 'muta', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Mutante XY', 'Mascota', 'mutb', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Mutante YY', 'Mascota', 'mutc', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Golem de lava', 'Mascota', 'mgl', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Golem vegetal', 'Mascota', 'mgv', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Golem de piedra', 'Mascota', 'mgp', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Mate', 'Alimento', 'arg', 0, 23, 1, 3200, 15, 0, 0, 6000, 150, 2, 0, '', NULL, 'Infusión hecha a partir de Yerba Mate.'),
('Dragón de huesos', 'Mascota', 'mra', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Escorpión', 'Mascota', 'mrb', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Espíritu de dragón', 'Mascota', 'mrc', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Halcón de fuego', 'Mascota', 'mrd', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Lagarto alado', 'Mascota', 'mre', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Insignia especial moderador', 'Especial', 'mod', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Insignia especial administrador', 'ADMIN', 'clangm', 0, 0, 1, 0, 10000, 10000, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial H', 'Z-Esp2', 'insh', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial K', 'Z-Esp3', 'insk', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial T', 'Z-Esp4', 'inst', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial B', 'Z-Esp5', 'insb', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial Z', 'Z-Esp6', 'insz', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Insignia especial J', 'Z-Esp7', 'insj', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo Campeonato - Primero', 'Z-Esp9', 'toi', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo Campeonato - Segundo', 'Z-Esp10', 'toii', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo Campeonato - Tercero', 'Z-Esp11', 'toiii', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Primer nivel trescientos', 'Z-Esp12', 'trescientos', 0, 0, 1, 0, 10, 10, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma de oro', 'Z-Esp13', 'trporo', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 2, '', NULL, NULL),
('Trofeo: Pluma de plata', 'Z-Esp14', 'trpplata', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma de bronce', 'Z-Esp15', 'trpbronce', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Pluma escritor', 'Z-Esp17', 'trpdos', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Competición mascotas', 'Z-Esp18', 'tab', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-A', 'Z-Esp19', 'trca', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-B', 'Z-Esp20', 'trcb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-C', 'Z-Esp21', 'trcc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-D', 'Z-Esp22', 'trcd', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-E', 'Z-Esp23', 'trce', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-F', 'Z-Esp24', 'trcf', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Carrera 14-G', 'Z-Esp25', 'trcg', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Primero', 'Z-Esp26', 'taaaa', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Segundo', 'Z-Esp27', 'taaab', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Tercero', 'Z-Esp28', 'taaac', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: I - Clan', 'Z-Esp29', 'taaad', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: II - Primero', 'Z-Esp30', 'taaba', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: II - Segundo', 'Z-Esp31', 'taabb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: II - Tercero', 'Z-Esp32', 'taabc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Primero', 'Z-Esp33', 'taaca', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Segundo', 'Z-Esp34', 'taacb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Tercero', 'Z-Esp35', 'taacc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: III - Clan', 'Z-Esp36', 'taacd', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: IV - Primero', 'Z-Esp37', 'taada', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: IV - Segundo', 'Z-Esp38', 'taadb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: IV - Tercero', 'Z-Esp39', 'taadc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: V - Primero', 'Z-Esp40', 'taaea', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: V - Segundo', 'Z-Esp41', 'taaeb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: V - Tercero', 'Z-Esp42', 'taaec', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: VI - Primero', 'Z-Esp43', 'taafa', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: VI - Segundo', 'Z-Esp44', 'taafb', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: VI - Tercero', 'Z-Esp45', 'taafc', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Historia oro', 'Z-Esp47', 'trhoro', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Historia plata', 'Z-Esp48', 'trhplata', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Historia bronce', 'Z-Esp49', 'trhbronce', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Competición Variedades', 'Z-Esp50', 'trdv', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Competición Clanes', 'Z-Esp51', 'trdc', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Primer nivel cuatrocientos', 'Z-Esp52', 'cuatrocientos', 0, 0, 1, 0, 10, 10, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: La búsqueda oscura', 'Z-Esp53', 'trbos', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Combates - Primero', 'Z-Esp54', 'trfa', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Combates - Segundo', 'Z-Esp55', 'trfb', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Trofeo: Combates - Tercero', 'Z-Esp56', 'trfc', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Mapache', 'Mascota', 'hdanimalmarino', 1, 0, 1, 100, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Esquirla de joya premium', 'Premium', 'rpreme', 0, 1, 0, 0, 0, 0, 0, 10, 0, 8, 0, '', NULL, NULL),
('Manual de manipulación de joyería', 'Libro', 'rljp', 1, 0, 1, 50, 0, 10, 0, 0, 0, 3, 0, '', NULL, NULL),
('Trozo de mapa A', 'Recurso', 'rmapaapua', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Trozo de mapa B', 'Recurso', 'rmapaapub', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Trozo de mapa C', 'Recurso', 'rmapaapuc', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Trozo de mapa D', 'Recurso', 'rmapaapud', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Trozo de mapa E', 'Recurso', 'rmapaapue', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Trozo de mapa F', 'Recurso', 'rmapaapuf', 0, 0, 0, 10000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Mapa: Campos de Lifo', 'Mapa', 'rmapaacl', 0, 0, 1, 0, 0, 5, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Bosques de Lifo', 'Mapa', 'rmapaabl', 0, 0, 7, 0, 0, 5, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Gruta helada', 'Mapa', 'rmapaagh', 0, 0, 19, 0, 0, 10, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Laberinto de hielo', 'Mapa', 'rmapaalh', 0, 0, 32, 0, 0, 15, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Montaña helada', 'Mapa', 'rmapaamh', 0, 0, 36, 0, 0, 20, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Cordillera helada', 'Mapa', 'rmapaach', 0, 0, 50, 0, 0, 25, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Cima nevada', 'Mapa', 'rmapaacn', 0, 0, 70, 0, 0, 33, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Escalera al cielo', 'Mapa', 'rmapaaen', 0, 0, 85, 0, 0, 35, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Reino celestial', 'Mapa', 'rmapaarc', 0, 0, 110, 0, 0, 70, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Cueva de la plata', 'Mapa', 'rmapaacp', 0, 0, 12, 0, 0, 10, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Mina de oro', 'Mapa', 'rmapaamo', 0, 0, 25, 0, 0, 15, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Descenso profundo', 'Mapa', 'rmapaadp', 0, 0, 34, 0, 0, 20, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Inframundo', 'Mapa', 'rmapaaim', 0, 0, 50, 0, 0, 25, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Río de lava', 'Mapa', 'rmapaarl', 0, 0, 60, 0, 0, 30, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Centro de volcán', 'Mapa', 'rmapaacv', 0, 0, 77, 0, 0, 35, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Puertas del infierno', 'Mapa', 'rmapaapi', 0, 0, 110, 0, 0, 70, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Purgatorio', 'Mapa', 'rmapaapu', 0, 0, 120, 0, 0, 70, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Limbo', 'Mapa', 'rmapaali', 0, 0, 120, 0, 0, 70, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Comarca', 'Mapa', 'rrrme', 0, 0, 65, 0, 0, 32, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Biblioteca', 'Mapa', 'rmapaabi', 0, 0, 75, 0, 0, 42, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Torre del mago', 'Mapa', 'rmapaato', 0, 0, 90, 0, 0, 55, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Mazmorra', 'Mapa', 'rmapaama', 0, 0, 96, 0, 0, 57, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Templo subterráneo', 'Mapa', 'rmapaats', 0, 0, 100, 0, 0, 67, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Cueva submarina', 'Mapa', 'rmapaacs', 0, 0, 105, 0, 0, 69, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Mares de Lifo', 'Mapa', 'rrrmm', 0, 0, 125, 0, 0, 80, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Artefacto náutico', 'Mapa', 'rmapaaan', 0, 0, 130, 0, 0, 95, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Ciudad acuática', 'Mapa', 'rmapaaca', 0, 0, 140, 0, 0, 110, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Portal', 'Mapa', 'rmapaapo', 0, 0, 150, 0, 0, 150, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Luna Aio', 'Mapa', 'rmapaala', 0, 0, 180, 0, 0, 160, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Luna Phobos', 'Mapa', 'rmapaalb', 0, 0, 180, 0, 0, 160, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Luna Dremek', 'Mapa', 'rmapaalc', 0, 0, 180, 0, 0, 160, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Planeta Aeron', 'Mapa', 'rmapaald', 0, 0, 200, 0, 0, 200, 0, 0, 0, 7, 0, '', NULL, NULL),
('Anillo del destino', 'Anillo', 'rfd', 0, 250, 250, 2500000000, 160, 0, 0, 1, 500000, 0, 0, '', NULL, NULL),
('Anillo de la muerte', 'Anillo', 'rfmu', 0, 240, 200, 1400000000, 130, 20, 0, 2, 350000, 0, 0, '', NULL, NULL),
('Anillo de las estrellas', 'Anillo', 'rfes', 0, 190, 190, 1100000000, 120, 10, 0, 2, 150000, 0, 0, '', NULL, NULL),
('Anillo mágico', 'Anillo', 'rfma', 0, 170, 170, 1000000000, 120, 0, 0, 2, 150000, 0, 0, '', NULL, NULL),
('Anillo de los deseos', 'Anillo', 'rfad', 0, 150, 150, 600000000, 90, 25, 0, 2, 200000, 0, 0, '', NULL, NULL),
('Anillo ancho', 'Anillo', 'rfga', 0, 130, 130, 800000000, 68, 2, 0, 4, 100000, 0, 0, '', NULL, NULL),
('Anillo encantado', 'Anillo', 'rfe', 0, 120, 120, 24000000, 35, 6, 0, 1, 120000, 0, 0, '', NULL, NULL),
('Anillo con ruby', 'Anillo', 'rfr', 0, 95, 95, 16000000, 20, 25, 0, 4, 80000, 0, 0, '', NULL, NULL),
('Anillo de cristal', 'Anillo', 'rfcr', 0, 72, 72, 15000000, 35, 0, 0, 2, 70000, 0, 0, '', NULL, NULL),
('Anillo de platino', 'Anillo', 'rfpt', 0, 54, 54, 12000000, 26, 0, 0, 5, 55000, 0, 0, '', NULL, NULL),
('Anillo de oro', 'Anillo', 'rfo', 0, 30, 30, 10000000, 23, 0, 0, 100, 35000, 0, 2, '', NULL, NULL),
('Anillo de plata', 'Anillo', 'rfp', 0, 16, 16, 150000, 18, 0, 0, 500, 16400, 0, 0, '', NULL, NULL),
('Anillo de cobre', 'Anillo', 'rfc', 0, 6, 6, 35000, 11, 0, 0, 300, 4000, 0, 0, '', NULL, NULL),
('Anillo de madera', 'Anillo', 'rfm', 0, 1, 3, 3000, 0, 6, 0, 3000, 200, 0, 0, '', NULL, NULL),
('Anillo de coco', 'Anillo', 'rfh', 1, 1, 1, 30, 0, 1, 0, 10000, 10, 0, 0, '', NULL, NULL),
('Oculo', 'Mascota', 'oculo', 0, 0, 1, 40000000, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Espada Glacial', 'Arma', 'iceblade', 0, 0, 75, 15000000, 17, 60, 10, 0, 0, 0, 0, '', NULL, NULL),
('Pollo Aficionado', 'Mascota', 'maprecre', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Adimensional', 'Mascota', 'mapdimensional', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Ala de murciélago', 'Recurso', 'batwing', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Arma desconocida de amazona(I)', 'Reliquia', 'rrrrarcoai', 0, 0, 10, 100, 0, 0, 0, 1000, 100, 0, 0, '1$20$%#2$10$%#3$5$%#7$5$%', NULL, NULL),
('Bolsa de caramelos', 'Alimento', 'candybag', 0, 0, 1, 1000, 100, 0, 0, 0, 0, 2, 0, '', NULL, 'Saco lleno de caramelos.\r\nNo es muy sano.\r\nEstuvo disponible durante Halloween 2018.'),
('Calabaza decorada', 'Halloween', 'pumpkinhead', 0, 0, 1, 100, 1, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Caramelos', 'Alimento', 'candies', 0, 0, 1, 100, 23, 0, 0, 0, 0, 2, 0, '', NULL, 'Bolas dulces envueltas (el envoltorio no se come).\r\nEstuvo disponible durante Halloween 2018.'),
('Carne podrida', 'Alimento', 'rottenmeat', 0, 0, 1, 100, -10, 0, 0, 0, 0, 2, 0, '', NULL, 'Trozo de carne de zombie.\r\nNo es una buena idea comérsela...\r\nEstuvo disponible durante Halloween 2018.'),
('Corona(I)', 'Reliquia', 'rrrci', 0, 0, 30, 100, 0, 0, 0, 2, 300000, 0, 0, '1$75$%#2$100$%#3$15$%#4$15$%#5$30$%#6$25$%#7$50$%', NULL, NULL),
('Esencia mágica', 'Recurso', 'magicesence', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Extraño utensilio inutilizable(I)', 'Reliquia', 'rrrrarcoi', 0, 0, 10, 100, 0, 0, 0, 1000, 100, 0, 0, '1$10$%#2$20$%#3$5$%#7$10$%', NULL, NULL),
('Fruta prohibida', 'Alimento', 'frutaprohibida', 0, 0, 1, 1000, 1500, 0, 0, 0, 0, 2, 0, '', NULL, 'Este fruto se prohibió en toda la comarca de Lifo.<br>\r\nEl poder que otorga te puede permitir conquistar territorios.<br>\r\n<i>En el peor de los casos te dará dolor de cabeza.</i>'),
('Fuego fatuo', 'Recurso', 'fatuo', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Hueso rojo dulce', 'Recurso', 'hurojo', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Lámpara(I)', 'Reliquia', 'rrrlai', 0, 0, 20, 100, 0, 0, 0, 3, 80000, 0, 0, '1$40$%#2$50$%#4$15$%#5$20$%#6$20$%#7$30$%', NULL, NULL),
('Manual de hechicería', 'Libro', 'manuhechi', 0, 0, 1, 100, 0, 100, 0, 0, 0, 3, 0, '', NULL, NULL),
('Mapa: Catacumbas', 'Mapa', 'tomb', 0, 0, 11, 0, 0, 30, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Cementerio', 'Mapa', 'cemetery', 0, 0, 10, 0, 0, 15, 0, 0, 0, 7, 0, '', NULL, NULL),
('Mapa: Necrópolis', 'Mapa', 'necropolis', 0, 0, 12, 0, 0, 50, 0, 0, 0, 7, 0, '', NULL, NULL),
('Piruleta de fresa', 'Alimento', 'lollipopstraw', 0, 0, 1, 100, 80, 0, 0, 0, 0, 2, 0, '', NULL, 'Dulce de fresa en un palo.\r\nEstuvo disponible durante Halloween 2018.'),
('Piruleta de manzana', 'Alimento', 'lollipopapple', 0, 0, 1, 100, 28, 0, 0, 0, 0, 2, 0, '', NULL, 'Dulce de manzana en un palo.\r\nEstuvo disponible durante Halloween 2018.'),
('Planta curativa(I)', 'Reliquia', 'rrrhui', 0, 0, 15, 100, 0, 0, 0, 10, 20000, 0, 0, '2$35$%#5$15$%#7$25$%', NULL, NULL),
('Polvo de estrellas(I)', 'Reliquia', 'rrrpmi', 0, 0, 15, 100, 0, 0, 0, 30, 40000, 0, 0, '1$15$%#2$15$%#3$15$%#4$15$%#5$15$%#6$15$%#7$15$%', NULL, NULL),
('Polvo de hueso rojo', 'Recurso', 'redpowder', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Símbolo sagrado(I)', 'Reliquia', 'rrrvsdsi', 0, 0, 20, 100, 0, 0, 0, 4, 40000, 0, 0, '1$50$%#2$30$%#3$10$%#5$20$%#6$20$%#7$30$%', NULL, NULL),
('Sombrero de hechicería', 'Halloween', 'rsonhe', 0, 0, 50, 9000000, 22, 22, 0, 0, 0, 0, 0, '', NULL, NULL),
('Tarta de calabaza', 'Alimento', 'tartacalabaza', 0, 0, 1, 100, 76, 0, 0, 0, 0, 2, 0, '', NULL, 'Tarta con un dulce sabor a calabaza.\r\nEstuvo disponible durante Halloween 2018.'),
('Venda impura', 'Recurso', 'bandage', 0, 0, 0, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Collar de la suerte(I)', 'Reliquia', 'csrti', 0, 0, 1, 100, 0, 0, 0, 500, 100, 0, 0, '1$10$%#3$10$%', NULL, NULL),
('Trofeo: La boda', 'Z-EspBoda', 'trboda', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Vamporo Helado', 'Mascota', 'frozenbat', 0, 0, 1, 100, 0, 0, 0, 0, 0, 6, 0, '', NULL, 'Esta mascota helada se puede comprar en la tienda premium durante el festival de invierno.'),
('Trofeo: La calabaza', 'Z-Esp57', 'trbaza', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Chocolate caliente', 'Alimento', 'chococaliente', 0, 0, 1, 1000, 60, 0, 0, 0, 0, 2, 0, '', NULL, 'Nada como una buena taza de chocolate caliente para afrontar los frios inviernos.'),
('Bastón de caramelo', 'Alimento', 'bdecaramelo', 0, 0, 1, 1000, 20, 0, 0, 0, 0, 2, 0, '', NULL, 'Bastón de caramelo dulce, el favorito de los niños.'),
('Galletas de mantequilla', 'Alimento', 'gaman', 0, 0, 1, 1000, 55, 0, 0, 0, 0, 2, 0, '', NULL, 'Galletas de mantequilla hechas con la receta de la abuela.'),
('Gorro de festivo', 'Yelmo', 'gorrosanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, '', NULL, 'Gorro usado durante la festividad del invierno.'),
('Túnica festiva', 'Coraza', 'tunicasanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, '', NULL, 'Túnica usada durante la festividad del invierno.'),
('Pantalones festivos', 'Perneras', 'pantalonessanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, '', NULL, 'Pantalones usados durante la festividad del invierno.'),
('Botas festivas', 'Botas', 'botassanta', 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, '', NULL, 'Botas usadas durante la festividad del invierno.'),
('Osito festivo de peluche', 'Recurso', 'ososanta', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Este oso de felpa se reparte cada festividad a todos los niños de Lifo.'),
('Matasuegras', 'Recurso', 'matasuegras', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Silvato festivo usado en celebraciones.'),
('Pollo Arcoiris', 'Mascota', 'maparcoiris', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Cielo', 'Mascota', 'mapceles', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Demoniaco', 'Mascota', 'mapdemon', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Masculino', 'Mascota', 'mapr', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Moderno', 'Mascota', 'mapmod', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Nocturno', 'Mascota', 'mapnoc', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Sultán', 'Mascota', 'mapalapollo', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Valiente', 'Mascota', 'mapcasco', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Binario', 'Mascota', 'mapcybern', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Pollo Festivo', 'Mascota', 'mapfestivo', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, NULL),
('Oso festivo animado', 'Mascota', 'osonavanim', 0, 0, 1, 0, 0, 0, 0, 0, 0, 6, 0, '', NULL, NULL),
('Pergamino mágico: Oso festivo', 'Navidad', 'pergaosonav', 0, 0, 1, 100, 0, 100, 0, 0, 0, 3, 0, '', NULL, NULL),
('Cofre festivo', 'Cofre', 'cofrenav', 0, 0, 1, 0, 0, 0, 0, 0, 0, 9, 0, NULL, NULL, '¿Qué tendrá dentro?'),
('Insignia Atrezzo A', 'Atrezzo', 'atreza', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo B', 'Atrezzo', 'atrezb', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo C', 'Atrezzo', 'atrezc', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo D', 'Atrezzo', 'atrezd', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo E', 'Atrezzo', 'atreze', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo F', 'Atrezzo', 'atrezf', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo G', 'Atrezzo', 'atrezg', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo H', 'Atrezzo', 'atrezh', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo I', 'Atrezzo', 'atrezi', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo J', 'Atrezzo', 'atrezj', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo K', 'Atrezzo', 'atrezk', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Insignia Atrezzo M', 'Atrezzo', 'atrezm', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, NULL, NULL, 'Insignia de atrezzo para clanes.'),
('Cristal carmesí inerte', 'Recurso', 'cenerroj', 0, 0, 1, 10, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Este cristal parece... ¿inerte?'),
('Cristal carmesí activado', 'Aumento', 'cenerrojacti', 0, 0, 1, 100, 0, 10, 0, 0, 0, 10, 0, '', NULL, 'Un cristal carmesí. Parece desprender una especie de energía....<br>Aumenta la enegía máxima en <strong style=\"color:red;\">+10</strong>.'),
('Cono de Fresa', 'Alimento', 'conestrawberry', 0, 0, 1, 100, 100, 0, 0, 0, 0, 2, 0, '', NULL, 'Cono de helado de fresa.\r\nEl favorito de Xilok.'),
('Gusanos de gominola', 'Alimento', 'yummyworms', 0, 0, 1, 100, 150, 0, 0, 0, 0, 2, 0, '', NULL, 'Los gusanos de gominola se hacen a partir de azucar y almas de gusanos de tierra.'),
('Águila', 'Mascota', 'mragi', 0, 0, 1, 250000, 0, 0, 0, 0, 0, 6, 0, NULL, NULL, 'Ave rapaz capaz de arrancar la carne de sus presas con sus afiladas garras.'),
('Cristal añil activado', 'Aumento', 'cenerazuacti', 0, 0, 1, 10000, 0, 25, 0, 0, 0, 10, 0, '', NULL, 'Un cristal añil . Parece desprender una especie de energía....<br>Aumenta la enegía máxima en <strong style=\"color:blue;\">+25</strong>.'),
('Cristal añil inerte', 'Recurso', 'cenerazu', 0, 0, 1, 1000, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Este cristal parece... ¿inerte?'),
('Cristal purpúreo activado', 'Aumento', 'cenerlilacti', 0, 0, 1, 1000000, 0, 50, 0, 0, 0, 10, 0, '', NULL, 'Un cristal purpúreo. Parece desprender una especie de energía....<br>Aumenta la enegía máxima en <strong style=\"color:purple;\">+50</strong>.'),
('Cristal purpúreo inerte', 'Recurso', 'cenerlil', 0, 0, 1, 100000, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Este cristal parece... ¿inerte?'),
('Filete de dragón', 'Alimento', 'filetedrag', 0, 0, 1, 360000, 400, 0, 0, 0, 0, 2, 0, '', NULL, 'Huele rancio, aunque parece aportar bastante energía.<br>Premio de competencia de clanes.'),
('Guantes de oro', 'Guantes', 'gudeoro', 0, 0, 1, 18000, 10, 0, 0, 0, 0, 0, 2, '', NULL, 'Ligeros como una pluma pero duros como una piedra.<br>Aún así, relucen como el primer día.<br>Premio de la arena de clanes.'),
('Manual de manipulación de cristales', 'Libro', 'rljpcr', 20, 0, 20, 20000, 0, 50, 0, 0, 0, 3, 0, '', NULL, 'Manual que contiene las recetas para fabricar cristales mágicos de pura energía.'),
('Violín de Oscar', 'Artefacto', 'vioscar', 0, 0, 72, 100000, 1, 0, 0, 0, 1000, 0, 0, '', NULL, 'El mejor regalo para una madre.</br><i>Marca Lifo</i>'),
('Dragón glacial', 'Mascota', 'dragohielo', 0, 0, 1, 100000000, 0, 0, 0, 0, 0, 6, 0, '', NULL, 'Mascota de Xilok el despiadado.<br>Su aliento es gélido, como el corazón de su amo.'),
('Trofeo: Pluma de platino', 'Z-Esp13pla', 'trpplati', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, '', NULL, NULL),
('Escudo roto', 'Escudo', 'esroto', 0, 1, 1, 5, 2, 0, 0, 0, 0, 0, 0, '', NULL, 'Escudo obtenido por verificar la cuenta de usuario.'),
('Insignia especial mano derecha', 'Especial', 'manod', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Insignia especial creada para las manos derechas.'),
('Trofeo: Medalla amistad', 'Medalla', 'medallaamistad', 0, 0, 20, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina 1º'),
('Trofeo: Medalla destreza', 'Medalla', 'medalladestreza', 0, 0, 20, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina 1º'),
('Trofeo: Medalla honor', 'Medalla', 'medallahonor', 0, 0, 20, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina 1º'),
('Trofeo: Medalla sangre', 'Medalla', 'medallasangre', 0, 0, 20, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina 1º'),
('Horca', 'Arma', 'pitchfork', 0, 0, 1, 10, 0, 1, 0, 0, 10, 0, 0, '', NULL, 'La horca de un viejo granjero...'),
('Felicitación 2020', 'Cifrado', 'navidadi', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, 0, '', '<h4>¡Feliz 2020!</h4>\r\n    Desde la administración queremos darte las gracias<br>\r\n    por jugar a <b>Lifo</b> y por ayudar a que este juego<br>\r\n    siga vivo.<br><br>\r\n    Ha sido un largo año, lleno de cambios para todos.<br>\r\n    Desde la administración, queremos comunicar que continuaremos<br>\r\n    esforzándonos por mantener el juego y modificarlo a poco<br>\r\n    con actualizaciones.<br><br>\r\n    Una vez más, gracias por todo. Un fuerte abrazo.<br>\r\n    Att: <i>Lifo</i>.', NULL),
('Brakna', 'Alimento', 'brakna', 0, 0, 1, 1000, 700, 0, 0, 0, 0, 2, 0, '', NULL, 'La brakna es una fruta originaria de las cavernas de Lifo.<br>\r\nSu sabor recuerda al del membrillo, pero con un toque de mango.<br>\r\n<i style=\"color:red;\">Advertencia: Puede producir alucinaciones</i>'),
('Trofeo: Pollo de oro', 'Z-EspPollo', 'trofpollo', 0, 0, 1, 0, 0, 5, 10, 0, 0, 0, 2, '', NULL, NULL),
('Recetario de bocadillos', 'Libro', 'lboc', 0, 5, 1, 1000, 0, 15, 0, 2000, 500, 3, 0, '', NULL, 'Contiene recetas básicas para bocadillos.'),
('Bocadillo vegetal', 'Alimento', 'bocveg', 0, 0, 1, 1900, 13, 0, 0, 0, 0, 2, 0, '', NULL, 'Bocata de vegetales.<br><i>100% sano</i>'),
('Bocadillo de pollo y lechuga', 'Alimento', 'bocpollec', 0, 0, 1, 1500, 16, 0, 0, 0, 0, 2, 0, '', NULL, 'Bocadillo de pollo y lechuga<br><i>El clásico</i>'),
('Bocadillo de solomillo y queso', 'Alimento', 'bocsolque', 0, 0, 1, 1600, 25, 0, 0, 0, 0, 2, 0, '', NULL, 'Bocadillo de solomillo y queso.<br><i>Producto 100% no vegano</i>'),
('Esencia viva', 'Recurso', 'essence', 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Jarra de batido de coco', 'Alimento', 'jbcco', 0, 0, 1, 27000, 55, 0, 0, 0, 0, 2, 0, '', NULL, 'Jarra de batido de coco, perfecta para el verano'),
('Leche de coco', 'Alimento', 'rglc', 0, 0, 1, 2000, 15, 0, 0, 0, 0, 2, 0, '', NULL, 'Leche extraída del prensado de un coco.'),
('Hechizo: Juicio final', 'Hechizo', 'phjf', 0, 0, 80, 0, 100, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Bastión', 'Hechizo', 'phba', 0, 0, 70, 0, 45, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Aura celestial', 'Hechizo', 'phac', 0, 0, 50, 0, 26, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Justicia divina', 'Hechizo', 'phjd', 0, 0, 44, 0, 20, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Fuego sagrado', 'Hechizo', 'phfs', 0, 0, 37, 0, 15, 0, 0, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Ciclo infinito', 'Hechizo', 'phci', 0, 0, 110, 0, 30, 80, 50, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Igualdad', 'Hechizo', 'phig', 0, 0, 120, 0, 75, 1, 130, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Tiempo muerto', 'Hechizo', 'phtm', 0, 0, 130, 0, 150, 10, 10, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Trinidad', 'Hechizo', 'phtr', 0, 0, 140, 0, 70, 70, 70, 0, 0, 1, 0, '', NULL, NULL),
('Hechizo: Dominación', 'Hechizo', 'phdo', 0, 0, 150, 0, -50, 200, 100, 0, 0, 1, 0, '', NULL, NULL),
('Grimorio de la luz', 'Libro', 'lglu', 0, 0, 1, 16000000, 0, 800, 0, 0, 0, 3, 0, '', NULL, NULL),
('Grimorio de la luz cerrado', 'Recurso', 'lgluc', 0, 40, 1, 6000000, 0, 0, 0, 70, 20000, 4, 0, '', NULL, NULL),
('Grimorio de otro mundo', 'Libro', 'lgdom', 0, 0, 110, 300000000, 0, 2000, 0, 0, 0, 3, 0, '', NULL, NULL),
('Grimorio de otro mundo cerrado', 'Libro', 'lgdomc', 0, 0, 1, 150000000, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Llave del grimorio de la luz', 'Recurso', 'gtl', 0, 40, 1, 2000000, 0, 0, 0, 200, 12000, 4, 0, '', NULL, NULL),
('Llaves de otro mundo', 'Recurso', 'gtdom', 0, 0, 1, 100, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Esfera añil', 'Recurso', 'esferaazulA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Esfera carmesí', 'Recurso', 'esferarojaA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Esfera de almas', 'Recurso', 'esferamoradaA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Esfera de jade', 'Recurso', 'esferaverdeA', 0, 0, 0, 33333333, 0, 0, 0, 0, 0, 4, 0, '', NULL, NULL),
('Ración de uvas dimensionales', 'Festividad', 'rguu', 0, 0, 1, 1000000, 40, 0, 0, 10, 0, 2, 0, '', NULL, 'Fruta agria usada en la fabricación de zumos y vinos.<br>\r\nA la venta durante el 1 de enero de 2021.');
INSERT INTO `objetos` (`nombreobj`, `tipo`, `img`, `nivelcomprar`, `nivelencontrar`, `niveluso`, `valor`, `prot`, `ataq`, `vida`, `posibilidad`, `puntosencontrar`, `usos`, `set`, `pasivas`, `texto`, `descripcion`) VALUES
('Felicitación 2021', 'Cifrado', 'feliz2021', 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, 0, '', '<h4>¡Feliz 2021!</h4>\r\n Desde la administración queremos darte las gracias<br>\r\n por jugar a <b>Lifo</b> y por ayudar a que este juego<br>\r\n siga vivo.<br><br>\r\n Ha sido un largo año, lleno de cambios para todos.<br>\r\n \r\n Desde la administración, queremos comunicar que continuaremos<br>\r\n esforzándonos por mantener el juego y seguiremos mejorándolo<br>\r\n con cambios y mejoras.<br><br>\r\n Una vez más, gracias por todo. Un fuerte abrazo.<br>\r\n Att: <i>Lifo</i>.', NULL),
('Botas de fuego mágico', 'Botas', 'botfma', 0, 0, 30, 5000000, 5, 0, 0, 0, 0, 0, 7, '', NULL, 'Estas botas emanan fuego que no quema al portador.<br>\r\nSu fuego protege al dueño de la lava.'),
('Mitad izquierda perleada', 'Recurso', 'mitadizquierda', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Esta semiesfera negra está compuesta en su totalidad por una perla marina.<br>Quizás sirva para algo.'),
('Cofre enano', 'Cofre', 'cenano', 0, 0, 1, 0, 0, 0, 0, 0, 0, 9, 0, NULL, NULL, '¿Qué tendrá dentro?'),
('Amuleto de otra era', 'Amuleto', 'aotraera', 0, 0, 100, 0, 50, 25, 100, 0, 0, 0, 0, '', NULL, 'Un amuleto poderoso procedente de otra era que <br>\r\nse perdió tras la 18º guerra de Lifo.<br>\r\nReforjar este amuleto sería toda una hazaña.'),
('Joya antigua', 'Recurso', 'joyaantigua', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Antigua joya de la decimoséptima era. Dicen que esta joya procede de otra dimensión.<br>Quizás sirva para algo.'),
('Mitad derecha obsidiana', 'Recurso', 'mitadderecha', 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Esta semiesfera negra está compuesta en su totalidad por una piedra de obsidiana.<br>Quizás sirva para algo.'),
('Receta: Amuleto de otra era', 'Libro', 'raotraera', 0, 0, 1, 0, 0, 10, 0, 0, 0, 3, 0, '', NULL, 'Enseña a fabricar un amuleto de un poder sin igual.'),
('Corazón de la montaña', 'Amuleto', 'amcormon', 0, 0, 40, 0, 0, 5, 20, 0, 0, 0, 0, '', NULL, 'Dicen que este amuleto era usado por los <br>\r\nantiguos enanos que habitaban el interior <br>\r\nde las montañas. Aquel que lo porte será <br>\r\nbendecido por la <font color=\"brown\">[Protección de la montaña]</font>.<br>\r\nAbre eventos ocultos...<br>\r\n<br>\r\n<font color=\"brown\">[Protección de la montaña]:</font> El portador <br>\r\nes inmune a la lava.'),
('Trofeo: Medalla saber', 'Medalla', 'medallasaber', 0, 0, 20, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Trofeo: Medalla misterio', 'Medalla', 'medallamisterio', 0, 0, 20, 0, 0, 0, 0, 0, 0, 4, 0, '', NULL, 'Trofeo otorgado al los ganadores del Rey de la colina'),
('Guantes de plata', 'Guantes', 'gudeplata', 0, 0, 1, 9000, 0, 5, 0, 0, 0, 0, 0, '', NULL, 'Ligeros como una pluma pero duros como una piedra.<br>Aún así, relucen como el primer día.<br>Premio de la arena de clanes.'),
('Guantes de cobre', 'Guantes', 'gudecobre', 0, 0, 1, 9000, 1, 1, 0, 0, 0, 0, 0, '', NULL, 'Ligeros como una pluma pero duros como una piedra.<br>Aún así, relucen como el primer día.<br>Premio de la arena de clanes.'),
('Botas de batalla', 'Botas', 'botbat', 0, 5, 5, 5000, 0, 2, 0, 2000, 300, 0, 1, '', NULL, NULL);

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
-- Estructura de tabla para la tabla `ofertasaceptadas`
--

CREATE TABLE `ofertasaceptadas` (
  `nombrejug` varchar(30) NOT NULL,
  `idoferta` int(11) NOT NULL,
  `unica` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(245, 'Leche de coco', 1, 'Alimento', 6, 30, 1),
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
(244, 'Amuleto de otra era', 1, 'Amuleto', 100, 0, 0),
(246, 'Jarra de batido de coco', 1, 'Alimento', 6, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sets`
--

CREATE TABLE `sets` (
  `id` int(11) NOT NULL,
  `nombreset` varchar(250) NOT NULL,
  `palabraclave` varchar(250) NOT NULL,
  `color` varchar(7) NOT NULL,
  `minpiezas` int(11) NOT NULL DEFAULT 1,
  `maxpiezas` int(11) NOT NULL DEFAULT 1,
  `ataque` float NOT NULL DEFAULT 0,
  `armadura` float NOT NULL DEFAULT 0,
  `vida` float NOT NULL DEFAULT 0,
  `reduccion` float NOT NULL DEFAULT 0,
  `absorcion` float NOT NULL DEFAULT 0,
  `evasion` float NOT NULL DEFAULT 0,
  `critico` float NOT NULL DEFAULT 0,
  `dcritico` float NOT NULL DEFAULT 0,
  `parmadura` float NOT NULL DEFAULT 0,
  `espinas` float NOT NULL DEFAULT 0,
  `vampirismo` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sets`
--

INSERT INTO `sets` (`id`, `nombreset`, `palabraclave`, `color`, `minpiezas`, `maxpiezas`, `ataque`, `armadura`, `vida`, `reduccion`, `absorcion`, `evasion`, `critico`, `dcritico`, `parmadura`, `espinas`, `vampirismo`) VALUES
(1, 'Guerrero formidable', 'Batalla', '#C76520', 3, 3, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Caballero dorado', 'Oro', '#FACF32', 2, 8, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Armadura gélida', 'Hielo', '#B4F5FA', 2, 5, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0),
(4, 'Discípulo dragón', 'Dragón', '#3EC74C', 2, 6, 0, 0, 3, 0, 0, 0, 0, 0, 0, 3, 0),
(5, 'Caballero del rey', 'Corona', '#FAA18D', 4, 4, 0, 0, 3, 0, 0, 0, 5, 0, 0, 0, 0),
(6, 'Engendro oscuro', 'Oscuridad', '#942A1E', 3, 4, 0, 0, 3, 0, 5, 0, 0, 0, 0, 0, 0),
(7, 'Fuego sagrado', 'Fuego mágico', '#E66800', 3, 6, 0, 0, 4, 0, 5, 0, 2, 10, 0, 0, 0),
(8, 'Guardián real', 'Guardián', '#FFFFFF', 3, 3, 0, 15, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 'Engendro terrestre', 'Geomante', '#FACF32', 3, 3, 10, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'Enviado de los cielos', 'Celestial', '#DBF6FA', 3, 7, 0, 0, 5, 3, 0, 0, 0, 0, 0, 0, 0),
(11, 'Engendro de las profundidades', 'Averno', '#E60A13', 3, 7, 0, 0, 5, 0, 0, 0, 0, 0, 3, 0, 0),
(12, 'Fantasma espectral', 'Espectral', '#CEDEE0', 2, 6, 0, 0, 5, 0, 0, 3, 0, 0, 0, 0, 0),
(13, 'Incorpóreo', 'Etereo', '#DBF6FA', 1, 5, 0, 0, 8, 0, 5, 10, 0, 0, 0, 0, 0),
(14, 'Tradicionalista', 'Ceremonial', '#E0A377', 2, 5, 2.5, 0, 6, 0, 0, 0, 2.5, 0, 0, 0, 0),
(15, 'Pontífice', 'Sagrado', '#FAE57A', 2, 5, 0, 3, 6, 0, 0, 0, 0, 0, 0, 3, 0),
(16, 'Aprendiz de las artes oscuras', 'Nigromante', '#850091', 3, 3, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 10),
(17, 'Héroe del reino', 'Heroe', '#FA6030', 2, 5, 2.5, 0, 7, 0, 0, 0, 2.5, 0, 0, 1.25, 0),
(18, 'Maestro artesano', 'Artesano', '#9D7565', 2, 5, 0, 3.5, 7, 0, 1.25, 0, 0, 0, 0, 2.5, 0),
(19, 'Rúnico', 'Arcano', '#B9658D', 2, 4, 3, 0, 7, 0, 0, 0, 0, 10, 5, 0, 0),
(20, 'Caballero demoniaco', 'Demoniaco', '#E00700', 1, 3, 5, 0, 8, 0, 0, -2, 0, 0, 0, 0, 5),
(21, 'Caballero real', 'Real', '#CC9C35', 1, 3, -2, 0, 8, 5, 5, 0, 0, 0, 0, 0, 0);

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

--
-- Volcado de datos para la tabla `textos`
--

INSERT INTO `textos` (`nombre`, `texto`) VALUES
('noticias', 'No hay noticias actualmente'),
('noticiaspag', '');

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
(56, ' II, Chef Real', '#ECE015', '#5D00A9', 'bold', 1, '3px ridge #e8d62f', 1),
(57, ' II, Rey de la colina', '#FAF896', '#C24309', 'bold', 1, '2px inset #A87818', 1),
(58, ' II, Maestro de gremio', '#FAF896', '#096EC2', 'bold', 1, '2px inset #181EA8', 1),
(59, ' II, el Destripahombres', '#FA9696', '#5F0101', 'bold', 1, '2px outset #F6F6F6', 1),
(60, ' II, Erudito Real', '#ECE015', '#5DA0A9', 'bold', 1, '2px ridge #F6F6F6', 1),
(61, ' II, Forjador de otra era', '#FAF896', '#0C1022', 'none', 1, '3px outset #A87818', 1),
(62, 'Pacificador', '#1eff00', '#000000', 'none', 0, '2px inset #AAAAAA', 0),
(63, 'Embajador de la pesadilla', '#FA6030', '#0C1022', 'none', 0, '3px ridge #850091', 0),
(64, 'Señor de los hechizos', '#F6F6F6', '#0C1022', 'none', 0, '3px outset #5D00A9', 0);

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
-- Indices de la tabla `monstruos_loot`
--
ALTER TABLE `monstruos_loot`
  ADD PRIMARY KEY (`idmonstruo`,`nombreobj`);

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
-- Indices de la tabla `sets`
--
ALTER TABLE `sets`
  ADD UNIQUE KEY `id` (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `contiene_cofre`
--
ALTER TABLE `contiene_cofre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `encantamientos`
--
ALTER TABLE `encantamientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `exploracion`
--
ALTER TABLE `exploracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=665;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

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
