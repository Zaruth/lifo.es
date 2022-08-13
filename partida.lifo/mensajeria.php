<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $_REQUEST, $tag, $confdiasmensajes, $time, $conftp, $vmen, $_SESSION, $imgroot, $confnivelmensaj, $us;

  techo('Bienvenido a la mensajería. Aquí podrás leer informes de combate, noticias y sucesos en general, y mensajes que te envíen otros jugadores. También puedes enviar mensajes a otros jugadores. No está permitido insultar en ningún caso, ni amenazar fuera del sentido del juego a otros jugadores. Única y exclusivamente si un mensaje incumple de forma clara esa norma, puedes informar al administrador del contenido del mensaje, que tomará las acciones oportunas.<br/><br/>Los administradores NUNCA te vamos a pedir tu contraseña ni ninguno de tus datos, y menos a través de la mensajería del juego. ¡No facilites a nadie tu contraseña por aquí!');
  if (isset($_REQUEST['p']))
    $p = $_REQUEST['p'];
  else
    $p = 1;
  if (!is_numeric($p))
    $p = 1;
  if ($p < 1)
    $p = 1;
  if (isset($_REQUEST['t']))
    $type = $_REQUEST['t'];
  else
    $type = '';

  $vmen = 0;
  $_SESSION['vmen'] = 0;

  $ini = ($p - 1) * 15;
  $fin = $p * 15;

  $retval = db_query("SELECT remitente,hora,mensaje,idmensaje,visto FROM mensajes WHERE nombrejug='{$jug}' AND reportado=0 AND tipo='{$type}' ORDER BY idmensaje DESC LIMIT {$ini},15");
  $retval2 = db_query("SELECT COUNT(*) FROM mensajes WHERE nombrejug='{$jug}' AND reportado=0 AND tipo LIKE '%{$type}%'");
  $query = db_query("SELECT tipo, COUNT(visto)-SUM(visto) as diff FROM `mensajes` WHERE nombrejug='{$jug}' GROUP BY nombrejug,tipo");
  $numTipos = mysqli_num_rows($query);
  if ($type == '' && mysqli_num_rows($query) > 0) {
    $hayNoVisto = false;
    $primerTipo = '';
    for ($i = 0; $i < $numTipos; $i++) {
      $tipo = mysqli_fetch_row($query);
      if ($i == 0) {
        $primerTipo = $tipo[0];
      }
      if ($tipo[1] != 0) {
        $type = $tipo[0];
        $hayNoVisto = true;
        break;
      }
      if ($tipo[0] == 'General') {
        $primerTipo = 'General';
      }
    }
    if ($hayNoVisto) {
	  if (isset($_SESSION['errorg'])) {
		$_SESSION['error'] = $_SESSION['errorg'];
		unset($_SESSION['errorg']);
	  }
	  if (isset($_SESSION['mensajeg'])) {
		$_SESSION['mensaje'] = $_SESSION['mensajeg'];
		unset($_SESSION['mensajeg']);
	  }
      header("Location: mensajeria.php?p={$p}&t={$type}");
      return 1;
    } else {
	  if (isset($_SESSION['errorg'])) {
		$_SESSION['error'] = $_SESSION['errorg'];
		unset($_SESSION['errorg']);
	  }
	  if (isset($_SESSION['mensajeg'])) {
		$_SESSION['mensaje'] = $_SESSION['mensajeg'];
		unset($_SESSION['mensajeg']);
	  }
      header("Location: mensajeria.php?p={$p}&t={$primerTipo}");
      return 1;
    }
  }


  $numrows = mysqli_num_rows($retval);
  $primero = 0;
  $ultimo = 0;
  for ($i = 0; $i < $numTipos; $i++) {
    if ($i == 0)
      echo "Categorías: ";
    $tipo = mysqli_fetch_row($query);
    echo "<a href=\"mensajeria.php?p={$p}&t={$tipo[0]}\">";
    if ($tipo[0] == $type) { //Si estás en la misma, se pone en negrita
      echo "<b>{$tipo[0]}</b>";
    } else {
      echo "{$tipo[0]}"; //Si no, no
    }
    if ($tipo[1] != 0) { //Si hay nuevos, pone el número sin leer
      echo "[{$tipo[1]}]";
    }
    echo "</a> ";
    if ($i + 1 < $numTipos) {
      echo "- ";
    }
  }
  mysqli_free_result($query);
  echo "<br/><b>Mensajes recibidos - {$type}:</b><br/><br/>";
  $nuevos = 0;
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_row($retval);
    if (!$primero)
      $ultimo = $ret[3];
    $primero = $ret[3];
    $dia = ahora_dia($ret[1]);
    $hora = ahora_hora($ret[1]);
    if ($ret[0] != '@')
      echo "<form action=\"mensajeria.php\" method=\"post\">";
    echo "<div class=\"news\">";
    if (!$ret[4]) {
      echo '<img src="' . $imgroot . 'nuevo.png" alt="Nuevo"/> ';
      $nuevos = 1;
    } else
      echo '<img src="' . $imgroot . 'leido.png" alt="Leido"/> ';
    if ($ret[0] == '@')
      echo "Noticia recibida el {$dia} a las {$hora}:</div><br/><div class=\"newsitem\">{$ret[2]}";
    else {
      echo "Mensaje de <b>{$ret[0]}</b> recibido el {$dia} a las {$hora}.<br/>";
      echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
      echo "<input type=\"hidden\" name=\"idmens\" value=\"{$ret[3]}\"/>";
      echo "<input type=\"submit\" name=\"reportar\" onclick=\"return c('Esta opción se debe usar ÚNICAMENTE bajo INSULTOS, o AMENAZAS no relacionadas con el juego. El abuso de esta opción será castigado.')\" value=\"Informar al administrador de este mensaje\"/></div><br/><div class=\"newsitem\">{$ret[2]}";
    }
    echo "</div>";
    if ($ret[0] != '@')
      echo "</form>";
    echo "<br/><br/><br/>";
  }
  mysqli_free_result($retval);

  $horalimite = floor($time - $confdiasmensajes * 86400);
  if ($nuevos) {
    db_query("UPDATE mensajes SET visto=1 WHERE nombrejug='{$jug}' AND tipo='{$type}' AND idmensaje >= {$primero} AND idmensaje <= {$ultimo}");
    db_query("DELETE FROM mensajes WHERE hora<{$horalimite} AND reportado=0 AND visto=1");
  }

  $ret2 = mysqli_fetch_row($retval2);
  mysqli_free_result($retval2);
  $npags = $ret2[0] / 15;
  $npag = floor($npags);
  if ($npag != $npags)
    $npag++;
  if ($npag > 1) {
    echo "Página: ";
    $ini = $p - 3;
    $fin = $p + 3;
    if ($ini < 1)
      $ini = 1;
    if ($fin > $npag)
      $fin = $npag;
    if ($ini > 1)
      echo '... ';
    for ($i = $ini; $i <= $fin; $i++) {
      if ($i != $p)
        echo "<a href=\"mensajeria.php?p={$i}&t={$type}\">{$i}</a> ";
      else
        echo "<b>{$i}</b> ";
    }
    if ($fin < $npag)
      echo '... ';
  }
  echo '<br/><br/>';
  echo '<form action="mensajeria.php" method="post">';
  echo '<div>';
  echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
  echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
  echo "<input type=\"hidden\" name=\"primero\" value=\"{$primero}\"/>";
  echo "<input type=\"hidden\" name=\"ultimo\" value=\"{$ultimo}\"/>";
  echo '<input type="submit" name="borrarpagina" onclick="return c()" value="Borrar mensajes de esta página"/> 
        <input type="submit" name="borrartodos" onclick="return c()" value="Borrar mensajes leidos"/> 
        <input type="submit" name="borrartodostodos" onclick="return c()" value="Borrar todos los mensajes"/>
        <br/><br/><br/></div>';
  echo '</form>';
  echo '<form action="mensajeria.php" method="post">';
  echo '<div>';
  echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
  echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
  echo "<input type=\"hidden\" name=\"primero\" value=\"{$primero}\"/>";
  echo "<input type=\"hidden\" name=\"ultimo\" value=\"{$ultimo}\"/>";

  if (isset($_SESSION['lastmuser'])) {
    $lastmuser = check_username($_SESSION['lastmuser']);
    unset($_SESSION['lastmuser']);
  } else
    $lastmuser = '';

  if (isset($_SESSION['lastmens'])) {
    $lastmens = stripslashes($_SESSION['lastmens']);
    unset($_SESSION['lastmens']);
  } else
    $lastmens = '';

  techo('<b>Si eres miembro de un clan, puedes enviar un mensaje a todos los miembros de tu clan especificando como destino \'@\' (sin comillas), es decir, una arroba.</b>');

  if ($_SESSION['silenciado']) {
    $dia_t = ahora_dia($_SESSION['silenciado']);
    $hora_t = ahora_hora($_SESSION['silenciado']);
    $conan = db_query("SELECT motivo FROM silencio WHERE horafin>{$time} ORDER BY horafin LIMIT 1");
    $motivo = mysqli_fetch_array($conan);
    if ($motivo[0] == '') {
      $motivo[0] = 'No especificado.';
    }
    echo "<font color=\"red\">Estás siendo silenciado por un moderador, no puedes enviar mensajes hasta el {$dia_t} a las {$hora_t}.<br><b>MOTIVO: {$motivo[0]}</b></font>";
  } else {
    if ($us['nivel'] >= $confnivelmensaj || $us['admin'] == 1 || $us['moderador'] == 1) {
      echo "<table id=\"mensajet\"><tr><td>Enviar un mensaje<br/><hr/><br/>Usuario al que quieres enviar el mensaje:<br/><input type=\"text\" name=\"username\" size=\"25\" maxlength=\"30\" value=\"{$lastmuser}\"/><br/><br/>Mensaje a enviar:<br/><textarea name=\"mensaje\" rows=\"7\" cols=\"60\">{$lastmens}</textarea><br/>";
      if ($us['admin'] == 1 || $us['moderador'] == 1)
        echo "<input type=\"checkbox\" name=\"html\" value=\"si\"> Texto Html";
      echo "<br/><input type=\"submit\" name=\"enviar\" onclick=\"return c()\" value=\"Enviar\"/></td></tr></table>";
    } else {
      echo "<table id=\"mensajet\"><tr><td><font color=\"red\">Nivel insuficiente</font></tr><tr><td>Necesitas ser nivel <b>{$confnivelmensaj}</b> o más para poder enviar un mensaje.<td></tr></table>";
    }
  }
  echo '</div>';
  echo '</form>';
}

