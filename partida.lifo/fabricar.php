<?php
$form = 1;
include('core.php');
function iweb() {
  global $jug,$tag,$confvalorventa,$_REQUEST,$confmercencuentra,$confmercvecesmax,$time,$conftp,$us,$imgroot,$confmuestrafabricar;

  $cat = '';
  if (isset($_REQUEST['cat']))
    $cat = check_itemname($_REQUEST['cat']);
  
  $busqueda = '';
  if (isset($_REQUEST['busqueda']))
	$busqueda = $_REQUEST['busqueda'];
  
  $search_query = '';
  if (isset($_REQUEST['search_query']))
	$search_query = $_REQUEST['search_query'];

  techo('Aquí puedes crear los objetos y hechizos que has aprendido a fabricar. Para aprender a fabricar objetos o hechizos debes leer cualesquiera de los distintos libros disponibles. Cada libro te enseña a fabricar unos objetos o hechizos determinados.');
  
  //SABIDURIA
  db_query("UPDATE jugadores SET sabiduria = (SELECT COUNT(*) FROM aprendido WHERE nombrejug='{$jug}' GROUP BY nombrejug) WHERE nombrejug='{$jug}'");
  $retvol = db_query("SELECT sabiduria FROM jugadores WHERE nombrejug='{$jug}'");
  $r = mysqli_fetch_row($retvol);
  $sabi = $r[0];
  $porsab = $sabi / 6;
  $porsab = round($porsab,2);
  mysqli_free_result($retvol);
  //

  echo "Tienes <b>{$us['energia']}</b> puntos de energía.<br/><br/>";
  echo "Tu sabiduría de <b>{$sabi}</b> reduce en un <b>{$porsab}</b>% la dificultad de tus recetas.<br/><br/>";

  if ($us['tiempopremium'] > 86400*7) {
    echo "<form action=\"fabricar.php\" method=\"post\">";
    echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
    echo "<input type=\"submit\" onclick=\"return c()\" name=\"joyapremiumf\" value=\"Convertir una semana premium en una joya premium\"/>";
    echo "</form><br/><br/>";
  }

	if ($cat || $busqueda) {
		if($cat){
			if (isset($_REQUEST['p']))
			  $p = $_REQUEST['p'];
			else 
			  $p = 1;
			if (!is_numeric($p))
			  $p = 1;
			if ($p < 1)
			  $p = 1;
			$ini = ($p-1)*$confmuestrafabricar;
			//db_lock("recetas READ,conoce READ,objetos READ");
			$retval3 = db_query("SELECT recetas.resultado,cantidadresultado,objetos.tipo,img,ataq,prot,vida,niveluso,usos,energia,dificultadhacer,perderingredientes,cantidad,objetos.pasivas FROM recetas,conoce,objetos WHERE recetas.tipo='{$cat}' AND conoce.resultado=recetas.resultado AND conoce.nombrejug='{$jug}' AND conoce.resultado=objetos.nombreobj ORDER BY dificultadhacer DESC,recetas.resultado DESC LIMIT {$ini},{$confmuestrafabricar}");
			$retvalt = db_query("SELECT COUNT(*) FROM recetas,conoce WHERE tipo='{$cat}' AND conoce.resultado=recetas.resultado AND conoce.nombrejug='{$jug}'");
			$retvab = db_query("SELECT resultado,0,img FROM aprendido,objetos WHERE nombreobj=resultado AND nombrejug='{$jug}'");
			//db_unlock();
			$nrb = mysqli_num_rows($retvab);
			for ($i = 0;$i < $nrb;$i++) {
			  $xen = mysqli_fetch_row($retvab);
			  $sabe[$i] = $xen[0];
			  $sabei[$i] = $xen[2];
			}
			mysqli_free_result($retvab);
			//db_unlock();

			$ret2 = mysqli_fetch_row($retvalt);
			mysqli_free_result($retvalt);

			$ulresul = '';
			$numrows = mysqli_num_rows($retval3);

			include_once 'auxiliar/f_items.php';
			for ($i = 0;$i < $numrows;$i++) {
				$ret = mysqli_fetch_assoc($retval3);
				$item = $ret;
				$objeto = getItemFabricarResultado($jug,$item);
				echo "<div class=\"item\">";
				echo "<b>Fabricar:</b> {$objeto}";
				echo "<br/></div>";
				$inccon = floor($ret['cantidad']/100);
				if ($inccon > 50)
					$inccon = 50;
				$dif = $ret['dificultadhacer']-$inccon-$porsab;
				if ($dif < 0)
					$dif = 0;

				if ($ret['cantidad'] < 10)
					echo "No tienes ninguna experiencia fabricando este objeto.";
				else if ($ret['cantidad'] < 100)
					echo "Tienes un poco de experiencia fabricando este objeto.";
				else if ($ret['cantidad'] < 300)
					echo "Tienes bastante experiencia fabricando este objeto.";
				else if ($ret['cantidad'] < 500)
					echo "Estás familiarizado con la fabricación de este objeto.";
				else if ($ret['cantidad'] < 1000)
					echo "Estás muy familiarizado con la fabricación de este objeto.";
				else if ($ret['cantidad'] < 3000)
					echo "Eres un experto fabricando este objeto.";
				else if ($ret['cantidad'] < 5000)
					echo "Eres un maestro fabricando este objeto.";
				else
					echo "Eres un gran maestro fabricando este objeto.";
				echo '<br/>'; 
				$exito = 100-$dif;
				$exito = round($exito,2);
				echo "Posibilidad de éxito: <b>{$exito}</b>%<br/>";
				echo "Coste de energía: <b>{$ret['energia']}</b><br/>";
				if ($ret['perderingredientes'])
					echo "¡Perderás los ingredientes si fallas!<br/>";
				echo "Ingredientes necesarios:<br/>";
				$ketval = db_query("SELECT i.nombreobj,i.cantidad,o.tipo,o.img,o.ataq,o.prot,o.vida,o.niveluso,o.usos,IFNULL(t.cantidad,0) as cantidadusuario,o.pasivas FROM ingrediente AS i join objetos AS o ON (i.nombreobj=o.nombreobj) LEFT JOIN tiene AS t ON (i.nombreobj=t.nombreobj AND t.nombrejug='{$jug}') WHERE i.resultado='{$ret['resultado']}'");
				$ketvali2 = db_query("SELECT nombreobj,cantidad FROM tiene WHERE nombrejug='{$jug}'");
				$ketval2 = db_query("SELECT nombreobj,cantidad FROM ingrediente WHERE resultado='{$ret['resultado']}'");
				$ni2 = mysqli_num_rows($ketvali2);
				$n2 = mysqli_num_rows($ketval2);
				$faltan = 0;
				for ($aa0 = 0;$aa0 < $n2 && !$faltan;$aa0++) {
					$retbb = mysqli_fetch_row($ketval2);
					$faltaeste = 1;
					for ($aa1 = 0;$aa1 < $ni2 && $faltaeste;$aa1++) {
						$retba = mysqli_fetch_row($ketvali2);
						if (($retba[0]==$retbb[0]) && ($retba[1]>=$retbb[1])) 
							$faltaeste = 0;
					}
					if ($ni2)
						mysqli_data_seek($ketvali2,0);
					if ($faltaeste)
						$faltan = 1;
				}
				$kumrows = mysqli_num_rows($ketval);
				for ($y = 0;$y < $kumrows;$y++) {
					$ket = mysqli_fetch_assoc($ketval);
					$subitem = $ket;
					$subobjeto = getItemFabricarIngrediente($jug,$subitem);
					echo "<div class=\"item\">";
					echo "{$subobjeto}";
					echo "<br/></div>";
				}
				if ($faltan) {
				echo '[te faltan ingredientes]<br/>';
				}
				else {
				if ($ret['energia'] > $us['energia'])
				  echo '[te falta energía]<br/>';
				else {
				  echo "<form action=\"fabricar.php\" method=\"post\"><div>";
				  echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
				  echo "<input type=\"hidden\" name=\"cat\" value=\"{$ret['tipo']}\"/>";
				  echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
				  echo "<input type=\"hidden\" name=\"idob\" value=\"{$ret['img']}\"/>";
				  echo "<input type=\"submit\" name=\"fabricar\" onclick=\"return c()\" value=\"Fabricar\"/>x<input type=\"text\" name=\"cantidad\" value=\"1\" size=\"2\" maxlength=\"3\"/>";
				  echo "</div></form>";
				}
				}
				echo '<br/><br/>';
			}
			mysqli_free_result($retval3);

			$npags = $ret2[0]/$confmuestrafabricar;
			$npag = floor($npags);
			if ($npag != $npags)
			  $npag++;
			if ($npag > 1) {
			  echo "Página: ";
			  for ($i = 1;$i <= $npag;$i++) {
				if ($i != $p)
				  echo "<a href=\"fabricar.php?cat={$cat}&amp;p={$i}\">{$i}</a> ";
				else
				  echo "<b>{$i}</b> ";
			  }
			}
		}
		else{
			//db_lock("recetas READ,conoce READ,objetos READ");
			$query = "SELECT recetas.resultado,cantidadresultado,objetos.tipo,img,ataq,prot,vida,niveluso,usos,energia,dificultadhacer,perderingredientes,cantidad,pasivas FROM recetas,conoce,objetos WHERE conoce.resultado=recetas.resultado AND conoce.nombrejug='{$jug}' AND conoce.resultado=objetos.nombreobj AND (";
			
			$palabras = explode("+", $busqueda);
			$num_palabras = count($palabras);
			$string_palabras = '';
			for($i = 0;$i<$num_palabras;$i++){
				$string_palabras .= $palabras[$i];
				if($i+1 < $num_palabras){
					$string_palabras .= " ";
				}
			}
			for($i = 0;$i<$num_palabras;$i++){
				$query .= "recetas.resultado LIKE '%".$palabras[$i]."%'";
				if($i+1 < $num_palabras){
					$query .= "OR ";
				}
			}
			$query .= ") ORDER BY dificultadhacer DESC,recetas.resultado DESC";
			
			
			$retval3 = db_query($query);
			$retvalt = db_query("SELECT COUNT(*) FROM recetas,conoce WHERE conoce.resultado=recetas.resultado AND conoce.nombrejug='{$jug}'");
			//db_unlock();

			$ret2 = mysqli_fetch_row($retvalt);
			mysqli_free_result($retvalt);

			$ulresul = '';
			$numrows = mysqli_num_rows($retval3);
			
			if($numrows == 0){
				echo '<p>No se encontraron resultados por "<b style="color:red;">'.$string_palabras.'</b>".</p>';
			}else{
				echo '<p><u>Resultados encontrados para "<b style="color:blue;">'.$string_palabras.'</b>".</u></p>';
				
				include_once 'auxiliar/f_items.php';
				for ($i = 0;$i < $numrows;$i++) {
				$ret = mysqli_fetch_assoc($retval3);
				$item = $ret;
				$objeto = getItemFabricarResultado($jug,$item);
				echo "<div class=\"item\">";
				echo "<b>Fabricar:</b> {$objeto}";
				echo "<br/></div>";
				$inccon = floor($ret['cantidad']/100);
				if ($inccon > 50)
					$inccon = 50;
				$dif = $ret['dificultadhacer']-$inccon-$porsab;
				if ($dif < 0)
					$dif = 0;

				if ($ret['cantidad'] < 10)
					echo "No tienes ninguna experiencia fabricando este objeto.";
				else if ($ret['cantidad'] < 100)
					echo "Tienes un poco de experiencia fabricando este objeto.";
				else if ($ret['cantidad'] < 300)
					echo "Tienes bastante experiencia fabricando este objeto.";
				else if ($ret['cantidad'] < 500)
					echo "Estás familiarizado con la fabricación de este objeto.";
				else if ($ret['cantidad'] < 1000)
					echo "Estás muy familiarizado con la fabricación de este objeto.";
				else if ($ret['cantidad'] < 3000)
					echo "Eres un experto fabricando este objeto.";
				else if ($ret['cantidad'] < 5000)
					echo "Eres un maestro fabricando este objeto.";
				else
					echo "Eres un gran maestro fabricando este objeto.";
				echo '<br/>'; 
				$exito = 100-$dif;
				$exito = round($exito,2);
				echo "Posibilidad de éxito: <b>{$exito}</b>%<br/>";
				echo "Coste de energía: <b>{$ret['energia']}</b><br/>";
				if ($ret['perderingredientes'])
					echo "¡Perderás los ingredientes si fallas!<br/>";
				echo "Ingredientes necesarios:<br/>";
				$ketval = db_query("SELECT i.nombreobj,i.cantidad,o.tipo,o.img,o.ataq,o.prot,o.niveluso,o.usos,IFNULL(t.cantidad,0) as cantidadusuario,o.pasivas FROM ingrediente AS i join objetos AS o ON (i.nombreobj=o.nombreobj) LEFT JOIN tiene AS t ON (i.nombreobj=t.nombreobj AND t.nombrejug='{$jug}') WHERE i.resultado='{$ret['resultado']}'");
				$ketvali2 = db_query("SELECT nombreobj,cantidad FROM tiene WHERE nombrejug='{$jug}'");
				$ketval2 = db_query("SELECT nombreobj,cantidad FROM ingrediente WHERE resultado='{$ret['resultado']}'");
				$ni2 = mysqli_num_rows($ketvali2);
				$n2 = mysqli_num_rows($ketval2);
				$faltan = 0;
				for ($aa0 = 0;$aa0 < $n2 && !$faltan;$aa0++) {
					$retbb = mysqli_fetch_row($ketval2);
					$faltaeste = 1;
					for ($aa1 = 0;$aa1 < $ni2 && $faltaeste;$aa1++) {
						$retba = mysqli_fetch_row($ketvali2);
						if (($retba[0]==$retbb[0]) && ($retba[1]>=$retbb[1])) 
							$faltaeste = 0;
					}
					if ($ni2)
						mysqli_data_seek($ketvali2,0);
					if ($faltaeste)
						$faltan = 1;
				}
				$kumrows = mysqli_num_rows($ketval);
				for ($y = 0;$y < $kumrows;$y++) {
					$ket = mysqli_fetch_assoc($ketval);
					$subitem = $ket;
					$subobjeto = getItemFabricarIngrediente($jug,$subitem);
					echo "<div class=\"item\">";
					echo "{$subobjeto}";
					echo "<br/></div>";
				}
				if ($faltan) {
				echo '[te faltan ingredientes]<br/>';
				}
				else {
				if ($ret['energia'] > $us['energia'])
				  echo '[te falta energía]<br/>';
				else {
				  echo "<form action=\"fabricar.php\" method=\"post\"><div>";
				  echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
				  echo "<input type=\"hidden\" name=\"cat\" value=\"{$ret['tipo']}\"/>";
				  echo "<input type=\"hidden\" name=\"p\" value=\"1\"/>";
				  echo "<input type=\"hidden\" name=\"idob\" value=\"{$ret['img']}\"/>";
				  echo "<input type=\"submit\" name=\"fabricar\" onclick=\"return c()\" value=\"Fabricar\"/>x<input type=\"text\" name=\"cantidad\" value=\"1\" size=\"2\" maxlength=\"3\"/>";
				  echo "</div></form>";
				}
				}
				echo '<br/><br/>';
			}

			}
			mysqli_free_result($retval3);
		}
		echo "<br/><br/><a href=\"fabricar.php\">Volver</a><br/><br/>";
	}
  else {
    //db_lock("aprendido READ,objetos READ");
    $retvab = db_query("SELECT resultado,0,img FROM aprendido,objetos WHERE nombreobj=resultado AND nombrejug='{$jug}'");
    //db_unlock();
    $nrb = mysqli_num_rows($retvab);
    for ($i = 0;$i < $nrb;$i++) {
      $xen = mysqli_fetch_row($retvab);
      $sabe[$i] = $xen[0];
      $sabei[$i] = $xen[2];
    }
    mysqli_free_result($retvab);

    //db_lock("recetas READ,conoce READ");
    $retvaln = db_query("SELECT DISTINCT tipo,COUNT(*) FROM recetas,conoce WHERE conoce.nombrejug='{$jug}' AND conoce.resultado=recetas.resultado GROUP BY tipo");
    //db_unlock();
    $retn = mysqli_num_rows($retvaln);
    if ($retn) {
	  echo'
	  <script>
		function buscar(){
			var string = document.getElementById("camp_busq").value;
			string = string.trim();
			if(string == ""){
				document.getElementById("aviso").innerHTML = "¡Búsqueda inválida!";
				return false;
			}
			else{
				document.getElementById("camp_busq").value = string;
			}
		}
	</script>
	<form method="get" name="form_busqueda" action="fabricar.php" onsubmit="return buscar()">
		<input type="text" name="busqueda" id="camp_busq">
		<button type="submit">Buscar</button>
	</form>
	  ';
	  echo'<p id="aviso" style="font-weight: bold;color:red;"></p>';
      echo '<b>Ver objetos a fabricar por categoría:</b><br/><br/>';
      for ($i = 0;$i < $retn;$i++) {
        $ret = mysqli_fetch_row($retvaln);
        echo "<a href=\"fabricar.php?cat={$ret[0]}\">Categoría: {$ret[0]} ({$ret[1]} objetos)</a><br/>";
      }
    }
    else 
      echo 'Aun no sabes fabricar ningún objeto. Intenta leer libros para aprender a fabricarlos.<br/>';
    mysqli_free_result($retvaln);
    echo '<br/><br/>';
    if ($nrb) {
      echo 'Libros aprendidos completamente:<br/><br/>';
      for ($i = 0;$i < $nrb;$i++) {
        echo "<div class=\"item\"><img src=\"{$imgroot}{$sabei[$i]}.gif\" alt=\"Aprendido\"/> {$sabe[$i]}<br/></div>";
      }
      echo '<br/><br/>';
    }
  }
}

