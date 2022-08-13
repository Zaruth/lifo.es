<?php
$form = 1;
include('core.php');
function iweb()
{
	global $jug, $_REQUEST, $tag, $time, $conftp, $_SESSION, $vfor, $us, $imgroot, $confnivelforo, $confnivelmensaj;

	techo('Bienvenido al foro, donde podrás hablar con los demás jugadores.');
	if (isset($_REQUEST['p']))
		$p = $_REQUEST['p'];
	else
		$p = 1;
	if (!is_numeric($p))
		$p = 1;
	if ($p < 1)
		$p = 1;

	if ($vfor)
		$dovfor = 1;
	else
		$dovfor = 0;
	$vfor = 0;
	$_SESSION['vfor'] = 0;
	$ini = ($p - 1) * 15;
	$fin = $p * 15;

	if (isset($_REQUEST['id']))
		$id = $_REQUEST['id'];
	else
		$id = 0;
	if (!is_numeric($id))
		$id = 0;
	if ($id < 1)
		$id = 0;

	if (($us['admin']) || ($us['moderador']))
		$esmodera = 1;
	else
		$esmodera = 0;

	if (isset($_REQUEST['rme'])) {
		$responderm = $_REQUEST['rme'];
		$idmensaje = $_REQUEST['idmensaje'];
	}
	if (isset($_REQUEST['hi']))
		$hi = $_REQUEST['hi'];

	if (isset($responderm)) {
		$retval = db_query("SELECT nombre,cerrada FROM forohebras WHERE id={$id}");
		$retval2 = db_query("
		SELECT foromensajes.nombrejug,hora,texto,insignia,clan,idmensaje 
			FROM foromensajes,jugadores 
				WHERE jugadores.nombrejug=foromensajes.nombrejug AND idhebra={$id} AND idmensaje={$idmensaje}");
		$retval3 = db_query("SELECT COUNT(*) FROM foromensajes WHERE idhebra={$id}");
		$numrows = mysqli_num_rows($retval2);
		$ret = mysqli_fetch_row($retval);
		$cerrada = $ret[1];
		mysqli_free_result($retval);
		$ret2 = mysqli_fetch_row($retval3);
		mysqli_free_result($retval3);
		echo "<div><b>{$ret[0]}</b></div><br/>";
		for ($i = 0; $i < $numrows; $i++) {
			$ret = mysqli_fetch_row($retval2);
			$dia = ahora_dia($ret[1]);
			$hora = ahora_hora($ret[1]);
			$insignia = getInsigniaJug($ret[0]);
			if ($ret[4] == '(ninguno)')
				$suclan = '';
			else {
				$insigniac = "";
				$retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[4]}'");
				if (mysqli_num_rows($retvalic) == 1) {
					$retic = mysqli_fetch_row($retvalic);
					$insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
				}
				mysqli_free_result($retvalic);
				$suclan = "del clan {$insigniac} <b>{$ret[4]}</b> ";
			}
			if ($esmodera)
				echo "<form>";
			echo "<div>";
			if ($esmodera) {
				echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
				echo "<input type=\"hidden\" name=\"id\" value=\"{$id}\"/>";
				echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
				echo "<input type=\"hidden\" name=\"idmensaje\" value=\"{$ret[5]}\"/>";
				echo "<input type=\"submit\" name=\"eliminarm\" onclick=\"return c('Como moderador debe eliminar únicamente los mensajes realmente problemáticos.')\" value=\"Eliminar\"/> ";
			}
			if (isset($_COOKIE['oculttitulos']))
				echo "- {$insignia} <b>" . $ret[0] . "</b> {$suclan}dijo en {$dia} {$hora}: <br/>{$ret[2]}";
			else
				echo "- {$insignia} " . getName($ret[0], 1) . " {$suclan}dijo en {$dia} {$hora}: <br/>{$ret[2]}";
			echo "</div>";
			if ($esmodera)
				echo "</form>";
			echo "<br/>";
		}
		mysqli_free_result($retval2);
		$npags = $ret2[0] / 15;
		$npag = floor($npags);
		if ($npag != $npags)
			$npag++;
		if ($npag > 1) {
			echo "Página: ";
			$ini = $p - 3;
			$fin = $p + 3;
			if ($ini < 1)
				$ini = 1;
			if ($fin > $npag)
				$fin = $npag;
			if ($ini > 1)
				echo '... ';
			for ($i = $ini; $i <= $fin; $i++) {
				if ($i != $p)
					echo "<a href=\"foro.php?id={$id}&amp;p={$i}\">{$i}</a> ";
				else
					echo "<b>{$i}</b> ";
			}
			if ($fin < $npag)
				echo '... ';
		}
		echo '<br/><br/>';
		echo "<a href=\"foro.php?id={$id}&p={$p}\">Volver a la hebra</a>";
		if (isset($_SESSION['lasttext'])) {
			$lasttext = stripslashes($_SESSION['lasttext']);
			unset($_SESSION['lasttext']);
		} else
			$lasttext = '';

		echo '<br/><br/>';
		echo '<form action="foro.php" method="post">';
		echo '<div>';
		echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
		echo "<input type=\"hidden\" name=\"id\" value=\"{$id}\"/>";
		echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
		echo "<input type=\"hidden\" name=\"idmensaje\" value=\"{$idmensaje}\"/>";
		if ($_SESSION['silenciado']) {
			$dia_t = ahora_dia($_SESSION['silenciado']);
			$hora_t = ahora_hora($_SESSION['silenciado']);
			$conan = db_query("SELECT motivo FROM silencio WHERE horafin>{$time} ORDER BY horafin LIMIT 1");
			$motivo = mysqli_fetch_array($conan);
			if ($motivo[0] == '') {
				$motivo[0] = 'No especificado.';
			}
			echo "<font color=\"red\">Estás siendo silenciado por un moderador, no puedes enviar mensajes hasta el {$dia_t} a las {$hora_t}.<br><b>MOTIVO: {$motivo[0]}</b></font>";
		} else {
			$tabla = "<table id=\"mensajet\">
				<tr>
					<td>Respuesta al mensaje<br/>
					<hr/><br/>
					Texto:<br/>
					<textarea name=\"mensaje\" rows=\"7\" cols=\"60\">{$lasttext}</textarea><br/>
					<br/>";
			if ($us['admin'] == 1 || $us['moderador'] == 1)
					$tabla .= "<input type=\"checkbox\" name=\"html\" value=\"si\"> Texto Html";
			$tabla .= "<br/>
					<input type=\"submit\" name=\"nuevarespuesta2\" onclick=\"return filterHOYGAN(this.form.mensaje.value) && c('Si escribe en el foro público insultos o palabras malsonantes, o amenazas fuera del sentido del juego, su cuenta podrá ser cerrada.')\" value=\"Responder\"/>
					</td>
				</tr>
				</table>";
			if ($us['admin'] == 1 || $us['moderador'] == 1) {
				echo $tabla;
			} else {
				if ($cerrada == 0) {
					if ($us['nivel'] >= $confnivelforo) {
						echo $tabla;
					} else {
						echo "<table id=\"mensajet\"><tr><td><font color=\"red\">Nivel insuficiente</font></tr><tr><td>Necesitas ser nivel <b>{$confnivelmensaj}</b> o más para poder comentar en el foro.<td></tr></table>";
					}
				} else {
					echo "<table id=\"mensajet\"><tr><td><font color=\"red\">Hebra cerrada</font></tr><tr><td>No puedes comentar en una hebra cerrada.<td></tr></table>";
				}
			}
		}
		echo '</div>';
		echo '</form>';
	} else {
		if ($id) {
			$retval = db_query("SELECT nombre,cerrada FROM forohebras WHERE id={$id}");
			$retval2 = db_query("
			SELECT foromensajes.nombrejug,hora,texto,insignia,clan,idmensaje,foromensajes.idmres,foromensajes.pag
				FROM foromensajes,jugadores 
					WHERE jugadores.nombrejug=foromensajes.nombrejug AND idhebra={$id}
						ORDER BY idmensaje ASC LIMIT {$ini},15");
			$retval3 = db_query("SELECT COUNT(*) FROM foromensajes WHERE idhebra={$id}");
			$numrows = mysqli_num_rows($retval2);
			$ret = mysqli_fetch_row($retval);
			$cerrada = $ret[1];
			mysqli_free_result($retval);
			$ret2 = mysqli_fetch_row($retval3);
			mysqli_free_result($retval3);
			echo "<div><b>{$ret[0]}</b></div><br/>";
			for ($i = 0; $i < $numrows; $i++) {
				$ret = mysqli_fetch_row($retval2);
				$dia = ahora_dia($ret[1]);
				$hora = ahora_hora($ret[1]);
				$insignia = getInsigniaJug($ret[0]);
				if ($ret[4] == '(ninguno)')
					$suclan = '';
				else {
					$insigniac = "";
					$retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[4]}'");
					if (mysqli_num_rows($retvalic) == 1) {
						$retic = mysqli_fetch_row($retvalic);
						$insigniac = "<img src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
					}
					mysqli_free_result($retvalic);
					$suclan = "del clan {$insigniac} <b>{$ret[4]}</b> ";
				}
				echo "<form>";
				echo "<div ";
				if (isset($hi) && $hi == $ret[5]) {
					echo "class=\"highlight\"";
				}
				echo "><a name=\"r{$ret[5]}\"></a>";

				echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
				echo "<input type=\"hidden\" name=\"id\" value=\"{$id}\"/>";
				echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
				echo "<input type=\"hidden\" name=\"idmensaje\" value=\"{$ret[5]}\"/>";
				if ($esmodera) {
					echo "<input type=\"submit\" name=\"eliminarm\" onclick=\"return c('Como moderador debe eliminar únicamente los mensajes realmente problemáticos.')\" value=\"Eliminar\"/> ";
				}
				if (isset($_COOKIE['oculttitulos']))
					echo "- {$insignia} <b>" . $ret[0] . "</b> {$suclan}dijo en {$dia} {$hora}";
				else
					echo "- {$insignia} " . getName($ret[0], 1) . " {$suclan}dijo en {$dia} {$hora}";
				if ($ret[6] != null) {
					$retvalres = db_query("
					SELECT foromensajes.nombrejug,hora,texto
						FROM foromensajes,jugadores 
							WHERE jugadores.nombrejug=foromensajes.nombrejug AND idhebra={$id} AND idmensaje={$ret[6]}");
					$response = mysqli_fetch_row($retvalres);
					$dia2 = ahora_dia($response[1]);
					$hora2 = ahora_hora($response[1]);
					echo " en respuesta a <strong>{$response[0]}</strong> 
				  <a href=\"foro.php?id={$id}&p={$ret[7]}&hi={$ret[6]}#r{$ret[6]}\">
				  <div class=\"tooltip\">(Mensaje)
					<span class=\"tooltiptext\">{$response[0]} dijo:<br>" . substr($response[2], 0, 100) . "<br>(...)</span>
				  </div> 
				  </a>escrito en {$dia2} {$hora2}";
					mysqli_free_result($retvalres);
				}
				echo ": <input type=\"submit\" name=\"rme\" value=\"Responder\"/>
			  <br/>{$ret[2]}";
				echo "</div>";
				echo "</form>";
				echo "<br/>";
			}
			mysqli_free_result($retval2);
			$npags = $ret2[0] / 15;
			$npag = floor($npags);
			if ($npag != $npags)
				$npag++;
			if ($npag > 1) {
				echo "Página: ";
				$ini = $p - 3;
				$fin = $p + 3;
				if ($ini < 1)
					$ini = 1;
				if ($fin > $npag)
					$fin = $npag;
				if ($ini > 1)
					echo '... ';
				for ($i = $ini; $i <= $fin; $i++) {
					if ($i != $p)
						echo "<a href=\"foro.php?id={$id}&amp;p={$i}\">{$i}</a> ";
					else
						echo "<b>{$i}</b> ";
				}
				if ($fin < $npag)
					echo '... ';
			}
			echo '<br/><br/>';
			echo "<a href=\"foro.php\">Volver</a><br/>";
			if (isset($_SESSION['lasttext'])) {
				$lasttext = stripslashes($_SESSION['lasttext']);
				unset($_SESSION['lasttext']);
			} else
				$lasttext = '';

			echo '<br/><br/>';
			echo '<form action="foro.php" method="post">';
			echo '<div>';
			echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
			echo "<input type=\"hidden\" name=\"id\" value=\"{$id}\"/>";
			if ($_SESSION['silenciado']) {
				$dia_t = ahora_dia($_SESSION['silenciado']);
				$hora_t = ahora_hora($_SESSION['silenciado']);
				$conan = db_query("SELECT motivo FROM silencio WHERE horafin>{$time} ORDER BY horafin LIMIT 1");
				$motivo = mysqli_fetch_array($conan);
				if ($motivo[0] == '') {
					$motivo[0] = 'No especificado.';
				}
				echo "<font color=\"red\">Estás siendo silenciado por un moderador, no puedes enviar mensajes hasta el {$dia_t} a las {$hora_t}.<br><b>MOTIVO: {$motivo[0]}</b></font>";
			} else {
				$tabla = "<table id=\"mensajet\"><tr><td>Nueva respuesta<br/><hr/><br/>Texto:<br/><textarea name=\"mensaje\" rows=\"7\" cols=\"60\">{$lasttext}</textarea><br/>";
				if ($us['admin'] == 1 || $us['moderador'] == 1)
					$tabla .= "<input type=\"checkbox\" name=\"html\" value=\"si\"> Texto Html";
				$tabla .= "<br/><input type=\"submit\" name=\"nuevarespuesta\" onclick=\"return filterHOYGAN(this.form.mensaje.value) && c('Si escribe en el foro público insultos o palabras malsonantes, o amenazas fuera del sentido del juego, su cuenta podrá ser cerrada.')\" value=\"Nueva respuesta\"/></td></tr></table>";
				if ($us['admin'] == 1 || $us['moderador'] == 1) {
					echo $tabla;
				} else {
					if ($cerrada == 0) {
						if ($us['nivel'] >= $confnivelforo) {
							echo $tabla;
						} else {
							echo "<table id=\"mensajet\"><tr><td><font color=\"red\">Nivel insuficiente</font></tr><tr><td>Necesitas ser nivel <b>{$confnivelmensaj}</b> o más para poder comentar en el foro.<td></tr></table>";
						}
					} else {
						echo "<table id=\"mensajet\"><tr><td><font color=\"red\">Hebra cerrada</font></tr><tr><td>No puedes comentar en una hebra cerrada.<td></tr></table>";
					}
				}
			}
			echo '</div>';
			echo '</form>';
		} else {
			if ($dovfor) {
				$retval = db_query("UPDATE jugadores SET ultimoforo={$time} WHERE nombrejug='{$jug}'");
			}

			//-Hebras fijadas-//
			$saveIni = $ini;
			$saveFin = $fin;
			$retval = db_query("
			SELECT fhe.id,fhe.nombre,fhe.nombrejug,fhe.hora,
				(SELECT COUNT(*) FROM foromensajes as fme WHERE fme.idhebra=fhe.id) as respuestas
				,j.insignia,j.clan,fhe.cerrada 
				FROM forohebras as fhe JOIN jugadores as j ON (fhe.nombrejug=j.nombrejug AND fhe.fijada=1)
					ORDER BY hora DESC");
			$numrows = mysqli_num_rows($retval);
			if (mysqli_num_rows($retval) > 0) {
				echo '<u>Hebras fijadas:</u><br><br>';
				for ($i = 0; $i < $numrows; $i++) {
					$ret = mysqli_fetch_row($retval);
					$dia = ahora_dia($ret[3]);
					$hora = ahora_hora($ret[3]);
					$insignia = getInsigniaJug($ret[2]);
					$resp = $ret[4] - 1;
					if ($esmodera)
						echo "<form action=\"foro.php\" method=\"post\">";
					echo "<div>";
					if ($esmodera) {
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
						echo "<input type=\"hidden\" name=\"idhebra\" value=\"{$ret[0]}\"/>";
						echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
						echo "<input type=\"submit\" name=\"eliminar\" onclick=\"return c('Como moderador debe eliminar únicamente los mensajes realmente problemáticos.')\" value=\"Eliminar\"/> ";
						if ($ret[7] == 1)
							echo "<input type=\"submit\" name=\"abrir\" onclick=\"return c('Vas a abrir esta hebra.')\" value=\"Abrir\"/> ";
						else
							echo "<input type=\"submit\" name=\"cerrar\" onclick=\"return c('Vas a cerrar esta hebra.')\" value=\"Cerrar\"/> ";
						echo "<input type=\"submit\" name=\"desfijar\" onclick=\"return c('Vas a desfijar esta hebra.')\" value=\"Desfijar\"/> ";
					}
					if ($us['ultimoforo'] <= $ret[3])
						echo '<img src="' . $imgroot . 'nuevo.png" alt="Nuevo"/> ';
					else
						echo '<img src="' . $imgroot . 'leido.png" alt="Leido"/> ';
					if ($ret[7] == 1)
						echo '<img src="' . $imgroot . 'cerrada.png" alt="Cerrada"/> ';
					else
						echo '<img src="' . $imgroot . 'abierta.png" alt="Abierta"/> ';
					$pags = '';
					$npags = ($resp + 1) / 15;
					$npag = floor($npags);
					if ($npag != $npags)
						$npag++;
					if ($npag > 1) {
						$pags .= "Página: ";
						$ini = $npag - 3;
						$fin = $npag;
						if ($ini < 1)
							$ini = 1;
						if ($fin > $npag)
							$fin = $npag;
						if ($ini > 1)
							$pags .= '... ';
						for ($x = $ini; $x <= $fin; $x++)
							$pags .= "<a href=\"foro.php?id={$ret[0]}&amp;p={$x}\" style=\"color: #d00000;\">{$x}</a> ";
					}
					$insigniac = "";
					if ($ret[6] != '(ninguno)') {
						$retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[6]}'");
						if (mysqli_num_rows($retvalic) == 1) {
							$retic = mysqli_fetch_row($retvalic);
							$insigniac = "<img style=\"vertical-align:middle\" src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
						}
						mysqli_free_result($retvalic);
						$clan = "{$insigniac}";
					} else
						$clan = '';
					if (isset($_COOKIE['oculttitulos']))
						echo "<a href=\"foro.php?id={$ret[0]}\" style=\"color: #d00000;\">(ver) {$ret[1]}</a> {$pags} - {$insignia} <b>" . $ret[2] . "</b> {$clan} ({$dia} {$hora}) ({$resp} respuestas)";
					else
						echo "<a href=\"foro.php?id={$ret[0]}\" style=\"color: #d00000;\">(ver) {$ret[1]}</a> {$pags} - {$insignia} " . getName($ret[2], 1) . " {$clan} ({$dia} {$hora}) ({$resp} respuestas)";
					echo "</div>";
					if ($esmodera) {
						echo "</form>";
					}
					echo "<br/>";
				}
				echo '<hr><br>';
			}
			mysqli_free_result($retval);
			//-//


			//-Hebras NO fijadas-//
			$ini = $saveIni;
			$fin = $saveFin;
			$retval = db_query("
			SELECT fhe.id,fhe.nombre,fhe.nombrejug,fhe.hora,
				(SELECT COUNT(*) FROM foromensajes as fme WHERE fme.idhebra=fhe.id) as respuestas
				,j.insignia,j.clan,fhe.cerrada 
				FROM forohebras as fhe JOIN jugadores as j ON (fhe.nombrejug=j.nombrejug AND fhe.fijada=0)
					ORDER BY hora DESC LIMIT {$ini},15");
			$retval2 = db_query("SELECT COUNT(*) FROM forohebras where fijada=0");
			$ret2 = mysqli_fetch_row($retval2);
			mysqli_free_result($retval2);
			$numrows = mysqli_num_rows($retval);

			for ($i = 0; $i < $numrows; $i++) {
				$ret = mysqli_fetch_row($retval);
				$dia = ahora_dia($ret[3]);
				$hora = ahora_hora($ret[3]);
				$insignia = getInsigniaJug($ret[2]);
				$resp = $ret[4] - 1;
				if ($esmodera)
					echo "<form action=\"foro.php\" method=\"post\">";
				echo "<div>";
				if ($esmodera) {
					echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
					echo "<input type=\"hidden\" name=\"idhebra\" value=\"{$ret[0]}\"/>";
					echo "<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>";
					echo "<input type=\"submit\" name=\"eliminar\" onclick=\"return c('Como moderador debe eliminar únicamente los mensajes realmente problemáticos.')\" value=\"Eliminar\"/> ";
					if ($ret[7] == 1)
						echo "<input type=\"submit\" name=\"abrir\" onclick=\"return c('Vas a abrir esta hebra.')\" value=\"Abrir\"/> ";
					else
						echo "<input type=\"submit\" name=\"cerrar\" onclick=\"return c('Vas a cerrar esta hebra.')\" value=\"Cerrar\"/> ";
					echo "<input type=\"submit\" name=\"fijar\" onclick=\"return c('Vas a fijar esta hebra.')\" value=\"Fijar\"/> ";
				}
				if ($us['ultimoforo'] <= $ret[3])
					echo '<img src="' . $imgroot . 'nuevo.png" alt="Nuevo"/> ';
				else
					echo '<img src="' . $imgroot . 'leido.png" alt="Leido"/> ';
				if ($ret[7] == 1)
					echo '<img src="' . $imgroot . 'cerrada.png" alt="Cerrada"/> ';
				else
					echo '<img src="' . $imgroot . 'abierta.png" alt="Abierta"/> ';
				$pags = '';
				$npags = ($resp + 1) / 15;
				$npag = floor($npags);
				if ($npag != $npags)
					$npag++;
				if ($npag > 1) {
					$pags .= "Página: ";
					$ini = $npag - 3;
					$fin = $npag;
					if ($ini < 1)
						$ini = 1;
					if ($fin > $npag)
						$fin = $npag;
					if ($ini > 1)
						$pags .= '... ';
					for ($x = $ini; $x <= $fin; $x++)
						$pags .= "<a href=\"foro.php?id={$ret[0]}&amp;p={$x}\">{$x}</a> ";
				}
				$insigniac = "";
				if ($ret[6] != '(ninguno)') {
					$retvalic = db_query("SELECT insignia FROM claninsignia WHERE clan='{$ret[6]}'");
					if (mysqli_num_rows($retvalic) == 1) {
						$retic = mysqli_fetch_row($retvalic);
						$insigniac = "<img style=\"vertical-align:middle\" src=\"{$imgroot}{$retic[0]}.gif\" alt=\"insignia\"/>";
					}
					mysqli_free_result($retvalic);
					$clan = "{$insigniac}";
				} else
					$clan = '';
				if (isset($_COOKIE['oculttitulos']))
					echo "<a href=\"foro.php?id={$ret[0]}\">(ver) {$ret[1]}</a> {$pags} - {$insignia} <b>" . $ret[2] . "</b> {$clan} ({$dia} {$hora}) ({$resp} respuestas)";
				else
					echo "<a href=\"foro.php?id={$ret[0]}\">(ver) {$ret[1]}</a> {$pags} - {$insignia} " . getName($ret[2], 1) . " {$clan} ({$dia} {$hora}) ({$resp} respuestas)";
				echo "</div>";
				if ($esmodera) {
					echo "</form>";
				}
				echo "<br/>";
			}
			mysqli_free_result($retval);
			//-//

			$npags = $ret2[0] / 15;
			$npag = floor($npags);
			if ($npag != $npags)
				$npag++;
			if ($npag > 1) {
				echo "Página: ";
				$ini = $p - 3;
				$fin = $p + 3;
				if ($ini < 1)
					$ini = 1;
				if ($fin > $npag)
					$fin = $npag;
				if ($ini > 1)
					echo '... ';
				for ($i = $ini; $i <= $fin; $i++) {
					if ($i != $p)
						echo "<a href=\"foro.php?p={$i}\">{$i}</a> ";
					else
						echo "<b>{$i}</b> ";
				}
				if ($fin < $npag)
					echo '... ';
			}

			if (isset($_SESSION['lastsubject'])) {
				$lastsubject = stripslashes($_SESSION['lastsubject']);
				unset($_SESSION['lastsubject']);
			} else
				$lastsubject = '';

			if (isset($_SESSION['lasttext'])) {
				$lasttext = stripslashes($_SESSION['lasttext']);
				unset($_SESSION['lasttext']);
			} else
				$lasttext = '';

			echo '<br/><br/>';
			echo '<form action="foro.php" method="post">';
			echo '<div>';
			echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
			if ($_SESSION['silenciado']) {
				$dia_t = ahora_dia($_SESSION['silenciado']);
				$hora_t = ahora_hora($_SESSION['silenciado']);
				$conan = db_query("SELECT motivo FROM silencio WHERE horafin>{$time} ORDER BY horafin LIMIT 1");
				$motivo = mysqli_fetch_array($conan);
				if ($motivo[0] == '') {
					$motivo[0] = 'No especificado.';
				}
				echo "<font color=\"red\">Estás siendo silenciado por un moderador, no puedes enviar mensajes hasta el {$dia_t} a las {$hora_t}.<br><b>MOTIVO: {$motivo[0]}</b></font>";
			} else {
				$tabla = "<table id=\"mensajet\"><tr><td>Nueva hebra<br/><hr/><br/>Asunto:<br/><input type=\"text\" name=\"subject\" size=\"60\" maxlength=\"40\" value=\"{$lastsubject}\"/><br/><br/>Texto:<br/><textarea name=\"mensaje\" rows=\"7\" cols=\"60\">{$lasttext}</textarea><br/>";
				if ($us['admin'] == 1 || $us['moderador'] == 1)
					$tabla .= "<input type=\"checkbox\" name=\"html\" value=\"si\"> Texto Html";
				$tabla .= "<br/><input type=\"submit\" name=\"nuevahebra\" onclick=\"return filterHOYGAN(this.form.mensaje.value) && filterHOYGAN(this.form.subject.value) && c('Si escribe en el foro público insultos o palabras malsonantes, o amenazas fuera del sentido del juego, su cuenta podrá ser cerrada.')\" value=\"Nueva hebra\"/></td></tr></table>";
				if ($us['admin'] == 1 || $us['moderador'] == 1) {
					echo $tabla;
				} else {
					if ($us['nivel'] >= $confnivelforo) {
						echo $tabla;
					} else {
						echo "<table id=\"mensajet\"><tr><td><font color=\"red\">Nivel insuficiente</font></tr><tr><td>Necesitas ser nivel <b>{$confnivelmensaj}</b> o más para poder comentar en el foro.<td></tr></table>";
					}
				}
			}
			echo '</div>';
			echo '</form>';
		}
	}
}

function procesaform()
{
	global $_REQUEST, $tag, $jug, $time, $confmaxmsg, $dbc, $us, $confnivelmensaj;
	if (isset($_REQUEST['p']))
		$p = $_REQUEST['p'];
	else
		$p = 1;
	if (!is_numeric($p))
		$p = 1;
	if (isset($_REQUEST['id']))
		$id = $_REQUEST['id'];
	else
		$id = 0;
	if (!is_numeric($id))
		$id = 0;

	if (isset($_REQUEST['nuevahebra'])) {
		if ($us['nivel'] >= $confnivelmensaj || $us['admin'] == 1 || $us['moderador'] == 1) {
			if ($_SESSION['silenciado']) {
				$_SESSION['error'] = 'No puedes hablar, estás siendo silenciado por un moderador.';
			} else if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['subject'])) && (isset($_REQUEST['mensaje']))) {
				$gtag = $_REQUEST['tag'];
				$subject = check_subject($_REQUEST['subject']);
				$mensorig = (isset($_REQUEST['html']) ? $_REQUEST['mensaje'] : check_text($_REQUEST['mensaje']));
				$mensaje = str_replace("\n", '<br/> ', $mensorig);
				if ($tag == $gtag) {
					if (strlen($mensorig) > $confmaxmsg) {
						$_SESSION['lastsubject'] = $subject;
						$_SESSION['lasttext'] = substr($mensorig, 0, $confmaxmsg - 2);
						$_SESSION['error'] = 'Mensaje demasiado largo, ha sido recortado. Reenvíe para confirmar';
					} else {
						if ((strlen($mensaje)) && (strlen($subject))) {
							db_query("INSERT INTO forohebras (nombrejug,nombre,hora) VALUES ('{$jug}','{$subject}',{$time})");
							$retval = db_query("SELECT MAX(id) FROM forohebras WHERE nombrejug='{$jug}' AND nombre='{$subject}' AND hora={$time}");
							$ret = mysqli_fetch_row($retval);
							mysqli_free_result($retval);
							db_query("INSERT INTO foromensajes (nombrejug,hora,texto,idhebra) VALUES ('{$jug}',{$time},'{$mensaje}',{$ret[0]})");
							$_SESSION['mensaje'] = 'Hebra creada.';
							$id = 0;
							$p = 0;
						} else {
							$_SESSION['error'] = 'Tienes que indicar asunto y texto.';
							$_SESSION['lastsubject'] = $subject;
							$_SESSION['lasttext'] = $mensorig;
						}
					}
				} else {
					$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
					$_SESSION['lastsubject'] = $subject;
					$_SESSION['lasttext'] = $mensorig;
				}
			}
		} else {
			$_SESSION['error'] = 'Nivel insuficiente. Necesitas ser nivel <b>' . $confnivelmensaj . '</b> o más para poder postear una hebra.';
		}
		header("Location: foro.php?id={$id}&p={$p}");
		return 1;
	}

	if (isset($_REQUEST['abrir']) || isset($_REQUEST['cerrar'])) {
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idhebra']))) {
			$gtag = $_REQUEST['tag'];
			$idhebra = $_REQUEST['idhebra'];
			if (($us['admin']) || ($us['moderador']))
				$esmodera = 1;
			else
				$esmodera = 0;
			if ($tag == $gtag) {
				if ($esmodera) {
					if (is_numeric($idhebra)) {
						if (isset($_REQUEST['abrir'])) {
							db_query("UPDATE forohebras SET cerrada = 0 WHERE id={$idhebra}");
							$_SESSION['mensaje'] = 'Hebra abierta.';
						} else {
							db_query("UPDATE forohebras SET cerrada = 1 WHERE id={$idhebra}");
							$_SESSION['mensaje'] = 'Hebra cerrada.';
						}
					} else
						$_SESSION['error'] = 'ID no válida.';
				} else
					$_SESSION['error'] = 'No eres moderador.';
			} else
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		}
		header("Location: foro.php?p={$p}");
		return 1;
	}

	if (isset($_REQUEST['fijar']) || isset($_REQUEST['desfijar'])) {
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idhebra']))) {
			$gtag = $_REQUEST['tag'];
			$idhebra = $_REQUEST['idhebra'];
			if (($us['admin']) || ($us['moderador']))
				$esmodera = 1;
			else
				$esmodera = 0;
			if ($tag == $gtag) {
				if ($esmodera) {
					if (is_numeric($idhebra)) {
						if (isset($_REQUEST['fijar'])) {
							db_query("UPDATE forohebras SET fijada = 1 WHERE id={$idhebra}");
							$_SESSION['mensaje'] = 'Hebra fijada.';
						} else {
							db_query("UPDATE forohebras SET fijada = 0 WHERE id={$idhebra}");
							$_SESSION['mensaje'] = 'Hebra desfijada.';
						}
					} else
						$_SESSION['error'] = 'ID no válida.';
				} else
					$_SESSION['error'] = 'No eres moderador.';
			} else
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		}
		header("Location: foro.php?p={$p}");
		return 1;
	}

	if (isset($_REQUEST['eliminar'])) {
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idhebra']))) {
			$gtag = $_REQUEST['tag'];
			$idhebra = $_REQUEST['idhebra'];
			if (($us['admin']) || ($us['moderador']))
				$esmodera = 1;
			else
				$esmodera = 0;
			if ($tag == $gtag) {
				if ($esmodera) {
					if (is_numeric($idhebra)) {
						db_query("DELETE FROM forohebras WHERE id={$idhebra}");
						db_query("DELETE FROM foromensajes WHERE idhebra={$idhebra}");
						$_SESSION['mensaje'] = 'Hebra eliminada.';
					} else
						$_SESSION['error'] = 'ID no válida.';
				} else
					$_SESSION['error'] = 'No eres moderador.';
			} else
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		}
		header("Location: foro.php?p={$p}");
		return 1;
	}

	if (isset($_REQUEST['eliminarm'])) {
		if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['idmensaje']))) {
			$gtag = $_REQUEST['tag'];
			$idmensaje = $_REQUEST['idmensaje'];
			if (($us['admin']) || ($us['moderador']))
				$esmodera = 1;
			else
				$esmodera = 0;
			if ($tag == $gtag) {
				if ($esmodera) {
					if (is_numeric($idmensaje)) {
						db_query("DELETE FROM foromensajes WHERE idmensaje={$idmensaje}");
						$_SESSION['mensaje'] = 'Mensaje eliminado.';
					} else
						$_SESSION['error'] = 'ID no válida.';
				} else
					$_SESSION['error'] = 'No eres moderador.';
			} else
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
		}
		header("Location: foro.php?p={$p}&id={$id}");
		return 1;
	}

	if (isset($_REQUEST['nuevarespuesta'])) {
		if ($us['nivel'] >= $confnivelmensaj || $us['admin'] == 1 || $us['moderador'] == 1) {
			if ($_SESSION['silenciado']) {
				$_SESSION['error'] = 'No puedes hablar, estás siendo silenciado por un moderador.';
			} else if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['id'])) && (isset($_REQUEST['mensaje']))) {
				$gtag = $_REQUEST['tag'];
				if (is_numeric($_REQUEST['id']))
					$ids = $_REQUEST['id'];
				else
					$ids = 0;
				$mensorig2 = $_REQUEST['mensaje'];
				$mensorig = (isset($_REQUEST['html']) ? $_REQUEST['mensaje'] : check_text($_REQUEST['mensaje']));
				$mensaje = str_replace("\n", '<br/> ', $mensorig);
				if ($tag == $gtag) {
					if (strlen(stripslashes($mensorig2)) > $confmaxmsg) {
						$_SESSION['lasttext'] = substr($mensorig2, 0, $confmaxmsg - 4);
						$_SESSION['error'] = 'Mensaje demasiado largo, ha sido recortado. Reenvíe para confirmar';
					} else {
						$r = db_query("SELECT cerrada FROM forohebras WHERE id={$ids}");
						if (mysqli_num_rows($r)) {
							$cerrada = mysqli_fetch_row($r);
							if ($cerrada[0] == 0 || $us['admin'] == 1 || $us['moderador'] == 1) {
								if (strlen($mensaje)) {
									db_query("UPDATE forohebras SET hora={$time} WHERE id={$ids}");
									db_query("INSERT INTO foromensajes (nombrejug,hora,texto,idhebra) VALUES ('{$jug}',{$time},'{$mensaje}',{$ids})");
									$retval3 = db_query("SELECT COUNT(*) FROM foromensajes WHERE idhebra={$ids}");
									$_SESSION['mensaje'] = 'Respuesta añadida.';
									$ret2 = mysqli_fetch_row($retval3);
									mysqli_free_result($retval3);
									$npags = $ret2[0] / 15;
									$npag = floor($npags);
									if ($npag != $npags)
										$npag++;
									$p = $npag;
								} else {
									$_SESSION['error'] = 'Tienes que indicar texto.';
									$_SESSION['lasttext'] = $mensorig;
								}
							} else {
								$_SESSION['error'] = 'La hebra está cerrada.';
							}
						} else {
							$_SESSION['error'] = 'Esa hebra no existe.';
						}
						mysqli_free_result($r);
					}
				} else {
					$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
					$_SESSION['lasttext'] = $mensorig;
				}
			}
		} else {
			$_SESSION['error'] = 'Nivel insuficiente. Necesitas ser nivel <b>' . $confnivelmensaj . '</b> o más para poder postear una hebra.';
		}
		header("Location: foro.php?id={$id}&p={$p}");
		return 1;
	}

	if (isset($_REQUEST['nuevarespuesta2'])) {
		if ($us['nivel'] >= $confnivelmensaj || $us['admin'] == 1 || $us['moderador'] == 1) {
			if ($_SESSION['silenciado']) {
				$_SESSION['error'] = 'No puedes hablar, estás siendo silenciado por un moderador.';
			} else if ((isset($_REQUEST['tag'])) && (isset($_REQUEST['id'])) && (isset($_REQUEST['mensaje']))) {
				$gtag = $_REQUEST['tag'];
				if (is_numeric($_REQUEST['id']))
					$ids = $_REQUEST['id'];
				else
					$ids = 0;
				$mensorig2 = $_REQUEST['mensaje'];
				$mensorig = (isset($_REQUEST['html']) ? $_REQUEST['mensaje'] : check_text($_REQUEST['mensaje']));
				$mensaje = str_replace("\n", '<br/> ', $mensorig);
				if ($tag == $gtag) {
					if (strlen(stripslashes($mensorig2)) > $confmaxmsg) {
						$_SESSION['lasttext'] = substr($mensorig2, 0, $confmaxmsg - 4);
						$_SESSION['error'] = 'Mensaje demasiado largo, ha sido recortado. Reenvíe para confirmar';
					} else {
						$r = db_query("SELECT cerrada FROM forohebras WHERE id={$ids}");
						if (mysqli_num_rows($r)) {
							$cerrada = mysqli_fetch_row($r);
							if ($cerrada[0] == 0 || $us['admin'] == 1 || $us['moderador'] == 1) {
								if (strlen($mensaje)) {
									$idmensaje = $_REQUEST['idmensaje'];
									$pag = $_REQUEST['p'];
									db_query("UPDATE forohebras SET hora={$time} WHERE id={$ids}");
									db_query("INSERT INTO foromensajes (nombrejug,hora,texto,idhebra,idmres,pag) VALUES ('{$jug}',{$time},'{$mensaje}',{$ids},{$idmensaje},{$pag})");
									$last_id = mysqli_insert_id($dbc);
									$retval3 = db_query("SELECT COUNT(*) FROM foromensajes WHERE idhebra={$ids}");
									$_SESSION['mensaje'] = 'Respuesta añadida.';
									$ret2 = mysqli_fetch_row($retval3);
									mysqli_free_result($retval3);
									$npags = $ret2[0] / 15;
									$npag = floor($npags);
									if ($npag != $npags)
										$npag++;
									$p = $npag;

									$hebra = mysqli_fetch_row(db_query("SELECT `nombre`, `nombrejug` FROM forohebras WHERE id={$ids}"));
									$jugrespuesta = mysqli_fetch_row(db_query("SELECT `nombrejug` FROM foromensajes WHERE idmensaje={$idmensaje}"));
									$mens = '<b>'.$jug.'</b> te ha respondido en el foro a una publicación tuya en la hebra "<b>['.$hebra[0].']</b>" publicada por <b>'.$hebra[1].'</b>.<br>
											Puedes ir a la respuesta con el siguiente enlace: <a href="foro.php?id='.$ids.'&p='.$pag.'&hi='.$last_id.'#r'.$last_id.'">Respuesta</a>';
									db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jugrespuesta[0]}','@',$time,'{$mens}','Foro')");
								} else {
									$_SESSION['error'] = 'Tienes que indicar texto.';
									$_SESSION['lasttext'] = $mensorig;
								}
							} else {
								$_SESSION['error'] = 'La hebra está cerrada.';
							}
						} else {
							$_SESSION['error'] = 'Esa hebra no existe.';
						}
						mysqli_free_result($r);
					}
				} else {
					$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
					$_SESSION['lasttext'] = $mensorig;
				}
			}
		} else {
			$_SESSION['error'] = 'Nivel insuficiente. Necesitas ser nivel <b>' . $confnivelmensaj . '</b> o más para poder postear una hebra.';
		}
		header("Location: foro.php?id={$id}&p={$p}");
		return 1;
	}
}
