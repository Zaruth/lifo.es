<?php
$publico = 1;
$hidelogin = 0;
$form = 1;
include('core.php');
function iweb() {
  global $ident,$conftp;
  if ($ident) {
    echo 'Ya estás registrado. Debes salir antes de intentar recuperar tu contraseña.<br/><br/>';
    return;
  }
  techo('¿Has olvidado tu contraseña? Introduce tu nombre de usuario y el correo electrónico de tu cuenta en el formulario que hay aquí debajo, y se generará y enviará una nueva contraseña para ese usuario a tu correo.<br/><br/>El abuso de esta opción para molestar a otros jugadores no está permitido y será sancionado.');
  echo "<form method=\"post\" action=\"recupera.php\">";
  echo "<table id=\"login\"><tr><td>";
  echo '<a href="estado.php">-&gt; ¡Recordé mi contraseña! &lt;-</a><br/><br/>';
  echo "Recuperar contraseña:<br/><hr/><br/>";
  echo "Nombre de usuario:<br/>";
  echo "<input type=\"text\" name=\"username\" size=\"25\" maxlength=\"14\"/><br/><br/>";
  echo "<input type=\"submit\" name=\"recupera\" value=\"Recordar contraseña\"/><br/>";
  echo "</td></tr></table></form>";
}

function procesaform() {
	global $_REQUEST,$ip,$conftp;
	if (isset($_REQUEST['recupera'])) {
		$salirnow = 0;
		if ((isset($_REQUEST['username']))) {
			$username = check_username($_REQUEST['username']);
			if ((!$username))
				$_SESSION['error'] = 'El usuario no es válido.';
			else {
				if (antifloodcheck('recupfalla',"{$username}.{$ip}",2,600)) {
					$retval = db_query("SELECT nombrejug,email FROM {$conftp}jugadores WHERE UPPER(nombrejug) LIKE UPPER('{$username}')");
					$ret = mysqli_num_rows($retval);
					if($ret != 0){
						$ret = mysqli_fetch_row($retval);
						mail_recu($ret[0],$ret[1]);
						mysqli_free_result($retval);
						$_SESSION['mensaje'] = "¡Listo! Correo de recuperación enviado al email ligado a la cuenta.";
						$salirnow = 1;
					}
					else{
						$_SESSION['error'] = 'El usuario "'.$username.'" no existe.';
					}	
				}
				else
					$_SESSION['error'] = 'Demasiados intentos fallidos, intentelo dentro de diez minutos.';
			}
		}
		if ($salirnow)
			header('Location: estado.php');
		else
			header('Location: recupera.php');
		return 1;
	}
}

?>
