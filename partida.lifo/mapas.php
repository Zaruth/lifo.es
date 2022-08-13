<?php
$form = 1;
include('core.php');
function iweb()
{
	global $tag, $jug, $us, $imgroot, $eventexplofactor, $time;
	techo('Esta es la pestaña de mapas, desde aquí podrás explorar los mapas que hayas obtenido y descubrir lo que ocultan las distintas zonas de Lifo. También, podrás realizar encuentros contra criaturas de los distintos mapas que hayas explorado.<br>
	¡Pero ten cuidado! Los encuentros no serán pan comido. Requeriran de tu estrategia y tu astucia, o quizás no vivas para contarlo... ¡Ánimo aventurero!');
	$getMaps = db_query("SELECT tie.nombreobj, obj.ataq, obj.niveluso, obj.img, exp.cantidad FROM tiene as tie JOIN objetos as obj ON (tie.nombreobj = obj.nombreobj) LEFT JOIN explorado as exp ON (tie.nombrejug = exp.nombrejug AND tie.nombreobj = exp.mapa) WHERE obj.usos = 7 AND tie.nombrejug = '{$jug}' ORDER BY obj.niveluso DESC, obj.ataq DESC, obj.nombreobj DESC");
	if ($eventexplofactor != 1) {
		echo "<p><strong>¡Evento!</strong> Actualmente está aumentada la probabilidad base de la exploración(<strong>x{$eventexplofactor}</strong>)</p>";
	}
	echo '<p>Tienes <strong>' . $us['energia'] . '</strong> puntos de energía.</p>';
	if ($us['noexplorarhasta'] >= $time) {
		$dia_c = ahora_dia($us['noexplorarhasta']);
		$hora_c = ahora_hora($us['noexplorarhasta']);
		echo "<p>No puedes explorar hasta: el <strong>{$dia_c}</strong> a las <strong>{$hora_c}</strong>.</p>";
	} else {
		echo "<p>Puedes explorar (si dispones de la energía y el nivel necesario).</p>";
	}
	if ($us['noencuentrohasta'] >= $time) {
		$dia_c = ahora_dia($us['noencuentrohasta']);
		$hora_c = ahora_hora($us['noencuentrohasta']);
		echo "<p>No puedes relizar encuentros hasta: el <strong>{$dia_c}</strong> a las <strong>{$hora_c}</strong>.</p>";
	} else {
		echo "<p>Puedes realizar encuentros (si dispones del nivel necesario).</p>";
	}

	// Estadísticas
	include_once './auxiliar/f_entity.php';
	$Jugador = new Jugador($jug);

	echo "<div class=\"bonificacion\"><table><tr><td>
    <table style=\"white-space: nowrap; width: 100%;\"><tbody><tr><td>";


	echo "<table>";
	echo "<tr><td colspan=\"4\">Estadísticas del jugador:</td><tr>";
	echo "<tr><td colspan=\"2\" style=\"color: #ffd100;\">Carac. Primarias</td><td colspan=\"2\" style=\"color: #ffd100;\">Carac. Secundarias</td><tr>";

	echo "<tr>";
	$dis = true;
	if ($Jugador->ataque != $Jugador->m_ataque) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Ataque:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_ataque) . "</td>";
	$dis = true;
	if ($Jugador->parmadura != $Jugador->m_parmadura) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Penetración de armadura:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_parmadura) . "%</td>";
	echo "</tr>";

	echo "<tr>";
	$dis = true;
	if ($Jugador->armadura != $Jugador->m_armadura) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Armadura:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_armadura) . "</td>";
	$dis = true;
	if ($Jugador->reduccion != $Jugador->m_reduccion) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Reducción de daño:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . (!$dis ? $Jugador->reduccion . '+' . ($Jugador->m_reduccion - $Jugador->reduccion) : $Jugador->m_reduccion) . "%</td>";
	echo "</tr>";

	echo "<tr>";
	$dis = true;
	if ($Jugador->vida != $Jugador->m_vida) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Vida:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_vida) . "</td>";
	$dis = true;
	if ($Jugador->absorcion != $Jugador->m_absorcion) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Absorción:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_absorcion) . "%</td>";
	echo "</tr>";

	echo "<tr>";
	$dis = true;
	if ($Jugador->evasion != $Jugador->m_evasion) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Evasion:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_evasion) . "%</td>";
	$dis = true;
	if ($Jugador->espinas != $Jugador->m_espinas) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Espinas:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_espinas) . "%</td>";
	echo "</tr>";

	echo "<tr>";
	$dis = true;
	if ($Jugador->critico != $Jugador->m_critico) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Crítico:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_critico) . "%</td>";
	$dis = true;
	if ($Jugador->vampirismo != $Jugador->m_vampirismo) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Vampirismo:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">" . ($Jugador->m_vampirismo) . "%</td>";
	echo "</tr>";

	echo "<tr>";
	$dis = true;
	if ($Jugador->dcritico != $Jugador->m_dcritico) $dis = false;
	echo "<td style=\"text-align:right; padding-right: 5px;\">Daño crítico:</td><td" . (!$dis ? ' style="color: #1eff00;"' : '') . ">+" . ($Jugador->m_dcritico) . "%</td>";
	echo "<td style=\"text-align:right; padding-right: 5px;\"></td><td></td>";
	echo "</tr>";

	echo "</table>";

	echo "</td></tr></tbody></table>
    </td><th style=\"background-position: top right\"></th></tr>
    <tr><th style=\"background-position: bottom left\"></th>
    <th style=\"background-position: bottom right\"></th>
    </tr></table></div>";

	echo '<br>Éstos son tus mapas:<br><br>';
	$numrows = mysqli_num_rows($getMaps);
	if ($numrows == 0) {
		$mensaje = "
		Has recibido el siguiente equipamiento:<br> 
		<strong>x1</strong> <img src=\"{$imgroot}cupeq.gif\"> Cuchillo (Ataque: 1 / Protección: 0 / Nivel: 1)<br>
		<strong>x1</strong> <img src=\"{$imgroot}esroto.gif\"> Escudo roto (Ataque: 0 / Protección: 2 / Nivel: 1)<br>
		Equípatelos y ¡prepárate para la batalla!<br>
		<br>
		También recibiste:<br>
		<strong>x1</strong> <img src=\"{$imgroot}rmapaacl.gif\"> Mapa: Campos de Lifo (Energía: -5 / Nivel: 1 / MAPA)<br>
		¡Mucha suerte en tu aventura!<br>";
		dale_objeto($jug, 'Escudo roto');
		dale_objeto($jug, 'Cuchillo');
		dale_objeto($jug, 'Mapa: Campos de Lifo');
		db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',{$time},'{$mensaje}')");
		header('Location: estado.php');
		exit();
		return 1;
	} else {
		echo '<table cellspacing="0" style="border: 1px solid black; text-align: center;">';
		echo '<thead><tr>
		<th>Mapa</th>
		<th colspan="2" style="border-left: 1px solid; border-right: 1px solid;">Exploración</th>
		<th colspan="2">Encuentros</th>
		</tr></thead>';
		for ($i = 0; $i < $numrows; $i++) {
			$row = mysqli_fetch_assoc($getMaps);

			// COLOR DE LA COLUMNA
			$back = '';
			if ($i % 2 == 0) {
				$back = 'background-color: #C4C4C4;';
			}
			// //
			echo "<tr>";

			// IMAGEN Y NOMBRE DEL MAPA
			echo "<td style=\"padding-left: 5px; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; {$back}; text-align: left;\">
			<img src=\"{$imgroot}{$row['img']}.gif\"> {$row['nombreobj']}</td>";

			$veces = 0;
			if ($row['cantidad'] != null) {
				$veces = $row['cantidad'];
			}
			// //

			// BOTON DE EXPLORAR
			echo "<td style=\"border-left: 1px solid; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; padding-right: 10px; {$back}\">";
			if ($us['nivel'] < $row['niveluso']) {
				echo '[Nivel insuficiente] ';
			} else {
				if ($row['ataq'] > $us['energia']) {
					echo '[Te falta energía] ';
				} else {
					echo "<form action=\"mapas.php\" method=\"post\">
				<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
				<input type=\"hidden\" name=\"ima\" value=\"{$row['img']}\"/>
				" . ($us['noexplorarhasta'] <= $time ? "<input type=\"submit\" name=\"explorar\" value=\"Explorar\" onclick=\"return c()\"/>" : '[No puedes explorar aún]') . "
				</form>";
				}
			}
			$prospec = round($veces * 0.15, 2);
			if ($prospec > 200) {
				$prospec = 200;
			}
			echo "</td>";
			// //

			// INFO DE PROSPECCION, EXPLORACIONES, NIVEL USO Y ENERGIA
			echo "<td style=\"border-right: 1px solid; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; {$back}\">
				<table>
					<tr>
						<td align=\"right\">Nivel de uso:</td>
						<td align=\"right\"><strong>{$row['niveluso']}</strong></td>
						<td style=\"padding-left: 5px;\" align=\"right\">Exploraciones:</td>
						<td align=\"center\"><strong>{$veces}</strong></td>
					</tr>
					<tr>
						<td align=\"right\">Coste energía:</td>
						<td align=\"right\"><strong>-{$row['ataq']}</strong></td>
						<td align=\"right\">Prospección:</td>
						<td><strong>+{$prospec}%</strong></td>
					</tr>
				</table>
			</td>";
			// //

			// ESPACIADO
			//echo "";
			// //

			// REALIZAR ENCUENTRO
			echo "<td style=\"padding: 5px; {$back}\">";
			if ($us['nivel'] < $row['niveluso']) {
				echo '[Nivel insuficiente] ';
			} else {
				echo "<form action=\"mapas.php\" method=\"post\">
				<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
				<input type=\"hidden\" name=\"idobj\" value=\"{$row['img']}\"/>
				" . ($us['noencuentrohasta'] <= $time ? "<input type=\"submit\" name=\"encuentro\" value=\"Combatir\" onclick=\"return c()\"/>" : '[No puedes combatir aún]') . "
				</form>";
			}
			echo "</td>";
			// //

			// REALIZAR ENCUENTRO
			$ganados = 0;
			$totales = 0;
			$encuentros = db_query("SELECT * FROM encuentros WHERE nombrejug LIKE '{$jug}' AND mapa LIKE '{$row['nombreobj']}'");
			if (mysqli_num_rows($encuentros)) {
				$combates = mysqli_fetch_assoc($encuentros);
				$ganados = $combates['ganados'];
				$totales = $combates['totales'];
			}
			echo "<td style=\"padding: 5px; {$back}\">";
			echo "<table>
					<tr>
						<td align=\"right\">Ganados:</td>
						<td align=\"right\"><strong>{$ganados}</strong></td>
					</tr>
					<tr>
						<td align=\"right\">Totales:</td>
						<td align=\"right\"><strong>{$totales}</strong></td>
					</tr>
				</table>";
			echo "</td>";
			// //

			echo "</tr>";
		}
		echo '</table>';
	}
	echo '<br>';
}
function procesaform()
{
	global $_REQUEST, $tag, $jug, $time, $us, $imgroot, $confmaxobjexplo, $confnoexplorarhasta, $confnoexplorarhastapremium, $eventexplofactor;
	if (isset($_REQUEST['explorar'])) {
		$loc = 'mapas.php';
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['ima']))) {
			$gtag = $_REQUEST['tag'];
			$ima = $_REQUEST['ima'];
			if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $ima))) {
				$retvalcome = db_query("SELECT noexplorarhasta,energia,nivel FROM jugadores WHERE nombrejug='{$jug}'");
				$retcome = mysqli_fetch_row($retvalcome);
				mysqli_free_result($retvalcome);
				if ($retcome[0] <= $time) {
					$getData = db_query("SELECT obj.* FROM tiene as tie JOIN objetos as obj on (tie.nombreobj = obj.nombreobj) WHERE tie.nombrejug = '{$jug}' AND tie.cantidad > 0 AND obj.usos = 7 AND obj.img = '{$ima}'");
					if (mysqli_num_rows($getData) > 0) {
						$row = mysqli_fetch_assoc($getData);
						if ($us['energia'] - $row['ataq'] >= 0) {
							if ($us['nivel'] >= $row['niveluso']) {
								$ener = $us['energia'] - $row['ataq'];
								$mapa = $row['nombreobj'];
								if (!$us['espremium']) {
									$noexplorarhasta = $time + $confnoexplorarhasta;
								} else {
									$noexplorarhasta = $time + $confnoexplorarhastapremium;
								}
								$reconn = db_query("SELECT cantidad FROM explorado WHERE nombrejug='{$jug}' and mapa='{$mapa}'");
								$veces = 0;
								if (mysqli_num_rows($reconn) == 1) {
									$retconn = mysqli_fetch_row($reconn);
									mysqli_free_result($reconn);
									$veces = $retconn[0] + 1;
									db_query("UPDATE explorado SET cantidad=cantidad+1 WHERE nombrejug='{$jug}' and mapa='{$mapa}'");
								} else {
									$veces = 1;
									db_query("INSERT INTO explorado VALUES ('{$jug}','{$mapa}',1)");
								}

								$mens = "Has explorado en " . substr($mapa, 6) . ".<br/><br/>";
								$experiencia = 0;

								$getObjetosMapa = db_query("SELECT explo.nombreobj, obj.img, obj.puntosencontrar, explo.probabilidad FROM exploracion as explo JOIN objetos as obj ON (explo.nombreobj = obj.nombreobj) WHERE explo.mapa='{$mapa}'");

								$listItems = [];
								$items = mysqli_num_rows($getObjetosMapa);
								for ($i = 0; $i < $items; $i++) {
									$ret = mysqli_fetch_assoc($getObjetosMapa);
									array_push($listItems, $ret);
								}
								shuffle($listItems);

								$prospec = $veces * 0.15;
								if ($prospec > 200) {
									$prospec = 200;
								}
								$objetos = 0;
								$objetostxt = '';
								for ($i = 0; $i < $items; $i++) {
									$puede = true;
									if (strpos($listItems[$i]['nombreobj'], 'Mapa:') !== false && tieneItem($jug, $listItems[$i]['nombreobj'])) {
										$puede = false;
									}
									if ($puede) {
										$numjug = rand(1, 10000);
										$itemprob = $listItems[$i]['probabilidad'];
										$itemprob *= $eventexplofactor;
										$itemprob += floor(($itemprob * $prospec) / 100);
										if ($itemprob > 10000) {
											$itemprob = 10000;
										}
										if (0 < $numjug && $numjug <= $itemprob) {
											$expitem = 0;
											$factorred = ((0.11 * $us['nivel']) - 0.11 + 4);
											//$factorredniveluno=((0.11 * 1) - 0.11 + 4);
											if ($factorred >= 15) $factorred = 15;
											$expitem = floor($listItems[$i]['puntosencontrar'] / $factorred);
											if (is_infinite($expitem)) {
												$expitem = 0;
											}
											$experiencia += $expitem;
											if ($experiencia < 0) {
												$experiencia = 0;
											}
											$porc = $itemprob / 100;
											$objetostxt .= "<img src=\"{$imgroot}{$listItems[$i]['img']}.gif\"> {$listItems[$i]['nombreobj']}";
											if ($expitem > 0 /*|| $us['admin']==1*/) {
												$objetostxt .= " (+{$expitem})";
												//if ($us['admin']==1) $objetostxt .= "[{$listItems[$i]['puntosencontrar']} / {$factorred} ... {$factorredniveluno}]";
											}
											$objetostxt .= "<br>";
											//$objetostxt .= " - (<strong>TEST: {$porc}%</strong>)<br>";    //PARA TESTEO
											$objetos++;
											dale_objeto($jug, $listItems[$i]['nombreobj']);
										}
									}
									if ($objetos >= $confmaxobjexplo) {
										break;
									}
								}
								if ($objetos > 0) {
									$mens .= "Has encontrado:<br/><br/>" . $objetostxt;
								} else {
									$mens .= "No has conseguido encontrar nada.<br/><br/>";
								}
								$experiencia = floor($experiencia);
								if ($experiencia < 1) {
									$experiencia = 1;
								}
								$num = rand(1, 100);
								if ($num == 1) {
									$num = rand(1, 100);
									if ($num > 0 && $num <= 20) {
										$cristal = 'Cristal purpúreo inerte';
										$im = 'cenerlil';
									}
									if ($num > 20 && $num <= 50) {
										$cristal = 'Cristal añil inerte';
										$im = 'cenerazu';
									}
									if ($num > 50 && $num <= 100) {
										$cristal = 'Cristal carmesí inerte';
										$im = 'cenerroj';
									}
									dale_objeto($jug, $cristal);
									$mens .= "¡Vaya! Has conseguido <img src=\"{$imgroot}{$im}.gif\" alt=\"{$cristal}\"/> <b>{$cristal}</b> mientras explorabas.";
								}
								db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',{$time},'{$mens}','Exploración')");
								db_query("UPDATE jugadores SET noexplorarhasta={$noexplorarhasta},energia={$ener} WHERE nombrejug='{$jug}'");
								db_query("UPDATE jugadores SET puntossuma = puntossuma + {$experiencia} WHERE nombrejug='{$jug}'");
								include_once 'auxiliar/f_logros.php';
								for ($k = 13; $k < 19; $k++)
									check_logro($k, $jug);
								check_logro(49, $jug);
								if ($experiencia > 0) {
									sumapuntosMonster();
								}
								$loc = 'mensajeria.php?t=Exploración';
								$_SESSION['mensaje'] = 'Has explorado con éxito.';
							} else {
								$_SESSION['error'] = 'No tienes suficiente nivel como para explorar ahí.';
							}
						} else {
							$_SESSION['error'] = '¡No tienes suficiente energía!';
						}
					} else {
						$_SESSION['error'] = '¡No dispones de ese mapa!';
					}
				} else {
					$_SESSION['error'] = 'No puedes volver a explorar aun.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		} else {
			$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		}
		header("Location: {$loc}");
		return 1;
	}

	if (isset($_REQUEST['encuentro'])) {
		$loc = 'mapas.php';
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idobj']))) {
			$gtag = $_REQUEST['tag'];
			$idobj = $_REQUEST['idobj'];
			if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $idobj))) {
				$retvalcome = db_query("SELECT noencuentrohasta,energia,nivel FROM jugadores WHERE nombrejug='{$jug}'");
				$retcome = mysqli_fetch_row($retvalcome);
				mysqli_free_result($retvalcome);
				if ($retcome[0] <= $time) {
					$getData = db_query("SELECT obj.* FROM tiene as tie JOIN objetos as obj on (tie.nombreobj = obj.nombreobj) WHERE tie.nombrejug = '{$jug}' AND tie.cantidad > 0 AND obj.usos = 7 AND obj.img = '{$idobj}'");
					if (mysqli_num_rows($getData) > 0) {
						$row = mysqli_fetch_assoc($getData);
						if ($us['nivel'] >= $row['niveluso']) {
							include_once 'auxiliar/f_encuentros.php';
							if (realizar_encuentro($jug, $row['nombreobj']) != null) {
								include_once 'auxiliar/f_logros.php';
								check_logro(57, $jug);
								check_logro(58, $jug);
								check_logro(59, $jug);
								$loc = 'mensajeria.php?t=Encuentros';
								$_SESSION['mensaje'] = '¡Has realizado un encuentro!';
							} else {
								$_SESSION['error'] = 'Parece ser que este mapa no tiene aún criaturas.<br>
								Prueba más tarde, quizás haya.' . $idMon;
							}
						} else {
							$_SESSION['error'] = 'No tienes suficiente nivel como para realizar un encuentro ahí.';
						}
					} else {
						$_SESSION['error'] = '¡No dispones de ese mapa!';
					}
				} else {
					$_SESSION['error'] = 'No puedes volver a realizar un encuentro aun.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		} else {
			$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		}
		header("Location: {$loc}");
		return 1;
	}
}
