<?php
function dar_titulo($jug, $id)
{
	db_query("INSERT INTO `tienetitulos`(`nombrejug`, `id`, `usado`) VALUES ('{$jug}',{$id},0)");
}

function dar_logro($jug, $id)
{
	global $time, $imgroot;
	db_query("INSERT INTO tienelogros (nombrejug,id,fecha) VALUES ('{$jug}',{$id},{$time})");
	$query = db_query("SELECT lo.nombre,lo.puntos,tit.id,tit.descripcion,lo.objetos,lo.oculto FROM logros AS lo LEFT JOIN titulos AS tit ON (lo.tituloid=tit.id) WHERE lo.id={$id}");
	$var = mysqli_fetch_row($query);
	mysqli_free_result($query);
	$mensaje = "Has conseguido el logro\"<b>{$var[0]}</b>\"" . ($var[5] == 1 ? ' <b>(SECRETO)</b>' : '') . " <img src=\"{$imgroot}logro{$id}.gif\"><br/><br/>La recompensa es:<br/> -Puntos de logro:<b>{$var[1]}</b>";
	if ($var[2] != null) {
		$mensaje .= "<br>-Título: <b>{$var[3]}</b>";
		dar_titulo($jug, $var[2]);
	}
	if ($var[4] != null) {
		$items = explode("#", $var[4]);
		$mensaje .= "<br>-Objeto: ";
		for ($j = 0; $j < count($items); $j++) {
			$itm = explode("$", $items[$j]);
			$mensaje .= "<b>x{$itm[1]} {$itm[0]}</b>";
			if ($j + 1 != count($items)) $mensaje .= '<br>';
			dale_objeto($jug, $itm[0], $itm[1]);
		}
	}
	db_query("INSERT INTO mensajes (nombrejug,remitente,hora,visto,mensaje) VALUES ('{$jug}','@',{$time},0,'{$mensaje}')");
}

function check_logro_tseguido($jug, $trabajoSeguido)
{
	global $time;
	$tienelogros = db_query("SELECT id FROM tienelogros WHERE id IN (5,6,7,8) AND nombrejug='{$jug}'"); //Logros de trabajo continuado
	$numrows = mysqli_num_rows($tienelogros);
	if ($numrows != 4) {
		$arr = [5 => 5, 6 => 6, 7 => 7, 8 => 8,];
		for ($i = 0; $i < $numrows; $i++) {
			$lo = mysqli_fetch_array($tienelogros);
			unset($arr[$lo[0]]);
		}
		foreach ($arr as &$valor) {
			$inserta = false;
			switch ($valor) {
				case 5:
					if ($trabajoSeguido / 3600 >= 8) {
						$inserta = true;
					}
					break;
				case 6:
					if ($trabajoSeguido / 3600 >= 16) {
						$inserta = true;
					}
					break;
				case 7:
					if ($trabajoSeguido / 3600 >= 24) {
						$inserta = true;
					}
					break;
				case 8:
					if ($trabajoSeguido / 3600 >= 168) {
						$inserta = true;
					}
					break;
			}
			if ($inserta) {
				dar_logro($jug, $valor);
			}
		}
	}
	mysqli_free_result($tienelogros);
}

function check_logro_out($id, $jug)
{
	$tlogro = db_query("SELECT count(*) FROM tienelogros WHERE id={$id} and nombrejug='{$jug}'");
	$var = mysqli_fetch_row($tlogro);
	mysqli_free_result($tlogro);
	if ($var[0] == 0) dar_logro($jug['nombrejug'], $id);
}

