<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $tag, $confclanmaxmem, $time, $conftp, $us, $imgroot;

  $retval2 = db_query("SELECT clan FROM {$conftp}clandata WHERE nombrejug='{$jug}'");

  techo("Desde la página de clanes puedes controlar toda la información que te concierne con respecto a clanes: crear un clan, solicitar la entrada a un clan cualquiera, o administrar tu clan. Un clan puede tener como máximo {$confclanmaxmem} miembros.");

  $numrows = mysqli_num_rows($retval2);
  if (($us['clan'] == '(ninguno)') && (!$numrows)) {
    techo('Puedes solicitar la entrada a un clan ya existente. El lider de dicho clan decidirá si te acepta o no.');
    echo '<form action="clanes.php" method="post">';
    echo "<table id=\"clanes\"><tr><td><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>Solicitar entrada a un clan<br/><hr/><br/>";
    db_lock("{$conftp}clandata READ,{$conftp}jugadores READ");
    $retval4 = db_query("SELECT DISTINCT clan,sum(puntos) p FROM {$conftp}jugadores GROUP by clan HAVING clan in (SELECT DISTINCT clan FROM {$conftp}clandata) ORDER BY p DESC,clan ASC;");
    db_unlock();
    $numrows3 = mysqli_num_rows($retval4);
    if ($numrows3) {
      echo "Nombre del clan:<br/><select name=\"clanname\">";
      for ($ix = 0; $ix < $numrows3; $ix++) {
        $ret2 = mysqli_fetch_row($retval4);
        if (check_clan($ret2[0]))
          echo "<option value=\"{$ret2[0]}\">$ret2[0]</option>";
      }
      echo "</select><br/><br/><input type=\"submit\" name=\"solicitar\" value=\"Solicitar entrada\"/>";
    } else
      echo 'No existe ningún clan!';
    mysqli_free_result($retval4);
    echo "</td></tr></table>";
    echo '</form><br/><br/>';

    techo('También puedes crear tu propio clan.');
    echo '<form action="clanes.php" method="post">';
    echo "<table id=\"clanes\"><tr><td><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>Crear un clan<br/><hr/><br/>Nombre del clan:<br/><input type=\"text\" name=\"clanname\" size=\"25\" maxlength=\"20\"/><br/><br/><input type=\"submit\" name=\"crear\" value=\"Crear\"/></td></tr></table>";
    echo '</form>';
  }
  if (($us['clan'] == '(ninguno)') && ($numrows)) {
    $reti = mysqli_fetch_row($retval2);
    echo ("Tienes una solicitud activa para pertenecer al clan <b>{$reti[0]}</b>.<br/>Puedes esperar a que el lider decida si formas o no parte del clan o retirar la solicitud.<br/><br/>");
    echo '<form action="clanes.php" method="post">';
    echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"submit\" name=\"retirar\" value=\"Retirar la solicitud\"/></div>";
    echo '</form>';
  }
  mysqli_free_result($retval2);

  /*** CHAT ***/
  if ($us['clan'] != '(ninguno)') {
    include 'chat/chat.php';
  }
  /*** FIN CHAT ***/


  if (($us['clan'] != '(ninguno)') && ($numrows)) {
    db_lock("{$conftp}jugadores READ,{$conftp}clandata READ,{$conftp}claninsignia READ");
    $retvil = db_query("SELECT {$conftp}jugadores.nombrejug,nivel,puntos,insignia,combates,vencedor FROM {$conftp}jugadores,{$conftp}clandata WHERE {$conftp}jugadores.nombrejug={$conftp}clandata.nombrejug AND {$conftp}clandata.clan='{$us['clan']}' AND solicita=1 ORDER BY puntos DESC");
    $retvol = db_query("SELECT {$conftp}jugadores.nombrejug,nivel,puntos,insignia,combates,vencedor,ultimaact FROM {$conftp}jugadores WHERE clan='{$us['clan']}' ORDER BY puntos DESC");
    $retvalic = db_query("SELECT insignia FROM {$conftp}claninsignia WHERE clan='{$us['clan']}'");
    db_unlock();
    $insigniac = '';
    if (mysqli_num_rows($retvalic) == 1) {
      $retic = mysqli_fetch_row($retvalic);
      $insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
    }
    mysqli_free_result($retvalic);
    $numriws = mysqli_num_rows($retvil);
    $nummiembros = mysqli_num_rows($retvol);
    echo "Tu clan, <b>{$us['clan']}</b>, tiene actualmente {$nummiembros} miembros.<br/><br/>";

    if ($insigniac)
      echo "La insignia de tu clan es {$insigniac}<br/>
		<form method=\"post\" action=\"clanes.php\">
		<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"cln\" value=\"{$us['clan']}\"/><label>Si lo deseas, puedes borrar la insignia de tu clan:</label>
		<input type=\"submit\" name=\"quitarinsg\" value=\"Borrar\" onclick=\"return c(' \\nBorrarás la insignia de tu clan y, éste, dejará de tenerla.')\">
		</form><br/>";
    else
      echo "<label>Tu clan no tiene insignia actualmente.<br>Puedes añadir una insignia de atrezzo a tu clan desde aquí: </label>
    <a href=\"clanatrezzo.php\"><button>Añadir</button></a><br><br/>";
    
    ### CHAT DE CLAN ###
    echo $chat;
    ### FIN CHAT DE CLAN ###


    echo "Estos son los miembros de tu clan.<br/><br/>";
    echo '<table class="highscores"><tr><th>Estado</th><th>Puntos</th><th>Insig.</th><th>Nombre</th><th>Nivel</th><th>Combates ganados/totales</th><th>&nbsp;</th><th>&nbsp;</th></tr>';

    for ($tx = 0; $tx < $nummiembros; $tx++) {
      $r = mysqli_fetch_row($retvol);
      if ($time - $r[6] < 600)
        $est = '<img src="' . $imgroot . 'on1.png" alt="ONLINE"/>';
      else if ($time - $r[6] < 1800)
        $est = '<img src="' . $imgroot . 'on2.png" alt="POCA ACTIVIDAD"/>';
      else
        $est = '-';
      echo "<tr><td>{$est}</td><td>{$r[2]}</td><td>".getInsigniaJug($r[0])."</td><td>{$r[0]}</td><td>{$r[1]}</td><td>{$r[5]}/{$r[4]}</td>";
      if ($jug == $r[0])
        echo '<td><b>Lider</b></td><td><b>Lider</b>';
      else {
        echo '<td>';
        echo '<form action="clanes.php" method="post">';
        echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"usuario\" value=\"{$r[0]}\"/><input type=\"submit\" onclick=\"return c()\" name=\"expulsar\" value=\"Expulsar\"/></div>";
        echo '</form>';
        echo '</td><td>';
        echo '<form action="clanes.php" method="post">';
        echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"usuario\" value=\"{$r[0]}\"/><input type=\"submit\" onclick=\"return c('Dejará de ser el lider del clan.')\" name=\"ceder\" value=\"Ceder liderazgo\"/></div>";
        echo '</form>';
        echo '</td>';
      }
      echo "</tr>";
    }
    mysqli_free_result($retvol);
    echo '</table><br/><br/>';


    if ($numriws) {
      echo "Estas son las solicitudes de entrada activas para tu clan.<br/><b>Ojo, sólo si tu clan tiene menos de {$confclanmaxmem} miembros puedes aceptar cualquier solicitud.</b><br/><br/>";
      echo '<table class="highscores"><tr><th>Puntos</th><th>Insig.</th><th>Nombre</th><th>Nivel</th><th>Combates ganados/totales</th><th>&nbsp;</th><th>&nbsp;</th></tr>';

      for ($tx = 0; $tx < $numriws; $tx++) {
        $r = mysqli_fetch_row($retvil);
        echo "<tr><td>{$r[2]}</td><td>".getInsigniaJug($r[0])."</td><td>{$r[0]}</td><td>{$r[1]}</td><td>{$r[5]}/{$r[4]}</td><td>";
        if ($nummiembros < $confclanmaxmem) {
          echo '<form action="clanes.php" method="post">';
          echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"usuario\" value=\"{$r[0]}\"/><input type=\"submit\" name=\"aceptar\" value=\"Aceptar\"/></div>";
          echo '</form>';
        } else
          echo "Máx. {$confclanmaxmem}";
        echo "</td><td>";
        echo '<form action="clanes.php" method="post">';
        echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"usuario\" value=\"{$r[0]}\"/><input type=\"submit\" name=\"rechazar\" value=\"Rechazar\"/></div>";
        echo '</form>';
        echo "</td></tr>";
      }
      mysqli_free_result($retvil);
      echo '</table><br/><br/>';
    } else {
      echo 'No hay solicitudes activas para entrar al clan.<br/><br/>';
    }


    echo 'En cualquier caso, si así lo decides, puedes disolver tu clan.<br/><br/>';
    echo '<form action="clanes.php" method="post">';
    echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"submit\" name=\"disolver\" onclick=\"return c()\" value=\"Disolver el clan\"/></div>";
    echo '</form>';
  }
  if (($us['clan'] != '(ninguno)') && (!$numrows)) {
    db_lock("{$conftp}jugadores READ,{$conftp}clandata READ,{$conftp}claninsignia READ");
    $retvol = db_query("SELECT {$conftp}jugadores.nombrejug,nivel,puntos,insignia,combates,vencedor,ultimaact FROM {$conftp}jugadores WHERE clan='{$us['clan']}' ORDER BY puntos DESC");
    $retlider = db_query("SELECT nombrejug FROM {$conftp}clandata WHERE clan='{$us['clan']}' AND lider=1");
    $retvalic = db_query("SELECT insignia FROM {$conftp}claninsignia WHERE clan='{$us['clan']}'");
    db_unlock();
    $insigniac = '';
    if (mysqli_num_rows($retvalic) == 1) {
      $retic = mysqli_fetch_row($retvalic);
      $insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
    }

    $nummiembros = mysqli_num_rows($retvol);
    echo "El clan al que perteneces, <b>{$us['clan']}</b>, tiene actualmente {$nummiembros} miembros.<br/><br/>";

    if ($insigniac)
      echo "La insignia de tu clan es {$insigniac}.<br/><br/>";

    
    
    ### CHAT DE CLAN ###
    echo $chat;
    ### FIN CHAT DE CLAN ###

    
    echo "Estos son los miembros de tu clan.<br/><br/>";
    echo '<table class="highscores"><tr><th>Estado</th><th>Puntos</th><th>Insig.</th><th>Nombre</th><th>Nivel</th><th>Combates ganados/totales</th><th></th><th></th></tr>';
    $lider = mysqli_fetch_row($retlider);
    mysqli_free_result($retlider);

    for ($tx = 0; $tx < $nummiembros; $tx++) {
      $r = mysqli_fetch_row($retvol);
      if ($time - $r[6] < 600)
        $est = '<img src="' . $imgroot . 'on1.png" alt="ONLINE"/>';
      else if ($time - $r[6] < 1800)
        $est = '<img src="' . $imgroot . 'on2.png" alt="POCA ACTIVIDAD"/>';
      else
        $est = '-';
      echo "<tr><td>{$est}</td><td>{$r[2]}</td><td>".getInsigniaJug($r[0])."</td><td>{$r[0]}</td><td>{$r[1]}</td><td>{$r[5]}/{$r[4]}</td><td>";
      if ($lider[0] == $r[0])
        echo '<b>Lider</b>';
      echo "</td></tr>";
    }
    mysqli_free_result($retvol);
    echo '</table><br/><br/>';

    if (check_clan($us['clan'])) {
      echo 'En cualquier momento, si así lo decides, puedes dejar el clan.<br/><br/>';
      echo '<form action="clanes.php" method="post">';
      echo "<div><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"submit\" name=\"dejar\" onclick=\"return c()\" value=\"Dejar el clan\"/></div>";
      echo '</form>';
    } else
      echo 'No puedes dejar este clan, debes ser expulsado por el lider.<br/><br/>';
  }
}