function procesaform()
{
  global $_REQUEST, $tag, $jug, $time, $confmaxmsg, $conftp, $imgroot, $confnivelmensaj, $us, $nameJug;
  if (isset($_REQUEST['p']))
    $p = $_REQUEST['p'];
  else
    $p = 1;
  if (!is_numeric($p))
    $p = 1;

  if (isset($_REQUEST['reportar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idmens']))) {
      $gtag = $_REQUEST['tag'];
      $idmens = $_REQUEST['idmens'];
      if (($tag == $gtag) && (is_numeric($idmens))) {
        $retval = db_query("SELECT * FROM mensajes WHERE nombrejug='{$jug}' AND idmensaje={$idmens} AND reportado=0");
        if (mysqli_num_rows($retval)) {
          db_query("UPDATE mensajes SET reportado=1 WHERE idmensaje={$idmens}");
          $_SESSION['mensaje'] = 'Se ha informado al administrador del contenido y remitente de ese mensaje.';
		  $_SESSION['mensajeg'] = $_SESSION['mensaje'];
          $p = $p - 1;
        } else {
          $_SESSION['error'] = 'Ese mensaje ya no está en tu mensajería.';
	      $_SESSION['errorg'] = $_SESSION['error'];
		}
        mysqli_free_result($retval);
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		$_SESSION['errorg'] = $_SESSION['error'];
	  }
    }
    header("Location: mensajeria.php?p={$p}");
    return 1;
  }
  if (isset($_REQUEST['enviar'])) {
    if ($us['nivel'] >= $confnivelmensaj || $us['admin'] == 1 || $us['moderador'] == 1) {
      if ($_SESSION['silenciado']) {
        $_SESSION['error'] = 'No puedes hablar, estás siendo silenciado por un moderador.';
		    $_SESSION['errorg'] = $_SESSION['error'];
      } else if (isset($_REQUEST['tag'])) {
        $gtag = $_REQUEST['tag'];
        if ($tag == $gtag) {
          $username = "";
          $mensorig = "";
          if ((isset($_REQUEST['username'])) && (isset($_REQUEST['mensaje']))) {
            $username = check_username($_REQUEST['username']);
            if ($_REQUEST['username'] == '@')
              $username = '@';
            $mensorig2 = $_REQUEST['mensaje'];
            $mensorig = (isset($_REQUEST['html']) ? $_REQUEST['mensaje'] : check_text($_REQUEST['mensaje']));
            $mensaje = str_replace("\n", '<br/> ', $mensorig);
            if (strlen(stripslashes($mensorig2)) > $confmaxmsg) {
              $_SESSION['lastmuser'] = $username;
              $_SESSION['lastmens'] = substr($mensorig, 0, $confmaxmsg - 2);
              $_SESSION['error'] = 'Mensaje demasiado largo, ha sido recortado. Reenvíe para confirmar';
			        $_SESSION['errorg'] = $_SESSION['error'];
            } else {
              if (($username) && (strlen($mensaje))) {
                $retval = db_query("SELECT * FROM jugadores WHERE nombrejug='{$username}'");
                if ((mysqli_num_rows($retval)) || ($username == '@')) {
                  $retvali = db_query("SELECT insignia,clan FROM jugadores WHERE nombrejug='{$jug}'");
                  $reti = mysqli_fetch_row($retvali);
                  mysqli_free_result($retvali);
                  if ($username == '@') {
                    if ($reti[1] != '(ninguno)') {
                      $insigniac = '';
                      $retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$reti[1]}'");
                      if (mysqli_num_rows($retvalic) == 1) {
                        $retic = mysqli_fetch_row($retvalic);
                        $insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
                      }
                      mysqli_free_result($retvalic);
                      $retvalg = db_query("SELECT nombrejug FROM jugadores WHERE clan='{$reti[1]}'");
                      $numrows = mysqli_num_rows($retvalg);
                      for ($ix = 0; $ix < $numrows; $ix++) {
                        $reto = mysqli_fetch_row($retvalg);
                        db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$reto[0]}','{$jug}',{$time},'".getInsigniaJug($jug)." " . ($jug == $nameJug ? '<b>' . $jug . '</b>' : $nameJug) . " (a los miembros del clan {$insigniac} <b>{$reti[1]}</b>):<br/><br/> {$mensaje}','Clan')");
                      }
                      mysqli_free_result($retvalg);
                      $_SESSION['mensaje'] = "Mensaje enviado correctamente a los {$numrows} miembros del clan.";
					            $_SESSION['mensajeg'] = $_SESSION['mensaje'];
                    } else {
                      $_SESSION['error'] = 'No eres miembro de un clan.';
					            $_SESSION['errorg'] = $_SESSION['error'];
                      $_SESSION['lastmens'] = $mensorig;
                    }
                  } else {
                    if ($reti[1] == '(ninguno)')
                      $clan = '';
                    else {
                      $insigniac = "";
                      if ($reti[1] != '(ninguno)') {
                        $retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$reti[1]}'");
                        if (mysqli_num_rows($retvalic) == 1) {
                          $retic = mysqli_fetch_row($retvalic);
                          $insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
                        }
                        mysqli_free_result($retvalic);
                      }
                      $clan = " del clan {$insigniac} <b>{$reti[1]}</b>";
                    }
                    db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$username}','{$jug}',{$time},'".getInsigniaJug($jug)." " . ($jug == $nameJug ? '<b>' . $jug . '</b>' : $nameJug) . "{$clan}:<br/><br/> {$mensaje}')");
                    $_SESSION['mensaje'] = 'Mensaje enviado correctamente.';
				          	$_SESSION['mensajeg'] = $_SESSION['mensaje'];
                  }
                } else {
                  $_SESSION['lastmens'] = $mensorig;
                  $_SESSION['error'] = 'El usuario que has indicado no existe.';
				          $_SESSION['errorg'] = $_SESSION['error'];
                }
                mysqli_free_result($retval);
              } else {
                $_SESSION['error'] = 'No se ha indicado usuario o mensaje a enviar.';
				        $_SESSION['errorg'] = $_SESSION['error'];
                $_SESSION['lastmuser'] = $username;
                $_SESSION['lastmens'] = $mensorig;
              }
            }
          } else {
            $_SESSION['error'] = 'No se ha indicado usuario o mensaje a enviar.';
			      $_SESSION['errorg'] = $_SESSION['error'];
            $_SESSION['lastmuser'] = $username;
            $_SESSION['lastmens'] = $mensorig;
          }
        } else {
          $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		      $_SESSION['errorg'] = $_SESSION['error'];
		    }
      }
    } else {
      $_SESSION['error'] = 'Nivel insuficiente. Necesitas ser nivel <b>' . $confnivelmensaj . '</b> o más para poder enviar un mensaje.';
	    $_SESSION['errorg'] = $_SESSION['error'];
	  }
    header("Location: mensajeria.php?p={$p}");
    return 1;
  }
  if (isset($_REQUEST['borrarpagina'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        if ((isset($_REQUEST['primero'])) && (isset($_REQUEST['ultimo']))) {
          $primero = $_REQUEST['primero'];
          $ultimo = $_REQUEST['ultimo'];
          if ((is_numeric($primero)) && (is_numeric($ultimo)) && ($primero <= $ultimo)) {
            db_query("DELETE FROM mensajes WHERE nombrejug='{$jug}' AND idmensaje >= {$primero} AND idmensaje <= {$ultimo} AND reportado=0");
            if ($p > 1)
              $p--;
            $_SESSION['mensaje'] = 'Mensajes borrados.';
			$_SESSION['mensajeg'] = $_SESSION['mensaje'];
          } else {
            $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			$_SESSION['errorg'] = $_SESSION['error'];
		  }
        } else {
          $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		  $_SESSION['errorg'] = $_SESSION['error'];
		}
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		$_SESSION['errorg'] = $_SESSION['error'];
	  }
    }
    header("Location: mensajeria.php?p={$p}");
    return 1;
  }
  if (isset($_REQUEST['borrartodos'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        db_query("DELETE FROM mensajes WHERE nombrejug='{$jug}' AND reportado=0 AND visto=1");
        $p = 1;
        $_SESSION['mensaje'] = 'Mensajes borrados.';
		$_SESSION['mensajeg'] = $_SESSION['mensaje'];
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		$_SESSION['errorg'] = $_SESSION['error'];
	  }
    }
    header("Location: mensajeria.php?p={$p}");
    return 1;
  }
  if (isset($_REQUEST['borrartodostodos'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        db_query("DELETE FROM mensajes WHERE nombrejug='{$jug}' AND reportado=0");
        $p = 1;
        $_SESSION['mensaje'] = 'Todos los mensajes han sido borrados.';
		$_SESSION['mensajeg'] = $_SESSION['mensaje'];
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		$_SESSION['errorg'] = $_SESSION['error'];
	  }
    }
    header("Location: mensajeria.php?p={$p}");
    return 1;
  }
}
