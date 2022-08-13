<?php
function hayNoticias()
{
}

function l_setdate($zh)
{
  global $zonahhhh, $zonaact;
  $zonahhhh = $zh;
  if ($zh == -15)
    $zonahhhh = -2;
  $zonahhhh -= $zonaact;
}
function l_getdate($tiempo)
{
  global $zonahhhh;
  return $tiempo - $zonahhhh * 3600;
}

/*pwdHash($username,$password) Herramienta de cifrado de contraseña.*/
function pwdHash($username, $password)
{
  global $confpwdsalt;
  return sha1("{$username}{$password}{$confpwdsalt}");
}

/*pwdgen(); Herramienta que genera una contraseña. */
function pwdgen()
{
  $out = '';
  $string = 'abcdefghijklmnopqrstuvwxyz';
  $len = strlen($string);
  for ($i = 0; $i < 7; $i++) {
    $out .= $string[rand(0, 10)];
  }
  return $out;
}


/*ahora_dia($time) Conversor a dia en formato texto. */
function ahora_dia($time)
{
  return date('d-m-Y', l_getdate($time));
}

/*ahora_hora($time) Conversor a hora en formato texto. */
function ahora_hora($time)
{
  return date('H:i:s', l_getdate($time));
}

/* expsignivel($nivactual,$ultimossubio) Devuelve la experiencia necesaria para alcanzar el siguiente nivel. */
function expsignivel($nivactual, $ultimossubio)
{
  global $confnivel;
  $incremento = 0;
  if ($nivactual >= 40)
    $incremento += ($nivactual - 39) * $confnivel * 2;
  if ($nivactual >= 55)
    $incremento += ($nivactual - 54) * $confnivel * 2;
  if ($nivactual >= 60)
    $incremento += ($nivactual - 59) * $confnivel * 2;
  if ($nivactual >= 65)
    $incremento += ($nivactual - 64) * $confnivel * 2;
  if ($nivactual >= 69)
    $incremento += ($nivactual - 68) * $confnivel * 2;

  return $ultimossubio + $incremento + $nivactual * $confnivel;
}

/* ahora_tiempo($cuanto) Devuelve el tiempo. */
function ahora_tiempo($cuanto)
{
  $horas = floor($cuanto / 3600);
  $cuanto = $cuanto % 3600;
  $minutos = floor($cuanto / 60);
  $cuanto = $cuanto % 60;
  $segundos = $cuanto;

  if ($horas < 10)
    $horas = "0{$horas}";
  if ($minutos < 10)
    $minutos = "0{$minutos}";
  if ($segundos < 10)
    $segundos = "0{$segundos}";

  return "{$horas}:{$minutos}:{$segundos}";
}


/* send_mail($email,$subject,$text) Envía un mail a una dirección de correo. */
function send_mail($fromEmail, $toEemail, $subject, $text, $fromWeb = 'Lifo.es')
{
	
}

/* Envía un mail de recuperación para una cuenta. */
function mail_recu($user, $email)
{
  global $confmail, $confmailn, $conftp, $time, $root;
  $email_md5 = md5($email);
  $user_md5  = md5($user);
  $enlace = $root . 'recuperapass.php?n=' . $user_md5 . '_' . $time . '_' . $email_md5;
  // Varios destinatarios // Desactivado
  /*
	$para  = 'aidan@example.com' . ', '; // atención a la coma
	$para .= 'wez@example.com';
	*/

  // título
  $título = 'Lifo.es - Email de recuperación de contraseña.';

  // mensaje
  $mensaje = "
	<html>
	<head>
	  <title>Recuperación</title>
	</head>
	<body>
	  <p>Has solicitado la recuperación de contraseña para el usuario \"{$user}\"<br>
	  Usa el siguiente enlace para establecer una nueva contraseña:</p>
	  <p><a href=\"{$enlace}\">{$enlace}</a></p>
	  <p><font color=\"red\">¡CUIDADO! </font>No compartas este enlace con nadie. Este enlace tiene una caducidad de 10 minutos.</p>
	</body>
	</html>
	";

  // Para enviar un correo HTML, debe establecerse la cabecera Content-type
  $cabeceras  = 'MIME-Version: 1.0' . "\r\n";
  $cabeceras .= 'Content-type: text/html; charset=UTF-8' . "\r\n";

  // Cabeceras adicionales // Desactivado

  //$cabeceras .= 'To: Mary <mary@example.com>, Kelly <kelly@example.com>' . "\r\n";
  $cabeceras .= 'From: Recordatorio de Contraseña <verification_mail@lifo.es>' . "\r\n";
  /*$cabeceras .= 'Cc: birthdayarchive@example.com' . "\r\n";
	$cabeceras .= 'Bcc: birthdaycheck@example.com' . "\r\n";
	*/

  // Enviarlo
  mail($email, $título, $mensaje, $cabeceras);
}

function antiflood($evento, $actor, $max, $tiempo)
{
  global $time, $conftp;
  $timelimit = $time - $tiempo;
  $return = 0;
  //db_lock("flood WRITE");
  db_query("DELETE FROM flood WHERE evento='{$evento}' AND tiempo<{$timelimit}");
  $retval = db_query("SELECT COUNT(*) FROM flood WHERE evento='{$evento}' AND actor='{$actor}' AND tiempo>=$timelimit");
  $ret = mysqli_fetch_row($retval);
  if ($ret[0] < $max) {
    db_query("INSERT INTO flood (evento,actor,tiempo) VALUES ('{$evento}','{$actor}',$time)");
    $return = 1;
  }
  //db_unlock();
  mysqli_free_result($retval);
  return $return;
}
function antifloodcheck($evento, $actor, $max, $tiempo)
{
  global $time, $conftp;
  $timelimit = $time - $tiempo;
  $return = 0;
  //db_lock("flood WRITE");
  db_query("DELETE FROM flood WHERE evento='{$evento}' AND tiempo<{$timelimit}");
  $retval = db_query("SELECT COUNT(*) FROM flood WHERE evento='{$evento}' AND actor='{$actor}' AND tiempo>=$timelimit");
  $ret = mysqli_fetch_row($retval);
  if ($ret[0] < $max) {
    $return = 1;
  }
  //db_unlock();
  mysqli_free_result($retval);
  return $return;
}
function antifloodc($evento, $actor)
{
  global $conftp;
  //db_lock("flood WRITE");
  db_query("DELETE FROM flood WHERE evento='{$evento}' AND actor='{$actor}'");
  //db_unlock();
}

function puedeatacar($jugador)
{
  global $time, $conforonivelataca, $conftp;
  $retval = db_query("SELECT * FROM jugadores WHERE oro>={$conforonivelataca}*nivel AND noatacarhasta<{$time} AND nombrejug='{$jugador}' AND energia>=5");
  $a = mysqli_num_rows($retval);
  mysqli_free_result($retval);
  return $a;
}

