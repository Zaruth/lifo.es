<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $links, $time, $_REQUEST, $us, $confregistro, $imgroot, $tag, $nameJug, $confvidabase, $confvidanivel, $confascension;

  $preret = db_query("SELECT email,emailnuevo,emailnuevocambio FROM jugadores WHERE nombrejug='{$jug}'");
  $ret = mysqli_fetch_row($preret);
  if ($ret[1] != '') {
    if ($ret[2] < $time)
      echo '<p><font color="red"><b><blink>AVISO IMPORTANTE:</blink> Actualmente se está procesando <font color="green">Y PUEDES CONFIRMAR</font> un cambio de dirección de correo electrónico en tu cuenta. Si no lo has solicitado tú, puedes cancelarlo desde la sección <a href="micuenta.php">Mi Cuenta</a>.</b></font></p>';
    else
      echo '<p><font color="red"><b><blink>AVISO IMPORTANTE:</blink> Actualmente se está procesando un cambio de dirección de correo electrónico en tu cuenta. Si no lo has solicitado tú, puedes cancelarlo desde la sección <a href="micuenta.php">Mi Cuenta</a>. Si lo has solicitado tú, este aviso cambiará cuando puedas confirmar el cambio.</b></font></p>';
  } else if (preg_match('/(hotmail\.com$)|(msn\.com$)/', $ret[0]))
    echo '<p><font color="red"><b><blink>AVISO IMPORTANTE:</blink> Actualmente estás utilizando una dirección de correo electrónico de hotmail o similar. No se puede recuperar una contraseña utilizando una cuenta de hotmail (hotmail filtra los mails). Si no cambias tu cuenta de correo por una válida que no sea de hotmail desde la sección <a href="micuenta.php">Mi Cuenta</a> y olvidas o pierdes tu contraseña, no podrás recuperar nunca esta cuenta! Puedes conseguir una cuenta de correo gratuita en <a href="http://www.gmail.com" rel="external">GMail</a>.</b></font></p>';

  if (isset($_REQUEST['versub'])) {
    if (isset($_REQUEST['p']))
      $p = $_REQUEST['p'];
    else
      $p = 1;
    if (!is_numeric($p))
      $p = 1;
    if ($p < 1)
      $p = 1;

    $ini = ($p - 1) * 15;
    $fin = $p * 15;
    $retvol = db_query("SELECT jugadores.nombrejug,nivel,puntos,insignia,combates,vencedor,clan,ultimaact FROM jugadores WHERE padre='{$jug}' ORDER by puntos DESC LIMIT {$ini},15");
    $retvol2 = db_query("SELECT COUNT(*) FROM jugadores WHERE padre='{$jug}'");
    $ret2 = mysqli_fetch_row($retvol2);
    mysqli_free_result($retvol2);
    $numsubs = mysqli_num_rows($retvol);
    if ($numsubs) {
      echo '<b>Estos son tus subordinados:</b><br/>';
      echo '<table class="highscores"><tr><th>Estado</th><th>Puntos</th><th>Insig.</th><th>Nombre</th><th>Nivel</th><th>Clan</th><th>Combates ganados/totales</th></tr>';
      for ($tx = 0; $tx < $numsubs; $tx++) {
        $r = mysqli_fetch_row($retvol);
        $clan = $r[6];
        if ($time - $r[7] < 600)
          $est = '<img src="' . $imgroot . 'img/on1.png" alt="ONLINE"/>';
        else if ($time - $r[7] < 1800)
          $est = '<img src="' . $imgroot . 'img/on2.png" alt="POCA ACTIVIDAD"/>';
        else
          $est = '-';

        if ($r[6] == '(ninguno)')
          $clan = '&nbsp;';
        echo "<tr><td>{$est}</td><td>{$r[2]}</td><td><img src=\"{$imgroot}img/{$r[3]}.gif\" alt=\"insignia\"/></td><td>{$r[0]}</td><td>{$r[1]}</td><td>{$clan}</td><td>{$r[5]}/{$r[4]}</td>";
        echo "</tr>";
      }
      echo '</table><br/><br/><br/>';
    }
    mysqli_free_result($retvol);
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
          echo "<a href=\"estado.php?versub=1&amp;p={$i}\">{$i}</a> ";
        else
          echo "<b>{$i}</b> ";
      }
      if ($fin < $npag)
        echo '... ';
      echo '<br/><br/>';
    }
    echo '<a href="estado.php">Volver</a><br/>';
    return;
  }
  techo('Desde esta página puedes ver la información de tu personaje. Todas las estadísticas, el estado actual, y una serie de <b>links para reclutar</b> nuevos trabajadores. Puedes cambiar tu insignia desde el inventario, cuando tengas algún objeto.');

  $retval2 = db_query("SELECT SUM(ataq),SUM(prot),SUM(vida) FROM tiene,objetos WHERE usado=1 AND tiene.nombreobj=objetos.nombreobj AND nombrejug='{$jug}'");

  $ret2 = mysqli_fetch_row($retval2);
  mysqli_free_result($retval2);

  $dia = ahora_dia($us['creado']);
  $hora = ahora_hora($us['creado']);
  $expnext = expsignivel($us['nivel'], $us['puntosnivel']) - $us['puntos'];

  if ($us['fintrabajo']) {
    $dia_t = ahora_dia($us['fintrabajo']);
    $hora_t = ahora_hora($us['fintrabajo']);
    $trabajandohasta = "el {$dia_t} a las {$hora_t}";
  } else
    $trabajandohasta = '(no estás trabajando)';

  if ($us['protegidohasta'] >= $time) {
    $dia_p = ahora_dia($us['protegidohasta']);
    $hora_p = ahora_hora($us['protegidohasta']);
    $protegidohasta = "el {$dia_p} a las {$hora_p}";
  } else
    $protegidohasta = '(no estás protegido)';

  if ($us['nocomerhasta'] >= $time) {
    $dia_c = ahora_dia($us['nocomerhasta']);
    $hora_c = ahora_hora($us['nocomerhasta']);
    $nocomerhasta = "el {$dia_c} a las {$hora_c}";
  } else
    $nocomerhasta = '(puedes comer)';

  if ($us['noexplorarhasta'] >= $time) {
    $dia_c = ahora_dia($us['noexplorarhasta']);
    $hora_c = ahora_hora($us['noexplorarhasta']);
    $noexplorarhasta = "el {$dia_c} a las {$hora_c}";
  } else
    $noexplorarhasta = '(puedes explorar)';


  if ($us['noatacarhasta'] >= $time) {
    $dia_nt = ahora_dia($us['noatacarhasta']);
    $hora_nt = ahora_hora($us['noatacarhasta']);
    $noatacarhasta = "el {$dia_nt} a las {$hora_nt}";
  } else
    $noatacarhasta = '(puedes atacar si cumples los demás requisitos)';

  if ($us['noencuentrohasta'] >= $time) {
    $dia_nt = ahora_dia($us['noencuentrohasta']);
    $hora_nt = ahora_hora($us['noencuentrohasta']);
    $noencuentrohasta = "el {$dia_nt} a las {$hora_nt}";
  } else
    $noencuentrohasta = '(puedes realizar encuentros si cumples los demás requisitos)';

  $insignia = getInsigniaJug($jug);

  $tiempo = ahora_tiempo($us['trabajado']);
  $ataqb = 10 + floor($us['nivel'] / 3);
  $protb = 10 + floor($us['nivel'] / 10);
  $vidab = $confvidabase + $us['nivel'] * $confvidanivel;
  $ataqo = $ret2[0];
  $proto = $ret2[1];
  $vidao = $ret2[2];
  if (!$ataqo) $ataqo = 0;
  if (!$proto) $proto = 0;
  if (!$vidao) $vidao = 0;
  $ataq = $ataqo + $ataqb;
  $prot = $proto + $protb;
  $vida = $vidao + $vidab;
  $prem = '';
  if (($us['moderador']) || ($us['enchufado'])) {
    $prem = "<tr><td><b>Premium ilimitado.</b></td></tr>";
  } else if ($us['tiempopremium']) {
    $phdia = ahora_dia($us['premiumhasta']);
    $phhora = ahora_hora($us['premiumhasta']);
    $prem .= "<tr><td><b>Premium hasta:</b></td><td>el {$phdia} a las {$phhora}</td></tr>";
  } else {
    $prem .= '<tr><td><b>No eres premium.</b></td><td>';
  }
  if ($us['tiempopremium'] > 86400 * 7) {
    $prem .= "<tr><td></td><td><form action=\"fabricar.php\" method=\"post\">";
    $prem .= "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
    $prem .= "<input type=\"submit\" onclick=\"return c()\" name=\"joyapremiume\" value=\"Convertir una semana premium en una joya premium\"/>";
    $prem .= "</form></td></tr>";
  }

  $enermax = 100 + $us['nivel'] * 10;
  if ($us['espremium'])
    $enermax = $enermax * 2;
  $enermaxbase = $enermax;
  $enermaxsum = getMaxAumento($us['nivel']);
  $enermaxtot = $enermaxbase + $us['enerext'];
  $enermaxsum = "<strong style=\"color: #580084\">{$enermaxsum}</strong>";
  $enersumactual = "<strong style=\"color: #580084\">{$us['enerext']}</strong>";



  $rg1 = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,vidabase,ataquenivel,defensanivel,vidanivel,expbase,expmult,expgana,maxnivel,usado FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$jug}' AND usado=1");
  $rows = mysqli_num_rows($rg1);
  if ($rows == 0) {
    $mascataq = 0;
    $mascprot = 0;
    $mascvida = 0;
  } else {
    $rrr = mysqli_fetch_row($rg1);
    $rg2 = db_query("SELECT img FROM objetos WHERE nombreobj='{$rrr[4]}'");
    $rg3 = db_query("SELECT cantidad FROM tiene WHERE nombreobj='{$rrr[4]}' AND nombrejug='{$jug}'");
    if (mysqli_num_rows($rg3)) {
      $rrt = mysqli_fetch_row($rg3);
    } else
      $rrt[0] = 0;
    mysqli_free_result($rg2);
    mysqli_free_result($rg3);

    $mascataq = $rrr[5] + ($rrr[8] * ($rrr[2] - 1));
    $mascprot = $rrr[6] + ($rrr[9] * ($rrr[2] - 1));
    $mascvida = $rrr[7] + ($rrr[10] * ($rrr[2] - 1));
  }
  mysqli_free_result($rg1);

  $ataq = $ataq + $mascataq;
  $prot = $prot + $mascprot;
  $vida = $vida + $mascvida;

  include_once './auxiliar/f_encantamientos.php';
  $encantt = getStatsEncantamientos($jug);
  $ataqen = $encantt[0];
  $proten = $encantt[1];
  $vidaen = $encantt[2];

  $ataq += $ataqen;
  $prot += $proten;
  $vida += $vidaen;

  //SABIDURIA, ENCANTAMIENTO, ASCENSIONES
  $retvol = db_query("SELECT sabiduria, encantado, ascension FROM jugadores WHERE nombrejug='{$jug}'");
  $r = mysqli_fetch_row($retvol);
  $sabi = $r[0];
  $encant = $r[1];
  $ascen = $r[2];
  mysqli_free_result($retvol);
  //

  // Ascensión //
  $inputAscension = "";
  $ascJug = getAscensiones($jug);
  $puedeAsc = puedeascender($jug);

  $nivelascension = 0;
  switch (getAscensiones($jug)) {
    case 0:
      $nivelascension = 10;
      break;
    case 1:
      $nivelascension = 20;
      break;
    case 2:
      $nivelascension = 40;
      break;
    case 3:
      $nivelascension = 75;
      break;
    case 4:
      $nivelascension = 100;
      break;
  }
  $proxAscension = "Nivel necesario para próxima ascensión: <b>" . $nivelascension . "</b>";
  if ($puedeAsc) {
    $inputAscension = "<tr><td colspan=\"2\">
      <form action=\"estado.php\" method=\"post\">
      <input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
      <input type=\"submit\" name=\"ascender\" value=\"Desafío de ascensión\" alt=\"Desafío de ascensión\" title=\"Desafío de ascensión\" onclick=\"return c('¡Cuidado, tendrás que ganar una pelea difícil para ascender!')\">
      </form></td></tr>";
  } else {
    if ($ascJug == 5) {
      $proxAscension = "Has alcanzado el máximo de ascensiones posibles.<br><i>\"Tu poder transciende el plano de la realidad.\" - Viejo sabio";
    }
  }
  //

  echo "<table class=\"estado\">
