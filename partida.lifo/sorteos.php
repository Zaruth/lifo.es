<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$_REQUEST,$time,$conftp,$imgroot,$tag,$conftitle,$us;
	techo('Bienvenido a la sección de sorteos. Desde aquí podrás participar en los sorteos que se realicen a lo largo de la partida.');
	
	$getVals = db_query("
	SELECT s.*,o.img, COUNT(p.idsorteo) as inscritos
	FROM {$conftp}`sorteos` as s LEFT JOIN {$conftp}`objetos` as o ON (s.nombreobj = o.nombreobj) LEFT JOIN {$conftp}`participantes` as p ON (s.id = p.idsorteo)
	GROUP BY s.id
	ORDER BY `id` DESC");
	$numsorteos = mysqli_num_rows($getVals);
	if ($numsorteos > 0) {
		for ($i = 0;$i < $numsorteos;$i++) {
			echo "<div style=\"border: 1px solid black; width: 300px;\">";
			$val = mysqli_fetch_assoc($getVals);
			if ($val['ganador'] != '' || $val['fechalimite'] < $time) {
				$open = "<strong style=\"color: red;\">CERRADO</strong>";
			} else {
				$open = "<strong style=\"color: green;\">ABIERTO</strong>";
			}
			echo "{$open} - <strong>{$val['titulo']}</strong><br>Descripción: {$val['descripcion']}<br>Participantes: <strong>{$val['inscritos']}</strong><br>";
			if ($val['nombreobj'] != '') {
				echo "Objeto => <strong>x{$val['cantidad']}</strong>";
				if ($val['img'] != '' || $val['img'] != null){
					echo"<img src=\"{$val['img']}.gif\">";
				}
				echo" {$val['nombreobj']}<br>";
			}
			if ($val['oro'] > 0) {
				echo "Oro => <strong>{$val['oro']}</strong> moneda(s) de oro<br>";
			}
			echo 'Fecha límite: <strong>'.ahora_dia($val['fechalimite']).'</strong> a las <strong>'.ahora_hora($val['fechalimite']).'</strong><br>Nivel Mínimo: <strong>'.$val['nivelmin'].'</strong><br>';
			if ($us['nivel'] >= $val['nivelmin']) {
				$getInscrit = db_query("SELECT * FROM {$conftp}`participantes` WHERE nombrejug='{$jug}' AND idsorteo={$val['id']}");
				$cgetInscrit = mysqli_num_rows($getInscrit);
				if ($cgetInscrit == 0) {
					if ($val['fechalimite'] > $time) {
						echo "
						<form action=\"sorteos.php\" method=\"post\">
						<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
						<input type=\"hidden\" name=\"id\" value=\"{$val['id']}\"/>
						<input type=\"submit\" name=\"participar\" value=\"Participar\"/>
						</form>";
					} else {
						echo "<strong>La participación ha terminado.</strong>";
					}
				} else {
					echo "<strong>Has participado en este sorteo.</strong>";
				}
			} else {
				echo "<strong>No tienes el nivel necesario para este sorteo.</strong>";
			}
			if ($val['ganador'] != '') {
				echo "<br>GANADOR: <strong>{$val['ganador']}</strong>";
			}
			if ($us['admin']) {
				echo "<hr>
				<form action=\"sorteos.php\" method=\"post\">
				<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
				<input type=\"hidden\" name=\"id\" value=\"{$val['id']}\"/>
				<input type=\"submit\" name=\"sortear\" onclick=\"return c('Se sorteará el premio a los jugadores.')\" value=\"Sortear\"/>
				<input type=\"submit\" name=\"borrarsorteo\" onclick=\"return c('Se borrará el sorteo.')\" value=\"Borrar Sorteo\"/>
				</form>";
			}
			echo "</div><br>";
		}
		mysqli_free_result($getVals);
	} else {
		echo "<p><strong>Actualmente no hay ningún sorteo.</strong></p>";
	}
	
	if ($us['admin']) {
		$parts = explode("-", ahora_dia($time));
		$dia = $parts[0];
		$mes = $parts[1];
		$anyo = $parts[2];
		echo "<hr><p>Crear sorteo(SOLO ADMIN):</p>
		<div style=\"text-align: left; width: 150px;\">
			<form action=\"sorteos.php\" method=\"post\">
			<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
			<label>Título:</label><input type=\"text\" name=\"titulo\"/><br>
			<label>Descripcion:</label><input type=\"text\" name=\"descripcion\"/><br>
			<label>Objeto:</label><input type=\"text\" name=\"objeto\"/><br>
			<label>Cantidad:</label><input type=\"text\" name=\"cantidad\" value=\"0\"/><br>
			<label>Oro:</label><input type=\"text\" name=\"oro\" value=\"0\"/><br>
			<label>Nivel Min:</label><input type=\"text\" name=\"nivelmin\" value=\"1\"/><br>
			<label>Fecha:</label><input type=\"date\" name=\"fechalimite\" value=\"{$anyo}-{$mes}-{$dia}\"><br>
			<label>Hora:</label><input type=\"number\" name=\"hora\" min=\"0\" max=\"23\" value=\"0\"><br>
			<label>Minuto:</label><input type=\"number\" name=\"minuto\" min=\"0\" max=\"59\" value=\"0\"><br>
			<input type=\"submit\" name=\"crearsorteo\" value=\"Crear\"/>
			</form>
		</div>";
		
	}
}

