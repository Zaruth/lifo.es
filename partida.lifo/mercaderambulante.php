<?php
$form = 1;
include('core.php');
function iweb()
{
	global $jug, $time, $conf_numHorasMercader, $confdbname;

	$ma_aparece = mysqli_fetch_array(db_query("SELECT hora FROM lifoes_especial.ma_aparece WHERE partida LIKE '{$confdbname}'"))[0];
	$diff = l_getdate($time) - $ma_aparece;
	if ($diff > $conf_numHorasMercader * 3600 && $diff >= 0) {
		$_SESSION['error'] = 'No hay nada por aquí, parece que el mercader ambulante no ha llegado aún.' . (l_getdate($time) - $ma_aparece);
		header('Location: estado.php');
		exit();
	}

	techo("¡Hola! ¡Hola amigo! ¿Querer cosas? Amigo yo vender cosas, todo buen precio. Si a ti gustar quizás poder hacer negocios.<br><br>
	¿Qué querer? ¿Trato?");



	$of_aceptadas = mysqli_fetch_array(db_query("SELECT COUNT(*) FROM ofertasaceptadas WHERE nombrejug LIKE '{$jug}' AND unica=0"))[0];
	$of = db_query("SELECT DISTINCT(idoferta) FROM lifoes_especial.ma_ofertado WHERE partida LIKE '{$confdbname}'");
	if ($of_aceptadas < mysqli_num_rows($of)) {
		echo "<p><b>El mercader ambulante abre su bolsa y te enseña lo que tiene para ofrecer:</b></p><br>";

		// Tabla //
		echo '<table cellspacing="0"><thead style="text-align: center;"><tr><th></th><th>Ofrecido</th><th>-</th><th>Pedido</th></tr></thead>';
		echo '<tbody>';

		$ofertas = array();
		$of_acep = db_query("SELECT DISTINCT(idoferta) FROM ofertasaceptadas WHERE nombrejug LIKE '{$jug}' AND unica=0");
		while ($off = mysqli_fetch_array($of))
			array_push($ofertas, $off[0]);
		$aceptadas = array();
		while ($off = mysqli_fetch_array($of_acep))
			array_push($aceptadas, $off[0]);
		for ($i = 0; $i < count($ofertas); $i++) {
			if (!in_array($ofertas[$i], $aceptadas)) {
				$objOfrecidos = array();
				$canOfrecidos = array();
				$objPedidos = array();
				$canPedidos = array();
				$oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=1");
				for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
					$obj = mysqli_fetch_assoc($oferta);
					array_push($objOfrecidos, $obj['nombreobj']);
					array_push($canOfrecidos, $obj['cantidad']);
				}
				$oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=0");
				for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
					$obj = mysqli_fetch_assoc($oferta);
					array_push($objPedidos, $obj['nombreobj']);
					array_push($canPedidos, $obj['cantidad']);
				}
				echo getRowOferta($ofertas[$i], $objOfrecidos, $canOfrecidos, $objPedidos, $canPedidos, $i % 2);
			}
		}
		echo '</tbody></table>';
		// //
	} else {
		echo "<p><b>[Mercader]:</b> ¡Vaya amigo!, parecer que no quedar objetos en esta bolsa.</p><br>";
	}

	$of_unicas = db_query("SELECT DISTINCT(idoferta) FROM lifoes_especial.ma_ofertas WHERE unica=1");
	$of_aceptadas_unicas = db_query("SELECT DISTINCT(idoferta) FROM ofertasaceptadas WHERE nombrejug LIKE '{$jug}' AND unica=1");

	if (mysqli_num_rows($of_unicas) > mysqli_num_rows($of_aceptadas_unicas)) {
		echo "<br><br><p><b>El mercader saca también otra bolsa dorada y te enseña otros objetos únicos que quizás te interesen:</b></p><br>";

		// Tabla //
		echo '<table cellspacing="0"><thead style="text-align: center;"><tr><th></th><th>Ofrecido</th><th>-</th><th>Pedido</th></tr></thead>';
		echo '<tbody>';

		$ofertas = array();
		while ($off = mysqli_fetch_array($of_unicas))
			array_push($ofertas, $off[0]);
		$aceptadas = array();
		while ($off = mysqli_fetch_array($of_aceptadas_unicas))
			array_push($aceptadas, $off[0]);
		for ($i = 0; $i < count($ofertas); $i++) {
			if (!in_array($ofertas[$i], $aceptadas)) {
				$objOfrecidos = array();
				$canOfrecidos = array();
				$objPedidos = array();
				$canPedidos = array();
				$oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=1");
				for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
					$obj = mysqli_fetch_assoc($oferta);
					array_push($objOfrecidos, $obj['nombreobj']);
					array_push($canOfrecidos, $obj['cantidad']);
				}
				$oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=0");
				for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
					$obj = mysqli_fetch_assoc($oferta);
					array_push($objPedidos, $obj['nombreobj']);
					array_push($canPedidos, $obj['cantidad']);
				}
				echo getRowOferta($ofertas[$i], $objOfrecidos, $canOfrecidos, $objPedidos, $canPedidos, $i % 2);
			}
		}
		echo '</tbody></table>';
		// //
	}
}
function procesaform()
{
	global $_POST, $tag, $jug, $time, $imgroot, $conf_numHorasMercader, $confdbname;
	$ma_aparece = mysqli_fetch_array(db_query("SELECT hora FROM lifoes_especial.ma_aparece WHERE partida LIKE '{$confdbname}'"))[0];
	$diff = l_getdate($time) - $ma_aparece;
	if ($diff > $conf_numHorasMercader * 3600 && $diff >= 0) {
		$_SESSION['error'] = 'No hay nada por aquí, parece que el mercader ambulante no ha llegado aún.';
		header('Location: estado.php');
		exit();
	} else {
		if (isset($_POST['intercambiar'])) {
			if ((isset($_POST['tag']))) {
				$gtag = $_POST['tag'];
				if ($tag == $gtag) {
					if (isset($_POST['oferta']) && (
						mysqli_num_rows(db_query("SELECT * FROM lifoes_especial.ma_ofertado WHERE partida LIKE '{$confdbname}' AND idoferta={$_POST['oferta']}")) ||
						mysqli_num_rows(db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$_POST['oferta']} AND unica=1"))
					)) {
						$idOferta = $_POST['oferta'];
						$objOfrecidos = array();
						$canOfrecidos = array();
						$objPedidos = array();
						$canPedidos = array();
						$oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$idOferta} AND ofrecido=1");
						$unica = 0;
						for ($i = 0; $i < mysqli_num_rows($oferta); $i++) {
							$obj = mysqli_fetch_assoc($oferta);
							array_push($objOfrecidos, $obj['nombreobj']);
							array_push($canOfrecidos, $obj['cantidad']);
							$unica = $obj['unica'];
						}
						$oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$idOferta} AND ofrecido=0");
						for ($i = 0; $i < mysqli_num_rows($oferta); $i++) {
							$obj = mysqli_fetch_assoc($oferta);
							array_push($objPedidos, $obj['nombreobj']);
							array_push($canPedidos, $obj['cantidad']);
						}

						$puede = true;
						for ($i = 0; $i < count($objPedidos) && $puede; $i++) {
							$puede = tieneItem($jug, $objPedidos[$i], $canPedidos[$i]);
						}
						if ($puede) {
							$mens = '¡Un placer hacer negocios, amigo!<br><i>-Dice el mercader mientras se frota las manos-</i><br><br>';
							$mens .= 'Has realizado un intercambio con el mercader ambulante.<br><br>Intercambiaste:<br>';
							for ($i = 0; $i < count($objPedidos); $i++) {
								$objid = getObjId($objPedidos[$i]);
								quita_objeto($jug, $objPedidos[$i], $objid, $canPedidos[$i]);
								$mens .= '<img src="' . $imgroot . $objid . '.gif"/> <b>' . $canPedidos[$i] . '</b> ' . $objPedidos[$i] . '<br>';
							}
							$mens .= '<br>Por lo siguiente:<br>';
							for ($i = 0; $i < count($objOfrecidos); $i++) {
								$objid = getObjId($objOfrecidos[$i]);
								dale_objeto($jug, $objOfrecidos[$i], $canOfrecidos[$i]);
								$mens .= '<img src="' . $imgroot . $objid . '.gif"/> <b>x' . $canOfrecidos[$i] . '</b> ' . $objOfrecidos[$i] . '<br>';
							}
							$mens .= '<br>¡Genial!';
							db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',$time,'{$mens}','Intercambios')");
							$_SESSION['mercaderambulante'] = 0;

							db_query("INSERT INTO `ofertasaceptadas`(`nombrejug`, `idoferta`, `unica`) VALUES ('{$jug}',{$idOferta},{$unica})");

							header('Location: mensajeria.php');
							return 1;
						} else {
							$_SESSION['error'] = 'Parecer que faltar objetos a amigo. ¡Revisar primero lo que tener antes de intercambiar!';
						}
					} else {
						$_SESSION['error'] = 'Yo no ofertar eso, amigo. Elegir entre lo que yo ofrecer.';
					}
				} else {
					$_SESSION['error'] = '¡Intentar de nuevo, por favor amigo!';
				}
			}
			header('Location: mercaderambulante.php');
			return 1;
		}
	}
}