function puedeseratacado($jugador)
{
  global $time, $conforonivelataca, $conftp;
  //db_lock("jugadores READ");
  $retval = db_query("SELECT * FROM jugadores WHERE oro>={$conforonivelataca}*nivel AND protegidohasta<{$time} AND nombrejug='{$jugador}'");
  //db_unlock();
  $a = mysqli_num_rows($retval);
  mysqli_free_result($retval);
  return $a;
}

function combateinfo($nombre, $sombra)
{
  global $conftp, $time, $confvidabase,$confvidanivel;
  $retval = db_query("SELECT oro,puntossuma,puntos,nivel,combates,vencedor,vencido,insignia,clan,premiumhasta,energia,moderador,enchufado FROM jugadores WHERE nombrejug='{$nombre}'");
  $ret = mysqli_fetch_row($retval);

  $juga['nombre'] = $nombre;
  if ($sombra == 1) $juga['nombre'] = "Sombra";
  $juga['oro'] = $ret[0];
  if ($sombra == 1) $juga['oro'] = 0;
  $juga['nivel'] = $ret[3];
  if ($sombra == 1) $juga['nivel'] = $ret[3] + 5;
  $juga['insignia'] = $ret[7];
  if ($sombra == 1) $juga['insignia'] = 'darkshadow';
  $juga['clan'] = $ret[8];
  if ($sombra == 1) $juga['clan'] = '(ninguno)';;

  $juga['puntossuma'] = $ret[1];
  $juga['puntossumasec'] = $ret[1];
  $juga['puntos'] = $ret[2];
  $juga['premiumhasta'] = $ret[9];
  if ($ret[11] || $ret[12]) {
    $juga['premiumhasta'] = $time + 10;
  }
  $juga['combates'] = $ret[4] + 1;
  $juga['vencedor'] = $ret[5];
  $juga['vencido'] = $ret[6];
  $juga['energia'] = $ret[10];
  $retval = db_query("SELECT SUM(ob.ataq), SUM(ob.prot), SUM(ob.vida) FROM `objetos` AS ob JOIN `tiene` AS ti ON (ob.nombreobj=ti.nombreobj AND ti.nombrejug='{$nombre}') WHERE ti.usado=1");
  $ret = mysqli_fetch_row($retval);
  $juga['ataq'] = 0 + $ret[0] + 10 + floor($juga['nivel'] / 3);
  $juga['prot'] = 0 + $ret[1] + 10 + floor($juga['nivel'] / 10);
  $juga['vida'] = 0 + $ret[2] + $confvidabase + $juga['nivel'] * $confvidanivel;
  $juga['ataqprotinvent'] = 0 + $ret[0] + $ret[1];
  mysqli_free_result($retval);
  $juga['ataqmascota'] = 0;
  $juga['protmascota'] = 0;
  $juga['vidamascota'] = 0;

  $retvox = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,ataquenivel,defensanivel,expbase,expmult,expgana,maxnivel,usado,expgana,tienemascotas.apodo,vidabase,vidanivel FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$nombre}' AND usado=1");
  if (mysqli_num_rows($retvox)) {
    $rrr = mysqli_fetch_row($retvox);
    $juga['mascota'] = $rrr[1];
    $juga['expmascota'] = $rrr[14];
    $juga['nombremascota'] = $rrr[0];
    $juga['ataqmascota'] = $rrr[5] + ($rrr[7] * ($rrr[2] - 1));
    $juga['protmascota'] = $rrr[6] + ($rrr[8] * ($rrr[2] - 1));
    $juga['vidamascota'] = $rrr[16] + ($rrr[17] * ($rrr[2] - 1));
    $juga['apodomascota'] =  $rrr[15];
  } else {
    $juga['mascota'] = '';
    $juga['expmascota'] = 0;
    $juga['nombremascota'] = '';
    $juga['ataqmascota'] = 0;
    $juga['protmascota'] = 0;
    $juga['vidamascota'] = 0;
    $juga['apodomascota'] = '';
  }
  $juga['ataq'] = $juga['ataq'] + $juga['ataqmascota'];
  $juga['prot'] = $juga['prot'] + $juga['protmascota'];
  $juga['vida'] = $juga['vida'] + $juga['vidamascota'];
  $juga['ataqprotmascota'] = $juga['ataqmascota'] + $juga['protmascota'];
  $juga['ataqprot'] = $juga['ataq'] + $juga['prot'];
  mysqli_free_result($retvox);

  if ($juga['clan'] == '(ninguno)') {
    $juga['clanpuntos'] = 0;
    $juga['claninsignia'] = 0;
  } else {
    $retvx = db_query("SELECT sum(puntos) p FROM jugadores GROUP BY clan HAVING clan='{$juga['clan']}'");
    $rxx = mysqli_fetch_row($retvx);
    $juga['clanpuntos'] = $rxx[0];
    mysqli_free_result($retvx);
    $retvx = db_query("SELECT insignia FROM claninsignia WHERE clan='{$juga['clan']}'");
    $rxx = mysqli_fetch_row($retvx);
    $juga['claninsignia'] = $rxx[0];
    mysqli_free_result($retvx);
  }
  return $juga;
}

function gestionaataque(&$tacante, &$tacado, $motivo, $certero = 0)
{
  if ($motivo) {
    $motivo = ' ' . $motivo;
  }
  $mensaje = "<b>{$tacante['nombre']}</b> se lanza hacia <b>{$tacado['nombre']}</b>{$motivo}.<br/>";

  $ataque = rand(1, $tacante['ataq'] * 3);
  $defensa = rand(1, $tacado['prot'] * 3);
  if ($ataque > $defensa || $certero == 1) {
    $ataque = floor($ataque / 5);
    $defensa = floor($defensa / 5);
    if ($ataque == 0)
      $ataque = 1;
    if ($defensa == 0)
      $defensa = 1;
    if (rand(1, 5) == 5) {
      $ataque = rand(2, 5) * $ataque;
      $tacado['vida'] = $tacado['vida'] - $ataque;
      $mensaje .= "¡<b>{$tacante['nombre']}</b> asesta un golpe crítico a <b>{$tacado['nombre']}</b> por <b>{$ataque}</b> puntos de vida!<br/>";
    } else {
      $tacado['vida'] = $tacado['vida'] - $ataque;
      $mensaje .= "¡<b>{$tacante['nombre']}</b> asesta un golpe a <b>{$tacado['nombre']}</b> por <b>{$ataque}</b> puntos de vida!<br/>";
    }
  } else {
    $mensaje .= "¡<b>{$tacado['nombre']}</b> detiene el ataque de <b>{$tacante['nombre']}</b>!<br/>";
  }
  if ($tacante['vida'] < 0)
    $tacante['vida'] = 0;
  if ($tacado['vida'] < 0)
    $tacado['vida'] = 0;
  $mensaje .= '<br/>';
  return $mensaje;
}
function infocombate($tacante, $tacado)
{
  return "<b>{$tacante['nombre']}</b> (puntos de vida: <b>{$tacante['vida']}</b>).<br/><b>{$tacado['nombre']}</b> (puntos de vida: <b>{$tacado['vida']}</b>).<br/><br/>";
}

