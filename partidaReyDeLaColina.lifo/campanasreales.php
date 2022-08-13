<?php
$form = 1;
include('core.php');
function iweb()
{
	global $jug, $root;
	techo('<strong>[Altorias]:</strong>Bienvenida alma mortal, te encuentras ante las campanas sagradas del Reino de Lifo. Las campanas sagradas otorgan a los mejores aspirantes su bendición y su gracia divina al tocarlas.<br>
	No todos los aspirantes pueden llegar a tocar alguna de ellas. Sólo aquellos que cumplan ciertos requisitos podrán hacerlas sonar.<br>Ánimo aspirante, mucha suerte en tu camino, la gracia divina te espera.');


	$haycampana = false;
	$campanas = "";

	// Campana de 1º Nivel 100
	$ganadores1 = db_query("SELECT * FROM ganadores WHERE premio=1");
	if (!mysqli_num_rows($ganadores1)) {
		$jugador = getJugador($jug);
		if ($jugador['nivel'] == 100) {
			$campanas .= mostrarCampana(1);
			$haycampana = true;
		}
	}
	mysqli_free_result($ganadores1);

	// Campana de 1º 1000 Combates
	$ganadores2 = db_query("SELECT * FROM ganadores WHERE premio=2");
	if (!mysqli_num_rows($ganadores2)) {
		$jugador = getJugador($jug);
		if ($jugador['vencedor'] >= 1000) {
			$campanas .= mostrarCampana(2);
			$haycampana = true;
		}
	}
	mysqli_free_result($ganadores2);

	// Campana de 1º Fabricar x1 Menú completo
	$ganadores3 = db_query("SELECT * FROM ganadores WHERE premio=3");
	if (!mysqli_num_rows($ganadores3)) {
		$num = db_query("SELECT * FROM conoce WHERE nombrejug='{$jug}' AND resultado='Menú completo' AND cantidad>0");
		if (mysqli_num_rows($num)) {
			$campanas .= mostrarCampana(3);
			$haycampana = true;
		}
	}
	mysqli_free_result($ganadores3);

	// Campana de 1º Clan nivel 100
	$ganadores4 = db_query("SELECT * FROM ganadores WHERE premio=4");
	if (!mysqli_num_rows($ganadores4)) {
		$clan = getJugador($jug)['clan'];
		if ($clan != "(ninguno)") {
			$miembros = mysqli_num_rows(db_query("SELECT * FROM jugadores WHERE clan='{$clan}' AND nivel=100"));
			$lider = mysqli_fetch_row(db_query("SELECT nombrejug FROM clandata WHERE lider=1 AND clan='{$clan}'"))[0];
			if ($miembros == 4 && $lider == $jug) {
				$campanas .= mostrarCampana(4);
				$haycampana = true;
			}
		}
	}
	mysqli_free_result($ganadores4);

	// Campana de 1º Aprender 30 libros completos
	$ganadores5 = db_query("SELECT * FROM ganadores WHERE premio=5");
	if (!mysqli_num_rows($ganadores5)) {
		$num = mysqli_fetch_row(db_query("SELECT COUNT(*) FROM aprendido WHERE nombrejug='{$jug}'"))[0];
		if ($num >= 30) {
			$campanas .= mostrarCampana(5);
			$haycampana = true;
		}
	}
	mysqli_free_result($ganadores5);

	// Campana de 1º En fabricar Amuleto de otra era y equiparselo
	$ganadores6 = db_query("SELECT * FROM ganadores WHERE premio=6");
	if (!mysqli_num_rows($ganadores6)) {
		$num = mysqli_fetch_row(db_query("SELECT COUNT(*) FROM conoce WHERE nombrejug='{$jug}' AND resultado='Amuleto de otra era' AND cantidad >0"))[0];
		$num2 = db_query("SELECT * FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Amuleto de otra era' AND usado=1");
		if ($num >= 1 && mysqli_num_rows($num2)) {
			$campanas .= mostrarCampana(6);
			$haycampana = true;
		}
	}
	mysqli_free_result($ganadores6);

	if ($haycampana) {
		echo '<p><strong>[Altorias]:</strong> ¡Vaya! Parece que sí eres digno de tocar alguna campana, enhorabuena aspirante. Ahora tócala, rápido, antes de que se te adelante alguien y te robe el triunfo.<p>';
	} else {
		echo '<p><strong>[Altorias]:</strong> Parece que aún no eres digno de tocar ninguna campana.<br>Vuelve más tarde cuando cumplas alguna hazaña.</p>';
	}
	echo '<br>';
	echo '<table>' . $campanas . '</table>';

	if (isset($_SESSION['sonarcampana'])) {
		echo '<audio autoplay><source src="' . $root . 'sonidos/churchbell.mp3" type="audio/mpeg"></audio>';
		unset($_SESSION['sonarcampana']);
	}
}
function procesaform()
{
	global $_POST, $tag, $jug, $time, $us;
	if (isset($_POST['tocarcampana'])) {
		if ((isset($_POST['tag']))) {
			$gtag = $_POST['tag'];
			if ($tag == $gtag && isset($_POST['campana']) && is_numeric($_POST['campana']) && $_POST['campana'] < 7 && $_POST['campana'] > 0) {
				$campana = $_POST['campana'];
				$ganadores = db_query("SELECT * FROM ganadores WHERE premio={$campana}");
				if (!mysqli_num_rows($ganadores)) {
					$puedeGanar = false;
					switch ($campana) {
						case 1:
							$jugador = getJugador($jug);
							if ($jugador['nivel'] == 100) {
								$puedeGanar = true;
							}
							break;
						case 2:

							$jugador = getJugador($jug);
							if ($jugador['vencedor'] >= 1000) {
								$puedeGanar = true;
							}
							break;
						case 3:
							$num = db_query("SELECT * FROM conoce WHERE nombrejug='{$jug}' AND resultado='Menú completo' AND cantidad >0");
							if (mysqli_num_rows($num)) {
								$puedeGanar = true;
							}
							break;
						case 4:
							$clan = getJugador($jug)['clan'];
							if ($clan != "(ninguno)") {
								$miem = db_query("SELECT nombrejug FROM jugadores WHERE clan='{$clan}' AND nivel=100");
								$lider = mysqli_fetch_row(db_query("SELECT nombrejug FROM clandata WHERE lider=1 AND clan='{$clan}'"))[0];
								if (mysqli_num_rows($miem) == 4 && $lider == $jug) {
									$puedeGanar = true;
								}
							}
							break;
						case 5:
							$num = mysqli_fetch_row(db_query("SELECT COUNT(*) FROM aprendido WHERE nombrejug='{$jug}'"))[0];
							if ($num >= 30) {
								$puedeGanar = true;
							}
							break;
						case 6:
							$num = mysqli_fetch_row(db_query("SELECT COUNT(*) FROM conoce WHERE nombrejug='{$jug}' AND resultado='Amuleto de otra era' AND cantidad >0"))[0];
							$num2 = db_query("SELECT * FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Amuleto de otra era' AND usado=1");
							if ($num >= 1 && mysqli_num_rows($num2)) {
								$puedeGanar = true;
							}
							break;
					}
					if ($puedeGanar == true) {
						$mensForo = '¡Saludos!<br/><br/>';
						switch ($campana) {
							case 1:
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$jug}',1,{$time})");
								$subject = '<font color="blue">1º premio: </font> <strong>GANADOR ' . $jug . '</strong>';
								$mensForo .= '<strong>' . $jug . '</strong> ha sido el aspirante más rápido y ha logrado hacerse con el 1º premio.<br/>
							Para conseguir el 1º premio era necesario ser el primer aspirante en llegar a nivel 100 y tocar la campana del honor<br/>
							antes que nadie.<br/><br/>
							El 1º premio consta de:<br/>
							- x10 Joyas premium<br/>
							- x1 Título exclusivo(1º Premio): <strong>' . $jug . ' II, (Rey/Reina) de la Colina</strong><br/>
							- x1 Trofeo exclusivo(1º Premio): <strong>Trofeo: Medalla honor</strong><br/>
							- Reconocimiento en el menú principal con el nombre del ganador.<br/>';
								break;
							case 2:
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$jug}',2,{$time})");
								$subject = '<font color="blue">2º premio: </font> <strong>GANADOR ' . $jug . '</strong>';
								$mensForo .= '<strong>' . $jug . '</strong> ha sido el aspirante más fuerte y ha logrado hacerse con el 2º premio.<br/>
							Para conseguir el 2º premio era necesario ser el primero en vencer 1000 combates y tocar la campana de sangre.<br/><br/>
							El 2º premio consta de:<br/>
							- x7 Joyas premium<br/>
							- x1 Título exclusivo(2º Premio): <strong>' . $jug . ' II, (El/La) Destripahombres</strong><br/>
							- x1 Trofeo exclusivo(2º Premio): <strong>Trofeo: Medalla sangre</strong><br/>
							- Reconocimiento en el menú principal con el nombre del ganador.<br/>';
								break;
							case 3:
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$jug}',3,{$time})");
								$subject = '<font color="blue">3º premio: </font> <strong>GANADOR ' . $jug . '</strong>';
								$mensForo .= '<strong>' . $jug . '</strong> ha sido el aspirante más diestro y ha logrado hacerse con el 3º premio.<br/>
							Para conseguir el 3º premio era necesario ser el primero en fabricar un Menú completo y tocar la campana de la destreza.<br/><br/>
							El 3º premio consta de:<br/>
							- x7 Joyas premium<br/>
							- x1 Título exclusivo(3º Premio): <strong>' . $jug . ' II, Chef Real</strong><br/>
							- x1 Trofeo exclusivo(3º Premio): <strong>Trofeo: Medalla destreza</strong><br/>
							- Reconocimiento en el menú principal con el nombre del ganador.<br/>';
								break;
							case 4:
								$miem = db_query("SELECT nombrejug FROM jugadores WHERE clan='{$clan}'");
								$miembros = array();
								for ($i = 0; $i < 4; $i++) {
									array_push($miembros, mysqli_fetch_row($miem)[0]);
								}
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$miembros[0]}',4,{$time})");
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$miembros[1]}',4,{$time})");
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$miembros[2]}',4,{$time})");
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$miembros[3]}',4,{$time})");
								$gana = $miembros[0] . ', ' . $miembros[1] . ' ,' . $miembros[2] . ' y ' . $miembros[3];
								$subject = '<font color="blue">4º premio: </font> <strong>GANADOR ' . $gana . '</strong>';
								$mensForo .= '<strong>' . $gana . '</strong> han sido los aspirantes más unidos y ha logrado hacerse con el 4º premio.<br/>
							Para conseguir el 4º premio era necesario que los 4 miembros de un clan subiesen a nivel 100 los primeros antes que nadie y que el lider del clan tocase la campana de la amistad.<br/><br/>
							El 4º premio consta de:<br/>
							- x7 Joyas premium<br/>
							- x1 Título exclusivo(4º Premio): <strong>' . $miembros[0] . ' II, Maestro de gremio</strong>, <strong>' . $miembros[1] . ' II, Maestro de gremio</strong>, <strong>' . $miembros[2] . ' II, Maestro de gremio</strong> y <strong>' . $miembros[3] . ' II, Maestro de gremio</strong><br/>
							- x1 Trofeo exclusivo(4º Premio): <strong>Trofeo: Medalla amistad</strong><br/>
							- Reconocimiento en el menú principal con el nombre de los ganadores.<br/>';
								break;
							case 5:
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$jug}',5,{$time})");
								$subject = '<font color="blue">5º premio: </font> <strong>GANADOR ' . $jug . '</strong>';
								$mensForo .= '<strong>' . $jug . '</strong> ha sido el aspirante más sabio y ha logrado hacerse con el 5º premio.<br/>
							Para conseguir el 5º premio era necesario ser el primero en aprender 30 libros completos y tocar la campana del saber.<br/><br/>
							El 5º premio consta de:<br/>
							- x7 Joyas premium<br/>
							- x1 Título exclusivo(5º Premio): <strong>' . $jug . ' II, (Erudito/Erudita) Real</strong><br/>
							- x1 Trofeo exclusivo(5º Premio): <strong>Trofeo: Medalla saber</strong><br/>
							- Reconocimiento en el menú principal con el nombre del ganador.<br/>';
								break;
							case 6:
								db_query("INSERT INTO ganadores (nombrejug,premio,obtenido) VALUES ('{$jug}',6,{$time})");
								$subject = '<font color="blue">6º premio: </font> <strong>GANADOR ' . $jug . '</strong>';
								$mensForo .= '<strong>' . $jug . '</strong> ha sido el aspirante más inteligente y ha logrado hacerse con el 6º premio.<br/>
							Para conseguir el 6º premio era necesario ser el primero en reconstruir la reliquia antigua "Amuleto de otra era", equipárselo y tocar la campana del misterio.<br/><br/>
							El 6º premio consta de:<br/>
							- x10 Joyas premium<br/>
							- x1 Título exclusivo(6º Premio): <strong>' . $jug . ' II, (Forjador/Forjadora) de otra Era</strong><br/>
							- x1 Trofeo exclusivo(6º Premio): <strong>Trofeo: Medalla misterio</strong><br/>
							- Reconocimiento en el menú principal con el nombre del ganador.<br/>';
								break;
						}
						$mensForo .= '¡Enhorabuena!<br/>';
						$tiempototal = $time - $us['creado'];
						$seg = floor($tiempototal%60);
						$minT = $tiempototal/60;
						$horasT = $minT/60;
						$min =  floor($minT%60);
						$horas = floor($horasT%24);
						$dias = floor($horasT/24);
						$mensForo .= '<br/><strong>'. $jug . '</strong> ha completado esta hazaña en <strong>'.$dias.' días, '.$horas.' horas, '.$min.' minutos y '.$seg.' segundos</strong>.';

						db_query("INSERT INTO forohebras (nombrejug,nombre,hora,fijada) VALUES ('Altorias','{$subject}',{$time},1)");
						$retval = db_query("SELECT MAX(id) FROM forohebras WHERE nombrejug='Altorias' AND nombre='{$subject}' AND hora={$time}");
						$ret = mysqli_fetch_row($retval);
						mysqli_free_result($retval);
						db_query("INSERT INTO foromensajes (nombrejug,hora,texto,idhebra) VALUES ('Altorias',{$time},'{$mensForo}',{$ret[0]})");
						$_SESSION['sonarcampana'] = true;

						$_SESSION['mensaje'] = 'Has hecho sonar una campana. ¡Eres digno de la gloria!';
					} else {
						$_SESSION['error'] = 'Parece que no cumples los requisitos para tocar la campana aún...';
					}
				} else {
					$_SESSION['error'] = 'Parece que alguien se te adelantó y tocó la campana antes que tú. Mis disculpas amigo, pero llegaste tarde.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header('Location: campanasreales.php');
		return 1;
	}
}
