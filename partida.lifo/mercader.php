<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $tag, $confvalorventa, $_REQUEST, $us, $imgroot;

  $of = 0;
  if (isset($_REQUEST['of'])) {
    if ($_REQUEST['of'] == 'premium') {
      $of = 1;
    }
  }

  $retvab = db_query("SELECT resultado FROM aprendido WHERE nombrejug='{$jug}'");
  $nrb = mysqli_num_rows($retvab);
  for ($i = 0; $i < $nrb; $i++) {
    $xen = mysqli_fetch_row($retvab);
    $sabe[$i] = $xen[0];
  }
  mysqli_free_result($retvab);

  $cat = '';
  if (isset($_REQUEST['cat']))
    $cat = check_itemname($_REQUEST['cat']);

  techo('"¡Bueno, bonito y barato! ¿o no?" En el mercader puedes adquirir toda clase de objetos artesanales en base a tu nivel y al oro o joyas premium de que dispongas. Ten en cuenta que el mercader sólo te mostrará aquellos objetos que puedes permitirte pagar o usar. El mercader también se ofrecerá a comprar los objetos y artefactos que encuentres. Si vendes la última unidad del objeto que utilizas como insignia, tu insignia desaparecerá. El mercader también venderá objetos extraños que otros jugadores le hayan vendido.');

  $retval2 = db_query("SELECT tiene.nombreobj,cantidad,tipo,img,ataq,prot,valor,usado,niveluso,usos FROM tiene,objetos WHERE tipo NOT IN ('Mapa','Cofre','Cifrado') AND nombrejug='{$jug}' AND tiene.nombreobj=objetos.nombreobj AND tiene.encantamiento=0 ORDER BY tipo ASC,ataq+prot DESC,posibilidad ASC");
  $retvalpp = db_query("SELECT cantidad FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Joya premium'");

  if (mysqli_num_rows($retvalpp)) {
    $rxp = mysqli_fetch_row($retvalpp);
    $njop = $rxp[0];
  } else
    $njop = 0;
  mysqli_free_result($retvalpp);

  echo "Tienes <b>{$us['oro']}</b> monedas de oro.<br/><br/>";

  if ($cat) {
    if (isset($_REQUEST['p']))
      $p = $_REQUEST['p'];
    else
      $p = 1;
    if (!is_numeric($p))
      $p = 1;
    if ($p < 1)
      $p = 1;
    $ini = ($p - 1) * 8;
    $fin = $p * 8;

    $retvaloff = db_query("SELECT DISTINCT nombreobj FROM ofertas");
    $nroff = mysqli_num_rows($retvaloff);
    $query = '(';
    for ($g = 0; $g < $nroff; $g++) {
      $ret = mysqli_fetch_row($retvaloff);
      $query .= "'{$ret[0]}',";
    }
    $query .= '\'0_$\')';
    mysqli_free_result($retvaloff);
    $retval3 = db_query("SELECT nombreobj,tipo,img,ataq,prot,valor,niveluso,usos,posibilidad FROM objetos WHERE tipo NOT IN ('Mapa','Cofre','Cifrado') AND ((niveluso<={$us['nivel']}) OR (valor<={$us['oro']})) AND ((nivelcomprar>0 AND nivelcomprar<={$us['nivel']}) OR nombreobj IN {$query}) AND tipo='{$cat}' ORDER BY ataq+prot DESC,posibilidad ASC LIMIT {$ini},1000");
    $retvalt = db_query("SELECT COUNT(*) FROM objetos WHERE ((niveluso<={$us['nivel']}) OR (valor<={$us['oro']})) AND ((nivelcomprar>0 AND nivelcomprar<={$us['nivel']}) OR nombreobj IN {$query}) AND tipo='{$cat}'");

    $ultipo = '';
    $numrows = mysqli_num_rows($retval3);
    echo '<b>Comprar objetos:</b><br/><br/>';
    for ($i = 0; $i < $numrows; $i++) {
      $ret = mysqli_fetch_row($retval3);
      if ($ultipo != $ret[1]) {
        $ultipo = $ret[1];
        echo "<br/>Categoría: {$ret[1]}.<br/><br/>";
      }
      echo "<form action=\"mercader.php\" method=\"post\">";
      echo "<div class=\"item\">";
      echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
      echo "<input type=\"hidden\" name=\"cat\" value=\"{$cat}\"/>";
      echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
      echo "<input type=\"hidden\" name=\"idob\" value=\"{$ret[2]}\"/>";
      if ($us['oro'] < $ret[5])
        echo '[comprar]';
      else {
        echo "<input type=\"submit\" name=\"comprar\" onclick=\"return c()\" value=\"Comprar\"/>x<input type=\"text\" name=\"cantidad\" value=\"1\" size=\"2\" maxlength=\"5\"/> ";
      }
      if ($ret[7] <= 1) {
        if ($ret[7])
          $usos = ' / UN SOLO USO';
        else
          $usos = '';
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]} (Ataque: {$ret[3]} / Protección: {$ret[4]} / Nivel: {$ret[6]}{$usos})<br/></div>";
      } else if ($ret[7] == 2) {
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]} (Energía: +{$ret[4]} / UN SOLO USO)<br/></div>";
      } else if ($ret[7] == 3) {
        $aprendido = '';
        for ($ba = 0; $ba < $nrb; $ba++) {
          if ($sabe[$ba] == $ret[0])
            $aprendido = ' / APRENDIDO';
        }
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]} (Energía: -{$ret[3]} / UN SOLO USO{$aprendido})<br/></div>";
      } else if ($ret[7] == 4) {
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]}<br/></div>";
      } else if ($ret[7] == 5) {
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]} (consumir para obtener 1 semana premium)<br/></div>";
      } else if ($ret[7] == 6) {
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]} (MASCOTA)<br/></div>";
      } else if ($ret[7] == 8) {
        echo "<img src=\"{$imgroot}{$ret[2]}.gif\" alt=\"{$ret[1]}\"/> <b>Precio compra: {$ret[5]}.</b> {$ret[0]}<br/></div>";
      }
      echo "</form>";
    }
    mysqli_free_result($retval3);
    $ret2 = mysqli_fetch_row($retvalt);
    mysqli_free_result($retvalt);
    $npags = $ret2[0] / 1000;
    $npag = floor($npags);
    if ($npag != $npags)
      $npag++;
    if ($npag > 1) {
      echo "Página: ";
      for ($i = 1; $i <= $npag; $i++) {
        if ($i != $p)
          echo "<a href=\"mercader.php?cat={$cat}&amp;p={$i}\">{$i}</a> ";
        else
          echo "<b>{$i}</b> ";
      }
    }
    echo '<br/><br/>';
    echo "<a href=\"mercader.php\">Volver</a><br/>";
  } else {
    $retvaloff = db_query("SELECT DISTINCT nombreobj FROM ofertas");
    $nroff = mysqli_num_rows($retvaloff);
    $query = '(';
    for ($g = 0; $g < $nroff; $g++) {
      $ret = mysqli_fetch_row($retvaloff);
      $query .= "'{$ret[0]}',";
    }
    $query .= '\'0_$\')';
    mysqli_free_result($retvaloff);
    $retvaln = db_query("SELECT DISTINCT tipo,COUNT(*) FROM objetos WHERE tipo NOT IN ('Mapa','Cofre','Cifrado') AND ((niveluso<={$us['nivel']}) OR (valor<={$us['oro']})) AND ((nivelcomprar>0 AND nivelcomprar<={$us['nivel']}) OR nombreobj IN $query) GROUP by tipo");
    $retvalx1 = db_query("SELECT tiene.nombreobj,cantidad-usado,valor FROM tiene,objetos WHERE tiene.nombreobj=objetos.nombreobj AND nombrejug='{$jug}' AND usos=0 AND tiene.encantamiento=0");
    $retn = mysqli_num_rows($retvaln);
    if ($retn) {
      echo '<b>Ver objetos ofertados por categoría:</b><br/><br/>';
      for ($i = 0; $i < $retn; $i++) {
        $ret = mysqli_fetch_row($retvaln);
        echo "<a href=\"mercader.php?cat={$ret[0]}\">Categoría: {$ret[0]} ({$ret[1]} objetos)</a><br/>";
      }
      mysqli_free_result($retvaln);
    }
    echo '<br/><br/>';
    $ultipo = '';
    $numrows = mysqli_num_rows($retval2);
    echo '<b>Vender objetos:</b><br/><br/>';
    $ventatot = 0;
    $numrowsx1 = mysqli_num_rows($retvalx1);

    for ($x = 0; $x < $numrowsx1; $x++) {
      $retx = mysqli_fetch_row($retvalx1);
      $ventatot = $ventatot + floor($retx[2] * $confvalorventa) * $retx[1];
    }
    mysqli_free_result($retvalx1);

    echo "<form action=\"mercader.php\" method=\"post\"><div>";
    echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
    echo "<input type=\"submit\" name=\"vendertodo\" onclick=\"return c()\" value=\"Vender armaduras y armas que no están siendo usados por {$ventatot} monedas de oro\"/> ";
    echo "</div></form>";


    for ($i = 0; $i < $numrows; $i++) {
      $ret = mysqli_fetch_row($retval2);
      if ($ultipo != $ret[2]) {
        $ultipo = $ret[2];
        echo "<br/>Categoría: {$ret[2]}.<br/><br/>";
      }
      echo "<form action=\"mercader.php\" method=\"post\">";
      echo "<div class=\"item\">";
      echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
      echo "<input type=\"hidden\" name=\"idob\" value=\"{$ret[3]}\"/>";
      $venta = floor($ret[6] * $confvalorventa);
      if ($venta <= 0) {
        echo '[no vendible]';
      } else if (($ret[7] == 1) && ($ret[1] == 1))
        echo '[en uso] ';
      else
        echo "<input type=\"submit\" name=\"vender\" onclick=\"return c()\" value=\"Vender\"/>x<input type=\"text\" name=\"cantidad\" value=\"1\" size=\"2\" maxlength=\"5\"/> ";
      if ($ret[9] <= 1) {
        if ($ret[9])
          $usos = ' / UN SOLO USO';
        else
          $usos = '';
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]} (Ataque: {$ret[4]} / Protección: {$ret[5]} / Nivel: {$ret[8]}{$usos})<br/></div>";
      } else if ($ret[9] == 2) {
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]} (Energía: +{$ret[5]} / UN SOLO USO)<br/></div>";
      } else if ($ret[9] == 3) {
        $aprendido = '';
        for ($ba = 0; $ba < $nrb; $ba++) {
          if ($sabe[$ba] == $ret[0])
            $aprendido = ' / APRENDIDO';
        }
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]} (Energía: -{$ret[4]} / UN SOLO USO{$aprendido})<br/></div>";
      } else if ($ret[9] == 4) {
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]}<br/></div>";
      } else if ($ret[9] == 5) {
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]} (consumir para obtener 1 semana premium)<br/></div>";
      } else if ($ret[9] == 6) {
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]} (MASCOTA)<br/></div>";
      } else if ($ret[9] == 8) {
        echo "<img src=\"{$imgroot}{$ret[3]}.gif\" alt=\"{$ret[2]}\"/><b>x{$ret[1]} Precio venta: {$venta}.</b> {$ret[0]}<br/></div>";
      }
      echo "</form>";
    }
    mysqli_free_result($retval2);
  }
}

