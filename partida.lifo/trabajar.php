<?php
$form = 1;
$nosetact = 1;
include('core.php');
function iweb() {
  global $tag,$time,$us,$confencobjbase,$confencobjeven;
  if (($us['trabajando'] == 0) && ($us['fintrabajo'] < $time)) {
    if ($us['tiempopremiumefectivo'] > 0)
      $retval = db_query("SELECT segundos,nombre FROM trabajos WHERE (premium=1 AND segundos<{$us['tiempopremiumefectivo']}+86400) OR (premium=0 AND segundos>={$us['tiempopremiumefectivo']}+86400) ORDER BY segundos ASC");
    else
      $retval = db_query("SELECT segundos,nombre FROM trabajos WHERE (premium=1 AND segundos<{$us['tiempopremiumefectivo']}) OR (premium=0 AND segundos>={$us['tiempopremiumefectivo']}) ORDER BY segundos ASC");
    $numrows = mysqli_num_rows($retval);
    techo('¡No todo es divertirse! Trabajando conseguirás experiencia y oro, y de vez en cuando subirás algún nivel o encontrarás algún objeto. Debes elegir un tiempo a trabajar, y pasado ese tiempo habrás ganado la experiencia y el oro indicado.');
    
    if (isWeekend() && $confencobjbase==$confencobjeven) echo '<b>Evento de fin de semana</b>: experiencia obtenida por encontrar objetos aumentada un <b>'.(($confencobjbase*100)-100).'%</b>.<br><br>';
    if (isWeekend() && $confencobjbase!=$confencobjeven) echo '<b>Evento</b>: experiencia obtenida por encontrar objetos aumentada un <b>'.(($confencobjeven*100)-100).'%</b>.<br><br>';
    
    
      
    echo '<form action="trabajar.php" method="post">';
    echo '<div>';
    echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
    echo '<select name="trabajo">';
    for ($i = 0;$i < $numrows;$i++) {
      $ret = mysqli_fetch_row($retval);
      echo "<option value=\"{$ret[0]}\">{$ret[1]}</option>";
    }
    echo '</select><input type="submit" value="Trabajar" name="trabajar"/>';
    echo '</div></form>';
    mysqli_free_result($retval);
  }
  else {
    $cuantonum = $us['fintrabajo']-$time;
    $cuanto = ahora_tiempo($cuantonum);
    $ran = pwdgen();
    techo('Ahora mismo estás trabajando. En cualquier momento puedes dejar de trabajar y ganarás oro y experiencia proporcional al tiempo que has trabajado y a lo que ibas a ganar. Recuerda, <b>¡no es necesario que permanezcas conectado ni con el ordenador encendido hasta acabar de trabajar!</b>');
    if ($cuantonum>0) {
      echo "Falta <span id=\"ca\">{$cuanto}</span> para que acabes de trabajar.<br/><br/>";
      echo "<script language=\"javascript\">
      //<![CDATA[
      inicia({$cuantonum});
      setTimeout(\"window.location.reload( false );\", 1200000 );
      //]]>
      </script>";
    } else echo "¡Trabajo completado!<br/><br/>";
      echo "<form action=\"trabajar.php\" method=\"post\"><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"r\" value=\"{$ran}\"/>";
    if ($cuantonum<=0) {
      echo "<input type=\"hidden\" name=\"fin\" value=\"si\"/><input type=\"submit\" name=\"dejartrab\" value=\"Recoger recompensas\"/></form><br/>";
    } else 
      echo "<input type=\"submit\" name=\"dejartrab\" value=\"Dejar de trabajar\"/></form><br/>";
  }
}
function procesaform() {
  global $_REQUEST,$tag,$jug,$time,$us,$confascension;
  if (isset($_REQUEST['dejartrab'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $adelante = 0;
        $retval = db_query("SELECT trabajando,fintrabajo,puntostrabajo,orotrabajo,ascension FROM jugadores WHERE nombrejug='{$jug}'");
        $ret = mysqli_fetch_row($retval);
        $ascensiones = $ret[4];
        mysqli_free_result($retval);
        if ($ret[0] != 0) {
          $thecho = $ret[0]-$ret[1]+$time;
          if($thecho>$ret[0]) 
            $thecho = $ret[0];
		      if ($time-$ret[1]>$ret[0])
			      $thecho = $ret[0];
		      if ($thecho < 0)
			      $thecho = 0;
          $tiempo = $time-1;
          
          $puntostrabajo = floor( ($ret[2]*$thecho/$ret[0]) * (1+(($confascension/100)*($ascensiones))));
          $orotrabajo = floor($ret[3]*$thecho/$ret[0]);
          db_query("UPDATE jugadores SET puntostrabajo={$puntostrabajo},orotrabajo={$orotrabajo},trabajopremium=0,fintrabajo={$tiempo},trabajando={$thecho} WHERE nombrejug='{$jug}'");
          $adelante = 1;
          if (isset($_REQUEST['fin'])) 
            $_SESSION['mensaje'] = 'Recompensas obtenidas.';
          else 
            $_SESSION['mensaje'] = 'Has dejado de trabajar.';
        }
        else
          $_SESSION['error'] = '¡Ya no estabas trabajando!';
        if ($adelante) {
          $retval = db_query("SELECT nombrejug,puntostrabajo,orotrabajo,oro,trabajando,trabajado,puntossuma,fintrabajo FROM jugadores WHERE fintrabajo<{$time} AND trabajando>0 AND nombrejug='{$jug}'");
          $numrows = mysqli_num_rows($retval);
          $trabajado = 0;
          $trabajando = 0;
          for ($i = 0;$i < $numrows;$i++) {
            $ret = mysqli_fetch_row($retval);
            $njug = $ret[0];
            $oro = $ret[2]+$ret[3];
            $trabajando = $ret[4];
            $trabajado = $ret[5]+$ret[4];
            $puntossuma = $ret[6]+$ret[1];
            if ($puntossuma > 0)
            $hacer = 1;
            $tiempo = ahora_tiempo($trabajando);
            db_query("UPDATE jugadores SET oro={$oro},puntossuma={$puntossuma},trabajado={$trabajado},trabajando=0,fintrabajo=0,puntostrabajo=0,orotrabajo=0 WHERE nombrejug='{$njug}'");
            if (db_affected())
            db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$njug}','@',$ret[7],'Has trabajado durante {$tiempo}.<br/>Has ganado {$ret[1]} puntos de experiencia y {$ret[2]} monedas de oro.')");
          }
          mysqli_free_result($retval);
          sumapuntos($jug);
          include_once 'auxiliar/f_logros.php';
          if ($trabajando/3600>=8 || $trabajado/3600>=24){
            check_logro_tseguido($jug, $trabajando);
          }
          check_logro(1,$jug);
          check_logro(2,$jug);
          check_logro(3,$jug);
          check_logro(4,$jug);
        }
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: trabajar.php');
    return 1;
  }  
  if (isset($_REQUEST['trabajar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['trabajo']))) {
      $gtag = $_REQUEST['tag'];
      $trabajo = $_REQUEST['trabajo'];
      if (($tag == $gtag) && (is_numeric($trabajo))) {
        //db_lock("jugadores READ");
        $retval = db_query("SELECT trabajando,premiumhasta FROM jugadores WHERE nombrejug='{$jug}'");
        //db_unlock();
        $ret = mysqli_fetch_row($retval);
        mysqli_free_result($retval);
        if ($ret[0] == 0) {
          //db_lock("trabajos READ");
          if ($us['tiempopremiumefectivo'])
            $retval2 = db_query("SELECT segundos,puntos,oro,premium FROM trabajos WHERE (premium=1 AND segundos<={$us['tiempopremiumefectivo']}+86400 AND segundos={$trabajo}) OR (premium=0 AND segundos={$trabajo}) ORDER BY segundos ASC");
          else
            $retval2 = db_query("SELECT segundos,puntos,oro,premium FROM trabajos WHERE (premium=1 AND segundos<={$us['tiempopremiumefectivo']} AND segundos={$trabajo}) OR (premium=0 AND segundos={$trabajo}) ORDER BY segundos ASC");
          //db_unlock();
          if (mysqli_num_rows($retval2)) {
            $ret = mysqli_fetch_row($retval2);
            $fintrabajo = $time+$ret[0];
            //db_lock("jugadores WRITE");
            db_query("UPDATE jugadores SET trabajando={$ret[0]},fintrabajo={$fintrabajo},puntostrabajo={$ret[1]},orotrabajo={$ret[2]},trabajopremium={$ret[3]} WHERE nombrejug='{$jug}'");
            //db_unlock();
	    $_SESSION['mensaje'] = 'Has empezado a trabajar.';
          }
          else
            $_SESSION['error'] = 'Cantidad de trabajo inválida o no tienes premium suficiente.';
          mysqli_free_result($retval2);
        }
        else
          $_SESSION['error'] = '¡Ya estabas trabajando!';
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: trabajar.php');
    return 1;
  }
}
