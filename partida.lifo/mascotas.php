<?php
$form = 1;
include('core.php');
function iweb()
{
  global $jug, $tag, $imgroot, $conftp, $time;

  techo('Aquí puedes atender a tus mascotas. Puedes elegir qué mascota te acompañará en tus combates y puedes alimentarlas cuando tengan toda la experiencia necesaria para que suban de nivel.');

  $rg1 = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,vidabase,ataquenivel,defensanivel,vidanivel,expbase,expmult,expgana,maxnivel,usado,tienemascotas.apodo, tienemascotas.acariciado FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$jug}' ORDER BY usado DESC,nombremascota ASC");
  $rows = mysqli_num_rows($rg1);
  if ($rows == 0) {
    echo 'No tienes ninguna mascota ahora mismo.';
  } else {
    $swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
    $shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
    $heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
    echo '<b>Listado de mascotas:</b><br/><br/>';

    for ($ii = 0; $ii < $rows; $ii++) {
      $rrr = mysqli_fetch_row($rg1);
      $rg2 = db_query("SELECT img FROM objetos WHERE nombreobj='{$rrr[4]}'");
      $rg3 = db_query("SELECT cantidad FROM tiene WHERE nombreobj='{$rrr[4]}' AND nombrejug='{$jug}'");
      $rrs = mysqli_fetch_row($rg2);
      if (mysqli_num_rows($rg3)) {
        $rrt = mysqli_fetch_row($rg3);
      } else
        $rrt[0] = 0;
      mysqli_free_result($rg2);
      mysqli_free_result($rg3);

      $ataq = $rrr[5] + ($rrr[8] * ($rrr[2] - 1));
      $prot = $rrr[6] + ($rrr[9] * ($rrr[2] - 1));
      $vida = $rrr[7] + ($rrr[10] * ($rrr[2] - 1));
      $expmax = $rrr[11] + ($rrr[12] * ($rrr[2] - 1));
      if ($rrr[2] >= $rrr[14])
        $expmax = 0;
      if (($expmax > 0) && ($rrr[3] >= $expmax)) {
        $a1 = '<b>';
        $a2 = '</b>';
      } else {
        $a1 = '';
        $a2 = '';
      }
      if ($rrr[15]) {
        echo "<b>Ahora mismo te acompaña:</b><br/><br/>";
        echo "<form action=\"mascotas.php\" method=\"post\">";
        echo "<div class=\"item\">";
        echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
        echo "<input type=\"submit\" onclick=\"return c()\" name=\"descansa\" value=\"Hacer que no te acompañe\"/>";
        echo "</form>";
      } else {
        echo "<form action=\"mascotas.php\" method=\"post\">";
        echo "<div class=\"item\">";
        echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
        echo "<input type=\"hidden\" name=\"idob\" value=\"{$rrr[1]}\"/>";
        echo "<input type=\"submit\" name=\"sigueme\" onclick=\"return c()\" value=\"Hacer que te acompañe\"/>";
        echo "</form>";
      }
      echo "<img src=\"{$imgroot}{$rrr[1]}.gif\" alt=\"{$rrr[0]}\"/> {$rrr[0]} ";
      echo "(Nivel: {$rrr[2]}/{$rrr[14]} / Experiencia: {$a1}{$rrr[3]}/{$expmax}{$a2} / {$swordIcon}: {$ataq} / {$shieldIcon}: {$prot} / {$heartIcon}: {$vida})<br/>";
      echo "<form action=\"mascotas.php\" method=\"post\">";
      echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
      echo "<input type=\"hidden\" name=\"idob\" value=\"{$rrr[1]}\"/>";
      echo "<label>Apodo: </label>";
      echo "<input type=\"text\" name=\"apodoText\" value=\"{$rrr[16]}\"/ placeholder=\"...\" minlength=\"3\" 
		maxlength=\"20\" size=\"21\" pattern=\"[A-Za-z]{0,20}\" title=\"Nombre entre 0 y 20 letras mayúsculas o minúsculas\">";
      echo "<input type=\"submit\" name=\"apodo\" value=\"Establecer\"/>";
      echo "</form>";
	  echo "<form action=\"mascotas.php\" method=\"post\">
	  <input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
	  <input type=\"hidden\" name=\"idob\" value=\"{$rrr[1]}\"/>
	  <label>Cuidado: </label>";
	  if($rrr[17] < $time)
		echo "<input type=\"submit\" name=\"acariciar\" value=\"Acariciar\"/>";
	  else
		echo "Puedes volver a acariciar tu mascota a las ".ahora_hora($rrr[17])." del ".ahora_dia($rrr[17]).".";
	  echo "</form>";
      if (($expmax > 0) && ($rrr[3] >= $expmax)) {
        if ($rrt[0]) {
          echo "<form action=\"mascotas.php\" method=\"post\">";
          echo "<div class=\"item\">";
          echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
          echo "<input type=\"hidden\" name=\"idob\" value=\"{$rrr[1]}\"/>";
          echo "<input type=\"submit\" name=\"come\" onclick=\"return c()\" value=\"Alimentar\"/>";
          echo "</form>";
        } else
          echo '[te falta este alimento]';
      } else
        echo '[le falta experiencia para comer]';
      echo " Su alimento preferido es: <img src=\"{$imgroot}{$rrs[0]}.gif\" alt=\"Alimento preferido\"/> {$rrr[4]}";
      echo "<br/><br/>";
      if ($rows > 1) {
        echo "<br/><br/><b>Resto de mascotas:</b><br/><br/>";
      }
    }
  }
  echo '<br/><br/>';
  mysqli_free_result($rg1);
}

