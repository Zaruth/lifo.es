<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $tag, $time, $conforonivelataca, $confdifnivel, $us, $confencobjbase, $confencobjeven;
  if (($us['oro'] >= $conforonivelataca * $us['nivel']) && ($us['protegidohasta'] < $time))
    echo '<b>Actualmente puedes ser atacado por otros jugadores.</b><br/><br/>';
  else
    echo '<b>Actualmente no puedes ser atacado por otros jugadores.</b><br/><br/>';
  if (($us['oro'] >= $conforonivelataca * $us['nivel']) && ($us['noatacarhasta'] < $time) && ($us['energia'] >= 5))
    $pat = 1;
  else
    $pat = 0;
  if (!$pat) {
    $pat_d = ahora_dia($us['noatacarhasta']);
    $pat_h = ahora_hora($us['noatacarhasta']);
    echo '¡Aun no puedes volver a atacar!<br/>';
    $oronec = $us['nivel'] * $conforonivelataca;
    if ($us['oro'] < $oronec)
      echo "Tienes sólo {$us['oro']} monedas de oro y necesitas {$oronec} para poder atacar.<br/>";
    if ($us['noatacarhasta'] >= $time)
      echo "Tienes que esperar hasta el {$pat_d} a las {$pat_h} para poder volver a atacar.<br/>";
    if ($us['energia'] < 5)
      echo "Necesitas tener al menos 5 puntos de energía para combatir.<br/>";
    return;
  }
  $min = $us['nivel'] - $confdifnivel;
  $max = $us['nivel'] + $confdifnivel;
  if ($min < 1)
    $min = 1;
  $retvol = db_query("SELECT jugadores.nombrejug,nivel,puntos,insignia,combates,vencedor,clan FROM jugadores WHERE oro>={$conforonivelataca}*nivel AND protegidohasta<{$time} AND nivel>={$min} AND nivel<={$max} AND nombrejug<>'{$jug}' AND (clan='(ninguno)' OR clan<>'{$us['clan']}') ORDER by puntos DESC LIMIT 6");
  techo('Así que te has decidido a atacar a alguien... ¡Genial! Combatiendo por las calles ganarás experiencia y mucho oro. Puedes elegir entre atacar a un viandante al azar (si cumple los requisitos para ser atacado), o atacar a un jugador de quien conozcas el nombre (si cumple los requisitos para ser atacado), o pelear contra tu propia sombra (cuidado, siempre será más fuerte que tú). Sólo puedes atacar una vez cada cierto tiempo, y el jugador atacado quedará protegido hasta que pase algún tiempo o hasta que él se decida a atacar. ¡Suerte!');

  if (isWeekend() && $confencobjbase == $confencobjeven) echo '<b>Evento de fin de semana</b>: experiencia obtenida por encontrar objetos aumentada un <b>' . (($confencobjbase * 100) - 100) . '%</b>.<br><br>';
  if (isWeekend() && $confencobjbase != $confencobjeven) echo '<b>Evento</b>: experiencia obtenida por encontrar objetos aumentada un <b>' . (($confencobjeven * 100) - 100) . '%</b>.<br><br>';

  echo "Tienes <b>{$us['energia']}</b> puntos de energía.<br/><br/>";

  $numsubs = mysqli_num_rows($retvol);
  if ($numsubs == 0 && $us['nivel'] >= 100) {
    $retvol = db_query("SELECT jugadores.nombrejug,nivel,puntos,insignia,combates,vencedor,clan FROM jugadores WHERE nombrejug='Xilok'");
    $numsubs = mysqli_num_rows($retvol);
  }
  echo 'Tienes una sola opción:<br/><br/>';
  echo '
	<table>
		<tr>
			<td style="padding-right:50px;">Puedes atacar a alguien al azar:</td>
		</tr>
	<tr>';
  if ($numsubs) {
    echo '<td>
				<form method="post" action="combate.php" id="atacaform">
				<div>
				<input type="hidden" name="tag" value="' . $tag . '" form="atacaform"/>
				<button type="submit" form="atacaform" name="atacaazar" onclick="return c()">
					Atacar a alguien al azar <span style="color:blue;">[normal]</span>
				</button>
				</div>
				</form>
			</td>';
  } else {
    echo '<td>
				<b>Ningún jugador cumple los requisitos<br>para ser atacado por ti actualmente.</b>	
			</td>';
  }
  echo '</tr>
	</table>
	<br/><br/>';
  mysqli_free_result($retvol);
}

function procesaform()
{
  global $_REQUEST, $tag, $jug, $time, $conforonivelataca, $confdifnivel;
  if (isset($_REQUEST['atacaazar'])) {
    $salirnow = 0;
    $otro = '';
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $adelante = 0;
        $retval = db_query("SELECT nivel,clan FROM jugadores WHERE nombrejug='{$jug}'");
        if (puedeatacar($jug)) {
          $ret = mysqli_fetch_row($retval);
          $min = $ret[0] - $confdifnivel;
          $max = $ret[0] + $confdifnivel;
          if ($min < 1)
            $min = 1;
          $retvalo = db_query("SELECT nombrejug FROM jugadores WHERE oro>={$conforonivelataca}*nivel AND protegidohasta<{$time} AND nivel>={$min} AND nivel<={$max} AND nombrejug<>'{$jug}' AND nombrejug<>'Xilok' AND (clan='(ninguno)' OR clan<>'{$ret[1]}')");
          $num = mysqli_num_rows($retvalo);
          if ($num) {
            mysqli_data_seek($retvalo, rand(0, $num - 1));
            $ret = mysqli_fetch_row($retvalo);
            $_SESSION['mensaje'] = 'Obtenidos resultados del combate.';
            combate($jug, $ret[0], 1);
            $otro = $ret[0];
            $adelante = 1;
            $salirnow = 1;
          } else
            $_SESSION['error'] = 'No has conseguido encontrar un contrincante.';
          mysqli_free_result($retvalo);
        } else
          $_SESSION['error'] = 'Ahora mismo no cumples los requisitos para atacar.';
        mysqli_free_result($retval);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    if ($salirnow) {
      header('Location: mensajeria.php');
      if ($otro != 'Xilok') {
        sumapuntos($jug);
        sumapuntos($otro);
        include_once 'auxiliar/f_logros.php';
        check_logro(9, $jug);
        check_logro(10, $jug);
        check_logro(11, $jug);
        check_logro(12, $jug);
        check_logro(9, $otro);
        check_logro(10, $otro);
        check_logro(11, $otro);
        check_logro(12, $otro);
      }
    } else
      header('Location: combate.php');
    return 1;
  }
}
