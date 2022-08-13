<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$time,$us,$conftp,$imgroot,$confmail,$tag;
	if(!thereAreVotes() && !$us['admin']){
		$_SESSION['error'] = '¡No hay votaciones actualmente!';
		header('Location: estado.php');
	}
	techo("Este es el apartado de votaciones. Desde aquí se deciden temas de caracter general para el servidor o para el propio juego.");
	
	echo '<br><u>Votaciones actuales:</u><br><br><table style="max-width: 400px;">';
	$str = "SELECT votc.*, votd.eleccion 
	FROM votacion as votc LEFT JOIN votado as votd ON (votc.id=votd.idvotacion AND votd.nombrejug='{$jug}') ";
	if (!$us['admin']) {
		$str.="WHERE votc.mostrar=1";
	}
	$str.=" ORDER BY votc.id";
	$query = db_query($str);
	$numrows = mysqli_num_rows($query);
	for ($i=0;$i<$numrows;$i++){
		$val = mysqli_fetch_row($query);
		echo '<tr><td ';
		if ($i % 2 == 0)
			echo 'style="background-color: #C4C4C4;"';
		echo "><h3>";
		if ($us['admin']){
			echo "<form action=\"votacion.php\" method=\"post\" id=\"oform{$i}\">
			<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
			<input type=\"hidden\" name=\"id\" value=\"{$val[0]}\"/>
			<input type=\"submit\" name=\"cerrar\" value=\"Cerrar votación\" onclick=\"return c()\"/>
			<input type=\"submit\" name=\"ocultar\" value=\"Ocultar\" onclick=\"return c()\"/>
			<input type=\"submit\" name=\"borrar\" value=\"Borrar\" onclick=\"return c()\"/>
			</form><br>";
			echo $val[4] == 1 ? '(Cerrada) - ':'(Abierta) - ';
			echo $val[5] == 1 ? '(Mostrada)':'(Oculta) ';
		}
		echo "{$val[1]}</h3><p>{$val[2]}</p>
		(<strong>Disponible hasta el ".ahora_dia($val[3])." a las ".ahora_hora($val[3])."</strong>)<br>";
		if ($us['nivel']<5) {
			echo 'Necesitas ser al menos nivel <strong>5</strong> para poder votar.';
		} else {
			if ($val[7]==null) {
				if($val[3]>$time && $val[4]==0){
					echo "<form action=\"votacion.php\" method=\"post\" id=\"voteform{$i}\">
					<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
					<input type=\"hidden\" name=\"id\" value=\"{$val[0]}\"/>
					<select form=\"voteform{$i}\" name=\"selection\">";
					$options = explode("#", $val[6]);
					foreach ($options as $option){
						echo '<option value="'.$option.'">'.$option.'</option>';
					}
					echo "</select><br>
					<input type=\"submit\" name=\"votar\" value=\"Votar\" onclick=\"return c()\"/>
					</form>";
				} else {
					echo "<strong>Votación cerrada.</strong>";
				}
			} else {
				echo "<strong>¡Ya has votado!</strong><br>Tu elección fue: <strong>{$val[7]}</strong>";
			}
		}
		if ($val[4]==1 || $us['admin']){
			echo "<br>Resultados: ";
			$query2 = db_query("SELECT eleccion,COUNT(*) as total FROM votado WHERE idvotacion={$val[0]} GROUP BY eleccion ORDER BY total DESC");
			$numrows2 = mysqli_num_rows($query2);
			$total=0;
			for ($j=0;$j<$numrows2;$j++) {
				$val2 = mysqli_fetch_row($query2);
				$total+=$val2[1];
			}
			mysqli_data_seek($query2,0);
			for ($j=0;$j<$numrows2;$j++) {
				$val2 = mysqli_fetch_row($query2);
				echo "<br><strong>{$val2[0]}:</strong> ";
				echo round(($val2[1]/$total)*100, 2);
				echo '%';
				if ($us['admin'])
					echo " ({$val2[1]})";
			}
		}
		echo '<br></td></tr>';
	}
	echo '</table>';
	
	if ($us['admin']) {
		$parts = explode("-", ahora_dia($time));
		$dia = $parts[0];
		$mes = $parts[1];
		$anyo = $parts[2];
		echo "<br><br><hr><p>Crear votación(SOLO ADMIN):</p>
		<div style=\"text-align: left; width: 150px;\">
			<form action=\"votacion.php\" method=\"post\">
			<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
			<label>Título:</label><input type=\"text\" name=\"titulo\"/><br>
			<label>Descripcion:</label><textarea name=\"descripcion\"></textarea><br>
			<label>Opciones:</label><input type=\"text\" name=\"opciones\"/><br>
			<label>Fecha:</label><input type=\"date\" name=\"fechalimite\" value=\"{$anyo}-{$mes}-{$dia}\"><br>
			<label>Hora:</label><input type=\"number\" name=\"hora\" min=\"0\" max=\"23\" value=\"0\"><br>
			<label>Minuto:</label><input type=\"number\" name=\"minuto\" min=\"0\" max=\"59\" value=\"0\"><br>
			<input type=\"submit\" name=\"crearvotacion\" value=\"Crear\"/>
			</form>
		</div>";
		
	}
}

