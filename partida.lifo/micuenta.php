<?php
$form = 1;
include('core.php');
function iweb() {
  global $jug,$tagc,$time,$zonahoraria,$conftp,$us;
  techo('Desde aquí puedes modificar las preferencias de tu cuenta(contraseña, correo, ...). Para modificar tu contraseña o correo deberás introducir tu contraseña actual.');

  $retvalem = db_query("SELECT emailnuevo,emailnuevocambio FROM jugadores WHERE nombrejug='{$jug}'");
  $retemail = mysqli_fetch_row($retvalem);
  mysqli_free_result($retvalem);

  if ($retemail[0]) {
    echo "<font color=\"red\"><b>AVISO</b>: Se está realizando un cambio de dirección de correo electrónico por la dirección de correo: {$retemail[0]}.</font><br/>";
    if ($retemail[1] < $time) {
      echo '<form action="micuenta.php" method="post"><input type="submit" name="confcambioemail" value="Confirmar cambio"/> <input type="submit" name="canccambioemail" value="Cancelar cambio"/></form><br/>';
    }
    else {
      $dia_t = ahora_dia($retemail[1]);
      $hora_t = ahora_hora($retemail[1]);
      echo "El cambio no se podrá confirmar hasta el {$dia_t} a las {$hora_t}.<br/>";
      echo '<form action="micuenta.php" method="post"><input type="submit" name="canccambioemail" value="Cancelar cambio"/></form><br/>';
    }
  }
  
  // Zonas Horarias //
  $zonasH = "";
  for ($hh = -15;$hh<13;$hh++) {
    $hhshow = $hh*-1;
    if ($hh > 0)
      $val = "Etc/GMT{$hhshow}";
    else
      $val = "Etc/GMT+{$hhshow}";
    if ($hh == -15)
      $val = 'Europe/Madrid';
    l_setdate($hh);
    $dia = ahora_dia($time);
    $hora = ahora_hora($time);
    if ($hh == $zonahoraria)
      $selected = 'selected=\"selected\" ';
    else
      $selected = '';
    $zonasH.= "<option {$selected}value=\"{$hh}\">{$dia} {$hora} ({$val})</option>";
  }
  l_setdate($zonahoraria);
  //  //
  
  // Títulos //
  if (isset($_COOKIE['oculttitulos']))
	$titulos = "<input type=\"submit\" name=\"mostrartitulos\" onclick=\"return c()\" value=\"Mostrar títulos\"/>";
  else
    $titulos = "<input type=\"submit\" name=\"ocultartitulos\" onclick=\"return c()\" value=\"Ocultar títulos\"/>";
  //  //
  
  // Recibir Correos //
  /*if ($us['recibemail'] == 1)
	$recibe = "<input type=\"submit\" name=\"norecibir\" onclick=\"return c()\" value=\"NO recibir correos\"/>";
  else
    $recibe = "<input type=\"submit\" name=\"sirecibir\" onclick=\"return c()\" value=\"Recibir correos\"/>";*/
  //  //
  
  
  // DIPLOMAS //
  //echo '<div>Recibe tu diploma de esta partida de Lifo aquí: <a href="diploma.php">[DIPLOMA]</a></div><br>';
  
  
  echo "<table class=\"estado\">
			<tr><td class=\"tab\"><b>Nombre del jugador:</b></td><td class=\"tab\">{$jug}</td></tr>
			
			<tr><td class=\"tab\"><b>Cuenta de correo actual:</b></td><td class=\"tab\">{$us['email']}</td></tr>
			
			<tr><td class=\"tab\"><b>Zona horaria:</b></td><td class=\"tab\"><form method=\"post\" action=\"micuenta.php\"><input type=\"hidden\" name=\"tagc\" value=\"{$tagc}\"/> <select name=\"hora\">{$zonasH}</select> <input type=\"submit\" name=\"cambiarz\" onclick=\"return c()\" value=\"Cambiar zona horaria\"/></form></td></tr>
			
			<tr><td class=\"tab\"><b>Títulos en foro</b><i>(Info guardada<br> 1 año en navegador)</i>:<br></td><td class=\"tab\"><form method=\"post\" action=\"micuenta.php\"><input type=\"hidden\" name=\"tagc\" value=\"{$tagc}\"/> {$titulos}</form></td></tr>
			
			";
			/*<tr><td class=\"tab\"><b>Recibir correos informativos:</b></td><td class=\"tab\"><form method=\"post\" action=\"micuenta.php\"><input type=\"hidden\" name=\"tagc\" value=\"{$tagc}\"/> {$recibe}</form></td></tr>*/
			echo "
		</table>";
  echo "<br/>";
  
  // Pre registro
  /*$query = db_query("SELECT COUNT(*) FROM lifoes_p6.jugadores WHERE nombrejug='{$jug}'");
  $var = mysqli_fetch_row($query);
  mysqli_free_result($query);
  echo "<br/><br/><h3>Pre-registro para Partida 6</h3>
  Usando este registro, tu usuario tendrá el mismo nombre, contraseña y correo que el actual.<br>
  <b style=\"color: red;\">¡Será necesario que tengas un correo valido para poder recibir el correo de verificación!</b>";
  if ($var[0]==0) {
	if ($us['nivel']>=10) {
		echo "<form method=\"post\" action=\"micuenta.php\"> Pre-registro para <b>Partida 6</b>: <input type=\"submit\" name=\"pre_registro\" onclick=\"return c()\" value=\"Registrar\"/></form>";
	} else {
		echo "<br/><b>Necesitas ser nivel 10 o más para poder hacer el pre-registro</b>";
	}
  } else {
	  echo "<br><br><b>Te has registrado con éxito en Partida 6.<br>
	  Asegurate de revisar tu bandeja de correo para verificar la cuenta.</b>";
  }*/
  /////////////////


  echo "<form method=\"post\" action=\"micuenta.php\">";
  echo "<table id=\"login\"><tr><td>";
  echo "<input type=\"hidden\" name=\"tagc\" value=\"{$tagc}\"/>";
  echo "Cambiar contraseña o e-mail:<br/><hr/><br/>";

  echo "<b>Contraseña actual *</b><br/>";
  echo "<input type=\"password\" name=\"password\" size=\"25\" maxlength=\"30\"/><br/><br/>";


  if ($retemail[0] == '') {
    echo "Nuevo e-mail:<br/>";
    echo "<input type=\"text\" name=\"email\" size=\"25\" maxlength=\"80\"/><br/><br/>";
  }

  echo "Nueva contraseña:<br/>";
  echo "<input type=\"password\" name=\"newpass\" size=\"25\" maxlength=\"30\"/><br/><br/>";

  echo "Repite la nueva contraseña:<br/>";
  echo "<input type=\"password\" name=\"newpassc\" size=\"25\" maxlength=\"30\"/><br/><br/>";

  echo "<input type=\"submit\" name=\"cambiar\" onclick=\"return c()\" value=\"Cambiar\"/> <b>* obligatorio</b><br/><br/>";
  echo "OJO: dejar en blanco cualquier<br/>valor para no cambiarlo<br/>";

  echo "</td></tr></table></form>";


}

