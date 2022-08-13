<?php
$form = 1;
include('core.php');
function iweb()
{
	global $jug, $tagc, $conftp, $confdbname, $imgroot;
	
	$_SESSION['error'] = '"<b>No puedes pasar, solo personal autorizado.</b>" <i>-Un gnomo mágico te impide la entrada-</i>';
	header('Location: estado.php');
	exit();

	if (preg_match('/test/i', $confdbname)) {
		return;
	}
	techo('Desde aquí puedes transferir tus joyas premium a otras partidas.');

	$retvaljo = db_query(
		"SELECT cantidad 
			FROM {$conftp}tiene 
				WHERE nombrejug='{$jug}' AND nombreobj='Joya premium'");
	$retbases = db_query(
		"SELECT * 
			FROM information_schema.schemata 
				WHERE schema_name != 'information_schema' AND schema_name LIKE 'lifoes_p%' AND schema_name != '{$confdbname}'");

	$ret = mysqli_fetch_row($retvaljo);
	mysqli_free_result($retvaljo);
	if ($ret[0]) {
		echo "Tienes <img src=\"{$imgroot}rprem.gif\" alt=\"Premium\"/><b>x{$ret[0]}</b> Joyas premium.<br>";

		echo "<form method=\"post\" action=\"transjoyas.php\">";
		echo "<table id=\"login\"><tr><td>";
		echo "<input type=\"hidden\" name=\"tagc\" value=\"{$tagc}\"/>";
		echo "Transferir joyas a otra partida:<br/><hr/><br/>";

		echo "<b>Contraseña actual:</b><br/>";
		echo "<input type=\"password\" name=\"password\" size=\"25\" maxlength=\"30\"/><br/><br/>";

		echo "<b>Repite contraseña:</b><br/>";
		echo "<input type=\"password\" name=\"passwordc\" size=\"25\" maxlength=\"30\"/><br/><br/>";

		echo "<b>Partida de destino:</b><br/>";
		echo "<select name=\"base\">";
		$selec = false;
		$selected = '';
		for ($i = 0; $i < mysqli_num_rows($retbases); $i++) {
			$rett = mysqli_fetch_row($retbases);
			$porciones = explode("_p", $rett[1]);
			if (!$selec) {
				$selec = true;
				$selected = 'selected';
			}
			echo "<option {$selected} value=\"{$rett[1]}\">Partida {$porciones[1]}</option>";
		}
		echo "</select><br><br>";

		echo "<b>Usuario de destino:</b><br/>";
		echo "<input type=\"text\" name=\"user\" size=\"25\" maxlength=\"80\"/><br/><br/>";

		echo "<b>Número de joyas:</b><br/>";
		echo "<input type=\"number\" name=\"number\" size=\"25\" value=\"1\" min=\"1\" max=\"{$ret[0]}\"/><br/><br/>";

		echo "<center><input type=\"submit\" name=\"transferir\" onclick=\"return c()\" value=\"Transferir\"/></center><br/>";
		echo "</td></tr></table></form>";
	} else {
		echo "No tienes Joyas premium que transferir.<br>";
	}
	mysqli_free_result($retbases);
}

function procesaform()
{
	global $_REQUEST, $jug, $tagc, $conftp, $time, $us, $confdbname;
	if (isset($_REQUEST['transferir'])) {

		$pass1 = $_REQUEST['password'];
		$pass2 = $_REQUEST['passwordc'];
		$database = $_REQUEST['base'];
		$user = $_REQUEST['user'];
		$number = $_REQUEST['number'];

		$retval = db_query("SELECT cantidad FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Joya premium'");
		if (mysqli_num_rows($retval) == 1) {
			$ret = mysqli_fetch_row($retval);
			$canti = $ret[0];
			if ($number > $canti || $number < 0) {
				$_SESSION['error'] = 'Error en el número de joyas.';
			} else {
				if (
					isset($pass1)
					&& isset($pass2)
					&& $pass1 == $pass2
					&& pwdHash($jug, $pass1) == $_SESSION['pwd']
				) {
					if (isset($database) && $database != 'information_schema' &&  strpos($database, 'test') === false && $database != '{$confdbname}') {
						$retval = db_query("SELECT * FROM {$database}.jugadores WHERE nombrejug='{$user}'");
						if (mysqli_num_rows($retval) == 1) {
							$retval = db_query("SELECT cantidad FROM {$database}.tiene WHERE nombrejug='{$user}' AND nombreobj='Joya premium'");
							if (mysqli_num_rows($retval) == 0)
								db_query("INSERT INTO {$database}.tiene (nombrejug,nombreobj,cantidad) VALUES ('{$user}','Joya premium',{$number})");
							else {
								$ret = mysqli_fetch_row($retval);
								$cantidad = $ret[0] + $number;
								db_query("UPDATE {$database}.tiene SET cantidad={$cantidad} WHERE nombrejug='{$user}' AND nombreobj='Joya premium'");
							}
							quita_objeto($jug, 'Joya premium', 'rprem', $number);
							$porciones = explode("_p", $database);
							$_SESSION['mensaje'] = '¡Listo! Se han transferido <b>x' . $number . '</b> Joyas premium al usuario <b>' . $user . '</b> de la <b>Partida ' . $porciones[1] . '</b>';
						} else {
							$_SESSION['error'] = 'El usuario no existe en la partida.';
						}
					} else {
						$_SESSION['error'] = 'Error al seleccionar la partida.';
					}
				} else {
					$_SESSION['error'] = 'Las contraseñas no coinciden o son incorrectas.';
				}
			}
		} else {
			$_SESSION['error'] = 'No tienes Joyas premium.';
		}

		header('Location: transjoyas.php');
		return 1;
	}
}
