<?php
$publico = 1;
$hidelogin = 0;
$form = 1;
include('core.php');
function iweb() {
  global $time;
	if (isset($_REQUEST['n'])){
	  $info = $_GET['n'];
	}
  if($info){
	
	list($user_md5,$time_consulta ,$email_md5) = explode("_", $info);
	
	$retval = db_query("SELECT nombrejug,email FROM jugadores");
	
	$numjug = mysqli_num_rows($retval);
	
	for($i=0;$i<$numjug;$i++){
		$ret = mysqli_fetch_row($retval);
		if(md5($ret[0])==$user_md5 && md5($ret[1])==$email_md5){
			if($time - $time_consulta <= 600){
				echo "<form method=\"post\" action=\"recuperapass.php\" onsubmit=\"return procesaform();\">";
				echo "<table id=\"login\"><tr><td>";
				echo "Recuperar contraseña:<br/><hr/><br/>";
				
				echo "Nombre de usuario:<br/>";
				echo "<input type=\"text\" name=\"username\" size=\"25\" maxlength=\"14\" value=\"{$ret[0]}\" disabled/><br/><br/>";
				
				echo "Email:<br/>";
				echo "<input type=\"text\" name=\"email\" size=\"25\" maxlength=\"14\" value=\"{$ret[1]}\" disabled/><br/><br/>";
				
				echo "Contraseña nueva:<br/>";
				echo "<input type=\"password\" name=\"pass1\" size=\"25\" maxlength=\"14\"/><br/><br/>";
				
				echo "Repetir contraseña:<br/>";
				echo "<input type=\"password\" name=\"pass2\" size=\"25\" maxlength=\"14\"/><br/><br/>";
				
				echo "<input type=\"hidden\" name=\"nombrejug\" value=\"{$ret[0]}\"/><br/>";
				echo "<input type=\"hidden\" name=\"tiempo\" value=\"{$time_consulta}\"/><br/>";
				echo "<input type=\"hidden\" name=\"url\" value=\"{$info}\"/><br/>";
				
				echo "<input type=\"submit\" name=\"establecer\" value=\"Establecer\"/><br/>";
				
				echo "</td></tr></table></form>";
			}
			else{
				$_SESSION['error'] = 'Error, enlace caducado.';
				header('Location: estado.php');
			}
			break;
		}
	}
  }
  /*else{
		$_SESSION['error'] = 'Error, acción invalida.';
		header('Location: estado.php');
  }*/
}

function procesaform() {
	global $_REQUEST,$ip,$time,$conftp;
	if (isset($_REQUEST['establecer'])) {
		$salirnow = 0;
		if ((isset($_REQUEST['nombrejug'])) && (isset($_REQUEST['tiempo'])) && (isset($_REQUEST['pass1'])) && (isset($_REQUEST['pass2'])) && (isset($_REQUEST['url']))) {
			$tiempo_consulta = $_REQUEST['tiempo'];
			$pass1 = check_password($_REQUEST['pass1']);
			$pass2 = check_password($_REQUEST['pass2']);
			$url = $_REQUEST['url'];
			$nombrejug = $_REQUEST['nombrejug'];
			if($time - $tiempo_consulta <= 600){
				
				if ((!$pass1) || (!$pass2))
					$_SESSION['error'] = 'La nueva contraseña debe tener al menos 6 caracteres y debe contener símbolos estandar (letras, números, _-.+:,$#...)';
				else {
					if ($pass1 != $pass2)
						$_SESSION['error'] = 'La contraseña nueva no coincide con su confirmación.';
					else {
						$nuevapass = $pass1;
						$pwdhash = pwdhash($nombrejug,$nuevapass);
						db_lock("{$conftp}jugadores WRITE");
						db_query("UPDATE {$conftp}jugadores SET password = '{$pwdhash}' WHERE nombrejug = '{$nombrejug}'");
						db_unlock();
						$_SESSION['mensaje'] = '¡Contraseña nueva establecida!';
						$salirnow = 1;
					}
				}
			}
			else{
				$_SESSION['error'] = 'Tiempo de recuperación excedido, vuelva a solicitar la recuperación.';
				$salirnow = 1;
			}
		}
		if ($salirnow == 1)
			header('Location: estado.php');
		else
			header("Location: recuperapass.php?n={$url}");
			
		return 1;
	}
}

?>