function procesaform() {
  global $_REQUEST,$smtpDefaultMail,$jug,$tagc,$conftp,$time,$confmailname,$confurl,$ip,$us;
  
  if (isset($_REQUEST['pre_registro'])) {
    $query = db_query("SELECT COUNT(*) FROM lifoes_p6.jugadores WHERE nombrejug='{$jug}'");
	$var = mysqli_fetch_row($query);
	mysqli_free_result($query);
    if ($var[0] == 0) {
		$query = db_query("SELECT nombrejug,password,email,emailreg,creado,ipcreado FROM jugadores WHERE nombrejug='{$jug}'");
		$var = mysqli_fetch_row($query);
		$user = $var[0];
		$user_email = $var[2];
		mysqli_free_result($query);
		db_query("INSERT INTO lifoes_p6.jugadores (nombrejug,password,email,emailreg,creado,ipcreado,iplogin,padre) VALUES ('{$var[0]}','{$var[1]}','{$var[2]}','{$var[3]}',{$time},'{$var[5]}','(no)','(desconocido)')");
		
		require_once('xor.php');
		$enlaceVerificacion = encryptXor($user . '#' . $user_email);
		$linkVerificacion = '<a href="http://p6.lifo.es/verificar.php?s='.$enlaceVerificacion.'">VERIFICAR</a>';
		$register_date = ahora_dia(time())." a las ".ahora_hora(time());
		$t_values = array("usuario" => $jug, "partida" => "Partida 6", "linkverificacion" => $linkVerificacion, "ip" => $ip, "email" => $user_email, "fecharegistro" => $register_date);
		$email = template("templates/registerEmail.t", $t_values);
		
		
		$newName = "uploads/registermail_{$jug}_".time().".html";
		$file = fopen($newName, "w") or die("Unable to open file!");
		fwrite($file, $email);
		fclose($file);
		rename($newName, '../common.lifo.es/'.$newName);
		
		
		postEmail($smtpDefaultMail, $user_email, "Bienvenido a Partida 6", $newName);
		$_SESSION['mensaje'] = 'Te has pre-registrado con éxito. En breve recibirás un correo para verificar tu cuenta.';
		//<br/><br/>Para poder jugar, verifica tu cuenta a través del siguiente enlace: <a href=\"{$root}verificar.php?s={$enlaceVerificacion}\">VERIFICAR</a>
	} else
		$_SESSION['error'] = '¡Ya estás registrado en esa partida!';
    header('Location: micuenta.php');
    return 1;
  }
  
  if (isset($_REQUEST['confcambioemail'])) {
    $retval = db_query("SELECT emailnuevo,email,emailnuevocambio FROM jugadores WHERE nombrejug='{$jug}'");
    $retemail = mysqli_fetch_row($retval);
    mysqli_free_result($retval);
    if ($retemail[0] != '') {
      if ($retemail[2] < $time) {
        db_query("UPDATE jugadores SET emailnuevo='',emailnuevocambio=0,email='{$retemail[0]}' WHERE nombrejug='{$jug}'");
        $_SESSION['mensaje'] = 'Cambio de correo confirmado';
      }
      else
        $_SESSION['error'] = 'Aun no podías aceptar el cambio de correo.';
    }
    else
      $_SESSION['error'] = 'No se estaba procesando ya ningún cambio de correo.';
    header('Location: micuenta.php');
    return 1;
  }

  if (isset($_REQUEST['canccambioemail'])) {
    $retval = db_query("SELECT emailnuevo FROM jugadores WHERE nombrejug='{$jug}'");
    $retemail = mysqli_fetch_row($retval);
    mysqli_free_result($retval);
    if ($retemail[0] != '') {
      db_query("UPDATE jugadores SET emailnuevo='',emailnuevocambio=0 WHERE nombrejug='{$jug}'");
      $_SESSION['mensaje'] = 'Cambio de correo cancelado';
    }
    else
      $_SESSION['error'] = 'No se estaba procesando ya ningún cambio de correo.';
    header('Location: micuenta.php');
    return 1;
  }

  if (isset($_REQUEST['cambiarz'])) {
    if ((isset($_REQUEST['hora'])) && (isset($_REQUEST['tagc']))) {
      $gtag = $_REQUEST['tagc'];
      $hora = $_REQUEST['hora'];
      if ($tagc == $gtag) {
        if ((is_numeric($hora)) && ($hora >= -15) && ($hora <= 12)) {
          $_SESSION['zonahoraria'] = $hora;
          if (isset($_SESSION['zonahoraria']))
            $zonahoraria = $_SESSION['zonahoraria'];
          else
            $zonahoraria = '-15';
          if ($zonahoraria > 0)
            $horazonahoraria = "Etc/GMT+{$hora}";
          else
            $horazonahoraria = "Etc/GMT{$hora}";
          if ($zonahoraria == -15)
            $horazonahoraria = 'Europe/Madrid';

          $_SESSION['mensaje'] = 'Zona horaria cambiada.';
          db_query("UPDATE jugadores SET zonahoraria={$hora} WHERE nombrejug='{$jug}'");
        }
        else
          $_SESSION['error'] = 'Hora no válida.';
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: micuenta.php');
    return 1;
  }
  if (isset($_REQUEST['cambiar'])) {
    if ((isset($_REQUEST['password'])) && (isset($_REQUEST['tagc']))) {
      $gtag = $_REQUEST['tagc'];
      $password = $_REQUEST['password'];
      if ($tagc == $gtag) {
        $pwdhash = pwdHash($jug,$password);
        $retval = db_query("SELECT emailnuevo,email FROM jugadores WHERE nombrejug='{$jug}' AND password='{$pwdhash}'");
	if (antifloodcheck('cambiafalla',$jug,2,600)) {
          if (mysqli_num_rows($retval)) {
            $retemail = mysqli_fetch_row($retval);
            antifloodc('cambiafalla',$jug);
  	    $cambiaemail = 0;
	    $cambiapass1 = 0;
	    $cambiapass2 = 0;
            if (isset($_REQUEST['email'])) {
	      if ($_REQUEST['email']) {
	        $cambiaemail = 1;
	        $email = check_email($_REQUEST['email']);
                if ($email == $retemail[1])
                  $cambiaemail = 0;
	      }
	    }
            if (isset($_REQUEST['newpass'])) {
	      if ($_REQUEST['newpass']) {
	        $cambiapass1 = 1;
	        $newpass = check_password($_REQUEST['newpass']);
	      }
	    }
            if (isset($_REQUEST['newpassc'])) {
	      if ($_REQUEST['newpassc']) {
	        $cambiapass2 = 1;
	        $newpassc = check_password($_REQUEST['newpassc']);
	      }
	    }
            if (($cambiaemail) && ($retemail[0] != '')) {
              $_SESSION['error'] = 'Ya se estaba procesando un cambio de dirección de correo.';
            }
	    if (($cambiaemail) && (!$email)) {
              $_SESSION['error'] = 'El nuevo email indicado no es válido. ¡Debe ser válido! No se ha realizado ningún cambio.';
	    }
            if (false) //($cambiaemail) && (preg_match('/(hotmail\.com$)|(msn\.com$)/',$email)))
              //$_SESSION['error'] = 'No puedes utilizar esa dirección de correo electrónico, ya que hotmail filtra los correos electrónicos. Puedes conseguir una cuenta de correo gratuita en <a href="http://www.gmail.com" rel="external">GMail</a>.';
              echo 'a';

	    else {
	      if ((($cambiapass1) && (!$newpass)) || (($cambiapass2) && (!$newpassc)))
	        $_SESSION['error'] = 'La nueva contraseña debe tener al menos 6 caracteres y debe contener símbolos estandar (letras, números, _-.+:,$#...)';
	      else {
                if (((!$cambiapass1) || (!$cambiapass2) || ($newpass != $newpassc)) && (($cambiapass1) || ($cambiapass2)))
                  $_SESSION['error'] = 'La contraseña nueva no coincide con su confirmación. No se ha realizado ningún cambio.';
                else {
  	          $cambio = '';
                  if (preg_match('/(hotmail\.com$)|(msn\.com$)/',$retemail[1]))
                    $nuevahora = $time+86400*3;
                  else
                    $nuevahora = $time+86400*31;
                  if (($cambiaemail) && ($cambiapass1)) {
                    $pwd = pwdHash($jug,$newpass);
                    $cambio = "password='{$pwd}',emailnuevo='{$email}',emailnuevocambio={$nuevahora}";
 		  }
		  elseif ($cambiaemail)
		    $cambio = "emailnuevo='{$email}',emailnuevocambio={$nuevahora}";
                  elseif ($cambiapass1) {
		    $pwd = pwdHash($jug,$newpass);
		    $cambio = "password='{$pwd}'";
		  }
		  if ($cambio) {
                    if ($cambiaemail) {
                      //send_mail($retemail[1],"Cambio de datos en {$confmailname}","Desde la IP {$ip} has solicitado cambiar tu correo en {$confmailname}. <br/>\n <br/>\nEl correo nuevo que has indicado para tu usuario {$jug} es {$email}.<br/>\nSi deseas cancelar este cambio, identifícaté en {$confurl} y ve a la sección Mi Cuenta.<br/>\n <br/>\n <br/>\nUn saludo. <br/>\n");
                    }
                    db_query("UPDATE jugadores SET {$cambio} WHERE nombrejug='{$jug}'");
		    if ($cambiapass1)
		      $_SESSION['error'] = 'Cambios realizados, tienes que identificarte con la nueva contraseña.';
		    else
                      if ($cambiaemail) {
                        $_SESSION['mensaje'] = 'Cambios realizados. Tendrás que confirmar el cambio de correo a partir de la fecha indicada.';
                      }
                      else
                        $_SESSION['mensaje'] = 'Cambios realizados.';
		    session_regenerate_id(TRUE);
		  }
	          else
	            $_SESSION['mensaje'] = 'No se ha realizado ningún cambio.';
	        }
	      }
	    }
	  }
          else {
            antiflood('cambiafalla',$jug,2,600);
            $_SESSION['error'] = 'Tu contraseña no coincide con tu usuario.';
	  }
	}
	else
	  $_SESSION['error'] = 'Demasiados intentos fallidos, intente en diez minutos.';
        mysqli_free_result($retval);
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: micuenta.php');
    return 1;
  }
  
  if (isset($_REQUEST['ocultartitulos'])) {
    if (isset($_REQUEST['tagc'])) {
      $gtag = $_REQUEST['tagc'];
      if ($tagc == $gtag) {
		setcookie('oculttitulos','1',strtotime('+1 year'));
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
	unset($_REQUEST['ocultartitulos']);
    header('Location: micuenta.php');
    return 1;
  }
  
  if (isset($_REQUEST['mostrartitulos'])) {
    if (isset($_REQUEST['tagc'])) {
      $gtag = $_REQUEST['tagc'];
      if ($tagc == $gtag) {
		setcookie('oculttitulos', '1', 1);
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: micuenta.php');
    return 1;
  }
  
  if (isset($_REQUEST['norecibir'])) {
    if (isset($_REQUEST['tagc'])) {
      $gtag = $_REQUEST['tagc'];
      if ($tagc == $gtag) {
		db_query("UPDATE jugadores SET recibemail = 0 WHERE nombrejug='{$jug}'");
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: micuenta.php');
    return 1;
  }
  
  if (isset($_REQUEST['sirecibir'])) {
    if (isset($_REQUEST['tagc'])) {
      $gtag = $_REQUEST['tagc'];
      if ($tagc == $gtag) {
		db_query("UPDATE jugadores SET recibemail = 1 WHERE nombrejug='{$jug}'");
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: micuenta.php');
    return 1;
  }
}
?>
