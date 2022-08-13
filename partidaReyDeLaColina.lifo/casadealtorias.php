<?php
$form = 1;
include('core.php');
function iweb()
{
	global $time, $imgroot,$tag;
	if (!(get_hora($time) == 5 && get_minutos($time) >= 0 && get_minutos($time) <= 59)) {
		$_SESSION['error'] = '"<b>No puedes pasar.</b>" <i>-Un gnomo mágico te impide la entrada. Parece que tendrás que volver en otro momento, cuando el gnomo no esté.-</i>';
		header('Location: estado.php');
		exit();
	}

	echo '<table style="width: 100%;"><tr><td align="center">';
	echo '<p>No tienes muy claro como, pero has conseguido llegar al centro del corazón del bosque de Lifo.<br/>
	En frente de ti ves la casa donde habita el mago Altorias. ¿Qué harás ahora?</p>';
	echo '<img src="' . $imgroot . 'casaaltorias.png" alt="Casa de Altorias" style="border: 3px ridge grey;">';

	echo '<br><br>
	<form action="casadealtorias.php" method="post">
	<input type="hidden" name="tag" value="'.$tag.'"/>
	<input class="btn_Enchant" style="background-image: none; cursor: pointer;" type="submit" name="tocartimbre" value="Llamar a la puerta" alt="Llamar a la puerta"/>
	</form>';

	echo '</td></tr></table>';
}
function procesaform()
{
	global $_POST, $tag, $jug, $time, $imgroot;
	if (isset($_POST['tocartimbre'])) {
		if ((isset($_POST['tag']))) {
			$gtag = $_POST['tag'];
			if ($tag == $gtag) {
				$tiene = db_query("SELECT * FROM tiene WHERE nombrejug='{$jug}' AND nombreobj='Sextante de Altorias'");
				if (mysqli_num_rows($tiene)) {
					quita_objeto($jug, 'Sextante de Altorias', 'sextante', 1);
					dale_objeto($jug, 'Joya antigua', 1);
					$mens = '¡Hola ' . $jug . '!,<br>Muchas gracias por darme uno de mis sextantes. No sé donde lo habrás encontrado pero bendito seas. Mil gracias.<br><br>...<br><br>
					Ah sí, espera, tengo algo para tí.<br>
					Toma, por si te sirve de algo. Yo una vez anduve en su busca, pero nunca conseguí encontrar las partes que me faltaban.<br>';
					$mens .= '<br>-<i>Junto al magifax, Altorias te envía</i> <img src="' . $imgroot . 'joyaantigua.gif"/> <b>x1</b> Joya antigua -<br>';
					db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','Altorias',$time,'{$mens}','Hazaña')");
					$_SESSION['mensaje'] = 'Dejas el sextante de Altorias en la puerta y te marchas del bosque sin molestar.';
					header('Location: estado.php');
					return 1;
				} else {
					$num = rand(0, 9);
					switch ($num) {
						case 0:
							$_SESSION['error'] = '<b>[Altorias]:</b> ¿Qué quieres? ¿No ves que estoy ocupado?';
							break;
						case 1:
							$_SESSION['error'] = '<b>[Altorias]:</b> No sé como has llegado hasta aquí, ¡ahora vete!';
							break;
						case 2:
							$_SESSION['error'] = '<b>[Altorias <i>murmura</i>]:</b> Quizás si añado un poco de esencia... no no no, demasiada esencia.';
							break;
						case 3:
							$_SESSION['error'] = '<b>[Altorias <i>murmura</i>]:</b> Me pregunto donde habré dejado mi sextante, es justo lo que necesito ahora mismo.';
							break;
						case 4:
							$_SESSION['error'] = '<b>[Altorias]:</b> Había una vez un aspirante que no dejaba tranquilo a un mago. Fin de la historia, ¡ahora largo!';
							break;
						case 5:
							$_SESSION['error'] = '<b>[Altorias]:</b> ¿Qué haces aquí? ¿Eres mago?';
							break;
						case 6:
							$_SESSION['error'] = '<b>[Altorias <i>murmura</i>]:</b> Haber contratado a ese gnomo para que vigile la casa ha sido una buena idea.';
							break;
						case 7:
							$_SESSION['error'] = '<b>[Altorias]:</b> La palabra vencedor empieza por uve. Por uve también empieza ¡Vete de mi casa!';
							break;
						case 8:
							$_SESSION['error'] = '<b>[Altorias <i>murmura</i>]:</b> Quién me iba a decir que la poción de sangre de dragón no se hace con sangre real, si no que se usan alas.';
							break;
						case 9:
							$_SESSION['error'] = '<b>[Altorias <i>murmura</i>]:</b> ¿Donde estará ese gnomo cuando lo necesito? No le pago con oro adimensional para que no haga nada.';
							break;
					}
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header('Location: casadealtorias.php');
		return 1;
	}
}
