<?php
$form = 1;
include('core.php');
function iweb()
{
	if (!isset($_SESSION['mercaderambulante']) || $_SESSION['mercaderambulante'] != 1) {
		$_SESSION['error'] = 'No hay nada por aquí, parece que el mercader ambulante no ha llegado aún.';
		header('Location: estado.php');
		exit();
	}

	techo("¡Hola! ¡Hola amigo! ¿Querer cosas? Amigo yo vender cosas, todo buen precio. Si a ti gustar quizás poder hacer trato.<br>Tener escorpión, tener piedra blanca del mar, tener helado...<br>
	¿Qué querer? ¿Trato?");

	echo "<p><b>El mercader ambulante abre su bolsa y te enseña lo que tiene para ofrecer:</b><br></p>";

	// Tabla //
	echo '<table cellspacing="0"><thead style="text-align: center;"><tr><th></th><th>Ofrecido</th><th>-</th><th>Pedido</th></tr></thead>';
	echo '<tbody">';

	$ofertas = array();
	$of = db_query("SELECT DISTINCT(idoferta) FROM ofertasambulante");
	while ($off = mysqli_fetch_array($of))
		array_push($ofertas, $off[0]);
	for ($i = 0; $i < count($ofertas); $i++) {
		$objOfrecidos = array();
		$canOfrecidos = array();
		$objPedidos = array();
		$canPedidos = array();
		$oferta = db_query("SELECT * FROM ofertasambulante WHERE idoferta={$ofertas[$i]} AND ofrecido=1");
		for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
			$obj = mysqli_fetch_assoc($oferta);
			array_push($objOfrecidos, $obj['nombreobj']);
			array_push($canOfrecidos, $obj['cantidad']);
		}
		$oferta = db_query("SELECT * FROM ofertasambulante WHERE idoferta={$ofertas[$i]} AND ofrecido=0");
		for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
			$obj = mysqli_fetch_assoc($oferta);
			array_push($objPedidos, $obj['nombreobj']);
			array_push($canPedidos, $obj['cantidad']);
		}
		echo getRowOferta($ofertas[$i], $objOfrecidos, $canOfrecidos, $objPedidos, $canPedidos, $i % 2);
	}
	echo '</tbody></table>';
	// //
}
function procesaform()
{
	global $_POST, $tag, $jug, $time, $imgroot;
	if (!isset($_SESSION['mercaderambulante']) || $_SESSION['mercaderambulante'] != 1) {
		$_SESSION['error'] = 'No hay nada por aquí, parece que el mercader ambulante no ha llegado aún.';
		header('Location: estado.php');
		exit();
	} else {
		if (isset($_POST['intercambiar'])) {
			if ((isset($_POST['tag']))) {
				$gtag = $_POST['tag'];
				if ($tag == $gtag) {
					if (isset($_POST['oferta']) && mysqli_num_rows(db_query("SELECT * FROM ofertasambulante WHERE idoferta={$_POST['oferta']}"))) {
						$idOferta = $_POST['oferta'];
						$objOfrecidos = array();
						$canOfrecidos = array();
						$objPedidos = array();
						$canPedidos = array();
						$oferta = db_query("SELECT * FROM ofertasambulante WHERE idoferta={$idOferta} AND ofrecido=1");
						for ($i = 0; $i < mysqli_num_rows($oferta); $i++) {
							$obj = mysqli_fetch_assoc($oferta);
							array_push($objOfrecidos, $obj['nombreobj']);
							array_push($canOfrecidos, $obj['cantidad']);
						}
						$oferta = db_query("SELECT * FROM ofertasambulante WHERE idoferta={$idOferta} AND ofrecido=0");
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
							$mens = 'Un placer hacer negocios, ahora tener que marchar. ¡Esperar vernos pronto de nuevo, amigo!<br><i>-Dice el mercader mientras se aleja-</i><br><br>';
							$mens .= 'Has realizado un intercambio con el mercader ambulante.<br><br>Intercambiaste:<br>';
							for ($i = 0; $i < count($objPedidos); $i++) {
								$objid = getObjId($objPedidos[$i]);
								quita_objeto($jug, $objPedidos[$i], $objid, $canPedidos[$i]);
								$mens .= '<img src="' . $imgroot . $objid .'.gif"/> <b>'.$canPedidos[$i].'</b> '.$objPedidos[$i].'<br>';
							}
							$mens .= '<br>Por lo siguiente:<br>';
							for ($i = 0; $i < count($objOfrecidos); $i++) {
								$objid = getObjId($objOfrecidos[$i]);
								dale_objeto($jug, $objOfrecidos[$i], $canOfrecidos[$i]);
								$mens .= '<img src="' . $imgroot . $objid .'.gif"/> <b>x'.$canOfrecidos[$i].'</b> '.$objOfrecidos[$i].'<br>';
							}
							$mens .= '<br>¡Genial!';
							db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',$time,'{$mens}','Intercambios')");
							$_SESSION['mercaderambulante'] = 0;
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
