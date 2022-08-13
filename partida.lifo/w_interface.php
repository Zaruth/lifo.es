<?php
function iface()
{
  global $conftitle, $confcontentstart, $confcontentend, $jug, $ident, $publico, $form, 
  $tags, $hidelogin, $confcontentbeffooter, $time, $confabierto, $conftitlebar, $conftp, 
  $us, $_SESSION, $ultimaact, $vmen, $vfor, $root, $nameJug, $conflogin, $confdbname, 
  $conf_numHorasMercader;
  if ((isset($form)) && ($confabierto))
    if (procesaform())
      return;
  echo "<!DOCTYPE html PUBLIC \"-/" . "/W3C/" . "/DTD XHTML 1.0 Strict/" . "/EN\" \"http:/" . "/www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html>
<head>
<meta name=\"Title\" content=\"{$conftitle}\"/>
<meta name=\"Subject\" content=\"Juego de rol/estrategia medieval gratis online\"/>
<meta name=\"Keywords\" content=\"juego, rol, estrategia, medieval, gratis, online, multijugador, {$conftitle}\"/>
<!--meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"-->
<meta name=\"Language\" content=\"Spanish\"/>
<title>{$conftitle}</title>
<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\"/>
<style type=\"text/css\" title=\"currentStyle\" media=\"screen\">@import \"{$root}estilo.css\";</style>
<link rel=\"shortcut icon\" href=\"{$root}favicon.ico\" type=\"image/x-icon\"/>
<script type=\"text/javascript\" src=\"{$root}ext.js\"></script>
<script type=\"text/javascript\" src=\"jquery-1.4.2.min.js\"></script>
</head>";
  if (!$confabierto) {
    echo "<body><div>Cerrado temporálmente por mantenimiento.</div></body></html>";
    return;
  }
  $esadmin = '';
  $espremium = '';
  if ($ident) {
    if (!isset($nosetact)) {
      if ($time - $ultimaact > 300) {
        $retval = db_query("UPDATE {$conftp}jugadores SET ultimaact={$time} WHERE nombrejug='{$jug}'");
        $ultimaact = $time;
        $_SESSION['ultimaact'] = $time;
      }
    }
    $esadmin = $us['admin'];
    $espremium = $us['espremium'];
  }
  echo "<body><div>{$conftitlebar}</div>";
  echo "{$confcontentstart}";
  $retva = db_query("SELECT texto FROM {$conftp}textos WHERE nombre='noticiaspag'");
  $notis = mysqli_fetch_row($retva);
  mysqli_free_result($retva);
  echo $notis[0];


  echo '<div id="menu">';
  if ($ident) {
    if ($jug == $nameJug)
      echo "Jugador: <b>{$jug}</b> ";
    else
      echo "Jugador: {$nameJug} ";
    if ($espremium)
      echo '(premium) ';
    echo " - ";
  } else
    echo 'No estás identificado - ';
  $ahora_d = ahora_dia($time);
  $ahora_h = ahora_hora($time);
  echo " Fecha: {$ahora_d} {$ahora_h}";
  echo '<br/><br/>';
  imenuitem('Estado', 'estado.php');
  echo ' - ';
  imenuitem('Guía del juego', 'guia.php');
  echo ' - ';
  $vtrue = 0;
  if ($ident) {
    $retval = db_query("SELECT COUNT(*) FROM {$conftp}trueques WHERE inicia='{$jug}' OR recibe='{$jug}'");
    $ret = mysqli_fetch_row($retval);
    mysqli_free_result($retval);
    if ($ret[0]) {
      $vtrue = 1;
    }
    if ($vmen == 0) {
      $retval = db_query("SELECT COUNT(*) FROM {$conftp}mensajes WHERE nombrejug='{$jug}' AND visto=0 AND reportado=0");
      $ret = mysqli_fetch_row($retval);
      mysqli_free_result($retval);
      if ($ret[0]) {
        $vmen = 1;
        $_SESSION['vmen'] = 1;
      }
    }
    if ($vfor == 0) {
      $retval = db_query("SELECT COUNT(*) FROM {$conftp}forohebras WHERE hora>={$us['ultimoforo']}");
      $ret = mysqli_fetch_row($retval);
      mysqli_free_result($retval);
      if ($ret[0]) {
        $vfor = 1;
        $_SESSION['vfor'] = 1;
      }
    }
  }
  if ($vmen)
    $noleidos = ' *';
  else
    $noleidos = '';
  imenuitemi("Mensajería{$noleidos}", 'mensajeria.php');
  echo ' - ';
  if ($vfor)
    $nolforo = ' *';
  else
    $nolforo = '';
  imenuitemi("Foro{$nolforo}", 'foro.php');
  echo ' - ';
  imenuitemi('Clasificación', 'clasificacion.php');
  echo ' - ';
  imenuitem('Cambiar Partida', '');
  echo ' - ';
  imenuitemi('Wiki', 'wikilifo.php');
  echo ' - ';
  imenuitemi('Mi cuenta', 'micuenta.php');
  echo ' - ';
  imenuitemi('Salir', "estado.php?salir={$tags}");
  echo '<br/>';
  imenuitemi('Trabajar' . finTrabajo($jug), 'trabajar.php');
  echo ' - ';
  imenuitemi('Inventario', 'inventario.php');
  echo ' - ';
  imenuitemi('Mapas', 'mapas.php');
  echo ' - ';
  imenuitemi('Fabricar', 'fabricar.php');
  //echo ' - ';
  //imenuitemi('Encantar','encantar.php');
  echo ' - ';
  imenuitemi('Mercader', 'mercader.php');
  echo ' - ';
  if ($vtrue)
    $trueques = ' *';
  else
    $trueques = '';
  imenuitemi("Trueques{$trueques}", 'trueques.php');
  echo ' - ';
  imenuitemi('Mascotas', 'mascotas.php');
  echo ' - ';
  imenuitemi('Clanes', 'clanes.php');
  echo ' - ';
  imenuitemi('Combate', 'combate.php');
  if (($us['admin']) || ($us['moderador'])) {
    $esmodera = 1;
    $retvalu = db_query("SELECT COUNT(*) FROM {$conftp}mensajes WHERE reportado=1");
    $hayReports = mysqli_fetch_array($retvalu);
  } else
    $esmodera = '';
  //echo ' - ';
  //imenuitemi('Coliseo','coliseo.php');
  if ($esmodera) {
    echo ' - ';
    if (isset($hayReports) && $hayReports[0] > 0)
      imenuitemi('<b>[*MOD*]</b>', 'mod.php');
    else
      imenuitemi('<b>[MOD]</b>', 'mod.php');
  }
  if ($esadmin) {
    echo ' - ';
    imenuitemi('<b>[ADMIN]</b>', 'admin.php');
  }
  echo '<br/>';
  imenuitemi('Logros', 'logros.php');
  echo ' - ';
  if (haySorteosActivos())
    $sorte = ' *';
  else
    $sorte = '';
  imenuitemi('Sorteos' . $sorte, 'sorteos.php');
  if ((thereAreVotes() && $ident) || $us['admin']) {
    echo ' - ';
    imenuitemi('<strong>[*Votación*]</strong>', 'votacion.php');
  }

  $ma_aparece = mysqli_fetch_array(db_query("SELECT hora FROM lifoes_especial.ma_aparece WHERE partida LIKE '{$confdbname}'"))[0];
  $diff = l_getdate($time) - $ma_aparece;
	if ($diff <= $conf_numHorasMercader * 3600 && $diff >= 0) {
    echo '<br>';
    imenuitemi('[Mercader ambulante]', 'mercaderambulante.php');
  }


  //echo '<br/>';
  //imenuitemi('Calendario de adviento','calendario.php');
  //echo '<br/>';
  //imenuitemi('Halloween','halloween.php');
  echo '</div>';

  echo '<div id="contenido">';

  if ((!$publico) && (!$ident) && (!isset($_SESSION['error'])) && (!isset($_SESSION['mensaje'])) && (!isset($_SESSION['error'])))
    $_SESSION['error'] = 'Parece ser que tu sesión ha caducado. Ten en cuenta que necesitas tener activadas las cookies en tu navegador para poder jugar.';
  $nomensaje = 0;
  $noerror = 0;
  if (isset($_SESSION['error'])) {
    $nomensaje = 1;
    unset($_SESSION['mensaje']);
  } else
    $noerror = 1;

  if (!$nomensaje) {
    echo "<div id=\"mensaje\">";
    if (isset($_SESSION['mensaje'])) {
      echo $_SESSION['mensaje'];
      unset($_SESSION['mensaje']);
    } else
      echo '&nbsp;';
    echo "</div><br/>";
  }
  if (!$noerror) {
    echo "<div id=\"error\">";
    if (isset($_SESSION['error'])) {
      echo $_SESSION['error'];
      unset($_SESSION['error']);
    } else
      echo '&nbsp;';
    echo "</div><br/>";
  }

  if ((!$ident) && (!isset($hidelogin))) {
    techo('¡Sé bienvenido! Si has llegado hasta aquí por casualidad te comento: Este es un juego de rol y estrategia online. Artefactos mágicos, combates, poder... echa un vistazo a la <a href="guia.php">guía del juego</a> o <a href="registro.php">regístrate (gratis)</a> y prueba...<br/><br/>Si ya tienes una cuenta, tienes que teclear tu usuario y contraseña en el formulario que hay aquí debajo para volver a continuar por donde lo dejaste.');
	if ($conflogin == 0){
		echo "<CENTER><h4 style=\"color: red;\">El login no está permitido, vuelve más tarde.</h4></CENTER>";
	}
    echo "<form method=\"post\" action=\"estado.php\"><table id=\"login\"><tr><td><div><b><span class=\"linkreg\"><a href=\"registro.php\">-&gt; ¡Quiero una cuenta! &lt;-</a></span></b><br/><br/>Identifícate:<br/><hr/><br/>Usuario:<br/><input type=\"text\" name=\"username\" size=\"30\" maxlength=\"30\"/><br/><br/>Contraseña:<br/><input type=\"password\" name=\"password\" size=\"30\" maxlength=\"30\"/><br/><br/><input type=\"submit\" name=\"login\" value=\"Entrar\"/><br/><br/>";
    echo "<a href=\"recupera.php\">Olvidé mi contraseña</a>";
    echo "<br/></div></td></tr></table></form>";
    echo '<div><br/><br/></div>';
  }
  if (isset($publico) || ($ident))
    iweb();
  echo $confcontentbeffooter;
  //NO MODIFICAR
  echo '<div id="rights">Copyright 2006-2014. Todos los derechos reservados. <a href="avisolegal.php" rel="external">Aviso legal</a>.<br/>El proyecto LifoSource es libre, puedes obtener el código fuente <a href="https://github.com/lquesada/LifoSource" rel="external">aquí</a>.</div>';
  echo "{$confcontentend}";
  echo "</div></body></html>";
}
function imenuitem($texto, $url)
{
  global $path;
  if ($path != $url)
    echo "<a href=\"{$url}\">{$texto}</a>";
  else {
    $relcode = pwdgen();
    echo "<a href=\"{$url}?reload={$relcode}\"><b>{$texto}</b></a>";
  }
}
function imenuitemi($texto, $url)
{
  global $ident;
  if ($ident)
    imenuitem($texto, $url);
  else
    echo $texto;
}