function procesaform()
{
  global $_REQUEST, $tag, $jug, $time, $confclanmaxmem, $conftp;
  if (isset($_REQUEST['quitarinsg'])) {
    $loc = 'clanes';
    if ((isset($_REQUEST['tag']))) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $retval = db_query("SELECT clan FROM {$conftp}clandata WHERE nombrejug='{$jug}'");
        $numrows = mysqli_num_rows($retval);
        mysqli_free_result($retval);
        $clan = $_REQUEST['cln'];
        if (($clan != '(ninguno)') && ($numrows)) {
          $retval2 = db_query("SELECT clan,insignia FROM {$conftp}claninsignia WHERE clan='{$clan}'");
          $filas = mysqli_num_rows($retval2);
          if ($filas > 0) {
            $ret = mysqli_fetch_row($retval2);
            db_query("UPDATE {$conftp}jugadores SET insignia='none' WHERE clan='{$clan}' AND insignia='{$ret[1]}'");
            db_query("DELETE FROM {$conftp}claninsignia WHERE clan='{$clan}'");
            mysqli_free_result($retval2);
            $_SESSION['mensaje'] = "Insignia eliminada con éxito.";
          } else {
            $_SESSION['error'] = 'Tu clan no tiene insignia.';
          }
        } else {
          $_SESSION['error'] = 'No eres lider de ese clan';
        }
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
      }
    }
    header('Location: ' . $loc . '.php');
    return 1;
  }

  if (isset($_REQUEST['aceptar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['usuario']))) {
      $gtag = $_REQUEST['tag'];
      $usuario = check_username($_REQUEST['usuario']);
      if ($tag == $gtag) {
        if ($usuario) {
          db_lock("{$conftp}jugadores WRITE,{$conftp}clandata WRITE,{$conftp}mensajes WRITE");
          $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
          $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND lider=1");
          $ret = mysqli_fetch_row($retval);
          mysqli_free_result($retval);
          $retval4 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$usuario}' AND clan='{$ret[0]}' AND solicita=1");
          $retval5 = db_query("SELECT * FROM {$conftp}jugadores WHERE clan='{$ret[0]}'");
          $numrows2 = mysqli_num_rows($retval3);
          $numrows3 = mysqli_num_rows($retval4);
          $numrows4 = mysqli_num_rows($retval5);
          mysqli_free_result($retval3);
          mysqli_free_result($retval4);
          mysqli_free_result($retval5);
          if (($ret[0] != '(ninguno)') && ($numrows2)) {
            if ($numrows3) {
              if ($numrows4 < $confclanmaxmem) {
                db_query("DELETE FROM {$conftp}clandata WHERE nombrejug='{$usuario}'");
                db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$usuario}','@',$time,'Se ha aceptado tu solicitud de entrada al clan <b>{$ret[0]}</b>. ¡Bienvenido!')");
                db_query("UPDATE {$conftp}jugadores SET clan='{$ret[0]}' WHERE nombrejug='{$usuario}'");
                $_SESSION['mensaje'] = 'Solicitud aceptada.';
              } else
                $_SESSION['error'] = "No puedes aceptar esa solicitud, ya tienes {$confclanmaxmem} miembros en tu clan.";
            } else
              $_SESSION['error'] = 'Esa solicitud no estaba activa ya.';
          } else
            $_SESSION['error'] = 'No eres lider de ningún clan.';
          db_unlock();
        } else
          $_SESSION['error'] = 'El nombre del jugador no es válido.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['rechazar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['usuario']))) {
      $gtag = $_REQUEST['tag'];
      $usuario = check_username($_REQUEST['usuario']);
      if ($tag == $gtag) {
        if ($usuario) {
          db_lock("{$conftp}jugadores READ,{$conftp}clandata WRITE,{$conftp}mensajes WRITE");
          $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
          $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND lider=1");
          $ret = mysqli_fetch_row($retval);
          mysqli_free_result($retval);
          $retval4 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$usuario}' AND clan='{$ret[0]}' AND solicita=1");
          $numrows2 = mysqli_num_rows($retval3);
          $numrows3 = mysqli_num_rows($retval4);
          mysqli_free_result($retval3);
          mysqli_free_result($retval4);
          if (($ret[0] != '(ninguno)') && ($numrows2)) {
            if ($numrows3) {
              db_query("DELETE FROM {$conftp}clandata WHERE nombrejug='{$usuario}'");
              db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$usuario}','@',$time,'Se ha rechazado tu solicitud de entrada al clan <b>{$ret[0]}</b>.')");
              $_SESSION['mensaje'] = 'Solicitud rechazada.';
            } else
              $_SESSION['error'] = 'Esa solicitud no estaba activa ya.';
          } else
            $_SESSION['error'] = 'No eres lider de ningún clan.';
          db_unlock();
        } else
          $_SESSION['error'] = 'El nombre del jugador no es válido.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['solicitar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['clanname']))) {
      $gtag = $_REQUEST['tag'];
      $clanname = check_clan($_REQUEST['clanname']);
      if ($tag == $gtag) {
        if ($clanname) {
          db_lock("{$conftp}jugadores READ,{$conftp}clandata WRITE,{$conftp}mensajes WRITE");
          $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
          $retval2 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}'");
          $retval3 = db_query("SELECT nombrejug FROM {$conftp}clandata WHERE clan='{$clanname}' AND lider=1");
          $ret = mysqli_fetch_row($retval);
          $numrows = mysqli_num_rows($retval2);
          $numrows2 = mysqli_num_rows($retval3);
          mysqli_free_result($retval);
          mysqli_free_result($retval2);
          if (($ret[0] == '(ninguno)') && (!$numrows)) {
            if ($numrows2) {
              db_query("INSERT INTO {$conftp}clandata (nombrejug,clan,solicita) VALUES ('{$jug}','{$clanname}',1)");
              $ret3 = mysqli_fetch_row($retval3);
              db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$ret3[0]}','@',$time,'<b>{$jug}</b> ha solicitado la entrada al clan.')");
              $_SESSION['mensaje'] = 'Has solicitado entrar al clan. Espera a que el lider decida.';
            } else
              $_SESSION['error'] = 'El clan con ese nombre no existe.';
          } else
            $_SESSION['error'] = 'No puedes solicitar la entrada a un clan porque ya estás en un clan o tienes una solicitud activa.';
          db_unlock();
          mysqli_free_result($retval3);
        } else
          $_SESSION['error'] = 'El nombre del clan no es válido.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['crear'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['clanname']))) {
      $gtag = $_REQUEST['tag'];
      $clanname = check_clan($_REQUEST['clanname']);
      if ($tag == $gtag) {
        if ($clanname) {
          db_lock("{$conftp}jugadores WRITE,{$conftp}clandata WRITE");
          $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
          $retval2 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}'");
          $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE clan='{$clanname}'");
          $ret = mysqli_fetch_row($retval);
          $numrows = mysqli_num_rows($retval2);
          $numrows2 = mysqli_num_rows($retval3);
          if (($ret[0] == '(ninguno)') && (!$numrows)) {
            if (!$numrows2) {
              db_query("INSERT INTO {$conftp}clandata (nombrejug,clan,lider) VALUES ('{$jug}','{$clanname}',1)");
              db_query("UPDATE {$conftp}jugadores SET clan='{$clanname}' WHERE nombrejug='{$jug}'");
              $_SESSION['mensaje'] = 'Has creado el clan.';
            } else
              $_SESSION['error'] = 'El clan con ese nombre ya existe.';
          } else
            $_SESSION['error'] = 'No puedes crear un clan porque ya estás en un clan o tienes una solicitud activa.';
          db_unlock();
        } else
          $_SESSION['error'] = 'El nombre del clan no es válido. Únicamente puede estar formado por letras sin tildes y espacios y debe tener una longitud entre 8 y 20 caracteres.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['retirar'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        db_lock("{$conftp}jugadores READ,{$conftp}clandata WRITE,{$conftp}mensajes WRITE");
        $retval = db_query("SELECT clan FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND solicita=1");
        $numrows = mysqli_num_rows($retval);
        if ($numrows) {
          $ret = mysqli_fetch_row($retval);
          db_query("DELETE FROM {$conftp}clandata WHERE nombrejug='{$jug}'");
          $retval2 = db_query("SELECT nombrejug FROM {$conftp}clandata WHERE clan='{$ret[0]}' AND lider=1");
          $ret2 = mysqli_fetch_row($retval2);
          mysqli_free_result($retval2);
          db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$ret2[0]}','@',$time,'<b>{$jug}</b> ha retirado la solicitud de entrada al clan.')");
          $_SESSION['mensaje'] = 'Has retirado tu solicitud de entrada al clan.';
        } else
          $_SESSION['error'] = 'No tienes ninguna solicitud de entrada activa a ningún clan.';
        db_unlock();
        mysqli_free_result($retval);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['dejar'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        db_lock("{$conftp}jugadores WRITE,{$conftp}mensajes WRITE,{$conftp}clandata READ,{$conftp}claninsignia WRITE");
        $retval = db_query("SELECT clan,insignia FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
        $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND lider=1");
        $ret = mysqli_fetch_row($retval);
        mysqli_free_result($retval);
        $retval4 = db_query("SELECT nombrejug FROM {$conftp}clandata WHERE clan='{$ret[0]}' AND lider=1");
        $retval2 = db_query("SELECT insignia FROM {$conftp}claninsignia WHERE clan='{$ret[0]}'");
        if (mysqli_num_rows($retval2))
          $ret2 = mysqli_fetch_row($retval2);
        else
          $ret2[0] = '0';
        $numrows2 = mysqli_num_rows($retval3);
        mysqli_free_result($retval2);
        mysqli_free_result($retval3);
        if ($ret[0] != '(ninguno)') {
          if (!$numrows2) {
            if (check_clan($ret[0])) {
              db_query("UPDATE {$conftp}jugadores SET clan='(ninguno)' WHERE nombrejug='{$jug}'");
              if ($ret2[0] == $ret[1])
                db_query("UPDATE {$conftp}jugadores SET insignia='none' WHERE nombrejug='{$jug}'");
              $retl = mysqli_fetch_row($retval4);
              db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$retl[0]}','@',$time,'<b>{$jug}</b> ha dejado el clan.')");
              $_SESSION['mensaje'] = 'Has dejado el clan.';
            } else
              $_SESSION['error'] = 'No puedes dejar este clan.';
          } else
            $_SESSION['error'] = 'No puedes dejar el clan si eres el lider.';
        } else
          $_SESSION['error'] = 'No perteneces a ningún clan.';
        db_unlock();
        mysqli_free_result($retval4);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['disolver'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        db_lock("{$conftp}jugadores WRITE,{$conftp}clandata WRITE,{$conftp}mensajes WRITE,{$conftp}claninsignia WRITE");
        $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
        $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND lider=1");
        $ret = mysqli_fetch_row($retval);
        $retval4 = db_query("SELECT insignia FROM {$conftp}claninsignia WHERE clan='{$ret[0]}'");
        if (mysqli_num_rows($retval4))
          $ret4 = mysqli_fetch_row($retval4);
        else
          $ret4[0] = '0';
        $numrows2 = mysqli_num_rows($retval3);
        mysqli_free_result($retval);
        mysqli_free_result($retval4);
        mysqli_free_result($retval3);
        if (($ret[0] != '(ninguno)') && ($numrows2)) {
          $retvalo = db_query("SELECT nombrejug FROM {$conftp}jugadores WHERE clan='{$ret[0]}'");
          $numrows = mysqli_num_rows($retvalo);
          for ($ix = 0; $ix < $numrows; $ix++) {
            $reto = mysqli_fetch_row($retvalo);
            db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$reto[0]}','@',{$time},'El clan <b>{$ret[0]}</b> se ha disuelto.')");
          }
          mysqli_free_result($retvalo);
          if ($ret4[0] != '0')
            db_query("UPDATE {$conftp}jugadores SET insignia='none' WHERE insignia='{$ret4[0]}' AND clan='{$ret[0]}'");
          db_query("UPDATE {$conftp}jugadores SET clan='(ninguno)' WHERE clan='{$ret[0]}'");
          db_query("DELETE FROM {$conftp}clandata WHERE clan='{$ret[0]}'");
          db_query("DELETE FROM {$conftp}claninsignia WHERE clan='{$ret[0]}'");
          $_SESSION['mensaje'] = 'Has disuelto el clan.';
        } else
          $_SESSION['error'] = 'No eres lider de ningún clan.';
        db_unlock();
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['expulsar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['usuario']))) {
      $gtag = $_REQUEST['tag'];
      $usuario = check_username($_REQUEST['usuario']);
      if ($tag == $gtag) {
        db_lock("{$conftp}jugadores WRITE,{$conftp}mensajes WRITE,{$conftp}clandata READ,{$conftp}claninsignia READ");
        $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
        $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND lider=1");
        $ret = mysqli_fetch_row($retval);
        $retval4 = db_query("SELECT insignia FROM {$conftp}claninsignia WHERE clan='{$ret[0]}'");
        $ret4 = mysqli_fetch_row($retval4);
        $numrows2 = mysqli_num_rows($retval3);
        mysqli_free_result($retval);
        mysqli_free_result($retval3);
        mysqli_free_result($retval4);
        if (($ret[0] != '(ninguno)') && ($numrows2)) {
          if ($usuario) {
            if ($usuario != $jug) {
              $reto = db_query("SELECT * FROM {$conftp}jugadores WHERE nombrejug='{$jug}' AND clan='{$ret[0]}'");
              if (mysqli_num_rows($reto)) {
                db_query("UPDATE {$conftp}jugadores SET clan='(ninguno)' WHERE nombrejug='{$usuario}'");
                db_query("UPDATE {$conftp}jugadores SET insignia='none' WHERE insignia='{$ret4[0]}' AND nombrejug='{$usuario}'");
                db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$usuario}','@',$time,'Has sido expulsado del clan <b>{$ret[0]}</b>.')");
                $_SESSION['mensaje'] = 'Has expulsado al jugador del clan.';
              } else
                $_SESSION['error'] = 'El usuario no pertenece al clan ya.';
              mysqli_free_result($reto);
            } else
              $_SESSION['error'] = 'No te puedes expulsar a ti mismo.';
          }
        } else
          $_SESSION['error'] = 'No eres lider de ningún clan.';
        db_unlock();
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }

  if (isset($_REQUEST['ceder'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['usuario']))) {
      $gtag = $_REQUEST['tag'];
      $usuario = check_username($_REQUEST['usuario']);
      if ($tag == $gtag) {
        db_lock("{$conftp}jugadores WRITE,{$conftp}mensajes WRITE,{$conftp}clandata WRITE");
        $retval = db_query("SELECT clan FROM {$conftp}jugadores WHERE nombrejug='{$jug}'");
        $retval3 = db_query("SELECT * FROM {$conftp}clandata WHERE nombrejug='{$jug}' AND lider=1");
        $ret = mysqli_fetch_row($retval);
        $numrows2 = mysqli_num_rows($retval3);
        mysqli_free_result($retval);
        mysqli_free_result($retval3);
        if (($ret[0] != '(ninguno)') && ($numrows2)) {
          if ($usuario) {
            if ($usuario != $jug) {
              $reto = db_query("SELECT * FROM {$conftp}jugadores WHERE nombrejug='{$usuario}' AND clan='{$ret[0]}'");
              if (mysqli_num_rows($reto)) {
                db_query("UPDATE {$conftp}clandata SET nombrejug='{$usuario}' WHERE clan='{$ret[0]}' AND lider=1");
                db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$usuario}','@',$time,'<b>$jug</b> te ha cedido el liderazgo del clan <b>{$ret[0]}</b>.')");
                $_SESSION['mensaje'] = 'Has cedido al jugador el liderazgo del clan.';
              } else
                $_SESSION['error'] = 'El usuario no pertenece al clan ya.';
              mysqli_free_result($reto);
            } else
              $_SESSION['error'] = 'No te puedes ceder el liderazgo a ti mismo.';
          }
        } else
          $_SESSION['error'] = 'No eres lider de ningún clan.';
        db_unlock();
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: clanes.php');
    return 1;
  }
}
