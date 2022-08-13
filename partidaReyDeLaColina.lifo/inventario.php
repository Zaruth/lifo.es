<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $tag, $time, $us, $imgroot, $nameJug;
  techo('Desde el inventario puedes observar los objetos que tienes y decidir cuales usas. Puedes adoptar un objeto que tengas como insignia, de modo que todos tus combates, mensajes, y tu nombre en la clasificación serán firmados con la imagen de ese objeto.');
  include_once 'auxiliar/f_items.php';
  if (isset($_REQUEST['c'])) {
    $c = $_REQUEST['c'];
  } //Saca categoría si se pide

  if ($us['tiempopremium'] > 86400 * 7) {
    echo "<form action=\"fabricar.php\" method=\"post\">";
    echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
    echo "<input type=\"submit\" onclick=\"return c()\" name=\"joyapremiumi\" value=\"Convertir una semana premium en una joya premium\"/>";
    echo "</form><br/><br/>";
  }

  if (isset($c)) {
    if ($c == 'Trofeo')
      $c = 'Z-Esp';
    $retval2 = db_query(
      "SELECT objetos.*,tiene.cantidad, tiene.usado, tiene.encantamiento, encantamientos.niveluso AS enniveluso
      FROM tiene JOIN objetos ON (tiene.nombreobj=objetos.nombreobj AND tiene.nombrejug='{$jug}') LEFT JOIN encantamientos ON (tiene.encantamiento=encantamientos.id)
        WHERE objetos.tipo LIKE '%{$c}%' 
          ORDER BY objetos.tipo ASC,objetos.ataq+objetos.prot DESC,objetos.posibilidad ASC,objetos.niveluso DESC,objetos.nombreobj ASC"
    );
  } else {
    $retval2 = db_query(
      "SELECT objetos.*,tiene.cantidad, tiene.usado, tiene.encantamiento
        FROM tiene JOIN objetos ON (tiene.nombreobj=objetos.nombreobj AND tiene.nombrejug='{$jug}')
          ORDER BY objetos.tipo ASC,objetos.ataq+objetos.prot DESC,objetos.posibilidad ASC,objetos.niveluso DESC,objetos.nombreobj ASC"
    );
    $retvalench = db_query(
      "SELECT SUM(encantamientos.ataq), SUM(encantamientos.prot), SUM(encantamientos.vida)
        FROM tiene JOIN objetos ON (tiene.nombreobj=objetos.nombreobj AND tiene.nombrejug='{$jug}') LEFT JOIN encantamientos ON (tiene.encantamiento=encantamientos.id)
          WHERE tiene.usado=1
          ORDER BY objetos.tipo ASC,objetos.ataq+objetos.prot DESC,objetos.posibilidad ASC,objetos.niveluso DESC,objetos.nombreobj ASC"
    );

    $retvalcat = db_query(
      "SELECT DISTINCT(obj.tipo),obj.usos,(
    								SELECT ti2.usado
    									FROM tiene AS ti2 JOIN objetos AS obj2 ON (ti2.nombreobj=obj2.nombreobj) 
    										WHERE ti2.nombrejug='{$jug}' AND obj2.tipo=obj.tipo AND obj2.usos='0' AND obj2.niveluso<={$us['nivel']}
    											ORDER BY obj2.ataq+obj2.prot DESC, obj2.niveluso DESC, obj2.nombreobj ASC
    												LIMIT 1
									) AS usado
        FROM tiene AS ti JOIN objetos AS obj ON (ti.nombreobj=obj.nombreobj) 
            WHERE ti.nombrejug='{$jug}' 
                ORDER BY obj.tipo ASC"
    );
  }

  echo "Tienes <b>{$us['oro']}</b> monedas de oro.<br/><br/>";
  echo "Tienes <b>{$us['energia']}</b> puntos de energía.<br/><br/>";

  //TÍTULOS//
  echo '<br><b>Cambiar título: </b>';
  $retval = db_query("SELECT tie.id,ti.descripcion FROM tienetitulos as tie JOIN titulos as ti ON (tie.id=ti.id) WHERE tie.nombrejug='{$jug}'");
  $numrows = mysqli_num_rows($retval);
  if ($numrows > 0) {
    echo '<div><form action="inventario.php" method="post">
	<select name="idti">
	<option value="none">-- Sin título --</option>';
    for ($i = 0; $i < $numrows; $i++) {
      $ret = mysqli_fetch_row($retval);
      echo "<option value=\"{$ret[0]}\">{$ret[1]}</option>";
    }
    echo '</select><input type="submit" name="cambiarti" value="Cambiar titulo"/></form></div><br>';
  } else {
    echo 'No tienes títulos.<br/><br/>';
  }
  mysqli_free_result($retval);
  echo '<b>Título actual:</b> ' . $nameJug . '<br/><br/>';
  /////////

  echo '<b>Cambiar insignia:</b><br/>';
  echo "<form action=\"inventario.php\" method=\"post\">";
  echo '<div>';
  echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
  echo "<select name=\"idob\">";
  if ($us['insignia'] != 'none')
    echo "<option value=\"none#0\">-- Sin insignia --</option>";
  else
    echo "<option value=\"none#0\" selected>-- Sin insignia --</option>";

  $rg1 = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,ataquenivel,defensanivel,expbase,expmult,expgana,maxnivel,usado FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$jug}' ORDER BY usado DESC,nombremascota ASC");

  $sel = 0;
  $bumrows = mysqli_num_rows($rg1);
  for ($i = 0; $i < $bumrows; $i++) {
    $ret = mysqli_fetch_row($rg1);
    if ($us['insignia'] == $ret[1]) {
      echo "<option value=\"{$ret[1]}#0\" selected>Mascota: {$ret[0]}</option>";
      $sel = 1;
    } else {
      echo "<option value=\"{$ret[1]}#0\">Mascota: {$ret[0]}</option>";
      $sel = 1;
    }
  }
  mysqli_free_result($rg1);
  $numrows = mysqli_num_rows($retval2);
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_assoc($retval2);
    if (($us['insignia'] == $ret['img']) && ($sel == 0))
      echo "<option value=\"{$ret['img']}#{$ret['encantamiento']}\" selected>{$ret['nombreobj']}" . ($ret['encantamiento'] != 0 ? '(Encantado)' : '') . "</option>";
    else
      echo "<option value=\"{$ret['img']}#{$ret['encantamiento']}\">{$ret['nombreobj']}" . ($ret['encantamiento'] != 0 ? '(Encantado)' : '') . "</option>";
  }
  if ($numrows)
    mysqli_data_seek($retval2, 0);
  echo "</select>";
  echo "<input type=\"submit\" name=\"cambiar\" value=\"Cambiar insignia\"/><br/><br/>";
  echo '</div>';
  echo "</form>";
  echo "<b>Insignia actual: " . getInsigniaJug($jug) . "</b><br/><br/>";


  if (!mysqli_num_rows($retval2)) {
    echo 'No tienes objetos. Trabaja para conseguir objetos.<br/><br/>';
    return;
  }

  $ataq = 0;
  $prot = 0;
  $vida = 0;

  $numrows = mysqli_num_rows($retval2);
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_assoc($retval2);
    if ($ret['usado']) {
      $ataq += $ret['ataq'];
      $prot += $ret['prot'];
      $vida += $ret['vida'];
    }
  }

  if ($numrows)
    mysqli_data_seek($retval2, 0);

  //SABIDURIA
  $retvol = db_query("SELECT sabiduria FROM jugadores WHERE nombrejug='{$jug}'");
  $r = mysqli_fetch_row($retvol);
  $sabi = $r[0];
  mysqli_free_result($retvol);
  //

  echo "<table>";
  $encantt = getStatsEncantamientos($jug);
  $ataq += $encantt[0];
  $prot += $encantt[1];
  $vida += $encantt[2];
  echo "<tr><td><b>Ataque (objetos en uso):</b></td><td><img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\">{$ataq}</td></tr>";
  echo "<tr><td><b>Protección (objetos en uso):</b></td><td><img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\">{$prot}</td></tr>";
  echo "<tr><td><b>Vida (objetos en uso):</b></td><td><img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\">{$vida}</td></tr>";
  echo "<tr><td><b>Sabiduria:</b></td><td><img src=\"{$imgroot}libroicon.png\" style=\"height: 12px;width: 10px;margin-left:1px; margin-right:1px\">{$sabi}</td></tr>";
  echo "</table><br/><br/>";

  $numrows = mysqli_num_rows($retval2);
  echo '<b>Actualmente en uso:</b><br/><br/>';
  $ultipo = '';
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_assoc($retval2);
    $item = $ret;
    if (isset($item['cantidad'])) unset($item['cantidad']);
    $objeto = getItemInventario($jug, $item);
    if ($ret['usado']) {
      echo "<form action=\"inventario.php\" method=\"post\">";
      echo "<div class=\"item\">";
      echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
      echo "<input type=\"hidden\" name=\"idob\" value=\"{$ret['img']}\"/>";
      echo "<input type=\"submit\" name=\"dejar\" value=\"Dejar de usar\"/> ";
      echo $objeto;
      echo "<br/></div>";
      echo "</form>";
    }
  }
  echo '<br/><br/>';

  if (!isset($c)) {
    $ultipo = '';
    $numrows = mysqli_num_rows($retvalcat);
    echo '<b>Objetos:</b><br/><br/>';
    for ($i = 0; $i < $numrows; $i++) {
      $ret = mysqli_fetch_row($retvalcat);
      if ($ultipo != $ret[0] && ($ret[1] != 0 && $ret[1] != 1)) {
        $ultipo = $ret[0];
        echo "<a href=\"inventario.php?c={$ret[0]}\">> {$ret[0]}</a><br/>";
      }
    }


    mysqli_data_seek($retvalcat, 0);
    $ultipo = '';
    echo '<br/><b>Equipamiento:</b> ';
    echo '<form style="display: inline;" action="encantar.php">';
    if ($us['nivel'] >= 5) {
      echo '<input class="btn_Enchant" type="submit" value="Encantar" title="Encantar" alt="Encantar"/>';
    } else {
      echo '<input class="btn_Enchant" type="submit" value="Encantar" title="Encantar" alt="Encantar" disabled/>';
    }
    echo '</form> ';
    echo '<form style="display: inline;" action="desencantar.php">';
    if ($us['nivel'] >= 5) {
      echo '<input class="btn_Disenchant" type="submit" value="Desencantar" title="Desencantar" alt="Desencantar"/>';
    } else {
      echo '<input class="btn_Disenchant" type="submit" value="Desencantar" title="Desencantar" alt="Desencantar" disabled/>';
    }
    echo '</form>';
    echo '<br/>';
    for ($i = 0; $i < $numrows; $i++) {
      $ret = mysqli_fetch_row($retvalcat);
      if (strpos($ret[0], 'Z-Esp') !== false) {
        $ret[0] = "Trofeo";
      }
      if ($ultipo != $ret[0] && ($ret[1] == 0 || $ret[1] == 1)) {
        $ultipo = $ret[0];
        echo "<a href=\"inventario.php?c={$ret[0]}\">> {$ret[0]}";
        if ($ret[2] == '0') {
          echo " <strong>(*)</strong>";
        }
        echo "</a><br/>";
      }
    }
  } else {
    $numrows = mysqli_num_rows($retval2);
    if ($numrows)
      mysqli_data_seek($retval2, 0);
    $ultipo = '';


    //Impresión de los items
    include_once 'auxiliar/f_items.php';
    for ($i = 0; $i < $numrows; $i++) {
      $ret = mysqli_fetch_assoc($retval2);
      if (strpos($ret['tipo'], 'Z-Esp') !== false) {
        $ret['tipo'] = "Trofeo";
      }
      if ($ultipo != $ret['tipo']) {
        $ultipo = $ret['tipo'];
        echo "<a href=\"inventario.php\">Volver</a><br/><br/><strong>Categoría: {$ret['tipo']}</strong>.<br/><br/>";
      }
      include_once 'auxiliar/f_items.php';
      $item = $ret;
      $objeto = getItemInventario($jug, $item);
      switch ($item['usos']) {
        case 0: //Equipo
        case 1: //Equipo (Un solo uso)
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          echo "<input type=\"hidden\" name=\"encant\" value=\"{$item['encantamiento']}\"/>";
          if (!$item['usado']) {
            if (!isset($item['enniveluso']) || (isset($item['enniveluso']) && $item['niveluso'] >= $item['enniveluso'])) {
              if ($item['niveluso'] > $us['nivel']) {
                echo '[Te falta nivel] ';
              } else {
                echo "<input type=\"submit\" name=\"usar\" value=\"Comenzar a usar\"/> ";
              }
            } else {
              $niveljug = getJugador($jug)['nivel'];
              if ($niveljug < $item['enniveluso']) {
                echo '[Te falta nivel] ';
              } else {
                echo "<input type=\"submit\" name=\"usar\" value=\"Comenzar a usar\"/> ";
              }
            }
          } else
            echo '[actualmente en uso] ';
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 2: //Comida
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          if ($us['nocomerhasta'] <= $time)
            $puedecomer = 1;
          else
            $puedecomer = 0;
          if ($puedecomer)
            echo "<input type=\"submit\" name=\"comer\" value=\"Comer\" onclick=\"return c()\"/> ";
          else
            echo '[ya has comido] ';
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 3: //Libro
          $aprendido = '';
          $esaprendido = 0;
          $retvab = db_query("SELECT * FROM aprendido WHERE nombrejug='{$jug}' AND resultado='{$item['nombreobj']}'");
          if (mysqli_num_rows($retvab) > 0) {
            $aprendido = ' (<b>APRENDIDO</b>)';
            $esaprendido = 1;
          }
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          if (!$esaprendido) {
            if ($us['energia'] >= $item['ataq'])
              echo "<input type=\"submit\" name=\"leer\" value=\"Leer\" onclick=\"return c()\"/> ";
            else
              echo '[te falta energía] ';
          } else
            echo '[aprendido] ';
          echo $objeto . $aprendido;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 4: //Recurso
          echo "<div class=\"item\">[no usable] ";
          echo $objeto;
          echo "<br/></div>";
          break;
        case 5: //Premium
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"submit\" name=\"consumir\" value=\"Consumir\" onclick=\"return c()\"/> ";
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 6: //Mascota
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          $rrxhi = db_query("SELECT * FROM tienemascotas,mascotas WHERE nombreobj='{$item['nombreobj']}' AND tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$jug}'");
          if (mysqli_num_rows($rrxhi))
            echo "[ya adoptada] ";
          else
            echo "<input type=\"submit\" name=\"adoptar\" value=\"Adoptar\" onclick=\"return c()\"/> ";
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 7: //Mapa
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 8: //Esquirla
          echo "<div class=\"item\">[no usable] ";
          echo $objeto;
          echo "<br/></div>";
          break;
        case 9: //Cofre
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          echo "<input type=\"submit\" name=\"abrir\" value=\"Abrir\" onclick=\"return c()\"/> ";
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 10: //Aumento
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          if ($us['enerext'] < getMaxAumento($us['nivel'])) {
            echo "<input type=\"submit\" name=\"addener\" value=\"Aumentar\" onclick=\"return c()\"/> ";
          } else {
            echo "[No usable] ";
          }
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
        case 11: //Cifrado
          echo "<form action=\"inventario.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$item['img']}\"/>";
          echo "<input type=\"submit\" name=\"descifrar\" value=\"Descifrar\" onclick=\"return c()\"/> ";
          echo $objeto;
          echo "<br/></div>";
          echo "</form>";
          break;
      }
    }
    echo "<br/><a href=\"inventario.php\">Volver</a>";
  }
  mysqli_free_result($retval2);
}