<tr><td><b>Nombre del jugador:</b></td><td>{$nameJug}</td></tr>
<tr><td><b>Insignia:</b></td><td>{$insignia}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Jugando desde:</b></td><td>el {$dia} a las {$hora}</td></tr>
<tr><td><b>Tiempo trabajado:</b></td><td>{$tiempo}</td></tr>
{$prem}
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Combates totales:</b></td><td>{$us['combates']}</td></tr>
<tr><td><b>Combates ganados:</b></td><td>{$us['vencedor']}</td></tr>
<tr><td><b>Combates perdidos:</b></td><td>{$us['vencido']}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Trabajando hasta:</b></td><td>{$trabajandohasta}</td></tr>
<tr><td><b>Protegido hasta:</b></td><td>{$protegidohasta}</td></tr>
<tr><td><b>No puedes atacar hasta:</b></td><td>{$noatacarhasta}</td></tr>
<tr><td><b>No puedes relizar encuentros hasta:</b></td><td>{$noencuentrohasta}</td></tr>
<tr><td><b>No puedes comer hasta:</b></td><td>{$nocomerhasta}</td></tr>
<tr><td><b>No puedes explorar hasta:</b></td><td>{$noexplorarhasta}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Nivel:</b></td><td>{$us['nivel']}</td></tr>
<tr><td><b>Experiencia:</b></td><td>{$us['puntos']}</td></tr>
<tr><td><b>Experiencia para el siguiente nivel:</b></td><td>{$expnext}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Oro:</b></td><td>{$us['oro']}</td></tr>
<tr><td><b>Energía:</b></td><td>{$us['energia']} de {$enermaxtot} ({$enermaxbase} + {$enersumactual}/{$enermaxsum})</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Subordinados:</b></td><td>{$us['hijos']}</td></tr>
<tr><td><b>Subordinados de subordinados:</b></td><td>{$us['nietos']}</td></tr>
<tr><td><b>Jefe:</b></td><td>{$us['padre']}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td><b>Accesos a mis links de reclutar:</b></td><td>{$us['visitashijos']}</td></tr>
<tr><td><b>Accesos a links de reclutar<br/>de subordinados:</b></td><td>{$us['visitasnietos']}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td colspan=\"2\"><u>> Caract. Primarias <</u></td></tr>
<tr><td><b>Ataque (nivel):</b></td><td>{$ataqb}</td></tr>
<tr><td><b>Ataque (objetos en uso):</b></td><td>{$ataqo}</td></tr>
<tr><td><b class=\"txt_encantado\">Ataque (encantamientos):</b></td><td>{$ataqen}</td></tr>
<tr><td><b>Ataque (mascota):</b></td><td>{$mascataq}</td></tr>
<tr><td><b>Ataque (total):</b></td><td>{$ataq}</td></tr>
<tr><td colspan=\"2\"><hr align=\"left\" width=\"265px\"></tr>
<tr><td><b>Protección (nivel):</b></td><td>{$protb}</td></tr>
<tr><td><b>Protección (objetos en uso):</b></td><td>{$proto}</td></tr>
<tr><td><b class=\"txt_encantado\">Protección (encantamientos):</b></td><td>{$proten}</td></tr>
<tr><td><b>Protección (mascota):</b></td><td>{$mascprot}</td></tr>
<tr><td><b>Protección (total):</b></td><td>{$prot}</td></tr>
<tr><td colspan=\"2\"><hr align=\"left\" width=\"265px\"></tr>
<tr><td><b>Vida (nivel):</b></td><td>{$vidab}</td></tr>
<tr><td><b>Vida (objetos en uso):</b></td><td>{$vidao}</td></tr>
<tr><td><b class=\"txt_encantado\">Vida (encantamientos):</b></td><td>{$vidaen}</td></tr>
<tr><td><b>Vida (mascota):</b></td><td>{$mascvida}</td></tr>
<tr><td><b>Vida (total):</b></td><td>{$vida}</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td colspan=\"2\"><u>> Caract. Secundarias <</u></td></tr>
<tr><td><b>Sabiduría:</b></td><td>{$sabi}</td></tr>
<tr><td><b>Encantamientos exitosos:</b></td><td>{$encant}</td></tr>
<tr><td><b>Ascensiones:</b></td><td>{$ascen}</td></tr>
<tr><td colspan=\"2\"><b>[Bonus exp.] Trabajo: +" . ($ascen * $confascension) . "% || Combates: +" . ($ascen * $confascension) . "%</b></td></tr>
<tr><td colspan=\"2\">{$proxAscension}</td></tr>
{$inputAscension}
</table><br/><br/><br/>
";

  //

  echo '<a href="estado.php?versub=1">Ver lista de subordinados</a><br/><br/><br/>';
  if ($confregistro) {
    techo('Tienes una lista de links distintos para reclutar. Puedes utilizarlos para firmar en foros, en correos electrónicos, o para ponerlos en el nick de tu programa de mensajería instantanea favorito (es tu responsabilidad no hacer spam). Cuando un jugador entra a uno de esos links, le robas algunas monedas. Aparte, si se decide a registrarse en el juego, se convierte en tu subordinado y ganas unas cuantas monedas más.<br/><br/>Atento, ¡esto es muy importante! ¡Cuando una persona entra en un link de alguno de tus subordinados, sin que tú tengas que hacer nada, ganas unas pocas monedas, y si esa persona se acaba registrando, se convierte en subordinado de tu subordinado y ganas otras tantas monedas de oro!<br/><br/>Recuerda: Cualquiera de los links para reclutar hace exáctamente lo mismo, el nombre varía para que sea más fácil hacer que una persona cualquiera lo visite.');
    echo '<b>Estos son tus links para reclutar:</b><br/><br/>';
    $jugcif = '';
    for ($i = 0; $i < strlen($jug); $i++) {
      $jugcif .= '%' . strtoupper(dechex(ord($jug[$i])));
    }
    $lin = sizeof($links);
    for ($i = 0; $i < $lin; $i++)
      echo "{$links[$i]}{$jug}<br/>";
    $lin = sizeof($links);
    for ($i = 0; $i < $lin; $i++)
      echo "{$links[$i]}{$jugcif}<br/>";
    echo '<br/><br/>';
  } else {
    echo 'No se permiten más registros en esta partida, por lo que los links de registrar están cerrados.';
  }
}