function check_logro($id, $jug)
{
	global $time, $imgroot, $us;
	$tlogro = db_query("SELECT COUNT(*) FROM tienelogros WHERE id={$id} and nombrejug='{$jug}'");
	$var = mysqli_fetch_row($tlogro);
	mysqli_free_result($tlogro);
	$name = $jug;
	if ($var[0] == 0) {
		$jugador = db_query("SELECT * FROM jugadores WHERE nombrejug='{$jug}'");
		$jug = mysqli_fetch_assoc($jugador);
		mysqli_free_result($jugador);
		$dar = false;
		switch ($id) {
			case 1:		// Nº de horas trabajadas(Total)
				if ($jug['trabajado'] / 3600 >= 24)  $dar = true;
				break;
			case 2:
				if ($jug['trabajado'] / 3600 >= 168)  $dar = true;
				break;
			case 3:
				if ($jug['trabajado'] / 3600 >= 720)  $dar = true;
				break;
			case 4:
				if ($jug['trabajado'] / 3600 >= 2160) $dar = true;
				break;
			case 9:		// Nº de combates ganados
				if ($jug['vencedor'] >= 10) $dar = true;
				break;
			case 10:
				if ($jug['vencedor'] >= 100) $dar = true;
				break;
			case 11:
				if ($jug['vencedor'] >= 1000) $dar = true;
				break;
			case 12:
				if ($jug['vencido'] >= 1) $dar = true;
				break;
			case 13:	// Nº de mapas explorados
				$query = db_query("SELECT count(*) FROM explorado WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1) $dar = true;
				break;
			case 14:
				$query = db_query("SELECT count(*) FROM explorado WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 10) $dar = true;
				break;
			case 49:
				$query = db_query("SELECT cantidad FROM explorado WHERE nombrejug='{$jug['nombrejug']}' AND mapa='Mapa: Bosques de Lifo'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1000) $dar = true;
				break;
			case 15:	// Mapas explorados 1
				$query = db_query("SELECT COUNT(*) FROM explorado WHERE nombrejug='{$jug['nombrejug']}' AND mapa IN('Mapa: Cueva de la plata', 'Mapa: Mina de oro', 'Mapa: Descenso profundo', 'Mapa: Inframundo', 'Mapa: Río de lava', 'Mapa: Centro de volcán', 'Mapa: Puertas del infierno', 'Mapa: Purgatorio')");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] == 8) $dar = true;
				break;
			case 16:	// Mapas explorados 2
				$query = db_query("SELECT COUNT(*) FROM explorado WHERE nombrejug='{$jug['nombrejug']}' AND mapa IN('Mapa: Gruta helada', 'Mapa: Laberinto de hielo', 'Mapa: Montaña helada', 'Mapa: Cordillera helada', 'Mapa: Cima nevada', 'Mapa: Escalera al cielo', 'Mapa: Reino celestial', 'Mapa: Limbo')");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] == 8) $dar = true;
				break;
			case 17:	// Mapas explorados 3
				$query = db_query("SELECT COUNT(*) FROM explorado WHERE nombrejug='{$jug['nombrejug']}' AND mapa IN('Mapa: Luna Phobos', 'Mapa: Luna Dremek', 'Mapa: Luna Aio', 'Mapa: Planeta Aeron')");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] == 4) $dar = true;
				break;
			case 18:	// Logros obtenidos
				$query = db_query("SELECT COUNT(*) FROM tienelogros WHERE nombrejug='{$jug['nombrejug']}' AND id IN(15,16,17)");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] == 3) $dar = true;
				break;
			case 19:	// Abrir cofre
				$dar = true;
				break;
			case 20:	//	Nº de libros aprendidos
				$query = db_query("SELECT COUNT(*) FROM aprendido WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 5) $dar = true;
				break;
			case 21:
				$query = db_query("SELECT COUNT(*) FROM aprendido WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 25) $dar = true;
				break;
			case 22:
				$query = db_query("SELECT COUNT(*) FROM aprendido WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 50) $dar = true;
				break;
			case 23:	// Nº de objetos fabricados
				$query = db_query("SELECT SUM(cantidad) FROM conoce WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 100) $dar = true;
				break;
			case 24:
				$query = db_query("SELECT SUM(cantidad) FROM conoce WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1000) $dar = true;
				break;
			case 25:
				$query = db_query("SELECT SUM(cantidad) FROM conoce WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 10000) $dar = true;
				break;
			case 26:	// Nº de menús fabricados
				$query = db_query("SELECT cantidad FROM conoce WHERE nombrejug='{$jug['nombrejug']}' AND resultado='Menú completo'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 25) $dar = true;
				break;
			case 27:	// Nº de mascotas
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1) $dar = true;
				break;
			case 28:
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 5) $dar = true;
				break;
			case 29:
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 10) $dar = true;
				break;
			case 30:
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 15) $dar = true;
				break;
			case 31:
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 20) $dar = true;
				break;
			case 32:
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 25) $dar = true;
				break;
			case 33:	// Nº de Pollos conseguidos 
				$query = db_query("SELECT COUNT(*) FROM tienemascotas WHERE nombrejug='{$jug['nombrejug']}' AND nombremascota LIKE '%Pollo%'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 5) $dar = true;
				break;
			case 34:	// Nivel alcanzado
				if ($jug['nivel'] >= 10) $dar = true;
				break;
			case 35:
				if ($jug['nivel'] >= 25) $dar = true;
				break;
			case 36:
				if ($jug['nivel'] >= 50) $dar = true;
				break;
			case 37:
				if ($jug['nivel'] >= 100) $dar = true;
				break;
			case 38:
				if ($jug['nivel'] >= 200) $dar = true;
				break;
			case 39:
				if ($jug['nivel'] >= 300) $dar = true;
				break;
			case 40:
				if ($jug['nivel'] >= 400) $dar = true;
				break;
			case 41:
				if ($jug['nivel'] >= 500) $dar = true;
				break;
			case 42:	// Nº de tipos de hechizos fabricados
				$query = db_query("SELECT COUNT(*), (SELECT COUNT(*) FROM objetos WHERE tipo='Hechizo') FROM conoce WHERE nombrejug='{$jug['nombrejug']}' AND resultado LIKE '%Hechizo%' AND cantidad >= 1");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1) $dar = true;
				break;
			case 43:
				$query = db_query("SELECT COUNT(*), (SELECT COUNT(*) FROM objetos WHERE tipo='Hechizo') FROM conoce WHERE nombrejug='{$jug['nombrejug']}' AND resultado LIKE '%Hechizo%' AND cantidad >= 1");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 15) $dar = true;
				break;
			case 44:
				$query = db_query("SELECT COUNT(*), (SELECT COUNT(*) FROM objetos WHERE tipo='Hechizo') FROM conoce WHERE nombrejug='{$jug['nombrejug']}' AND resultado LIKE '%Hechizo%' AND cantidad >= 1");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] == $var[1]) $dar = true;
				break;
			case 45: 	//Combate contra Xilok
				$dar = true;
				break;
			case 46:	// Puntos de logro
				$query = db_query("SELECT IFNULL(SUM(lo.puntos), 0) FROM logros as lo JOIN tienelogros as tie ON (lo.id=tie.id) WHERE tie.nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 100) $dar = true;
				break;
			case 47:
				$query = db_query("SELECT IFNULL(SUM(lo.puntos), 0) FROM logros as lo JOIN tienelogros as tie ON (lo.id=tie.id) WHERE tie.nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 250) $dar = true;
				break;
			case 48:
				$query = db_query("SELECT IFNULL(SUM(lo.puntos), 0) FROM logros as lo JOIN tienelogros as tie ON (lo.id=tie.id) WHERE tie.nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 500) $dar = true;
				break;
			case 50:	// Nº de batidos de plátanos fabricwdos
				$query = db_query("SELECT cantidad FROM conoce WHERE nombrejug='{$jug['nombrejug']}' AND resultado LIKE '%Jarra de batido de plátano%'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 10000) $dar = true;
				break;
			case 51:	// Encantamientos
				$query = db_query("SELECT encantado FROM jugadores WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1) $dar = true;
				break;
			case 52:
				$query = db_query("SELECT encantado FROM jugadores WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 100) $dar = true;
				break;
			case 53:
				$query = db_query("SELECT encantado FROM jugadores WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1000) $dar = true;
				break;
			case 54:
				$query = db_query("SELECT * FROM tiene WHERE nombrejug='{$jug['nombrejug']}' AND nombreobj='Cuchillo' AND usado=1 AND encantamiento=1");
				if (mysqli_num_rows($query)) $dar = true;
				mysqli_free_result($query);
				break;
			case 55:	// Ascension
				$query = db_query("SELECT ascension FROM jugadores WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1) $dar = true;
				break;
			case 56:	// Ascension
				$query = db_query("SELECT ascension FROM jugadores WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] == 5) $dar = true;
				break;
			case 57:	// Encuentros1
				$query = db_query("SELECT SUM(ganados) FROM encuentros WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 100) $dar = true;
				break;
			case 58:	// Encuentros2
				$query = db_query("SELECT SUM(ganados) FROM encuentros WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 1000) $dar = true;
				break;
			case 59:	// Encuentros3
				$query = db_query("SELECT SUM(ganados) FROM encuentros WHERE nombrejug='{$jug['nombrejug']}'");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 10000) $dar = true;
				break;
			case 60:	// Encantamientos equipados
				$query = db_query("SELECT COUNT(*) FROM tiene WHERE nombrejug='{$jug['nombrejug']}' AND usado=1 AND encantamiento!=0");
				$var = mysqli_fetch_row($query);
				mysqli_free_result($query);
				if ($var[0] >= 10) $dar = true;
				break;
		}
		if ($dar) {
			dar_logro($jug['nombrejug'], $id);
		}
	}
	if ($id != 46 && $id != 47 && $id != 48) {
		for ($k = 46; $k < 49; $k++)
			check_logro($k, $name);
	}
}