function procesaform()
{
  global $_REQUEST, $tag, $jug, $confvalorventa, $conftp;

  if (isset($_REQUEST['vendertodo'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $retvalx1 = db_query("SELECT tiene.nombreobj,cantidad-usado,valor,nivelcomprar,img FROM tiene,objetos WHERE tiene.nombreobj=objetos.nombreobj AND tiene.encantamiento=0 AND nombrejug='{$jug}' AND valor>0 AND usos=0 AND cantidad-usado>0");
        $ventatot = 0;
        $numrowsx1 = mysqli_num_rows($retvalx1);
        for ($x = 0; $x < $numrowsx1; $x++) {
          $retx = mysqli_fetch_row($retvalx1);
          $ventatot = $ventatot + floor($retx[2] * $confvalorventa) * $retx[1];
          if (!$retx[3]) {
            addoferta($retx[0], $retx[1]);
          }
          quita_objeto($jug, $retx[0], $retx[4], $retx[1]);
        }
        mysqli_free_result($retvalx1);
        db_query("UPDATE {$conftp}jugadores set oro=oro+{$ventatot} WHERE nombrejug='{$jug}'");
        $_SESSION['mensaje'] = "Has vendido todos los objetos que no estaban en uso por {$ventatot} monedas de oro.";
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: mercader.php');
    return 1;
  }

  if (isset($_REQUEST['vender'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob'])) && (isset($_REQUEST['cantidad']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      $cantidad = floor($_REQUEST['cantidad']);
      if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $idob)) && (is_numeric($cantidad)) && ($cantidad > 0)) {
        $retval = db_query("SELECT tiene.nombreobj,valor,img,usado,cantidad,nivelcomprar FROM tiene,objetos WHERE nombrejug='{$jug}' AND tiene.nombreobj=objetos.nombreobj AND objetos.img='{$idob}' AND ((cantidad>={$cantidad} AND usado=0) OR (cantidad-1>={$cantidad} AND usado=1))");
        if (mysqli_num_rows($retval)) {
          $ret = mysqli_fetch_row($retval);
          $valor = floor($ret[1] * $confvalorventa);
          if ($valor > 0) {
            db_query("UPDATE jugadores SET oro=oro+{$valor}*{$cantidad} WHERE nombrejug='{$jug}'");
            if (!$ret[5])
              addoferta($ret[0], $cantidad);
            quita_objeto($jug, $ret[0], $ret[2], $cantidad);
            $_SESSION['mensaje'] = 'Objetos vendidos.';
          } else
            $_SESSION['error'] = 'Este objeto no se puede vender.';
        } else
          $_SESSION['error'] = '¡No puedes vender esa cantidad de ese objeto porque no la tienes o la estás usando!';
        mysqli_free_result($retval);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor! (indica una cantidad válida)';
    }
    header('Location: mercader.php');
    return 1;
  }

  if (isset($_REQUEST['comprar'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob'])) && (isset($_REQUEST['cantidad']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      $cantidad = floor($_REQUEST['cantidad']);
      if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $idob)) && (is_numeric($cantidad)) && ($cantidad > 0)) {
        $retval = db_query("SELECT oro,nivel FROM jugadores WHERE nombrejug='{$jug}'");
        $ret = mysqli_fetch_row($retval);
        mysqli_free_result($retval);
        $retval = db_query("SELECT nombreobj,valor FROM objetos WHERE img='{$idob}' AND nivelcomprar<={$ret[1]} AND nivelcomprar>0 AND valor*{$cantidad}<={$ret[0]}");
        if (mysqli_num_rows($retval)) {
          $ret2 = mysqli_fetch_row($retval);
          $oro = $ret[0] - $ret2[1] * $cantidad;
          db_query("UPDATE jugadores SET oro={$oro} WHERE nombrejug='{$jug}'");
          dale_objeto($jug, $ret2[0], $cantidad);
          $_SESSION['mensaje'] = 'Objetos comprados.';
        } else {
          $retval = db_query("SELECT objetos.nombreobj,valor,nivelcomprar,cantidad FROM ofertas,objetos WHERE ofertas.nombreobj=objetos.nombreobj AND valor*{$cantidad}<={$ret[0]} AND img='{$idob}'");
          if (mysqli_num_rows($retval)) {
            $ret2 = mysqli_fetch_row($retval);
            if ($ret2[3] >= $cantidad) {
              $oro = $ret[0] - $ret2[1] * $cantidad;
              db_query("UPDATE jugadores SET oro={$oro} WHERE nombrejug='{$jug}'");
              dale_objeto($jug, $ret2[0], $cantidad);
              if (!$ret2[2])
                remoferta($ret2[0], $cantidad);
              $_SESSION['mensaje'] = 'Objetos comprados.';
            } else {
              $_SESSION['error'] = 'No hay tantas unidades disponibles de este objeto.';
            }
          } else
            $_SESSION['error'] = 'No tienes oro para comprar ese objeto o el objeto no está en venta.';
        }
        mysqli_free_result($retval);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor! (indica una cantidad válida)';
    }
    if (isset($_REQUEST['cat']))
      $cat = check_itemname($_REQUEST['cat']);
    else
      $cat = '';
    if (isset($_REQUEST['p']))
      $p = $_REQUEST['p'];
    else
      $p = '';

    header("Location: mercader.php?cat={$cat}&p={$p}");
    return 1;
  }

  if (isset($_REQUEST['comprarprem'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $idob))) {
        //db_lock("jugadores WRITE,tiene WRITE,objetos READ,ofertasesp WRITE");
        $retvalpp = db_query("SELECT cantidad FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Joya premium'");
        if (mysqli_num_rows($retvalpp)) {
          $rxp = mysqli_fetch_row($retvalpp);
          $njop = $rxp[0];
        } else
          $njop = 0;
        mysqli_free_result($retvalpp);
        $retvalpp2 = db_query("SELECT unico,preciojoyas,objetos.nombreobj FROM ofertasesp,objetos WHERE img='{$idob}' AND ofertasesp.nombreobj=objetos.nombreobj");
        if (mysqli_num_rows($retvalpp2)) {
          $bb = mysqli_fetch_row($retvalpp2);
          if ($bb[1] <= $njop) {
            quita_objeto($jug, 'Joya premium', 'rprem', $bb[1]);
            dale_objeto($jug, $bb[2]);
            if ($bb[0]) {
              db_query("DELETE FROM ofertasesp WHERE nombreobj='{$bb[2]}'");
              $_SESSION['mensaje'] = 'Objeto único adquirido!';
            } else
              $_SESSION['mensaje'] = 'Objeto adquirido!.';
          } else
            $_SESSION['error'] = 'No tienes suficientes joyas premium para adquirir este objeto.';
        } else
          $_SESSION['error'] = 'Este objeto ya no está en venta.';
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor! (indica una cantidad válida)';
    }

    header("Location: mercader.php?of=premium");
    return 1;
  }
}
