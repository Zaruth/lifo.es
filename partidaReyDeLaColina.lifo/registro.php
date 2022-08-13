<?php
$publico = 1;
$hidelogin = 1;
$form = 1;
include('core.php');
function iweb()
{
  global $ident, $_REQUEST, $conforovisitahijo, $conforovisitanieto, $ip, $confregistro, $conftp;
  if (!$confregistro) {
    echo '<b>El registro no está permitido en esta partida.</b><br/>';
  }
  if ($ident) {
    echo 'Ya estás registrado. Debes salir antes de registrar otra cuenta.<br/><br/>';
    return;
  }
  if (isset($_REQUEST['invita']))
    $p = check_username($_REQUEST['invita']);
  else
    $p = '';
  if (isset($_REQUEST['f']))
    $f = $_REQUEST['f'];
  else
    $f = 0;

  $msgmail = "Ojo, la dirección de correo electrónico tiene que ser válida y real. Al registrarte, tu primera contraseña se envía a esa dirección de correo electrónico, y la cuenta del juego pertenecerá en todo caso a la persona que puede acceder al correo electrónico de registro (que se puede cambiar más adelante).";
  if ($p) {
    if (antiflood('visita', $ip, 1, 86400)) {
      if ($f) {
        if (antiflood('visitalimit', $p, 100, 86400)) {
          $orodalep = $conforovisitahijo;
          $orodalea = $conforovisitanieto;
        } else {
          $orodalep = 0;
          $orodalea = 0;
        }
        //db_lock("jugadores WRITE");
        $retval = db_query("SELECT padre FROM jugadores WHERE nombrejug='{$p}'");
        if (!mysqli_num_rows($retval))
          $p = '';
        else {
          db_query("UPDATE jugadores SET visitashijos=visitashijos+1,oro=oro+{$orodalep} WHERE nombrejug='{$p}'");
          $ret = mysqli_fetch_row($retval);
          $abuelo = $ret[0];
          db_query("UPDATE jugadores SET visitasnietos=visitasnietos+1,oro=oro+{$orodalea} WHERE nombrejug='{$abuelo}'");
        }
        //db_unlock();
        mysqli_free_result($retval);
      }
      $visitado = 1;
    } else
      $visitado = 0;

    if ($visitado)
      techo("Mientras caminabas por una calle estrecha has chocado con alguien. Al momento te has dado cuenta de que te ha robado algunas monedas... Te decides a seguirlo, y cuando llegais a su casa se presenta como {$p}, te felicita por ser tan avispado y te ofrece trabajar para él.<br/><br/>¿Te apetece como a muchos otros, entrar a formar parte de esta aventura? Encontrarás artefactos, mantendrás combates, ganarás poder... echa un vistazo a la <a href=\"guia.php\">guía del juego</a> o regístrate (gratis) en el formulario de aquí debajo y prueba...<br/><br/>{$msgmail}");
    else
      techo("Mientras caminabas por una calle estrecha has chocado con alguien. Al momento te has dado cuenta de que te está haciendo señales... Te decides a seguirlo, y cuando llegais a su casa se presenta como {$p} y te ofrece trabajar para él.<br/><br/>¿Te apetece como a muchos otros, entrar a formar parte de esta aventura? Encontrarás artefactos, mantendrás combates, ganarás poder... echa un vistazo a la <a href=\"guia.php\">guía del juego</a> o regístrate (gratis) en el formulario de aquí debajo y prueba...<br/><br/>{$msgmail}");
  } else {
    techo("Estás a punto de entrar a formar parte de una aventura que cambiará tu vida. Encontrarás artefactos, mantendrás combates, ganarás oro y poder... Echa un vistazo a la <a href=\"guia.php\">guía del juego</a> o regístrate (gratis) en el formulario de aquí debajo y, ¡mucha suerte!<br/><br/>{$msgmail}");
  }
  echo "<form method=\"post\" action=\"registro.php\">";
  echo "<table id=\"login\"><tr><td>";
  echo '<a href="estado.php">-&gt; ¡Ya tengo una cuenta! &lt;-</a><br/><br/>';
  echo "Nuevo jugador:<br/><hr/><br/>";

  if (isset($_SESSION['lastuser'])) {
    $lastuser = $_SESSION['lastuser'];
    unset($_SESSION['lastuser']);
  } else
    $lastuser = '';
  if (isset($_SESSION['lastemail'])) {
    $lastemail = $_SESSION['lastemail'];
    unset($_SESSION['lastemail']);
  } else
    $lastemail = '';
  if (isset($_SESSION['lastpadre'])) {
    $lastpadre = $_SESSION['lastpadre'];
    unset($_SESSION['lastpadre']);
  } else
    $lastpadre = '';

  echo "<b>Nombre de usuario: *</b><br/>";
  echo "<input type=\"text\" name=\"username\" size=\"25\" maxlength=\"14\" value=\"{$lastuser}\"/><br/><br/>";

  echo "<b>E-mail: *</b><br/>";
  echo "<input type=\"text\" name=\"email\" size=\"25\" maxlength=\"80\" value=\"{$lastemail}\"/><br/><i>*Debe ser un email válido, se enviará<br>un correo para verificar la cuenta.</i><br/><br/>";

  echo "<b>Contraseña: *</b><br/>";
  echo "<input type=\"password\" name=\"newpass\" size=\"25\" maxlength=\"30\"/><br/><br/>";

  echo "<b>Repite la contraseña: *</b><br/>";
  echo "<input type=\"password\" name=\"newpassc\" size=\"25\" maxlength=\"30\"/><br/><br/>";

  echo "Usuario que te invitó: <br/>";
  if ($p) {
    echo "<input type=\"hidden\" name=\"invita\" value=\"{$p}\"/>";
    echo "<input type=\"hidden\" name=\"padre\" value=\"{$p}\"/>";
    echo "<input type=\"text\" name=\"padred\" size=\"25\" disabled=\"disabled\" value=\"{$p}\"/><br/><br/>";
  } else
    echo "<input type=\"text\" name=\"padre\" size=\"25\" maxlength=\"30\" value=\"{$lastpadre}\"/><br/><br/>";

  echo "<input type=\"submit\" name=\"registra\" value=\"Registrarse\"/> <b>* obligatorio</b><br/>";

  echo "</td></tr></table></form>";
}