function combate($atacante, $atacado, $aleat)
{
  global $confnoatacarhasta, $time, $confprotegidohasta, $conforonivelataca, $confganacombexpmax, $confganacombexpmin, $confnoatacarhastapremium, $conftp, $imgroot;
  $tacante = combateinfo($atacante, 0);
  if ($atacante == $atacado) {
    $tacado = combateinfo($atacado, 1);
  } else {
    $tacado = combateinfo($atacado, 0);
  }
  if ($tacante['premiumhasta'] >= $time)
    $tacante['noatacarhasta'] = $time + $confnoatacarhastapremium;
  else
    $tacante['noatacarhasta'] = $time + $confnoatacarhasta;
  $tacado['protegidohasta'] = $time + $confprotegidohasta;


  if ($tacante['clan'] == '(ninguno)')
    $tteclan = '';
  else {
    if ($tacante['claninsignia'] == '')
      $tteclan = " del clan <b>{$tacante['clan']}</b>";
    else
      $tteclan = " del clan <img style=\"vertical-align:middle\" src=\"{$imgroot}img/{$tacante['claninsignia']}.gif\" alt=\"insignia\"/> <b>{$tacante['clan']}</b>";
  }
  if ($tacado['clan'] == '(ninguno)')
    $tdoclan = '';
  else {
    if ($tacado['claninsignia'] == '')
      $tdoclan = " del clan <b>{$tacado['clan']}</b>";
    else
      $tdoclan = " del clan <img style=\"vertical-align:middle\" src=\"{$imgroot}img/{$tacado['claninsignia']}.gif\" alt=\"insignia\"/> <b>{$tacado['clan']}</b>";
  }

  if (!$aleat)
    $mensa2 = '<font color="#DDDDDD">_</font>';
  else
    $mensa2 = '';

  $mensaje  = "<b>¡Combate!</b>";
  $mensaje .= "<img style=\"vertical-align:middle\" src=\"{$imgroot}img/{$tacante['insignia']}.gif\" alt=\"insignia\"/> " . getName($atacante, 1) . " (nivel {$tacante['nivel']}){$tteclan}";
  $mensaje .= " ha atacado a ";
  if ($atacante == $atacado) {
    $mensaje .= "<img style=\"vertical-align:middle\" src=\"{$imgroot}img/{$tacado['insignia']}.gif\" alt=\"insignia\"/> <b>Sombra</b> (nivel {$tacado['nivel']}){$tdoclan}.{$mensa2}<br/><br/>";
  } else {
    $mensaje .= "<img style=\"vertical-align:middle\" src=\"{$imgroot}img/{$tacado['insignia']}.gif\" alt=\"insignia\"/> " . getName($atacado, 1) . " (nivel {$tacado['nivel']}){$tdoclan}.{$mensa2}<br/><br/>";
  }


  $retval = db_query("SELECT objetos.img,objetos.nombreobj FROM tiene,objetos WHERE nombrejug='{$atacante}' AND tiene.nombreobj=objetos.nombreobj AND tiene.usado=1 ORDER BY tipo ASC");
  $mensaje .= "<b>{$atacante}</b> está usando: ";
  if ($tacante['mascota'])
    $mensaje .= "<img src=\"{$imgroot}img/{$tacante['mascota']}.gif\" alt=\"{$tacante['nombremascota']}\"/>";
  $numrows = mysqli_num_rows($retval);
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_row($retval);
    $mensaje .= "<img src=\"{$imgroot}img/{$ret[0]}.gif\" alt=\"{$ret[1]}\"/>";
  }
  $mensaje .= '<br/>';
  mysqli_free_result($retval);

  $retval = db_query("SELECT objetos.img,objetos.nombreobj FROM tiene,objetos WHERE nombrejug='{$atacado}' AND tiene.nombreobj=objetos.nombreobj AND tiene.usado=1 ORDER BY tipo ASC");
  if ($atacante == $atacado) {
    $mensaje .= "<b>Sombra</b> está usando: ";
  } else {
    $mensaje .= "<b>{$atacado}</b> está usando: ";
  }
  if ($tacado['mascota'])
    $mensaje .= "<img src=\"{$imgroot}img/{$tacado['mascota']}.gif\" alt=\"{$tacado['nombremascota']}\"/>";
  $numrows = mysqli_num_rows($retval);
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_row($retval);
    $mensaje .= "<img src=\"{$imgroot}img/{$ret[0]}.gif\" alt=\"{$ret[1]}\"/>";
  }
  $mensaje .= '<br/><br/>';
  mysqli_free_result($retval);


  $orooblig = $conforonivelataca * $tacado['nivel'];
  if ($conforonivelataca * $tacante['nivel'] < $orooblig)
    $orooblig = $conforonivelataca * $tacante['nivel'];
  $oromax = $tacado['oro'];
  if ($tacante['oro'] < $oromax)
    $oromax = $tacante['oro'];
  $oromax = floor($oromax / 6);
  $orooblig = floor($orooblig / 6);
  $oroapuesta = rand(1, $oromax);
  if ($orooblig > $oroapuesta) {
    $aux = $orooblig;
    $orooblig = $oroapuesta;
    $oroapuesta = $aux;
  }
  $oro_ganador = rand($orooblig, $oroapuesta);
  $exptacante = floor(($tacante['puntos'] + $tacado['puntos'] * rand(10, 20)) / 4000);
  $exptacado = floor(($tacado['puntos'] + $tacante['puntos'] * rand(10, 20)) / 4000);
  if (!$exptacante)
    $exptacante = 10;
  if (!$exptacado)
    $exptacado = 10;
  
  $turno = 1;

  if ($tacante['vida'] > 0 && $tacado['vida'] > 0) {
    if ($tacante['clanpuntos'] > $tacado['clanpuntos']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacante, $tacado, 'porque está en un clan mejor');
      $turno++;
    } else if ($tacado['clanpuntos'] > $tacante['clanpuntos']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacado, $tacante, 'porque está en un clan mejor');
      $turno++;
    }
  }

  if ($tacante['vida'] > 0 && $tacado['vida'] > 0) {
    if ($tacante['ataqprotmascota'] > $tacado['ataqprotmascota']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacante, $tacado, 'porque tiene una mascota más fuerte');
      //('.$tacante['nombre'].':'.$tacante['ataqprotmascota'].' # '.$tacado['nombre'].':'.$tacado['ataqprotmascota'].')');
      $turno++;
    } else if ($tacado['ataqprotmascota'] > $tacante['ataqprotmascota']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacado, $tacante, 'porque tiene una mascota más fuerte');
      //('.$tacado['nombre'].':'.$tacado['ataqprotmascota'].' # '.$tacante['nombre'].':'.$tacante['ataqprotmascota'].')');
      $turno++;
    }
  }

  if ($tacante['vida'] > 0 && $tacado['vida'] > 0) {
    if ($tacante['nivel'] > $tacado['nivel']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacante, $tacado, 'porque tiene más nivel');
      //('.$tacante['nombre'].':'.$tacante['nivel'].' # '.$tacado['nombre'].':'.$tacado['nivel'].')');
      $turno++;
    } else if ($tacado['nivel'] > $tacante['nivel']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacado, $tacante, 'porque tiene más nivel');
      //('.$tacado['nombre'].':'.$tacado['nivel'].' # '.$tacante['nombre'].':'.$tacante['nivel'].')');
      $turno++;
    }
  }

  if ($tacante['vida'] > 0 && $tacado['vida'] > 0) {
    if ($tacante['energia'] > $tacado['energia']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacante, $tacado, 'porque tiene más energía');
      //('.$tacante['nombre'].':'.$tacante['energia'].' # '.$tacado['nombre'].':'.$tacado['energia'].')');
      $turno++;
    } else if ($tacado['energia'] > $tacante['energia']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacado, $tacante, 'porque tiene más energía');
      //('.$tacado['nombre'].':'.$tacado['energia'].' # '.$tacante['nombre'].':'.$tacante['energia'].')');
      $turno++;
    }
  }

  if ($tacante['vida'] > 0 && $tacado['vida'] > 0) {
    if ($tacante['ataqprotinvent'] > $tacado['ataqprotinvent']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacante, $tacado, 'porque tiene mejor inventario', 1);
      //('.$tacante['nombre'].':'.$tacante['ataqprotinvent'].'/'.$tacante['ataqprot'].' # '.$tacado['nombre'].':'.$tacado['ataqprotinvent'].'/'.$tacado['ataqprot'].')');
      $turno++;
    } else if ($tacado['ataqprotinvent'] > $tacante['ataqprotinvent']) {
      $mensaje .= infocombate($tacante, $tacado);
      $mensaje .= gestionaataque($tacado, $tacante, 'porque tiene mejor inventario', 1);
      //('.$tacado['nombre'].':'.$tacado['ataqprotinvent'].'/'.$tacado['ataqprot'].' # '.$tacante['nombre'].':'.$tacante['ataqprotinvent'].'/'.$tacante['ataqprot'].')');
      $turno++;
    }
  }

  if ($turno % 2 == 0)
    $turno--;
  while ($turno <= 10) {
    if ($tacante['vida'] > 0 && $tacado['vida'] > 0) {
      $mensaje .= infocombate($tacante, $tacado);
      if ($turno % 2 == 0)
        $mensaje .= gestionaataque($tacado, $tacante, '');
      else
        $mensaje .= gestionaataque($tacante, $tacado, '');
    }
    $turno++;
  }

  $mensaje .= infocombate($tacante, $tacado);

  if ($tacante['vida'] > $tacado['vida']) {
    $mensaje .= "¡<b>{$atacante} ha ganado el combate!</b><br/>";
    $ganador = 'atacante';
  } else {
    if ($atacante == $atacado) {
      $mensaje .= "¡<b>Sombra ha ganado el combate!</b><br/>";
    } else {
      $mensaje .= "¡<b>{$atacado} ha ganado el combate!</b><br/>";
    }
    $ganador = 'atacado';
  }

  if ($ganador == 'atacante') {
    $tacante['vencedor'] = $tacante['vencedor'] + 1;
    $tacado['vencido'] = $tacado['vencido'] + 1;
    if (rand(0, 3))
      $exptacado = $exptacado * -1;
    $tacante['oro'] = $tacante['oro'] + $oro_ganador;
    $tacado['oro'] = $tacado['oro'] - $oro_ganador;
    if ($atacado != "Xilok" && $atacante != $atacado) $mensaje .= "<b>¡{$atacante} roba a {$atacado} {$oro_ganador} monedas de oro!</b><br/>";
    $tacante['puntossuma'] = $tacante['puntossuma'] + $exptacante;
    $tacado['puntossuma'] = $tacado['puntossuma'] + $exptacado;
    if ($tacante['puntossuma'] <= $tacado['puntossuma'])
      $tacante['puntossuma'] = $tacado['puntossuma'] + 1;
    if ($atacado != "Xilok")
      if ($tacante['mascota'])
        db_query("UPDATE tienemascotas SET experiencia=experiencia+{$tacante['expmascota']} WHERE nombrejug='{$atacante}' AND nombremascota='{$tacante['nombremascota']}'");
  } else {
    $tacado['vencedor'] = $tacado['vencedor'] + 1;
    $tacante['vencido'] = $tacante['vencido'] + 1;
    if (rand(0, 5))
      $exptacante = $exptacante * -1;
    $tacante['oro'] = $tacante['oro'] - $oro_ganador;
    $tacado['oro'] = $tacado['oro'] + $oro_ganador;
    if ($atacado != "Xilok" && $atacante != $atacado) $mensaje .= "<b>¡{$atacado} roba a {$atacante} {$oro_ganador} monedas de oro!</b><br/>";
    $tacante['puntossuma'] = $tacante['puntossuma'] + $exptacante;
    $tacado['puntossuma'] = $tacado['puntossuma'] + $exptacado;
    if ($tacado['puntossuma'] <= $tacante['puntossuma'])
      $tacado['puntossuma'] = $tacante['puntossuma'] + 1;
    if ($tacado['mascota'])
      db_query("UPDATE tienemascotas SET experiencia=experiencia+{$tacado['expmascota']} WHERE nombrejug='{$atacado}' AND nombremascota='{$tacado['nombremascota']}'");
  }
  if ($tacante['puntos'] + $tacante['puntossuma'] < 0)
    $tacante['puntossuma'] = $tacante['puntos'] * -1;
  if ($tacado['puntos'] + $tacado['puntossuma'] < 0)
    $tacado['puntossuma'] = $tacado['puntos'] * -1;
  if ($tacante['puntossuma'] > $confganacombexpmax)
    $tacante['puntossuma'] = $confganacombexpmax;
  if ($tacado['puntossuma'] > $confganacombexpmax)
    $tacado['puntossuma'] = $confganacombexpmax;
  if ($tacante['puntossuma'] < $confganacombexpmin)
    $tacante['puntossuma'] = $confganacombexpmin;
  if ($tacado['puntossuma'] < $confganacombexpmin)
    $tacado['puntossuma'] = $confganacombexpmin;

  if (!$tacante['puntossuma'])
    $tacante['puntossuma'] = 1;
  if (!$tacado['puntossuma'])
    $tacado['puntossuma'] = 1;

  if ($ganador == 'atacante') {
    $expx = $tacante['puntossuma'] - $tacante['puntossumasec'];
    if ($atacado != "Xilok") {
      $mensaje .= "<b>¡{$atacante} gana {$expx} puntos de experiencia!";
      if ($tacante['mascota']) {
        if ($tacante['apodomascota'] != '') {
          $mensaje .= " Su mascota, {$tacante['apodomascota']}, se siente fuerte.";
        } else {
          $mensaje .= ' Su mascota se siente fuerte.';
        }
      }
      $mensaje .= "</b><br/>";
    }

    $expx = $tacado['puntossuma'] - $tacado['puntossumasec'];
    if ($atacado != "Xilok" && $atacante != $atacado) {
      if ($expx < 0) {
        $expx = $expx * -1;
        $mensaje .= "<b>¡{$atacado} se desmoraliza y pierde {$expx} puntos de experiencia!</b><br/>";
      } else
        $mensaje .= "<b>¡{$atacado} ha aprendido de este combate y gana {$expx} puntos de experiencia!</b><br/>";
    } else {
	  if ($atacado == "Xilok") {
      $mensaje .= "<br><b>Agg, maldito seas, eres un luchador nato.<br/>Está bien, admito la derrota sucia rata.</b><br/>";
      $mensaje .= get_objeto_xilok($atacante);
	  }
    }
    if ($atacado == "Xilok") {
      include_once 'auxiliar/f_logros.php';
      check_logro(45, $atacante);
    }
  } else {
    $expx = $tacado['puntossuma'] - $tacado['puntossumasec'];
    if ($atacado != "Xilok" && $atacante != $atacado) {
      $mensaje .= "<b>¡{$atacado} gana {$expx} puntos de experiencia!";
      if ($tacado['mascota']) {
        if ($tacado['apodomascota'] != '') {
          $mensaje .= " Su mascota, {$tacado['apodomascota']}, se siente fuerte.";
        } else {
          $mensaje .= ' Su mascota se siente fuerte.';
        }
      }
      $mensaje .= "</b><br/>";
    }
    $expx = $tacante['puntossuma'] - $tacante['puntossumasec'];
    if ($atacado != "Xilok") {
      if ($expx < 0) {
        $expx = $expx * -1;
        $mensaje .= "<b>¡{$atacante} se desmoraliza y pierde {$expx} puntos de experiencia!</b><br/>";
      } else
        $mensaje .= "<b>¡{$atacante} ha aprendido de este combate y gana {$expx} puntos de experiencia!</b><br/>";
    } else {
      $mensaje .= "<br><b>Ja ja ja, no me hagas reir saco de carne.<br/>Vuelve cuando sepas empuñar una espada, basura.</b><br/>";
    }
  }
  if ($atacante == $atacado) {
    $mensaje .= "<br/><b>La sombra se desvanece...</b><br/>";
  }
  db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$atacante}','@',$time,'{$mensaje}','Combate')");
  if ($atacado != "Xilok" && $atacante != $atacado) {
    db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$atacado}','@',$time,'{$mensaje}','Combate')");
  }
  if ($atacado == "Xilok") {
    db_query("UPDATE jugadores SET noatacarhasta={$tacante['noatacarhasta']},protegidohasta=0 WHERE nombrejug='{$atacante}'");
  } else {
    if ($atacante == $atacado) {
      db_query("UPDATE jugadores SET puntossuma={$tacante['puntossuma']},noatacarhasta={$tacante['noatacarhasta']},protegidohasta=0,combates={$tacante['combates']},vencedor={$tacante['vencedor']},vencido={$tacante['vencido']} WHERE nombrejug='{$atacante}'");
    } else {
      db_query("UPDATE jugadores SET oro={$tacante['oro']},puntossuma={$tacante['puntossuma']},noatacarhasta={$tacante['noatacarhasta']},protegidohasta=0,combates={$tacante['combates']},vencedor={$tacante['vencedor']},vencido={$tacante['vencido']} WHERE nombrejug='{$atacante}'");
    }
  }
  if ($atacado == "Xilok" || $atacante == $atacado) {
    if ($atacado == "Xilok") {
      db_query("UPDATE jugadores SET oro=0,puntossuma=0,protegidohasta=0,combates=0,vencedor=0,vencido=0 WHERE nombrejug='{$atacado}'");
    }
  } else {
    db_query("UPDATE jugadores SET oro={$tacado['oro']},puntossuma={$tacado['puntossuma']},protegidohasta={$tacado['protegidohasta']},combates={$tacado['combates']},vencedor={$tacado['vencedor']},vencido={$tacado['vencido']} WHERE nombrejug='{$atacado}'");
  }

  $rxx = db_query("SELECT nombrejug,tiene.nombreobj,img FROM tiene,objetos WHERE (nombrejug='{$atacante}' OR nombrejug='{$atacado}') AND usado=1 AND tiene.nombreobj=objetos.nombreobj AND usos=1");
  $nr = mysqli_num_rows($rxx);
  for ($i = 0; $i < $nr; $i++) {
    $rex = mysqli_fetch_row($rxx);
    quita_objeto($rex[0], $rex[1], $rex[2]);
  }
  mysqli_free_result($rxx);
}
function techo($texto)
{
  echo "<table class=\"texto\"><tr><td>{$texto}</td></tr></table>";
}