function procesaform()
{
  global $jug, $tag, $time, $imgroot;
  if (isset($_POST['ascender'])) {
    $loc = 'estado.php';
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        try {
          $ascJug = getAscensiones($jug);
          $puedeAsc = puedeascender($jug);
          if ($ascJug < 5 && $puedeAsc) {
            include_once './auxiliar/f_encuentros.php';
            $nombremon = null;
            switch ($ascJug) {
              case 0:
                $nombremon = 'Caballero helado';
                break;
              case 1:
                $nombremon = 'Asesino de dragones';
                break;
              case 2:
                $nombremon = 'Gladiador de la arena';
                break;
              case 3:
                $nombremon = null;
                break;
              case 4:
                $nombremon = null;
                break;
            }
            $ganado = realizar_desafio($jug, $nombremon);
            if ($nombremon == null) {
              $_SESSION['error'] = 'Vaya, parece que aún no se puede realizar este desafío, vuelve más tarde.';
            } else if ($ganado == false) {
              $_SESSION['error'] = 'Has perdido el desafío, parece que tendrás que intentarlo cuando seas un poco más fuerte.';
              $loc = 'mensajeria.php?t=Encuentros';
            } else {
              $mens = '¡Has completado el desafío y has ascendido, Enhorabuena!<br>Ahora recibirás más experiencia trabajando y combatiendo.' . $nombremon;
              db_query("UPDATE jugadores SET ascension=ascension+1 WHERE nombrejug='{$jug}'");
              include_once 'auxiliar/f_logros.php';
              check_logro(55, $jug);
              check_logro(56, $jug);
              $_SESSION['mensaje'] = $mens;
              $loc = 'mensajeria.php?t=Encuentros';
            }
          } else {
            $_SESSION['error'] = 'Aún no puedes ascender.';
          }
        } catch (\Throwable $th) {
          $_SESSION['error'] = 'Error: ' . $th;
        }
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
      }
    }
    header('Location: ' . $loc);
    return 1;
  }
}