function procesaform()
{
  global $_REQUEST, $tag, $jug, $conftp, $confnocomerhastapremium, $confnocomerhasta, $confnoexplorarhasta, $confnoexplorarhastapremium, $time, $us, $imgroot;

  if (isset($_REQUEST['cambiarti'])) {
    $idti = $_REQUEST['idti'];
    if ($idti) {
      if ($idti == 'none') {
        db_query("UPDATE tienetitulos SET usado=0 WHERE nombrejug='{$jug}'");
        $_SESSION['mensaje'] = 'Has cambiado tu título.';
      } else {
        db_query("UPDATE tienetitulos SET usado=0 WHERE nombrejug='{$jug}'");
        db_query("UPDATE tienetitulos SET usado=1 WHERE nombrejug='{$jug}' and id='{$idti}'");
        $_SESSION['mensaje'] = 'Has cambiado tu título.';
      }
    } else {
      $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }

  if (isset($_REQUEST['cambiar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = explode('#', $_REQUEST['idob']);
      if ($tag == $gtag) {
        $retval = db_query("SELECT tiene.nombreobj FROM tiene,objetos WHERE nombrejug='{$jug}' AND tiene.nombreobj=objetos.nombreobj AND objetos.img='{$idob[0]}' AND tiene.encantamiento={$idob[1]}");
        if (mysqli_num_rows($retval) || ($idob[0] == 'none')) {
          if ($idob[0] != 'none') {
            $item = mysqli_fetch_row($retval);
            db_query("UPDATE tiene SET insignia=0 WHERE nombrejug='{$jug}'");
            db_query("UPDATE tiene SET insignia=1 WHERE nombrejug='{$jug}' AND nombreobj='{$item[0]}' AND encantamiento={$idob[1]}");
          }
          db_query("UPDATE jugadores SET insignia='{$idob[0]}' WHERE nombrejug='{$jug}'");
          $_SESSION['mensaje'] = 'Has cambiado tu insignia.';
        } else {
          $rg1 = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,ataquenivel,defensanivel,expbase,expmult,expgana,maxnivel,usado FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$jug}' AND img='{$idob[0]}' ORDER BY usado DESC,nombremascota ASC");
          if ((mysqli_num_rows($rg1))) {
            db_query("UPDATE jugadores SET insignia='{$idob[0]}' WHERE nombrejug='{$jug}'");
            $_SESSION['mensaje'] = 'Has cambiado tu insignia.';
          } else
            $_SESSION['error'] = 'No tienes ese objeto, no puedes usarlo como insignia.';
        }

        mysqli_free_result($retval);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }

  //Función del botón abrir//
  if (isset($_REQUEST['abrir'])) {
    if (isset($_REQUEST['tag'])) {
      $si = false;
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retval = db_query("SELECT nombreobj FROM objetos WHERE img = '{$idob}'");
        if (mysqli_num_rows($retval) == 1) {
          $objeto = mysqli_fetch_row($retval);
          $retvol = db_query("SELECT nombreobj,cantidad FROM tiene WHERE nombreobj = '{$objeto[0]}' AND nombrejug = '{$jug}'");
          if (mysqli_num_rows($retvol) == 1) {
            $objeto = mysqli_fetch_row($retvol);
            quita_objeto($jug, $objeto[0], $idob);
            $mens = "¡Has abierto un {$objeto[0]}!<br/><br/>Dentro contenía:<br/><br/>";
            $ret_valores =  db_query("SELECT contiene_cofre.nombreobj,objetos.img,contiene_cofre.probabilidad,contiene_cofre.cant_min,contiene_cofre.cant_max FROM contiene_cofre INNER JOIN objetos ON contiene_cofre.nombreobj = objetos.nombreobj WHERE nombre_cofre = '{$objeto[0]}'");
            for ($i = 1; $i <= mysqli_num_rows($ret_valores); $i++) {
              $objeto = mysqli_fetch_row($ret_valores);
              $nombre = $objeto[0];
              $img = $objeto[1];
              $prob = $objeto[2];
              $cant_min = $objeto[3];
              $cant_max = $objeto[4];
              $cant_total = rand($cant_min, $cant_max);
              if ($prob == 100) {
                dale_objeto($jug, $nombre, $cant_total);
                $mens .= "<div class=\"item\"><img src=\"{$imgroot}{$img}.gif\" /> x{$cant_total} {$nombre}</div><br/>";
              } else {
                $numero = rand(1, 100);
                if ($numero <= $prob) {
                  dale_objeto($jug, $nombre, $cant_total);
                  $mens .= "<div class=\"item\"><img src=\"{$imgroot}{$img}.gif\" /> x{$cant_total} {$nombre}</div><br/>";
                }
              }
            }
            //$mens .= "<p>¡También has recibido 3 días de premium!<br>";
            //db_query("UPDATE jugadores SET premiumhasta=premiumhasta+86400*3 WHERE nombrejug='{$jug}' AND premiumhasta>={$time}");
            //b_query("UPDATE jugadores SET premiumhasta={$time}+86400*3 WHERE nombrejug='{$jug}' AND premiumhasta<{$time}");
            db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',{$time},'{$mens}')");
            include_once 'auxiliar/f_logros.php';
            check_logro(19, $jug);
          } else {
            $_SESSION['error'] = 'No tienes ese objeto.';
            $si = true;
          }
        } else {
          $_SESSION['error'] = 'No existe ese objeto.';
          $si = true;
        }
        mysqli_free_result($retval);
        mysqli_free_result($retvol);
        mysqli_free_result($ret_valores);
      } else {
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
        $si = true;
      }
    }
    if ($si == false) {
      header('Location: mensajeria.php');
    } else {
      header('Location: inventario.php');
    }
    return 1;
  }
  //FIN//

  if (isset($_REQUEST['dejar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retv3 = db_query("SELECT tiene.nombreobj FROM tiene,objetos WHERE nombrejug='{$jug}' AND usado=1 AND tiene.nombreobj=objetos.nombreobj AND img='{$idob}'");
        if (mysqli_num_rows($retv3)) {
          $ret = mysqli_fetch_row($retv3);
          db_query("UPDATE tiene SET usado=0 WHERE nombreobj='{$ret[0]}' AND nombrejug='{$jug}' AND usado=1");
          $_SESSION['mensaje'] = 'Has dejado de usar el objeto.';
        } else
          $_SESSION['error'] = 'No tenías ese objeto o no lo estabas usando.';

        mysqli_free_result($retv3);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }

  if (isset($_REQUEST['addener'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retv = db_query("SELECT nombreobj,ataq FROM objetos WHERE img='{$idob}' AND usos=10");
        $ret = mysqli_fetch_row($retv);
        mysqli_free_result($retv);
        $retv2 = db_query("SELECT * FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='{$ret[0]}'");
        if (mysqli_num_rows($retv2)) {
          $enermaxaum = getMaxAumento($us['nivel']);
          $enermaxact = $us['enerext'];
          if ($enermaxact < $enermaxaum) {
            if ($enermaxact + $ret[1] > $enermaxaum) {
              $enermaxact = $enermaxaum;
            } else {
              $enermaxact += $ret[1];
            }
            $energiaactual = $us['energia'] + $ret[1];
            db_query("UPDATE jugadores SET energia={$energiaactual}, enerext={$enermaxact} WHERE nombrejug='{$jug}'");
            quita_objeto($jug, $ret[0], $idob);
            $_SESSION['mensaje'] = 'Has aumentado tu energía máxima. ¡Te sientes más fuerte!';
          } else {
            $_SESSION['error'] = 'Ya tienes el máximo aumento posible actualmente.';
          }
        } else {
          $_SESSION['error'] = 'No tienes ese objeto.';
        }
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }

  if (isset($_REQUEST['usar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retv = db_query("SELECT nivel FROM jugadores WHERE nombrejug='{$jug}'");
        $ret = mysqli_fetch_row($retv);
        mysqli_free_result($retv);
        $encant = $_REQUEST['encant'];
        $retv2 = db_query("SELECT obj.nombreobj,obj.tipo,ti.encantamiento 
                           FROM `objetos` as obj JOIN `tiene` as ti ON (obj.nombreobj=ti.nombreobj) 
                           WHERE obj.niveluso<={$ret[0]} AND obj.img='{$idob}' AND ti.nombrejug='{$jug}' AND encantamiento={$encant} AND obj.usos<=1");
        if (mysqli_num_rows($retv2)) {
          $item1 = mysqli_fetch_row($retv2);
          $retv3 = db_query("SELECT * 
                             FROM tiene 
                             WHERE nombrejug='{$jug}' AND usado=0 AND nombreobj='{$item1[0]}' AND encantamiento={$item1[2]}");
          $retv4 = db_query("SELECT tiene.nombreobj,objetos.tipo,tiene.encantamiento 
                             FROM tiene,objetos 
                            WHERE tiene.nombreobj=objetos.nombreobj AND nombrejug='{$jug}' AND usado=1 AND tipo='{$item1[1]}'");
          $item2 = mysqli_fetch_row($retv4);
          if (mysqli_num_rows($retv3)) {


            db_query("UPDATE tiene SET usado=0 WHERE nombreobj='{$item2[0]}' AND nombrejug='{$jug}' AND usado=1 AND encantamiento={$item2[2]}");
            db_query("UPDATE tiene SET usado=1 WHERE nombreobj='{$item1[0]}' AND nombrejug='{$jug}' AND usado=0 AND encantamiento={$item1[2]}");
            $_SESSION['mensaje'] = 'Has comenzado a usar el objeto.';
          } else
            $_SESSION['error'] = 'No tenías ese objeto o ya lo estabas usando.';
          mysqli_free_result($retv3);
          mysqli_free_result($retv4);
        } else
          $_SESSION['error'] = 'No tienes suficiente nivel para usar este objeto o este objeto no es utilizable.';
        mysqli_free_result($retv2);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }

  if (isset($_REQUEST['leer'])) {
    $salirnow = 0;
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retval = db_query("SELECT energia,nivel FROM jugadores WHERE nombrejug='{$jug}'");
        $retval2 = db_query("SELECT ataq,nombreobj FROM objetos WHERE img='{$idob}' AND usos=3");
        $ret = mysqli_fetch_row($retval);
        mysqli_free_result($retval);
        if (mysqli_num_rows($retval2)) {
          $ret2 = mysqli_fetch_row($retval2);
          $retvalte = db_query("SELECT * FROM aprendido WHERE nombrejug='{$jug}' AND resultado='{$ret2[1]}'");
          if (!mysqli_num_rows($retvalte)) {
            $retvalt = db_query("SELECT * FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='{$ret2[1]}'");
            if (mysqli_num_rows($retvalt)) {
              if ($ret[0] >= $ret2[0]) {
                $retval3 = db_query("SELECT resultado,dificultadaprender FROM contiene where nombreobj='{$ret2[1]}'");
                $retval4 = db_query("SELECT resultado FROM conoce WHERE nombrejug='{$jug}'");
                $nro = mysqli_num_rows($retval4);
                for ($i = 0; $i < $nro; $i++) {
                  $retone = mysqli_fetch_row($retval4);
                  $sabx[$i] = $retone[0];
                }
                $nrows = mysqli_num_rows($retval3);
                $yasabidos = 0;
                if ($nrows) {
                  db_query("UPDATE jugadores SET energia=energia-{$ret2[0]} WHERE nombrejug='{$jug}'");
                  $mens = "Has gastado <b>{$ret2[0]}</b> puntos de energía en leer el <b>{$ret2[1]}</b><br/><br/>";
                  $aprendidos = 0;
                  $incnivel = floor($ret[1] / 5);
                  if ($incnivel > 30)
                    $incnivel = 30;
                  for ($i = 0; $i < $nrows; $i++) {
                    $ret3 = mysqli_fetch_row($retval3);
                    $aprender = 1;
                    for ($y = 0; $y < $nro; $y++)
                      if ($ret3[0] == $sabx[$y])
                        $aprender = 0;
                    if ($aprender) {
                      $total = $incnivel + rand(0, 100);
                      if ($total > $ret3[1]) {
                        db_query("INSERT INTO conoce (nombrejug,resultado,cantidad) VALUES ('{$jug}','{$ret3[0]}',0)");
                        $mens .= "Has aprendido a fabricar <b>{$ret3[0]}</b>.<br/>";
                        $aprendidos++;
                      }
                    } else
                      $yasabidos++;
                  }
                  if (!$aprendidos)
                    $mens .= "No has conseguido aprender nada de este libro.<br/>";
                  $faltan = $nrows - $aprendidos - $yasabidos;
                  if (!$faltan) {
                    db_query("INSERT INTO aprendido (nombrejug,resultado) VALUES ('{$jug}','{$ret2[1]}')");
                    $mens .= "<br/>¡Enhorabuena! Te has aprendido este libro entero.";
                  } else
                    $mens .= "<br/>Aun puedes aprender a fabricar <b>{$faltan}</b> objetos más de otros ejemplares de este libro.";
                  $mens .= '<br/><br/>El libro ha quedado emborronado e inservible.';
                  db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',$time,'{$mens}')");
                  quita_objeto($jug, $ret2[1], $idob);
                  $_SESSION['mensaje'] = 'Has leido el libro.';
                  $salirnow = 1;
                  include_once 'auxiliar/f_logros.php';
                  for ($k = 20; $k < 23; $k++)
                    check_logro($k, $jug);
                } else
                  $_SESSION['error'] = 'Ya te habías aprendido ese libro de memoria.';
                mysqli_free_result($retval3);
                mysqli_free_result($retval4);
              } else
                $_SESSION['error'] = '¡No tienes suficiente energía!';
            } else
              $_SESSION['error'] = 'No tienes ese objeto.';
          } else
            $_SESSION['error'] = 'Ya te habías aprendido ese libro de memoria.';
          mysqli_free_result($retvalte);
        } else
          $_SESSION['error'] = 'Ese objeto no se puede leer.';

        mysqli_free_result($retval2);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    if ($salirnow)
      header('Location: mensajeria.php');
    else
      header('Location: inventario.php');
    return 1;
  }

  if (isset($_REQUEST['comer'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retvalcome = db_query("SELECT nocomerhasta FROM jugadores WHERE nombrejug='{$jug}'");
        $retcome = mysqli_fetch_row($retvalcome);
        mysqli_free_result($retvalcome);
        if ($retcome[0] <= $time) {
          $retv2 = db_query("SELECT objetos.nombreobj,prot FROM objetos,tiene WHERE tiene.nombreobj=objetos.nombreobj AND nombrejug='{$jug}' AND img='{$idob}' AND usos=2");
          if (mysqli_num_rows($retv2)) {
            $retvv2 = mysqli_fetch_row($retv2);
            quita_objeto($jug, $retvv2[0], $idob);
            $retv3 = db_query("SELECT premiumhasta,nivel,energia,nocomerhasta FROM jugadores WHERE nombrejug='{$jug}'");
            $r = mysqli_fetch_row($retv3);
            mysqli_free_result($retv3);
            $espremium = $us['espremium'];

            $enermax = getEnergiaMax($us);

            $ener = $r[2] + $retvv2[1];
            if ($ener > $enermax)
              $ener = $enermax;
            if ($ener < $r[2])
              $ener = $r[2];
            if (!$espremium)
              $nocomerhasta = $time + $confnocomerhasta;
            else
              $nocomerhasta = $time + $confnocomerhastapremium;
            db_query("UPDATE jugadores SET nocomerhasta={$nocomerhasta},energia={$ener} WHERE nombrejug='{$jug}'");
            $_SESSION['mensaje'] = 'Te sientes saciado.';
          } else
            $_SESSION['error'] = 'Este objeto no es comestible o no lo tienes.';
          mysqli_free_result($retv2);
        } else
          $_SESSION['error'] = 'No puedes volver a comer aun.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }


  if (isset($_REQUEST['consumir'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if (($us['moderador']) || ($us['enchufado']))
        $_SESSION['error'] = 'No uses joyas premium, ¡tienes premium ilimitado!';
      else if ($tag == $gtag) {
        $retvala = db_query("SELECT COUNT(*) FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Joya premium'");
        $rc = mysqli_fetch_row($retvala);
        mysqli_free_result($retvala);
        if ($rc[0]) {
          quita_objeto($jug, 'Joya premium', 'rprem');
          db_query("UPDATE jugadores SET premiumhasta=premiumhasta+86400*7 WHERE nombrejug='{$jug}' AND premiumhasta>={$time}");
          db_query("UPDATE jugadores SET premiumhasta={$time}+86400*7 WHERE nombrejug='{$jug}' AND premiumhasta<{$time}");
          $_SESSION['mensaje'] = 'Joya premium consumida, has ganado una semana premium.';
        } else
          $_SESSION['error'] = 'No te quedaban joyas premium.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }


  if (isset($_REQUEST['descifrar'])) {
    $salirnow = 0;
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retv2 = db_query("SELECT * FROM objetos,tiene WHERE tiene.nombreobj=objetos.nombreobj AND nombrejug='{$jug}' AND img='{$idob}' AND usos=11");
        if (mysqli_num_rows($retv2)) {
          $item = mysqli_fetch_assoc($retv2);
          $mens = "<i>Analizas <img src=\"{$imgroot}{$item['img']}.gif\"> <b>{$item['nombreobj']}</b> y descifras lo siguiente:</i><br>
          <br>
          <span>{$item['texto']}</span>";
          db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',$time,'{$mens}','Escrituras')");
          $salirnow = 1;
        } else
          $_SESSION['error'] = 'No tienes ese objeto.';
        mysqli_free_result($retv2);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    if ($salirnow)
      header('Location: mensajeria.php');
    else
      header('Location: inventario.php');
    return 1;
  }


  if (isset($_REQUEST['adoptar'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if ($tag == $gtag) {
        $retv2 = db_query("SELECT objetos.nombreobj FROM objetos,tiene WHERE tiene.nombreobj=objetos.nombreobj AND nombrejug='{$jug}' AND img='{$idob}' AND usos=6");
        if (mysqli_num_rows($retv2)) {
          $r = mysqli_fetch_row($retv2);
          $retv3 = db_query("SELECT nombremascota FROM mascotas WHERE nombreobj='{$r[0]}'");
          if (mysqli_num_rows($retv3)) {
            $r2 = mysqli_fetch_row($retv3);
            $retv4 = db_query("SELECT count(*) FROM tienemascotas WHERE nombrejug='{$jug}' AND nombremascota='{$r2[0]}'");
            $r5 = mysqli_fetch_row($retv4);
            mysqli_free_result($retv4);
            if (!$r5[0]) {
              quita_objeto($jug, $r[0], $idob);
              db_query("INSERT INTO tienemascotas (nombrejug,nombremascota,nivel,experiencia,usado) VALUES ('{$jug}','{$r2[0]}',1,0,0)");
              $_SESSION['mensaje'] = '¡Has adoptado una nueva mascota! Revisa la sección Mascotas.';
              include_once 'auxiliar/f_logros.php';
              for ($k = 27; $k < 34; $k++)
                check_logro($k, $jug);
            } else
              $_SESSION['error'] = 'Ya tienes esa mascota, sólo puedes tener una mascota de cada clase.';
          } else
            $_SESSION['error'] = '¡Eso no es una mascota!';
          mysqli_free_result($retv3);
        } else
          $_SESSION['error'] = 'No tienes ese objeto.';
        mysqli_free_result($retv2);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: inventario.php');
    return 1;
  }
}
