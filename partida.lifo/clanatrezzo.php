<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$time,$us,$conftp,$imgroot,$confmail,$tag;
	$retval = db_query("SELECT clan FROM {$conftp}clandata WHERE nombrejug='{$jug}'");
	$retval2 = db_query("SELECT clan FROM {$conftp}claninsignia WHERE clan='{$us['clan']}'");
	$numrows = mysqli_num_rows($retval);
	$numrows2 = mysqli_num_rows($retval2);
	mysqli_free_result($retval);
	if (($us['clan'] != '(ninguno)') && ($numrows) && (!$numrows2)) {
		techo("Esta es la pestaña de atrezzo para clanes. Desde aquí puedes colocar una insignia a tu clan siempre y cuando cuentes con una insignia de atrezzo.<br>Las insignias de atrezzo se fabrican con el Tomo de diseño de atrezzo<img src=\"{$imgroot}lda.gif\">.<br>Además, establecer la insignia te costará 50 esquirlas de joya premium.");
		$retval = db_query("SELECT o.nombreobj, t.cantidad, o.img FROM {$conftp}tiene AS t JOIN {$conftp}objetos as o ON (t.nombreobj = o.nombreobj) WHERE o.tipo = 'Atrezzo' AND t.nombrejug='{$jug}'");
		$retval2 = db_query("SELECT cantidad FROM tiene WHERE nombreobj='Esquirla de joya premium' AND nombrejug='{$jug}'");
		$numrows2 = mysqli_num_rows($retval2);
		if ($numrows2 > 0) {
			$retesqui = mysqli_fetch_assoc($retval2);
			$canti = $retesqui['cantidad'];
		} else {
			$canti = 0;
		}
		echo 'Actualmente tienes <strong>x'.$canti.'</strong> <img src="'.$imgroot.'rpreme.gif"> Esquirla de joya premium.';
		$numrows = mysqli_num_rows($retval);
		if ($numrows > 0) {
			echo '<p>Insignias disponibles:</p>';
			for ($i=0;$i<$numrows;$i++) {
				$ret=mysqli_fetch_assoc($retval);
				if ($ret['cantidad'] == null) {
					$can = 0;
				} else {
					$can = $ret['cantidad'];
				}
				echo "<p><form method=\"post\" action=\"clanatrezzo.php\">
					<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
					<input type=\"hidden\" name=\"itt\" value=\"{$ret['img']}\"/>";
				if ($canti < 50) {
					echo "[Esquirlas insuficientes]";
				} else {
					echo "<input type=\"submit\" name=\"add\" value=\"Establecer\" onclick=\"return c(' \\nEstablecerás esta insignia para tu clan por un costo de 50 Esquirlas de joya premium.')\">";
				}
				echo " <label><strong>x{$can}</strong> <img src=\"{$imgroot}{$ret['img']}.gif\"> {$ret['nombreobj']}</label></form></p>";
			}
		} else {
			echo "<br><strong>Actualmente no tienes ninguna insignia de atrezzo.</strong><br>Fabrica u obten alguna para poder establecerla a tu clan.<br>";
		}
		echo "<br><a href=\"clanes.php\">Volver</a>";
	} else {
		$_SESSION['error'] = 'No eres lider de ningún clan actualmente o tu clan ya tiene insignia.';
		header('Location: clanes.php');
		return 1;
	}
}

function procesaform() {
	global $_REQUEST,$tag,$jug,$us,$time,$conftp;
	if (isset($_REQUEST['add'])) {
		$loc='clanatrezzo';
		if ((isset($_REQUEST['tag']))) {
			$gtag = $_REQUEST['tag'];
			if ($tag == $gtag) {
				$retval = db_query("SELECT clan FROM {$conftp}clandata WHERE nombrejug='{$jug}'");
				$numrows = mysqli_num_rows($retval);
				mysqli_free_result($retval);
				if (($us['clan'] != '(ninguno)') && ($numrows)) {
					$retval = db_query("SELECT clan FROM {$conftp}claninsignia WHERE clan='{$us['clan']}'");
					$filas = mysqli_num_rows($retval);
					if ($filas == 0) {
						mysqli_free_result($retval);
						$itt = $_REQUEST['itt'];
						$retval = db_query("SELECT t.nombreobj FROM {$conftp}tiene AS t JOIN {$conftp}objetos as o ON (t.nombreobj = o.nombreobj) WHERE o.img='{$itt}' AND t.nombrejug='{$jug}'");
						$ret = mysqli_fetch_array($retval);
						$objeto = $ret[0];
						$filas = mysqli_num_rows($retval);
						if ($filas > 0) {
							mysqli_free_result($retval);
							$retval = db_query("SELECT cantidad FROM tiene WHERE nombreobj='Esquirla de joya premium' AND nombrejug='{$jug}'");
							if ($retval != null) {
								$retesqui = mysqli_fetch_assoc($retval);
								$canti = $retesqui['cantidad'];
							} else {
								$retesqui = null;
								$canti = 0;
							}
							if ($canti >= 50) {
								quita_objeto($jug,$objeto,$itt,1);
								quita_objeto($jug,'Esquirla de joya premium','rpreme',50);
								db_query("INSERT INTO {$conftp}claninsignia VALUES ('{$us['clan']}','{$itt}')");
								$_SESSION['mensaje'] = 'Insignia establecida con éxito.';
								$loc='clanes';
							} else {
								$_SESSION['error'] = 'No tienes suficientes esquirlas.';
							}
						} else {
							$_SESSION['error'] = 'No tienes esa insignia de atrezzo.';
						}
					} else {
						$_SESSION['error'] = 'Tu clan tiene ya insignia.';
						$loc='clanes';
					}
				} else {
					$_SESSION['error'] = 'No eres lider de ese clan';
					$loc='clanes';
				}
			} else{
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header('Location: '.$loc.'.php');
		return 1;
	}
}
?>