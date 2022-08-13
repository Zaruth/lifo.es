<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug, $tagc, $time, $us, $confdbname, $imgroot;
	if ($us['admin'] != 1) {
		return;
	}
	$pathPost = "showJug.php";
	$formId = 1;
	echo "<table><tr><td>";
	echo mkform($pathPost, '<label>Usuario: </label> <input type="text" name="usuario" value="'.(isset($_POST['usuario'])?$_POST['usuario']:"").'" placeholder="..." required><br>
	<label>Tipo de mensaje: </label> 
	<select name="tipo" form="form'.$formId.'">
	  <option value="General">General</option>
	  <option value="Exploración">Exploración</option>
	  <option value="Combate">Combate</option>
	  <option value="Clan">Clan</option>
	</select><br>
	<button form="form'.$formId.'" type="submit" name="examinar" onclick="return c()">Examinar</button>', $formId++, 'post', true);
	echo "</td><td>";
	echo mkform($pathPost, '<label>Listado de usuarios por clan: </label>
	<button form="form'.$formId.'" type="submit" name="mostrar" onclick="return c()">Mostrar</button>', $formId++, 'post', true);
	echo "</td></tr></table>";
	echo '<hr>';
	
	if (isset($_POST['examinar'])) {
		try {
			if (isset($_POST['usuario']) && isset($_POST['tipo'])){
				$usuario = $_POST['usuario'];
				$tipo = $_POST['tipo'];
				if($tipo=='Combate'){
					echo "<p>Tiempo entre los últimos 1000 mensajes de '{$tipo}' buscado por '{$usuario}.*ha atacado': <br>";
					$getHoras = db_query("SELECT `hora`,`mensaje` FROM `mensajescopy` WHERE `nombrejug` LIKE '{$usuario}' AND `tipo` LIKE 'Combate' AND `mensaje` REGEXP '{$usuario}.*ha atacado' ORDER BY `mensajescopy`.`hora` DESC LIMIT 1001");
				}
				else {
					echo "<p>Tiempo entre los últimos 1000 mensajes de '{$tipo}': <br>";
					$getHoras = db_query("SELECT `hora` FROM `mensajescopy` WHERE `nombrejug` LIKE '{$usuario}' AND `tipo` LIKE '{$tipo}' ORDER BY `mensajescopy`.`hora` DESC LIMIT 1001");
				}
				$hora = 0;
				$numrows = mysqli_num_rows($getHoras);
				for ($i = 0; $i < $numrows; $i++) {
					$horaMs = mysqli_fetch_row($getHoras);
					$horaM = $horaMs[0];
					if($hora == 0)
						$hora = $horaM;
					if($horaM!=$hora){
						$index = $i;
						$diff = $hora - $horaM;
						$minutos = floor($diff/60);
						$segundos = $diff%60;
						echo "{$index}º - {$diff} - {$minutos}:{$segundos}<br>";
					}
					$hora = $horaM;
				}
				echo "</p>";
			} else {
				echo "ERROR";
			}
		} catch(Exception $e){ $error = $e->getMessage(); }
		if(isset($error)){
			echo "Error capturado: ".$error;
		}
	}
	
	if (isset($_POST['mostrar'])) {
		try {
			$getusers = db_query("SELECT nombrejug, clan FROM jugadores ORDER BY clan ASC, nombrejug ASC");
			$numrows = mysqli_num_rows($getusers);
			
			echo "Número de jugadores: <b>{$numrows}</b><br><table><tr><th>Jugadores</th><th>Clan</th></tr>";
			for ($i = 0; $i < $numrows; $i++) {
				$user = mysqli_fetch_row($getusers);
				echo "<tr><td>{$user[0]}</td><td>{$user[1]}</td></tr>";
			}	
			echo "</table>";
		} catch(Exception $e){ $error .= $e->getMessage(); }
		if(isset($error)){
			echo "Error capturado: ".$error;
		}
	}
}

function procesaform() {
}