function procesaform() {
	global $jug,$_REQUEST,$time,$conftp,$imgroot,$tag,$conftitle,$zonaact;
	
	if (isset($_REQUEST['crearsorteo'])) {
		$loc = 'sorteos.php';
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($gtag == $tag) {
				$titulo = $_REQUEST['titulo'];
				$descripcion = $_REQUEST['descripcion'];
				$objeto = $_REQUEST['objeto'];
				$cantidad = $_REQUEST['cantidad'];
				$oro = $_REQUEST['oro'];
				$nivelmin = $_REQUEST['nivelmin'];
				$fechalim = $_REQUEST['fechalimite'];
				$hora = $_REQUEST['hora'];
				$minuto = $_REQUEST['minuto'];
				if (trim($titulo) != '' && trim($descripcion) != '' && (trim($objeto) != '' || $oro > 0)) {
					$fecha = strtotime($fechalim) + ($zonaact*3600) + ($hora*3600) + ($minuto*60);
					db_query("INSERT INTO {$conftp}sorteos (titulo,descripcion,nombreobj,cantidad,oro,nivelmin,ganador,fechalimite) VALUES ('{$titulo}','{$descripcion}','{$objeto}',{$cantidad},{$oro},{$nivelmin},'',{$fecha})");
					$_SESSION['mensaje'] = 'Sorteo creado.';
				} else {
					$_SESSION['error'] = 'Error en los datos, ¡intenta de nuevo, por favor!';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}					
		header("Location: {$loc}");
		return 1;
	}
	
	if (isset($_REQUEST['borrarsorteo'])) {
		$loc = 'sorteos.php';
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($gtag == $tag) {
				$id = $_REQUEST['id'];
				db_query("DELETE FROM sorteos WHERE id = {$id}");
				db_query("DELETE FROM participantes WHERE idsorteo = {$id}");
				$_SESSION['mensaje'] = '<font style="color: red;">Sorteo borrado.</font>';
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}					
		header("Location: {$loc}");
		return 1;
	}
	
	if (isset($_REQUEST['sortear'])) {
		$loc = 'sorteos.php';
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($gtag == $tag) {
				$id = $_REQUEST['id'];
				$getSorteo = db_query("SELECT s.*,o.img FROM {$conftp}`sorteos` as s LEFT JOIN {$conftp}`objetos` as o ON (s.nombreobj = o.nombreobj) WHERE s.id={$id}");
				$sorteo = mysqli_fetch_assoc($getSorteo);
				$getParticipantes = db_query("SELECT DISTINCT nombrejug FROM {$conftp}participantes WHERE idsorteo={$id}");
				$numParticipantes = mysqli_num_rows($getParticipantes);
				if ($numParticipantes > 0) {
					$ganador = rand(1,$numParticipantes);
					for($i = 1;$i<=$numParticipantes;$i++){
						$participante = mysqli_fetch_assoc($getParticipantes);
						$mensaje="¡Has ganado el sorteo <strong>{$sorteo['titulo']}</strong>!<br>Has recibido:";
						if($i == $ganador){
							if ($sorteo['nombreobj'] != '' && $sorteo['cantidad'] > 0 ) {
								if ($sorteo['img'] != null && $sorteo['img'] != '') {
									dale_objeto($participante['nombrejug'],$sorteo['nombreobj'],$sorteo['cantidad']);
									$mensaje.="<br><strong>x{$sorteo['cantidad']}</strong> <img src=\"{$sorteo['img']}.gif\"> {$sorteo['nombreobj']}";
								} else {
									$mensaje.="<br><strong>x{$sorteo['cantidad']}</strong> {$sorteo['nombreobj']}";
								}
							}
							if ($sorteo['oro'] > 0) {
								dale_oro($participante['nombrejug'],$sorteo['oro']);
								$mensaje.="<br><strong>x{$sorteo['oro']}</strong> moneda(s) de oro";
							}
							$mensaje.="<br>¡Enhorabuena!";
							db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$participante['nombrejug']}','@',{$time},'{$mensaje}')");
							db_query("UPDATE {$conftp}sorteos SET ganador='{$participante['nombrejug']}' WHERE id={$id}");
							$_SESSION['mensaje'] = '<font style="color: green;">¡Sorteo realizado! Ha ganado <strong>'.$participante['nombrejug'].'</strong></font>';
						} else {
							db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$participante['nombrejug']}','@',{$time},'No has ganado el sorteo <strong>{$sorteo['titulo']}</strong>.<br>¡No te desanimes! próximamente habrá más oportunidades.')");
						}
					}
				} else {
					$_SESSION['error'] = 'El sorteo no tiene participantes.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}					
		header("Location: {$loc}");
		return 1;
	}
	
	if (isset($_REQUEST['participar'])) {
		$loc = 'sorteos.php';
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($gtag == $tag) {
				$id = $_REQUEST['id'];
				$getVals = db_query("SELECT * FROM {$conftp}sorteos WHERE id={$id}");
				$numVals = mysqli_num_rows($getVals);
				if (trim($id) != '' && $id != null && $numVals > 0) {
					$val = mysqli_fetch_assoc($getVals);
					if ($val['ganador'] == '' && $time < $val['fechalimite']) {
						db_query("INSERT INTO {$conftp}participantes (idsorteo,nombrejug) 
						VALUES ('{$id}','{$jug}')");
						$_SESSION['mensaje'] = 'Has realizado tu participación con éxito.';
					} else {
						$_SESSION['error'] = 'No puedes participar en un sorteo finalizado.';
					}
				} else {
					$_SESSION['error'] = 'Error al participar en el sorteo.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}					
		header("Location: {$loc}");
		return 1;
	}
}
?>