function procesaform()
{
  global $_REQUEST, $time, $conforonuevohijo, $conforonuevonieto, $confmailname, $ip, $confurl, $ident, $confregistro, $conftp, $imgroot, $smtpVerificationMail, $root, $conftitle;

  if (isset($_REQUEST['registra'])) {
    $salirnow = 0;
    if (!$confregistro) {
      header("Location: registro.php");
      return 1;
    }
    if ($ident)
      $_SESSION['error'] = 'Ya estás identificado, tienes que salir antes de registrar una cuenta.';
    else {
      if ((isset($_REQUEST['username'])) && (isset($_REQUEST['email'])) && (isset($_REQUEST['newpass'])) && (isset($_REQUEST['newpassc']))) {
        $username = check_username($_REQUEST['username']);
        $email = check_email($_REQUEST['email']);
        $newpass = check_password($_REQUEST['newpass']);
        $newpassc = check_password($_REQUEST['newpassc']);
        if (isset($_REQUEST['padre']))
          $padre = check_username($_REQUEST['padre']);
        else
          $padre = '';
        if ((!$username) && (!$email))
          $_SESSION['error'] = 'Tanto el usuario como el email no son válidos.<br/>El usuario sólo puede estar formado por letras (mayúsculas o minúsculas), entre 3 y 14 caracteres, y el email debe ser válido.';
        elseif (!$username) {
          $_SESSION['error'] = 'El usuario no es válido. Sólo puede estar formado por letras (mayúsculas o minúsculas), entre 3 y 14 caracteres.';
          $_SESSION['lastemail'] = $email;
          $_SESSION['lastpadre'] = $padre;
        } elseif (!$email) {
          $_SESSION['error'] = 'El email no es válido. Debe ser válido!';
          $_SESSION['lastuser'] = $username;
          $_SESSION['lastpadre'] = $padre;
        } else {
			
          $retval = db_query("SELECT * FROM jugadores WHERE nombrejug='{$username}'");
          //db_unlock();
          $a = mysqli_num_rows($retval);
          mysqli_free_result($retval);
          if ($a) {
            $_SESSION['error'] = 'Ese nombre de usuario ya está registrado.';
            $_SESSION['lastemail'] = $email;
            $_SESSION['lastpadre'] = $padre;
          } else {

            if ((!$newpass) || (!$newpassc))
              $_SESSION['error'] = 'La nueva contraseña debe tener al menos 6 caracteres y debe contener símbolos estandar (letras, números, _-.+:,$#...)';
            else {

              if ($newpass != $newpassc)
                $_SESSION['error'] = 'La contraseña nueva no coincide con su confirmación.';

              else {

                if (antiflood('registro', $ip, 2, 3600)) {
                  $padre = '(desconocido)';
                  if (isset($_REQUEST['padre'])) {
                    $padre = check_username($_REQUEST['padre']);
                    if (!$padre)
                      $padre = '(desconocido)';
                  }

                  if ($padre != '(desconocido)') {
                    if (antiflood('regpadre', $ip, 1, 86400))
                      $daroro = 1;
                    else
                      $daroro = 0;
                    if (!antiflood('reghijo', $padre, 10, 86400))
                      $daroro = 0;
                    //db_lock("jugadores READ");
                    $retval = db_query("SELECT padre FROM jugadores WHERE nombrejug='{$padre}'");
                    //db_unlock();
                    if (!mysqli_num_rows($retval))
                      $padre = '(desconocido)';
                    else {
                      if ($daroro)
                        db_query("UPDATE jugadores SET hijos=hijos+1,oro=oro+{$conforonuevohijo} WHERE nombrejug='{$padre}'");
                      else
                        db_query("UPDATE jugadores SET hijos=hijos+1 WHERE nombrejug='{$padre}'");
                      $ret = mysqli_fetch_row($retval);
                      $abuelo = $ret[0];
                      if ($daroro)
                        db_query("UPDATE jugadores SET nietos=nietos+1,oro=oro+{$conforonuevonieto} WHERE nombrejug='{$abuelo}'");
                      else
                        db_query("UPDATE jugadores SET nietos=nietos+1 WHERE nombrejug='{$abuelo}'");
                    }
                    mysqli_free_result($retval);
                  }
                  $nuevapass = $newpass;
                  $pwdhash = pwdhash($username, $nuevapass);
				  
                  db_query("INSERT INTO jugadores (nombrejug,password,email,verificado,emailreg,creado,ipcreado,iplogin,padre) VALUES ('{$username}','{$pwdhash}','{$email}',1,'{$email}',{$time},'{$ip}','(no)','{$padre}')");
				  
				  // VERIFICACIÓN //
				  $user = $username;
				  $user_email = $email;
                  require_once('xor.php');
				  $enlaceVerificacion = encryptXor($user . '#' . $user_email);
				  $linkVerificacion = "<a href=\"{$root}verificar.php?s={$enlaceVerificacion}\">VERIFICAR</a>";
				  $register_date = ahora_dia(time())." a las ".ahora_hora(time());
				  $t_values = array("usuario" => $user, "partida" => $conftitle, "linkverificacion" => $linkVerificacion, "ip" => $ip, "email" => $email, "fecharegistro" => $register_date);
				  $emailTem = template("templates/registerEmail.t", $t_values);
				  $newName = "uploads/registermail_{$user}_".time().".html";
				  $file = fopen($newName, "w") or die("Unable to open file!");
				  fwrite($file, $emailTem);
				  fclose($file);
				  rename($newName, '../common.lifo.es/'.$newName);
				  postEmail($smtpVerificationMail, $user_email, "Bienvenido a {$conftitle}", $newName);
				  // //
				  
                  $_SESSION['mensaje'] = '¡Te has registrado con éxito!<br>En breve recibirás un correo de verificación.';
                  $salirnow = 1;
                } else {
                  $_SESSION['error'] = 'Como máximo están permitidos dos registros por ip y hora. Espera alrededor de una hora e intenta de nuevo.';
                  $_SESSION['lastuser'] = $username;
                  $_SESSION['lastemail'] = $email;
                  $_SESSION['lastpadre'] = $padre;
                }
              }
            }
          }
        }
      }
    }
    if ($salirnow)
      header('Location: estado.php');
    else {
      if (isset($_REQUEST['invita'])) {
        $uname = check_username($_REQUEST['invita']);
        header("Location: registro.php?invita={$uname}");
      } else
        header('Location: registro.php');
    }
    return 1;
  }
}