function procesaform() {
  global $_REQUEST,$tag,$jug,$confvalorventa,$conftp,$time,$imgroot,$us;

  if ((isset($_REQUEST['joyapremiumi'])) || (isset($_REQUEST['joyapremiume'])) || (isset($_REQUEST['joyapremiumf']))) {
    if (isset($_REQUEST['tag'])) {
      $gtag = $_REQUEST['tag'];
      if ($tag == $gtag) {
        if ($us['tiempopremium'] > 86400*7) {
          //db_lock("jugadores WRITE,tiene WRITE");
          $retbola = db_query("SELECT trabajopremium,fintrabajo FROM jugadores WHERE nombrejug='{$jug}'");
          $retbele = mysqli_fetch_row($retbola);
          mysqli_free_result($retbola);
          if (($time+$us['tiempopremium']-86400*7<$retbele[1]) && ($retbele[0]) && (!$us['moderador']) && (!$us['enchufado'])) {
            $_SESSION['error'] = 'Estás realizando un trabajo premium y no te queda suficiente tiempo premium, deja de trabajar antes de intentar fabricar una joya premium.';
          }
          else {
            db_query("UPDATE jugadores SET premiumhasta=premiumhasta-86400*7 WHERE nombrejug='{$jug}'");
            dale_objeto($jug,'Joya premium');
            $_SESSION['mensaje'] = 'Has convertido una semana premium en una joya premium.';
          }
          //db_unlock();
        }
        else
          $_SESSION['error'] = 'No tienes suficiente tiempo premium.';
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    if (isset($_REQUEST['joyapremiumf']))
      header('Location: fabricar.php');
    if (isset($_REQUEST['joyapremiumi']))
      header('Location: inventario.php');
    if (isset($_REQUEST['joyapremiume']))
      header('Location: estado.php');
    return 1;
  }
  if (isset($_REQUEST['fabricar'])) {
    $salirnow = 0;
    if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idob'])) && (isset($_REQUEST['cantidad']))) {
      $gtag = $_REQUEST['tag'];
      $idob = $_REQUEST['idob'];
      $cantidad = floor($_REQUEST['cantidad']);
      if (($tag == $gtag) && (preg_match('/^[a-z]+$/',$idob)) && (is_numeric($cantidad)) && ($cantidad > 0)) {
        //db_lock("jugadores WRITE,recetas READ,objetos READ,ingrediente READ,tiene WRITE,conoce WRITE,mensajes WRITE");
		$retsab = db_query("SELECT sabiduria FROM jugadores WHERE nombrejug='{$jug}'");
		$sabi = mysqli_fetch_row($retsab);
		$porsab = $sabi[0] / 6;
		$porsab = round($porsab,2);
		mysqli_free_result($retsab);
        $retvalo = db_query("SELECT energia,resultado,dificultadhacer,perderingredientes,cantidadresultado,img,recetas.tipo FROM recetas,objetos WHERE objetos.nombreobj=recetas.resultado AND objetos.img='{$idob}'");
        if (mysqli_num_rows($retvalo)) {
          $retval = db_query("SELECT energia FROM jugadores WHERE nombrejug='{$jug}'");
          $ret = mysqli_fetch_row($retval);
          mysqli_free_result($retval);
          $reto = mysqli_fetch_row($retvalo);
          $consume = $reto[0]*$cantidad;
          if ($ret[0]>=$consume) {
            $ketvali2 = db_query("SELECT nombreobj,cantidad FROM tiene WHERE nombrejug='{$jug}'");
            $ketval2 = db_query("SELECT nombreobj,cantidad*{$cantidad} FROM ingrediente WHERE resultado='{$reto[1]}'");
            $ni2 = mysqli_num_rows($ketvali2);
            $n2 = mysqli_num_rows($ketval2);
            $faltan = 0;
            for ($aa0 = 0;$aa0 < $n2 && !$faltan;$aa0++) {
              $retbb = mysqli_fetch_row($ketval2);
              $faltaeste = 1;
              for ($aa1 = 0;$aa1 < $ni2 && $faltaeste;$aa1++) {
                $retba = mysqli_fetch_row($ketvali2);
                if (($retba[0]==$retbb[0]) && ($retba[1]>=$retbb[1]))
                  $faltaeste = 0;
              }
              if ($ni2)
                mysqli_data_seek($ketvali2,0);
              if ($faltaeste)
                $faltan = 1;
            }
            if (!$faltan) {
              db_query("UPDATE jugadores SET energia=energia-{$consume} WHERE nombrejug='{$jug}'");
              $retvelo = db_query("SELECT cantidad FROM conoce WHERE nombrejug='{$jug}' AND resultado='{$reto[1]}'");
              $rete = mysqli_fetch_row($retvelo);
              mysqli_free_result($retvelo);
              $inccon = floor($rete[0]/100);
              if ($inccon > 50)
                $inccon = 50;
              $total = rand(0,100)+$inccon;
              $creados = $cantidad*$reto[4];
			  $diff = $reto[2]-$porsab;
			  if($diff <= 0){
				  $diff = 0;
			  }
              if ($total >= $diff) {
                $ketvoy = db_query("SELECT objetos.nombreobj,cantidad,img FROM objetos,ingrediente WHERE resultado='{$reto[1]}' AND objetos.nombreobj=ingrediente.nombreobj");
                $nk = mysqli_num_rows($ketvoy);
                for ($i = 0;$i < $nk;$i++) {
                  $kk = mysqli_fetch_row($ketvoy);
                  quita_objeto($jug,$kk[0],$kk[2],$kk[1]*$cantidad);
                }
                mysqli_free_result($ketvoy);
                dale_objeto($jug,$reto[1],$creados);
                db_query("UPDATE conoce SET cantidad=cantidad+{$cantidad} WHERE nombrejug='{$jug}' AND resultado='{$reto[1]}'");
                $_SESSION['mensaje'] = 'Objeto fabricado con éxito.';
                db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',{$time},'Has creado con éxito <img src=\"{$imgroot}{$reto[5]}.gif\" alt=\"{$reto[6]}\"/><b>x{$creados} {$reto[1]}</b>.')");
              }
              else {
                $_SESSION['mensaje'] = 'Has fallado fabricando el objeto.';
                if ($reto[3]) {
                $ketvoy = db_query("SELECT objetos.nombreobj,cantidad,img FROM objetos,ingrediente WHERE resultado='{$reto[1]}' AND objetos.nombreobj=ingrediente.nombreobj");
                $nk = mysqli_num_rows($ketvoy);
                for ($i = 0;$i < $nk;$i++) {
                  $kk = mysqli_fetch_row($ketvoy);
                  quita_objeto($jug,$kk[0],$kk[2],$kk[1]*$cantidad);
                }
                mysqli_free_result($ketvoy);
                db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',{$time},'No has conseguido crear <img src=\"{$imgroot}{$reto[5]}.gif\" alt=\"{$reto[6]}\"/><b>x{$creados} {$reto[1]}</b>, has perdido la energía y los ingredientes.')");
                }
                else {
                db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$jug}','@',{$time},'No has conseguido crear <img src=\"{$imgroot}{$reto[5]}.gif\" alt=\"{$reto[6]}\"/><b>x{$creados} {$reto[1]}</b>, has perdido la energía aunque no los ingredientes.')");
                }
              }
              $salirnow = 1;
			  include_once 'auxiliar/f_logros.php';
			  for ($k=23;$k<27;$k++)
				check_logro($k,$jug);
			  for ($k=42;$k<45;$k++)
				check_logro($k,$jug);
            }
            else
              $_SESSION['error'] = 'Te faltan ingredientes para fabricar esos objetos.';
            mysqli_free_result($ketval2);
          }
          else
            $_SESSION['error'] = 'No tienes energía suficiente para fabricar esos objetos.';
        }
        else
          $_SESSION['error'] = 'No puedes crear ese objeto.';
        mysqli_free_result($retvalo);
        //db_unlock();
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor! (es válida la cantidad?)';
    }
    if (isset($_REQUEST['cat']))
      $cat = check_itemname($_REQUEST['cat']);
    else
      $cat = '';
    if (isset($_REQUEST['p']))
      $p = $_REQUEST['p'];
    else
      $p = '';
    if ($salirnow)
      header('Location: mensajeria.php');
    else
      header("Location: fabricar.php?cat={$cat}&p={$p}");
    return 1;
  }
}

?>
