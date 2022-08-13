ALTER TABLE `tiene` ADD `encantamiento` INT NULL DEFAULT 0 AFTER `usado`;
ALTER TABLE `itemstrueques` ADD `encantamiento` INT NULL DEFAULT 0 AFTER `cantidad`;

CREATE TABLE `encantamientos` (
   `id` int(11) NOT NULL,
    `nombreobj` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
    `img` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    `niveluso` int(10) NOT NULL DEFAULT 0,
    `prot` int(20) NOT NULL DEFAULT 0,
	`ataq` int(20) NOT NULL DEFAULT 0,
  	`vida` int(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `encantamientos` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`id`);

INSERT INTO encantamientos (nombreobj, img, niveluso, prot, ataq, vida) SELECT nombreobj, img, niveluso, prot, ataq, vida FROM objetos WHERE tipo = 'Hechizo';

INSERT INTO `jugadores` (`nombrejug`, `password`, `verificado`, `recibemail`, `email`, `emailnuevo`, `emailnuevocambio`, `creado`, `login`, `premiumhasta`, `clan`, `baneadohasta`, `emailreg`, `ipcreado`, `iplogin`, `nivel`, `insignia`, `puntos`, `puntossuma`, `puntosnivel`, `puntosobjeto`, `oro`, `energia`, `enerext`, `trabajando`, `fintrabajo`, `puntostrabajo`, `trabajopremium`, `trabajado`, `orotrabajo`, `protegidohasta`, `noatacarhasta`, `noexplorarhasta`, `nocomerhasta`, `combates`, `vencedor`, `vencido`, `visitashijos`, `visitasnietos`, `hijos`, `nietos`, `padre`, `ultimoforo`, `zonahoraria`, `ultimaact`, `admin`, `moderador`, `enchufado`, `sabiduria`) VALUES
('Sora', '2ced9f704108408daa11cbbf5ed1cb026c592239', 1, 1, 'luigito18@gmail.com', '', 0, 1558132949, 1604914774, 1575667629, 'Administracion', 0, 'luigito18@gmail.com', '79.144.143.113', '217.217.35.38', 1000, 'clangm', -10, 0, 0, 0, 1784, 53, 0, 0, 0, 0, 0, 0, 0, 0, 1575495325, 1558787103, 0, 1, 1, 0, 0, 0, 0, 0, '(desconocido)', 1604914775, -15, 1604914774, 1, 0, 0, 2);

ALTER TABLE `tiene` ADD `insignia` INT(1) NOT NULL DEFAULT '0' AFTER `usado`;