function addoferta($obj, $canti = 1)
{
  global $confmaxoferta, $conftp;
  if ($canti > $confmaxoferta)
    $canti = $confmaxoferta;
  $retval = db_query("SELECT cantidad FROM ofertas WHERE nombreobj='{$obj}'");
  if (mysqli_num_rows($retval) == 0)
    db_query("INSERT INTO ofertas (nombreobj,cantidad) VALUES ('{$obj}',{$canti})");
  else {
    $ret = mysqli_fetch_row($retval);
    $cantidad = $ret[0] + $canti;
    if ($cantidad > $confmaxoferta)
      $cantidad = $confmaxoferta;
    db_query("UPDATE ofertas SET cantidad={$cantidad} WHERE nombreobj='{$obj}'");
  }
  mysqli_free_result($retval);
}

function remoferta($obj, $canti = 1)
{
  global $conftp;
  $retval = db_query("SELECT cantidad FROM ofertas WHERE nombreobj='{$obj}'");
  if (mysqli_num_rows($retval)) {
    $ret = mysqli_fetch_row($retval);
    if ($ret[0] <= $canti) {
      db_query("DELETE FROM ofertas WHERE nombreobj='{$obj}'");
    } else {
      $cantidad = $ret[0] - $canti;
      db_query("UPDATE ofertas SET cantidad={$cantidad} WHERE nombreobj='{$obj}'");
    }
  }
  mysqli_free_result($retval);
}


