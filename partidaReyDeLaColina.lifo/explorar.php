<?php
$form = 1;
include('core.php');
function iweb()
{
	global $conftp, $_REQUEST, $tag, $jug, $us, $imgroot, $eventexplofactor, $time;
	techo('Esta es la pestaña de exploración, desde aquí podrás explorar los mapas que hayas obtenido. Si quieres saber que puedes encontrar en cada mapa, échale un vistazo a la Wiki.');
	$getMaps = db_query("SELECT tie.nombreobj, obj.ataq, obj.niveluso, obj.img, exp.cantidad FROM {$conftp}tiene as tie JOIN {$conftp}objetos as obj ON (tie.nombreobj = obj.nombreobj) LEFT JOIN {$conftp}explorado as exp ON (tie.nombrejug = exp.nombrejug AND tie.nombreobj = exp.mapa) WHERE obj.usos = 7 AND tie.nombrejug = '{$jug}' ORDER BY obj.niveluso DESC, obj.ataq DESC, obj.nombreobj DESC");
	if ($eventexplofactor != 1) {
		echo "<p><strong>¡Evento!</strong> Actualmente está aumentada la probabilidad base de la exploración(<strong>x{$eventexplofactor}</strong>)</p>";
	}
	echo '<p>Tienes <strong>' . $us['energia'] . '</strong> puntos de energía.</p>';
	echo '<br>Éstos son tus mapas:<br><br>';
	$numrows = mysqli_num_rows($getMaps);
	if ($numrows == 0) {
		echo '<strong>No tienes aún ningún mapa.</strong>';
	} else {
		echo '<table cellspacing="0" style="border: 1px solid black;">';
		for ($i = 0; $i < $numrows; $i++) {
			$row = mysqli_fetch_assoc($getMaps);
			$veces = 0;
			if ($row['cantidad'] != null) {
				$veces = $row['cantidad'];
			}
			$back = '';
			if ($i % 2 == 0) {
				$back = 'background-color: #C4C4C4;';
			}
			echo "<tr><td style=\"padding-left: 5px; padding-top: 5px; padding-bottom: 5px; padding-right: 10px; {$back}\">";
			if ($row['ataq'] > $us['energia']) {
				echo '[te falta energía] ';
			} else {
				echo "<form action=\"explorar.php\" method=\"post\">
				<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
				<input type=\"hidden\" name=\"ima\" value=\"{$row['img']}\"/>
				" . ($us['noexplorarhasta'] <= $time ? "<input type=\"submit\" name=\"explorar\" value=\"Explorar\" onclick=\"return c()\"/>" : '[No puedes explorar aún]') . "
				</form>";
			}
			$prospec = round($veces * 0.15, 2);
			if ($prospec > 200) {
				$prospec = 200;
			}
			echo "</td><td style=\"padding-left: 5px; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; {$back}\"><img src=\"{$imgroot}{$row['img']}.gif\"> {$row['nombreobj']}</td><td style=\"padding-top: 5px; padding-bottom: 5px; padding-right: 5px; {$back}\"><table><tr><td align=\"right\">Nivel de uso:</td><td align=\"right\"><strong>{$row['niveluso']}</strong></td><td style=\"padding-left: 5px;\" align=\"right\">Exploraciones:</td><td align=\"center\"><strong>{$veces}</strong></td></tr><tr><td align=\"right\">Coste energía:</td><td align=\"right\"><strong>-{$row['ataq']}</strong></td><td align=\"right\">Prospección:</td><td><strong>+{$prospec}%</strong></td></tr></table></td></tr>";
		}
		echo '</table>';
	}
}
function procesaform()
{
	global $conftp, $_REQUEST, $tag, $jug, $time, $us, $imgroot, $confmaxobjexplo, $confnoexplorarhasta, $confnoexplorarhastapremium, $eventexplofactor;
	if (isset($_REQUEST['explorar'])) {
		$loc = 'explorar.php';
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['ima']))) {
			$gtag = $_REQUEST['tag'];
			$ima = $_REQUEST['ima'];
			if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $ima))) {
				if (!($ima == "rmapaacv" && estaUsando($jug, 'Corazón de la montaña') && tieneOtraEra($jug)==false)) {
					$retvalcome = db_query("SELECT noexplorarhasta,energia,nivel FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
					$retcome = mysqli_fetch_row($retvalcome);
					mysqli_free_result($retvalcome);
					if ($retcome[0] <= $time) {
						$getData = db_query("SELECT obj.* FROM {$conftp}tiene as tie JOIN {$conftp}objetos as obj on (tie.nombreobj = obj.nombreobj) WHERE tie.nombrejug = '{$jug}' AND tie.cantidad > 0 AND obj.usos = 7 AND obj.img = '{$ima}'");
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
										db_query("UPDATE {$conftp}explorado SET cantidad=cantidad+1 WHERE nombrejug='{$jug}' and mapa='{$mapa}'");
									} else {
										$veces = 1;
										db_query("INSERT INTO {$conftp}explorado VALUES ('{$jug}','{$mapa}',1)");
									}

									$mens = "Has explorado en " . substr($mapa, 6) . ".<br/><br/>";
									$experiencia = 0;

									$getObjetosMapa = db_query("SELECT explo.nombreobj, obj.img, obj.puntosencontrar, explo.probabilidad FROM {$conftp}exploracion as explo JOIN {$conftp}objetos as obj ON (explo.nombreobj = obj.nombreobj) WHERE explo.mapa='{$mapa}'");

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
									db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',{$time},'{$mens}','Exploración')");
									db_query("UPDATE {$conftp}jugadores SET noexplorarhasta={$noexplorarhasta},energia={$ener} WHERE nombrejug='{$jug}'");
									db_query("UPDATE {$conftp}jugadores SET puntossuma = puntossuma + {$experiencia} WHERE nombrejug='{$jug}'");
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
					// Combate especial
					$ener = $us['energia'] - 35;
					if (!$us['espremium']) {
						$noexplorarhasta = $time + $confnoexplorarhasta;
					} else {
						$noexplorarhasta = $time + $confnoexplorarhastapremium;
					}
					db_query("UPDATE jugadores SET noexplorarhasta={$noexplorarhasta},energia={$ener} WHERE nombrejug='{$jug}'");
					$loc = 'mensajeria.php';
					combateContraEnano();
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
