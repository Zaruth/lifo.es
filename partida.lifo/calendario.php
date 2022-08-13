<?php
$form = 1;
include('core.php');
function iweb()
{
	global $jug, $_REQUEST, $time, $imgroot, $tag, $conftitle;
	header("Location: estado.php");
	return 1;
	techo('Bienvenidos al calendario de adviendo de Lifo de ' . $conftitle . '. Ven cada día para abrir tu regalo, ¿qué habrá dentro?.
	<br><i>-Evento disponible hasta el día 24 de diciembre-</i><br>');
	$parts = explode("-", ahora_dia($time));
	$dia = intval($parts[0]);
	$mes = intval($parts[1]);
	if ($mes != 12) { 
		echo "<p>El evento volverá el 1 de diciembre, ¡tendrás que esperar un poco!</p>";
	} else {
		if ($dia > 24) {
			echo "<p>El evento terminó el día <strong>24</strong>. ¡Gracias por haber participado! HO HO HO</p>";
		} else {
			$getVals = db_query("SELECT cal.*, obj.img FROM `calendario` as cal JOIN `objetos` as obj ON (cal.nombreobj = obj.nombreobj) WHERE cal.nombrejug = '{$jug}' ORDER BY `dia` DESC");
			$obtenidoHoy = false;
			for ($i = 0; $i < mysqli_num_rows($getVals); $i++) {
				$val = mysqli_fetch_assoc($getVals);
				if (intval($val['dia']) == $dia) {
					$obtenidoHoy = true;
					break;
				}
			}
			if ($obtenidoHoy) {
				echo "<p>¡Ya has recibido tu regalo hoy!<br>Vuelve mañana para recibir un nuevo regalo.</p>";
			} else {
				echo "<p>¡Aún no has reclamado tu regalo hoy! Date prisa y reclámalo aquí: </p>
			<p>
				<form action=\"calendario.php\" method=\"post\">
				<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
				<label><img src=\"{$imgroot}presentnav.gif\"> </label>
				<input type=\"submit\" name=\"reclamar\" value=\"Reclamar\"/>
				</form>
			</p>";
			}
			if (mysqli_num_rows($getVals) > 0) {
				echo "Éstos son tus últimos regalos obtenidos (<strong>" . mysqli_num_rows($getVals) . "</strong>): <br>";
				mysqli_data_seek($getVals, 0);
				for ($i = 0; $i < mysqli_num_rows($getVals); $i++) {
					$val = mysqli_fetch_assoc($getVals);
					echo "<br>Día {$val['dia']} - <strong>x{$val['cantidad']}</strong> <img src=\"{$imgroot}{$val['img']}.gif\"> {$val['nombreobj']}";
				}
			}
		}
	}
}

function procesaform()
{
	global $jug, $_REQUEST, $time, $conftp, $imgroot, $tag, $conftitle;
	if (isset($_REQUEST['reclamar'])) {
		$loc = 'calendario.php';
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($gtag == $tag) {
				$parts = explode("-", ahora_dia($time));
				$dia = intval($parts[0]);
				$getVals = db_query("SELECT * FROM `calendario` WHERE nombrejug = '{$jug}' AND dia = {$dia}");
				if (mysqli_num_rows($getVals) == 0) {
					$cantidad = 1;
					switch ($dia) {
						case 1:
						case 6:
						case 14:
						case 17:
							$objeto = 'Chocolate';
							break;
						case 2:
						case 10:
						case 19:
						case 22:
							$objeto = 'Bastón de caramelo';
							break;
						case 3:
						case 7:
						case 11:
						case 15:
						case 23:
							$objeto = 'Chocolate caliente';
							break;
						case 5:
						case 8:
						case 12:
						case 18:
							$objeto = 'Galletas de mantequilla';
							break;
						case 4:
							$objeto = 'Matasuegras';
							break;
						case 9:
							$objeto = 'Gorro de festivo';
							break;
						case 13:
							$objeto = 'Túnica festiva';
							break;
						case 16:
							$objeto = 'Pantalones festivos';
							break;
						case 20:
							$objeto = 'Botas festivas';
							break;
						case 21:
							$objeto = 'Pergamino mágico: Oso festivo';
							break;
						case 24:
							$objeto = 'Osito festivo de peluche';
							break;
						default:
							$objeto = 'Chocolate caliente';
							break;
					}
					db_query("INSERT INTO calendario (nombrejug,dia,nombreobj,cantidad) VALUES ('{$jug}',{$dia},'{$objeto}',{$cantidad})");

					include_once 'auxiliar/f_items.php';
					$queryItem = db_query("SELECT * FROM objetos WHERE nombreobj='{$objeto}'");
					$item = mysqli_fetch_assoc($queryItem);
					$item['cantidad']=1;
					$objeto = getItemInventario($item);

					dale_objeto($jug, $item['nombreobj'], $cantidad);
					$mens = 'Has reclamado tu regalo del día.<br>Has recibido:<br>'.$objeto;
					$getVals = db_query("SELECT * FROM `calendario` WHERE nombrejug = '{$jug}'");
					if (mysqli_num_rows($getVals) >= 23 && $dia == 24) {
						$tiempo = 518400;
						$jugador = $jug;
						if ($tiempo > 0)
						$tiempo = "+{$tiempo}";
						db_query("UPDATE jugadores SET premiumhasta=premiumhasta{$tiempo} WHERE nombrejug='{$jugador}' AND premiumhasta>={$time}");
						db_query("UPDATE jugadores SET premiumhasta={$time}{$tiempo} WHERE nombrejug='{$jugador}' AND premiumhasta<{$time}");

						$mens .= '<p>¡Vaya!, hay algo más en el fondo de la caja.<br>
						La caja contenía además una cápsula de tiempo premium.<br>
						Al momento de tocarla se destruye y te imbuye de poder.<br>
						<br>
						Has recibido <b>6 días</b> de tiempo premium.';
						//dale_objeto($jug, $item['nombreobj'], $cantidad);
					}
					db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',{$time},'{$mens}')");
					
					mysqli_free_result($queryItem);
					$loc = 'mensajeria.php';
				} else {
					$_SESSION['error'] = 'Ya has reclamado tu regalo hoy, por favor revisa mensajería.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header("Location: {$loc}");
		return 1;
	}
}