function dale_objeto($jug, $obj, $canti = 1)
{
  global $conftp;
  $retval = db_query("SELECT cantidad FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='{$obj}'");
  if (mysqli_num_rows($retval) == 0)
    db_query("INSERT INTO tiene (nombrejug,nombreobj,cantidad) VALUES ('{$jug}','{$obj}',{$canti})");
  else {
    $ret = mysqli_fetch_row($retval);
    $cantidad = $ret[0] + $canti;
    db_query("UPDATE tiene SET cantidad={$cantidad} WHERE nombrejug='{$jug}' AND nombreobj='{$obj}'");
  }
  mysqli_free_result($retval);
}

function quita_objeto($jug, $obj, $idob, $canti = 1)
{
  global $conftp;
  $retval = db_query("SELECT cantidad FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='{$obj}'");
  if (mysqli_num_rows($retval)) {
    $ret = mysqli_fetch_row($retval);
    if ($ret[0] <= $canti) {
      db_query("UPDATE jugadores SET insignia='none' WHERE nombrejug='{$jug}' AND insignia='{$idob}'");
      db_query("DELETE FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='{$obj}'");
    } else {
      $cantidad = $ret[0] - $canti;
      db_query("UPDATE tiene SET cantidad={$cantidad} WHERE nombrejug='{$jug}' AND nombreobj='{$obj}'");
    }
  }
  mysqli_free_result($retval);
}