function procesaform() {
	global $_REQUEST,$tag,$jug,$us,$time,$conftp,$zonaact;
	if (isset($_REQUEST['votar'])) {
		if ((isset($_REQUEST['tag']))) {
			$gtag = $_REQUEST['tag'];
			if ($tag == $gtag) {
				$selection = $_POST['selection'];
				$id = $_POST['id'];
				if ($selection) {
					if($us['nivel'] >= 5 || $us['admin']){
					$retval = db_query("SELECT * FROM votado WHERE nombrejug='{$jug}' AND idvotacion={$id}");
						$numrows = mysqli_num_rows($retval);
						if($numrows == 0){
							db_query("INSERT INTO votado (idvotacion,nombrejug,eleccion) VALUES ({$id},'{$jug}','{$selection}')");
							$_SESSION['mensaje'] = '¡Has votado con éxito!';
						} else{
							$_SESSION['error'] = '¡Ya has votado antes, no puedes votar de nuevo!';
						}
						mysqli_free_result($retval);
					} else{
						$_SESSION['error'] = '¡Nivel insuficiente! Necesitas ser al menos nivel <b>5</b> para votar.';
					}
				} else{
					$_SESSION['error'] = 'Elección inválida.';
				}
			} else{
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header('Location: votacion.php');
		return 1;
	}
	
	if (isset($_REQUEST['cerrar']) || isset($_REQUEST['ocultar']) || isset($_REQUEST['borrar'])) {
		if ((isset($_REQUEST['tag']))) {
			$gtag = $_REQUEST['tag'];
			if ($tag == $gtag) {
				if($us['admin']){
					$id = $_POST['id'];
					if(isset($_REQUEST['cerrar'])){
						db_query("UPDATE `votacion` SET `cerrado`=1 WHERE id={$id}");
						$_SESSION['mensaje'] = 'Votación cerrada con éxito.';
					} else if(isset($_REQUEST['ocultar'])){
						db_query("UPDATE `votacion` SET `mostrar`=0 WHERE id={$id}");
						$_SESSION['mensaje'] = 'Votación ocultada con éxito.';
					} else {
						db_query("DELETE FROM `votado` WHERE idvotacion={$id}");
						db_query("DELETE FROM `votacion` WHERE id={$id}");
						$_SESSION['error'] = 'Votación borrada con éxito.';
					}
				} else{
					$_SESSION['error'] = 'No puedes hacer eso si no eres administrador.';
				}
			} else{
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header('Location: votacion.php');
		return 1;
	}
	
	if (isset($_REQUEST['crearvotacion'])) {
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($gtag == $tag) {
				$titulo = $_REQUEST['titulo'];
				$descripcion = $_REQUEST['descripcion'];
				$fechalim = $_REQUEST['fechalimite'];
				$hora = $_REQUEST['hora'];
				$minuto = $_REQUEST['minuto'];
				$opciones = $_REQUEST['opciones'];
				if (trim($titulo) != '' && trim($descripcion) != '' && trim($opciones) != '') {
					$fecha = strtotime($fechalim) + ($zonaact*3600) + ($hora*3600) + ($minuto*60);
					db_query("INSERT INTO `votacion`(`titulo`, `descripcion`, `hasta`, `cerrado`, `mostrar`, `opciones`) VALUES ('{$titulo}','{$descripcion}',{$fecha},0,1,'{$opciones}')");
					$_SESSION['mensaje'] = 'Votación creada.';
				} else {
					$_SESSION['error'] = 'Error en los datos, ¡intenta de nuevo, por favor!';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}					
		header('Location: votacion.php');
		return 1;
	}
}
?>