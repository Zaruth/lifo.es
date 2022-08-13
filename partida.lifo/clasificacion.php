<?php
include('core.php');
function iweb() {
  global $jug,$ident,$confalredhigh,$confalredchigh,$conftp,$us,$imgroot;

  techo('Desde la clasificación puedes ver las características de los diez mejores jugadores y tu puesto en la clasificación general al final de la lista, si no formas parte de los diez mejores. También podrás ver la clasificación de los clanes.');
  db_lock("jugadores READ,claninsignia READ");
  $retval = db_query("SELECT nombrejug,nivel,puntos,trabajado,insignia,combates,vencedor,clan FROM jugadores ORDER BY puntos DESC,trabajado DESC,nombrejug ASC LIMIT 10");
  $retval2 = db_query("SELECT COUNT(*) FROM jugadores");
  db_unlock();
  $ret2 = mysqli_fetch_row($retval2);
  mysqli_free_result($retval2);
  $tot = $ret2[0];
  echo '<table class="highscores"><tr><th>Puesto</th><th>Experiencia</th><th>Insig.</th><th>Nombre</th><th>Ins. clan</th><th>Clan</th><th>Nivel</th><th>Trabajado</th><th>Combates ganados/totales</th></tr>';
  $numrows = mysqli_num_rows($retval);
  $mostrado = 0;
  $posjug = 0;
  for ($i = 1;$i<=$numrows;$i++) {
    $ret = mysqli_fetch_row($retval);
    $insigniac = "<img src=\"{$imgroot}noneu.gif\" alt=\"sin insignia\"/>";
    if ($ret[7] != '(ninguno)') {
      db_lock("claninsignia READ");
      $retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[7]}'");
      db_unlock();
      if (mysqli_num_rows($retvalic) == 1) {
        $retic = mysqli_fetch_row($retvalic);
        $insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
      }
      mysqli_free_result($retvalic);
    }
    $tiempo = ahora_tiempo($ret[3]);
    $insignia = "<img src=\"{$imgroot}{$ret[4]}.gif\" alt=\"insignia\"/>";
    $clan = $ret[7];
    if ($clan == '(ninguno)')
      $clan = '';

    if ($ret[0] == $jug) {
      echo "<tr><td class=\"jugador\">{$i}</td><td class=\"jugador\"><b>{$ret[2]}</b></td><td class=\"jugador\">".getInsigniaJug($ret[0])."</td><td class=\"jugador\">{$ret[0]}</td><td class=\"jugador\">{$insigniac}</td><td class=\"jugador\">{$clan}</td><td class=\"jugador\">{$ret[1]}</td><td class=\"jugador\">{$tiempo}</td><td class=\"jugador\">{$ret[6]}/{$ret[5]}</td></tr>\n";
      $mostrado = 1;
      $posjug = $i;
    }
    else
      echo "<tr><td>{$i}</td><td><b>{$ret[2]}</b></td><td>".getInsigniaJug($ret[0])."</td><td>{$ret[0]}</td><td>{$insigniac}</td><td>{$clan}</td><td>{$ret[1]}</td><td>{$tiempo}</td><td>{$ret[6]}/{$ret[5]}</td></tr>";
  }
  mysqli_free_result($retval);

  if (((!$mostrado) || ($posjug >= 10-$confalredhigh)) && ($ident)) {
    db_lock("jugadores READ");
    $retval3 = db_query("SELECT COUNT(*) FROM jugadores WHERE puntos>{$us['puntos']} OR (puntos={$us['puntos']} AND trabajado>{$us['trabajado']}) OR (puntos={$us['puntos']} AND trabajado={$us['trabajado']} AND nombrejug<'{$jug}')");
    $ret2 = mysqli_fetch_row($retval3);
    mysqli_free_result($retval3);
    $min = $ret2[0]-$confalredhigh;
    $max = $ret2[0]+$confalredhigh;
    if ($min < 10)
      $min = 10;
    if ($max > $tot-1)
      $max = $tot-1;
    $maxdif = $max-$min+1;
	if($maxdif < 0) $maxdif = 0;
    $retval = db_query("
	SELECT nombrejug,nivel,puntos,trabajado,insignia,combates,vencedor,clan 
		FROM jugadores ORDER BY puntos DESC,trabajado DESC,nombrejug ASC LIMIT {$min},{$maxdif}");
    db_unlock();
    if ($min != 10)
      echo '<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>';
    $numrows = mysqli_num_rows($retval);
    $mostrado = 0;
    for ($i = $min+1;$i<=$max+1;$i++) {
      $ret = mysqli_fetch_row($retval);
      $tiempo = ahora_tiempo($ret[3]);
      $insigniac = "<img src=\"{$imgroot}noneu.gif\" alt=\"sin insignia\"/>";
      if ($ret[7] != '(ninguno)') {
        db_lock("claninsignia READ");
        $retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[7]}'");
        db_unlock();
        if (mysqli_num_rows($retvalic) == 1) {
          $retic = mysqli_fetch_row($retvalic);
          $insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
        }
        mysqli_free_result($retvalic);
      }
      $clan = $ret[7];
      if ($clan == '(ninguno)')
        $clan = '';

      $insignia = "<img src=\"{$imgroot}{$ret[4]}.gif\" alt=\"insignia\"/>";
      if ($ret[0] == $jug) {
        echo "<tr><td class=\"jugador\">{$i}</td><td class=\"jugador\"><b>{$ret[2]}</b></td><td class=\"jugador\">".getInsigniaJug($ret[0])."</td><td class=\"jugador\">{$ret[0]}</td><td class=\"jugador\">{$insigniac}</td><td class=\"jugador\">{$clan}</td><td class=\"jugador\">{$ret[1]}</td><td class=\"jugador\">{$tiempo}</td><td class=\"jugador\">{$ret[6]}/{$ret[5]}</td></tr>\n";
        $mostrado = 1;
      }
      else
        echo "<tr><td>{$i}</td><td><b>{$ret[2]}</b></td><td>".getInsigniaJug($ret[0])."</td><td>{$ret[0]}</td><td>{$insigniac}</td><td>{$clan}</td><td>{$ret[1]}</td><td>{$tiempo}</td><td>{$ret[6]}/{$ret[5]}</td></tr>";
    }
    mysqli_free_result($retval);
  }

  echo '</table><br/><br/>';

  techo('Formar parte de un clan te dará poder y protección. Aquí podrás ver la clasificación de los clanes y el puesto de tu clan en la misma.');

  db_lock("jugadores READ,clandata READ");
  $retval = db_query("SELECT clan,SUM(puntos) a,0,SUM(vencedor) v,SUM(combates),COUNT(*) FROM jugadores WHERE jugadores.clan<>'(ninguno)' && clan != 'Administracion' GROUP BY clan ORDER BY a DESC,v DESC,clan DESC");
  $retvall = db_query("SELECT clan,nombrejug FROM clandata WHERE lider=1 && clan != 'Administracion'");
  db_unlock();

  $tot = mysqli_num_rows($retval);
  $totl = mysqli_num_rows($retvall);

  echo "<b>Número total de clanes: {$tot}</b>";
  if ($tot) {
  echo '<table class="highscores"><tr><th>Puesto</th><th>Experiencia total</th><th>Insig.</th><th>Nombre del clan</th><th>Lider</th><th>Miembros</th><th>Combates ganados/totales</th></tr>';
  
  $mostrado = 0;
  $posjug = 0;
  $show = 10;
  if ($tot < 10)
    $show = $tot;
  for ($i = 1;$i<=$tot;$i++) {
    $ret = mysqli_fetch_row($retval);
    if ($ret[0] == $us['clan'])
      $posjug = $i;
  }
  if ($tot)
    mysqli_data_seek($retval,0);
  $blank = 0;
  $blanked = 0;
  for ($i = 1;$i<=$tot;$i++) {
    $ret = mysqli_fetch_row($retval);
    if (($i <= 10) || (($i >= $posjug-$confalredchigh) && ($i <= $posjug+$confalredchigh))) {
      if (mysqli_num_rows($retvall) != 0) {
        mysqli_data_seek($retvall,0);
        $lider = '';
        for ($hhh = 0;$hhh < $totl;$hhh++) {
          $reti = mysqli_fetch_row($retvall);
          if ($reti[0] == $ret[0]) {
            $lider = $reti[1];
            $hhh = $totl;
          }
        }
      }
      else
        $lider = '';
      if (($blank) && (!$blanked)) {
        $blanked = 1;
        echo '<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>';
      }
      $insignia = "<img src=\"{$imgroot}noneu.gif\" alt=\"sin insignia\"/>";
      db_lock("claninsignia READ");
      $retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[0]}'");
      db_unlock();
      if (mysqli_num_rows($retvalic) == 1) {
        $retic = mysqli_fetch_row($retvalic);
        $insignia = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
      }
      mysqli_free_result($retvalic);

      if ($ret[0] == $us['clan'])
        echo "<tr><td class=\"jugador\">{$i}</td><td class=\"jugador\"><b>{$ret[1]}</b></td><td class=\"jugador\">{$insignia}</td><td class=\"jugador\">{$ret[0]}</td><td class=\"jugador\">{$lider}</td><td class=\"jugador\">{$ret[5]}</td><td class=\"jugador\">{$ret[3]}/{$ret[4]}</td></tr>\n";
      else
        echo "<tr><td>{$i}</td><td><b>{$ret[1]}</b></td><td>{$insignia}</td><td>{$ret[0]}</td><td>{$lider}</td><td>{$ret[5]}</td><td>{$ret[3]}/{$ret[4]}</td></tr>";
    }
    else if ($i > 5)
      $blank = 1;
  }
  }
  mysqli_free_result($retval);
  mysqli_free_result($retvall);
  echo '</table>';

}
?>