function sumapuntos($jug)
{
  global $confobj, $confnivel, $conftp, $time, $imgroot, $conffacobj;
  $cambiopuntos = 1;
  //db_lock("jugadores WRITE,mensajes WRITE,tiene WRITE,objetos READ,aprendido READ");
  while ($cambiopuntos) {
    $cambiopuntos = 0;

    $retval = db_query("SELECT puntos,nivel,puntosnivel,puntosobjeto,puntossuma FROM jugadores WHERE puntossuma<>0 AND nombrejug='{$jug}' ORDER BY login DESC LIMIT 0,20");
    $numrows = mysqli_num_rows($retval);
    if ($numrows > 0) {
      $mens = '';
      $ret = mysqli_fetch_row($retval);
      $njug = $jug;
      $puntos = $ret[0] + $ret[4];
      $puntossuma = 0;
      $nivel = $ret[1];
      $ultimossubio = $ret[2];
      $ultimosobjeto = $ret[3];

      $nganaobjetos = floor(($puntos - $ultimosobjeto) / $confobj);
      $ultimosobjeto = $ultimosobjeto + $nganaobjetos * $confobj;

      $retvab = db_query("SELECT resultado FROM aprendido WHERE nombrejug='{$njug}'");
      $nrb = mysqli_num_rows($retvab);
      $sabe = array();
      for ($nni = 0; $nni < $nrb; $nni++) {
        $xen = mysqli_fetch_row($retvab);
        $sabe[$nni] = $xen[0];
      }

      mysqli_free_result($retvab);

      if ($nganaobjetos < 0)
        $nganaobjetos = 0;
      if ($nganaobjetos > 0) {
        $mens .= "Has encontrado:<br/><br/>";
        $retval2 = db_query("SELECT nombreobj,posibilidad,img,tipo,ataq,prot,puntosencontrar,niveluso,usos FROM objetos WHERE nivelencontrar<={$nivel} AND nivelencontrar>0 ORDER BY posibilidad DESC");
        $maxpos = 0;
        $numrows2 = mysqli_num_rows($retval2);
        $reta = array();
        for ($y = 0; $y < $numrows2; $y++) {
          $reta[$y] = mysqli_fetch_row($retval2);
          $maxpos += $reta[$y][1];
        }
        if ($maxpos == 0)
          $nganaobjetos = 0;
        mysqli_free_result($retval2);
      }
      for ($x = 0; $x < $nganaobjetos; $x++) {
        $azar = rand(1, $maxpos) - $reta[0][1];
        $nuevo = 0;
        while ($azar > 0) {
          $nuevo++;
          $azar = $azar - $reta[$nuevo][1];
        }
        dale_objeto($njug, $reta[$nuevo][0]);

        if (isWeekend() && $conffacobj == 1.05) $reta[$nuevo][6] = floor($reta[$nuevo][6] * 1.05);
        if ($conffacobj != 1.05) $reta[$nuevo][6] = floor($reta[$nuevo][6] * $conffacobj);

        if ($reta[$nuevo][8] <= 1) {
          if ($reta[$nuevo][8])
            $usos = ' / UN SOLO USO';
          else
            $usos = '';
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (Ataque: {$reta[$nuevo][4]} / Protección: {$reta[$nuevo][5]} / Nivel: {$reta[$nuevo][7]}{$usos}) (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 2) {
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (Energía: +{$reta[$nuevo][5]} / UN SOLO USO) (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 3) {
          $aprendido = '';
          $esaprendido = 0;
          for ($ba = 0; $ba < $nrb; $ba++) {
            if ($sabe[$ba] == $reta[$nuevo][0]) {
              $aprendido = ' / APRENDIDO';
              $esaprendido = 1;
            }
          }

          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (Energía: -{$reta[$nuevo][4]} / UN SOLO USO{$aprendido}) (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 4) {
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 5) {
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (consumir para obtener 1 semana premium) (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 6) {
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (MASCOTA) (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 7) {
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (Energía: -{$reta[$nuevo][4]} / MAPA) (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        } else if ($reta[$nuevo][8] == 8) {
          $mens .= "<div class=\"item\"><img src=\"{$imgroot}img/{$reta[$nuevo][2]}.gif\" alt=\"{$reta[$nuevo][3]}\"/> {$reta[$nuevo][0]} (experiencia +{$reta[$nuevo][6]}).</div><br/>";
        }

        $puntossuma = $puntossuma + $reta[$nuevo][6];
        $ultimosobjeto = $ultimosobjeto + $reta[$nuevo][6];
        if ($reta[$nuevo][6] != 0)
          $cambiopuntos = 1;
      }
      if ($mens == "Has encontrado:<br/><br/>")
        $mens = '';
      while ($puntos >= expsignivel($nivel, $ultimossubio)) {
        $ultimossubio = $ultimossubio + $nivel * $confnivel;
        $nivel++;
        $mens .= "Enhorabuena, has subido hasta el nivel {$nivel}!<br/><br/>";
      }

      if (($mens != "Has encontrado:<br/><br/>") && ($mens != '')) {
        $retvalgg = db_query("SELECT idmensaje,mensaje FROM mensajes WHERE nombrejug='{$njug}' AND remitente='@' AND visto=0 ORDER by idmensaje DESC LIMIT 0,1");
        if (mysqli_num_rows($retvalgg)) {
          $ret = mysqli_fetch_row($retvalgg);
          db_query("UPDATE mensajes SET mensaje='{$ret[1]}<br/><br/>{$mens}' WHERE idmensaje={$ret[0]}");
        } else
          db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$njug}','@',{$time},'{$mens}')");
        mysqli_free_result($retvalgg);
      }
      include_once 'auxiliar/f_logros.php';
      for ($k = 34; $k < 42; $k++)
        check_logro($k, $jug);

      db_query("UPDATE jugadores SET puntos={$puntos},nivel={$nivel},puntosnivel={$ultimossubio},puntosobjeto={$ultimosobjeto},puntossuma={$puntossuma} WHERE nombrejug='{$njug}'");
    }
    mysqli_free_result($retval);
  }
  //db_unlock();
}

function sumapuntosMonster()
{
  global $confobj, $confnivel, $conftp, $time, $imgroot;
  $cambiopuntos = 1;
  //db_lock("jugadores WRITE,mensajes WRITE,tiene WRITE,objetos READ,aprendido READ");
  while ($cambiopuntos) {
    $cambiopuntos = 0;

    $retval = db_query("SELECT nombrejug,puntos,nivel,puntosnivel,puntosobjeto,puntossuma FROM jugadores WHERE puntossuma<>0 ORDER BY login DESC LIMIT 0,20");
    $numrows = mysqli_num_rows($retval);
    for ($i = 0; $i < $numrows; $i++) {
      $mens = '';
      $ret = mysqli_fetch_row($retval);
      $njug = $ret[0];
      $puntos = $ret[1] + $ret[5];
      $puntossuma = 0;
      $nivel = $ret[2];
      $ultimossubio = $ret[3];
      $ultimosobjeto = $ret[4];

      $nganaobjetos = floor(($puntos - $ultimosobjeto) / $confobj);
      $ultimosobjeto = $ultimosobjeto + $nganaobjetos * $confobj;

      $retvab = db_query("SELECT resultado FROM aprendido WHERE nombrejug='{$njug}'");
      $nrb = mysqli_num_rows($retvab);
      $sabe = array();
      for ($nni = 0; $nni < $nrb; $nni++) {
        $xen = mysqli_fetch_row($retvab);
        $sabe[$nni] = $xen[0];
      }

      mysqli_free_result($retvab);

      $nganaobjetos = 0;

      while ($puntos >= expsignivel($nivel, $ultimossubio)) {
        $ultimossubio = $ultimossubio + $nivel * $confnivel;
        $nivel++;
        $mens .= "Enhorabuena, has subido hasta el nivel {$nivel}!<br/><br/>";
      }

      if (($mens != "Has encontrado:<br/><br/>") && ($mens != '')) {
        $retvalgg = db_query("SELECT idmensaje,mensaje FROM mensajes WHERE nombrejug='{$njug}' AND remitente='@' AND visto=0 ORDER by idmensaje DESC LIMIT 0,1");
        if (mysqli_num_rows($retvalgg)) {
          $ret = mysqli_fetch_row($retvalgg);
          db_query("UPDATE mensajes SET mensaje='{$ret[1]}<br/><br/>{$mens}' WHERE idmensaje={$ret[0]}");
        } else
          db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$njug}','@',{$time},'{$mens}')");
        mysqli_free_result($retvalgg);
      }

      db_query("UPDATE jugadores SET puntos={$puntos},nivel={$nivel},puntosnivel={$ultimossubio},puntosobjeto={$ultimosobjeto},puntossuma={$puntossuma} WHERE nombrejug='{$njug}'");
    }
    mysqli_free_result($retval);
  }
  //db_unlock();
}

function isAdmin($jug)
{
  global $conftp;
  //db_lock("jugadores READ");
  $retval = db_query("SELECT admin FROM jugadores WHERE nombrejug='{$jug}'");
  //db_unlock();
  $ret = mysqli_fetch_row($retval);
  if (!$ret[0])
    return false;
  else
    return true;
}

function getDificultad($prob)
{
  if ($prob >= 60) {
    return '<font style="color: #007F0D;"><strong>Fácil</strong></font>';
  } else if ($prob >= 30) {
    return '<font style="color: #CC6D00;"><strong>Media</strong></font>';
  } else if ($prob >= 10) {
    return '<font style="color: #7F1000;"><strong>Difícil</strong></font>';
  } else {
    return '<font style="color: #7F0B49;"><strong>Muy difícil</strong></font>';
  }
}

function getRareza($prob)
{
  if ($prob >= 3000) {
    return '<font style="color: #007F0D;"><strong>Común</strong></font>';
  } else if ($prob >= 1000) {
    return '<font style="color: #CC6D00;"><strong>Poco común</strong></font>';
  } else if ($prob >= 500) {
    return '<font style="color: #7F1000;"><strong>Raro</strong></font>';
  } else if ($prob >= 100) {
    return '<font style="color: #2F0B49;"><strong>Muy raro</strong></font>';
  } else {
    return '<font style="color: #200BD9;"><strong>Épico</strong></font>';
  }
}

function haySorteosActivos()
{
  global $conftp, $time;
  $retval = db_query("SELECT * FROM sorteos WHERE fechalimite >= {$time} AND ganador = ''");
  $num = mysqli_num_rows($retval);
  if ($num > 0)
    return true;
  else
    return false;
}

function dale_oro($jug, $canti = 0)
{
  global $conftp;
  db_query("UPDATE jugadores SET oro=oro+{$canti} WHERE nombrejug='{$jug}'");
}

function getEnergiaMax($us)
{
  $enermax = 100 + $us['nivel'] * 10;
  if ($us['espremium'])
    $enermax = $enermax * 2;
  return $enermax + $us['enerext'];
}

function getMaxAumento($lvl)
{
  return (1 * $lvl) + (10 * floor($lvl / 10)) + (25 * floor($lvl / 25)) + (100 * floor($lvl / 50)) + (500 * floor($lvl / 75));
}


function getCristalEner($ener)
{
  if ($ener <= 10) {
    return "<strong style=\"color: #7F2A24\">+{$ener}</strong>";
  } else if ($ener <= 25) {
    return "<strong style=\"color: #0084f2\">+{$ener}</strong>";
  } else if ($ener <= 50) {
    return "<strong style=\"color: #580084\">+{$ener}</strong>";
  }
}

function getName($jug, $bold = 0)
{
  $name = $jug;
  $query = db_query("SELECT descripcion, color, estilo, fondo, sombra, posicion, borde FROM tienetitulos as tie JOIN titulos as ti ON (tie.id=ti.id) WHERE tie.nombrejug='{$jug}' AND usado=1");
  $num = mysqli_num_rows($query);
  if ($num > 0) {
    $val = mysqli_fetch_array($query);
    $name = ($val[5] == 0 ? $val[0] . ' ' . $jug : $jug . $val[0]);
    $name = '<span style="border: ' . $val[6] . '; color: ' . $val[1] . '; font-weight:' . $val[2] . '; background-color: ' . $val[3] . '; ' . ($val[4] == 1 ? 'text-shadow: 2px 2px #444444; ' : '') . 'padding: 2px;font-family: verdana; border-radius: 5px;">' . $name . '</span>';
  } else if ($bold != 0) {
    $name = '<b>' . $name . '</b>';
  }
  return $name;
}

function finTrabajo($jug)
{
  global $time;
  $retval = db_query("SELECT trabajando,fintrabajo FROM jugadores WHERE nombrejug='{$jug}'");
  $ret = mysqli_fetch_row($retval);
  if (!($ret[0] == 0) && ($ret[1] < $time) && $ret[1] - $time <= 0) return ' *';
  else return '';
}

function get_titulo($id)
{
  $rettitu = db_query("SELECT descripcion, color, estilo, sombra, fondo FROM titulos WHERE id={$id}");
  $val = mysqli_fetch_row($rettitu);
  $texto = '<span style="border: 2px solid #AAAAAA; color: ' . $val[1] . '; font-weight:' . $val[2] . '; 
	background-color: ' . $val[4] . ';' . ($val[3] == 1 ? 'text-shadow: 2px 2px #444444;' : '') . ' padding: 2px;font-family: verdana; border-radius: 5px;">' . $val[0] . '</span>';
  return $texto;
}

function get_objeto_xilok($jug)
{
  global $imgroot;
  $num = rand(1, 100);
  if ($num == 1) {
    $items = array();
    $query = db_query("SELECT nombreobj FROM tiene WHERE nombrejug='Xilok' AND usado=1");
    $numrows = mysqli_num_rows($query);
    for ($i = 0; $i < $numrows; $i++) {
      $itm = mysqli_fetch_row($query);
      array_push($items, $itm[0]);
    }
    $query = db_query("SELECT nombremascota FROM tienemascotas WHERE nombrejug='Xilok' AND usado=1");
    $numrows = mysqli_num_rows($query);
    for ($i = 0; $i < $numrows; $i++) {
      $itm = mysqli_fetch_row($query);
      array_push($items, $itm[0]);
    }
    shuffle($items);
    dale_objeto($jug, $items[0]);
    $query = db_query("SELECT img FROM objetos WHERE nombreobj='{$items[0]}'");
    $img = mysqli_fetch_row($query);
    mysqli_free_result($query);
    return '<br/><b>Toma, quédate esto, ahora vete y no vuelvas.</b></br></br><i>Has conseguido </i> <b><img src="' . $imgroot . 'img/' . $img[0] . '.gif" alt="' . $items[0] . '"/> ' . $items[0] . '</b>';
  } else {
    return '';
  }
}

function isWeekend()
{
  return (date("l") == 'Sunday' || date("l") == 'Saturday' ? true : false);
}

function thereAreVotes()
{
  $query = db_query("SELECT COUNT(*) FROM votacion WHERE mostrar=1");
  $getval = mysqli_fetch_row($query);
  return $getval[0] != 0 ? true : false;
}

function mkform($path, $content, $formId, $method='post', $file = false){
	$form = "<form action=\"{$path}\" method=\"{$method}\" id=\"form{$formId}\"";
	if ($file) {
		$form .= ' enctype="multipart/form-data"';
	}
	$form .= ">{$content}</form>";
	return $form;
}

function postEmail($fromEmail, $toEmail, $subject, $filePath){
	db_query("INSERT INTO lifoes_especial.emails(`from`, `to`, `subject`, `email`) VALUES ('{$fromEmail}','{$toEmail}','{$subject}','{$filePath}')");
}

function template($filepath, $array){
	try {
		$templateFile = fopen($filepath, "r") or die("Unable to open file!");
		$content = fread($templateFile, filesize($filepath));
		fclose($templateFile);
		
		foreach ($array as $key => $value){
			$content = str_replace('[['.$key.']]', $value, $content);
		}
	} catch (Exception $e){
		$content = "Error: ".$e->getMessage();
	}
	
	return $content;
}

function getEquip($jug){
  $jugquery = db_query("SELECT SUM(ob.ataq), SUM(ob.prot) FROM `objetos` as ob JOIN `tiene` as ti ON(ob.nombreobj=ti.nombreobj) WHERE ti.nombrejug='{$jug}' and ti.usado=1");
  $info = mysqli_fetch_row($jugquery);
  return $info[0]+$info[1];
}

/**
 * return [ataque, proteccion, vida];
 */
function stats($user){
  global $confvidabase, $confvidanivel;
  $retval = db_query("SELECT oro,puntossuma,puntos,nivel,combates,vencedor,vencido,insignia,clan,premiumhasta,energia,moderador,enchufado FROM jugadores WHERE nombrejug='{$user}'");
  $ret = mysqli_fetch_row($retval);

  $juga['nivel'] = $ret[3];

  $retval = db_query("SELECT SUM(ob.ataq), SUM(ob.prot), SUM(ob.vida)  FROM `objetos` AS ob JOIN `tiene` AS ti ON (ob.nombreobj=ti.nombreobj AND ti.nombrejug='{$user}') WHERE ti.usado=1");
  $ret = mysqli_fetch_row($retval);
  $juga['ataq'] = 0 + $ret[0] + 10 + floor($juga['nivel'] / 3);
  $juga['prot'] = 0 + $ret[1] + 10 + floor($juga['nivel'] / 10);
  $juga['vida'] = 0 + $ret[2] + $confvidabase + $juga['nivel'] * $confvidanivel;
  $juga['ataqprotinvent'] = 0 + $ret[0] + $ret[1];
  mysqli_free_result($retval);
  $juga['ataqmascota'] = 0;
  $juga['protmascota'] = 0;
  $juga['vidamascota'] = 0;

  $retvox = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,ataquenivel,defensanivel,expbase,expmult,expgana,maxnivel,usado,expgana,tienemascotas.apodo,vidabase,vidanivel FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$user}' AND usado=1");
  if (mysqli_num_rows($retvox)) {
    $rrr = mysqli_fetch_row($retvox);
    $juga['mascota'] = $rrr[1];
    $juga['expmascota'] = $rrr[14];
    $juga['nombremascota'] = $rrr[0];
    $juga['ataqmascota'] = $rrr[5] + ($rrr[7] * ($rrr[2] - 1));
    $juga['protmascota'] = $rrr[6] + ($rrr[8] * ($rrr[2] - 1));
    $juga['vidamascota'] = $rrr[16] + ($rrr[17] * ($rrr[2] - 1));
    $juga['apodomascota'] =  $rrr[15];
  } else {
    $juga['mascota'] = '';
    $juga['expmascota'] = 0;
    $juga['nombremascota'] = '';
    $juga['ataqmascota'] = 0;
    $juga['protmascota'] = 0;
    $juga['vidamascota'] = 0;
    $juga['apodomascota'] = '';
  }
  $stats = [0,0,0];
  $stats[0] = $juga['ataq'] + $juga['ataqmascota'];
  $stats[1] = $juga['prot'] + $juga['protmascota'];
  $stats[2] = $juga['vida'] + $juga['vidamascota'];
  mysqli_free_result($retvox);
  
  $retvalench = db_query(
	"SELECT SUM(encantamientos.ataq), SUM(encantamientos.prot), SUM(encantamientos.vida)
	  FROM tiene JOIN objetos ON (tiene.nombreobj=objetos.nombreobj AND tiene.nombrejug='{$user}') LEFT JOIN encantamientos ON (tiene.encantamiento=encantamientos.id)
		WHERE tiene.usado=1
		ORDER BY objetos.tipo ASC,objetos.ataq+objetos.prot DESC,objetos.posibilidad ASC,objetos.niveluso DESC,objetos.nombreobj ASC"
  );
  $enc=mysqli_fetch_row($retvalench);
  $stats[0]+=$enc[0];
  $stats[1]+=$enc[1];
  $stats[2]+=$enc[2];
  return $stats;
}