function procesaform()
{
  global $_REQUEST, $tag, $jug, $time;

  if (isset($_REQUEST['descansa'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $retvalx1 = db_query("UPDATE tienemascotas set usado=0 WHERE nombrejug='{$jug}'");
        $_SESSION['mensaje'] = "Tu mascota ya no te acompaña.";
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: mascotas.php');
    return 1;
  }

  if (isset($_REQUEST['apodo'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $apodo = $_REQUEST['apodoText'];
        $apodo = trim($apodo);
        $idob = $_REQUEST['idob'];
        if (strlen($apodo) < 26) {
          $rrt = db_query("SELECT tienemascotas.nombremascota FROM tienemascotas,mascotas WHERE mascotas.nombremascota=tienemascotas.nombremascota AND nombrejug='{$jug}' AND img='{$idob}'");
          if (mysqli_num_rows($rrt)) {
            $masc = mysqli_fetch_row($rrt);
            if (!isset($apodo) || $apodo == '') {
              $apodo = '';
            }
            db_query("UPDATE tienemascotas set apodo='{$apodo}' WHERE nombrejug='{$jug}' AND nombremascota='{$masc[0]}'");
            $_SESSION['mensaje'] = "Apodo modificado con éxito.";
          } else
            $_SESSION['error'] = 'No tienes esa mascota';
          mysqli_free_result($rrt);
        } else {
          $_SESSION['error'] = 'Ese apodo no es válido';
        }
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: mascotas.php');
    return 1;
  }
  
  if (isset($_REQUEST['acariciar'])) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        $idob = $_REQUEST['idob'];
		$rrt = db_query("SELECT tienemascotas.nombremascota, tienemascotas.acariciado FROM tienemascotas,mascotas WHERE mascotas.nombremascota=tienemascotas.nombremascota AND nombrejug='{$jug}' AND img='{$idob}'");
		if (mysqli_num_rows($rrt)) {
			$masc = mysqli_fetch_row($rrt);
			if($masc[1] < $time){
				$hora = $time + (3600*12);
				db_query("UPDATE tienemascotas set acariciado={$hora},experiencia=experiencia+1 WHERE nombrejug='{$jug}' AND nombremascota='{$masc[0]}'");
				$_SESSION['mensaje'] = "Has acariciado a tu mascota. ¡Tu mascota está contenta!";
			} else
				$_SESSION['error'] = 'No puedes acariciar a tu mascota aun, temdrás que esperar.';
		} else
			$_SESSION['error'] = 'No tienes esa mascota';
		mysqli_free_result($rrt);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: mascotas.php');
    return 1;
  }

  if (isset($_REQUEST['sigueme'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $idob))) {
        $rrt = db_query("SELECT tienemascotas.nombremascota FROM tienemascotas,mascotas WHERE mascotas.nombremascota=tienemascotas.nombremascota AND nombrejug='{$jug}' AND img='{$idob}'");
        if (mysqli_num_rows($rrt)) {
          $retvalx1 = db_query("UPDATE tienemascotas set usado=0 WHERE nombrejug='{$jug}'");
          $masc = mysqli_fetch_row($rrt);
          $retvalx1 = db_query("UPDATE tienemascotas set usado=1 WHERE nombrejug='{$jug}' AND nombremascota='{$masc[0]}'");
          $_SESSION['mensaje'] = "Tu mascota ya te está acompañando.";
        } else
          $_SESSION['error'] = 'No tienes esa mascota';
        mysqli_free_result($rrt);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: mascotas.php');
    return 1;
  }

  if (isset($_REQUEST['come'])) {
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      if (($tag == $gtag) && (preg_match('/^[a-z]+$/', $idob))) {
        $rrt = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,ataquenivel,defensanivel,expbase,expmult,expgana,maxnivel FROM tienemascotas,mascotas WHERE mascotas.nombremascota=tienemascotas.nombremascota AND nombrejug='{$jug}' AND img='{$idob}'");
        if (mysqli_num_rows($rrt)) {
          $rr = mysqli_fetch_row($rrt);
          $rrx = db_query("SELECT cantidad FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='{$rr[4]}'");
          $rrb = db_query("SELECT img FROM objetos WHERE nombreobj='{$rr[4]}'");
          if (mysqli_num_rows($rrx)) {
            $rb = mysqli_fetch_row($rrb);
            $expmax = $rr[9] + ($rr[10] * ($rr[2] - 1));
            if ($rr[2] >= $rr[12])
              $expmax = 0;
            if (($expmax > 0) && ($rr[3] >= $expmax)) {
              quita_objeto($jug, $rr[4], $rb[0]);
              $retvalx1 = db_query("UPDATE tienemascotas set nivel=nivel+1,experiencia=0 WHERE nombrejug='{$jug}' AND nombremascota='{$rr[0]}'");
              $_SESSION['mensaje'] = '¡Tu mascota ha subido de nivel y se ha puesto más fuerte!';
            } else
              $_SESSION['error'] = 'Esta mascota no tiene suficiente experiencia para comer o ha alcanzado su nivel máximo.';
          } else
            $_SESSION['error'] = 'No tienes ese alimento.';
          mysqli_free_result($rrx);
          mysqli_free_result($rrb);
        } else
          $_SESSION['error'] = 'No tienes esa mascota';
        mysqli_free_result($rrt);
      } else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    header('Location: mascotas.php');
    return 1;
  }
}
