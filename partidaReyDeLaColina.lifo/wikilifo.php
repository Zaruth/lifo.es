<?php
$form = 1;
include('core.php');
function iweb()
{
	global $conftp, $_REQUEST, $imgroot, $us, $tag;
	techo("¡Bienvenido a la wiki de Lifo! Aquí podrás consultar, si lo deseas, toda la información relevante sobre los objetos de la partida.<br>Podrás ver desde de qué se alimenta cierta mascota hasta que podrías encontrar explorando cierto mapa.<br>Tienes los objetos agrupados por categorías, navega por ellas y ¡descubre que se esconde en el mundo de Lifo! O quizás también puedes no adentrarte en la wiki y descubrirlo por tí mismo... tú decides.");

	include_once 'auxiliar/f_items.php';

	if (isset($_REQUEST['u'])) {
		// Búsqueda en categoría //
		$search = "";
		$q = "";
		if (isset($_REQUEST['q'])) {
			$search = ' nombreobj LIKE \'%' . trim($_REQUEST['q']) . '%\'  AND ';
			$q = trim($_REQUEST['q']);
		}
		echo '<form action="wikilifo.php" method="get">';
		echo "<input type=\"hidden\" name=\"u\" value=\"{$_REQUEST['u']}\"/>";
		echo "<input type=\"hidden\" name=\"p\" value=\"1\"/>";
		echo '<input type="text" name="q" value="' . $q . '"/>';
		echo '<input type="submit" name="buscar" value="Buscar"/>';
		echo '</form>';
		// //

		$volver = "<br><br><a href=\"wikilifo.php\">Volver</a>";
		$type = $_REQUEST['u'];
		$getTotalPos = db_query("SELECT SUM(`posibilidad`) as posibilidad FROM `objetos` WHERE `posibilidad`>0");
		$gtotalpos = mysqli_fetch_row($getTotalPos);
		$totalPos = $gtotalpos[0];
		switch ($type) {
			case 2: // Alimentos
				echo '<h2 style="font-family: Arial;">Alimentos:</h2>';
				if (isset($_REQUEST['i'])) {
					$img = $_REQUEST['i'];
					$p = $_REQUEST['p'];
					$getResource = db_query("SELECT * FROM `objetos` WHERE `img`='{$img}'");
					$res = mysqli_fetch_assoc($getResource);
					$descript = $res['descripcion'] != null ? $res['descripcion'] : '???';
					echo '<table>
						<tr><th align="right">Imagen:</th><td style="padding-left: 10px;"><img src="' . $imgroot . $img . '.gif"></td></tr>
						<tr><th align="right">Nombre:</th><td style="padding-left: 10px;">' . $res['nombreobj'] . '</td></tr>
						<tr><th align="right">Descripción:</th><td style="padding-left: 10px;">';
					if ($us['admin'] == 1) {
						echo '<form action="wikilifo.php" method="post">
						<textarea name="des">' . $descript . '</textarea>
							<p>' . $descript . '</p>';
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
						<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
						<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
						<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>";
						echo '<br><input type="submit" name="moddes" value="Modificar"/></form>';
					} else {
						echo $descript;
					}
					echo '</td></tr>
						<tr><th align="right">Tipo:</th><td style="padding-left: 10px;">' . $res['tipo'] . '</td></tr>
						<tr><th align="right">Energía:</th><td style="padding-left: 10px;">' . $res['prot'] . '</td></tr>
						<tr><th align="right">Experiencia:</th><td style="padding-left: 10px;">' . $res['puntosencontrar'] . '</td></tr>
						<tr><th align="right">Valor:</th><td style="padding-left: 10px;">' . $res['valor'] . '</td></tr>
						</table>';
					echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}";
					if ($q != "")
						echo '&q=' . $q;
					echo "\">Volver</a>";
				} else {
					echo '<table cellspacing="0" style="border: 1px solid black;"><tr><th align="center" style="padding-left: 5px;">Imagen</th><th align="center">Nombre</th><th align="center">Energía</th><th align="center" style="padding-left: 5px;">Experiencia</th><th align="center">Valor</th></tr>';
					$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (2) ORDER BY `prot` DESC");
					$totalRows = mysqli_num_rows($getResources);
					$pags = ceil($totalRows / 25);
					$actualPage = 1;
					if (isset($_REQUEST['p'])) {
						$actualPage = $_REQUEST['p'];
					}
					for ($i = 0, $count = 1; $i < $totalRows; $i++, $count++) {
						$resource = mysqli_fetch_assoc($getResources);
						if ($actualPage == ceil($count / 25)) {
							if ($count % 2 == 0) {
								echo "<tr><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['prot']}</td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['puntosencontrar']}</td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['valor']}</td></tr>";
							} else {
								echo "<tr><td align=\"center\" style=\"padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['prot']}</td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['puntosencontrar']}</td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['valor']}</td></tr>";
							}
						}
					}
					echo '</table><br>';
					for ($j = 1; $j <= $pags; $j++) {
						if ($j == $actualPage) {
							echo '<strong><a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a></strong>';
						} else {
							echo '<a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a>';
						}
						if ($j < $pags) {
							echo ' - ';
						}
					}
					echo $volver;
				}
				break;
			case 0: // Equipamiento
			case 1: // Equipamiento (un uso)
				echo '<h2 style="font-family: Arial;">Equipamiento:</h2>';
				if (isset($_REQUEST['i'])) {
					$img = $_REQUEST['i'];
					$p = $_REQUEST['p'];
					$getResource = db_query("SELECT * FROM `objetos` WHERE `img`='{$img}'");
					$res = mysqli_fetch_assoc($getResource);
					$descript = $res['descripcion'] != null ? $res['descripcion'] : '???';
					echo '<table>
						<tr><th align="right">Imagen:</th><td style="padding-left: 10px;"><img src="' . $imgroot . $img . '.gif"></td></tr>
						<tr><th align="right">Nombre:</th><td style="padding-left: 10px;">' . $res['nombreobj'] . '</td></tr>
						<tr><th align="right">Descripción:</th><td style="padding-left: 10px;">';
					if ($us['admin'] == 1) {
						echo '<form action="wikilifo.php" method="post">
							<textarea name="des">' . $descript . '</textarea>
							<p>' . $descript . '</p>';
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>";
						echo '<br><input type="submit" name="moddes" value="Modificar"/></form>';
					} else {
						echo $descript;
					}
					echo '</td></tr>
						<tr><th align="right">Tipo:</th><td style="padding-left: 10px;">' . $res['tipo'] . '</td></tr>
						<tr><th align="right">Nivel mínimo:</th><td style="padding-left: 10px;">' . $res['niveluso'] . '</td></tr>
						<tr><th align="right">Ataque:</th><td style="padding-left: 10px;">' . $res['ataq'] . '</td></tr>
						<tr><th align="right">Protección:</th><td style="padding-left: 10px;">' . $res['prot'] . '</td></tr>
						<tr><th align="right">Vida:</th><td style="padding-left: 10px;">' . $res['vida'] . '</td></tr>
						<tr><th align="right">Experiencia:</th><td style="padding-left: 10px;">' . $res['puntosencontrar'] . '</td></tr>
						<tr><th align="right">Valor:</th><td style="padding-left: 10px;">' . $res['valor'] . '</td></tr>
						</table>';
					echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}";
					if ($q != "")
						echo '&q=' . $q;
					echo "\">Volver</a>";
				} else {
					echo '<table cellspacing="0" style="border: 1px solid black;">
					<tr>
						<th align="center" style="padding-left: 5px;">Imagen</th>
						<th align="center">Nombre</th>
						<th align="center">Tipo</th>
						<th align="center">Ataque</th>
						<th align="center">Protección</th>
						<th align="center">Vida</th>
						<th align="center" style="padding-left: 5px;">Experiencia</th>
						<th align="center">Valor</th>
					</tr>';
					$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (0,1) AND `tipo` NOT LIKE 'ADMIN' ORDER BY `tipo` ASC, `niveluso` DESC");
					$totalRows = mysqli_num_rows($getResources);
					$pags = ceil($totalRows / 25);
					$actualPage = 1;
					if (isset($_REQUEST['p'])) {
						$actualPage = $_REQUEST['p'];
					}
					for ($i = 0, $count = 1; $i < $totalRows; $i++, $count++) {
						$resource = mysqli_fetch_assoc($getResources);
						if ($actualPage == ceil($count / 25)) {
							if ($count % 2 == 0) {
								echo "<tr>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['tipo']}</td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['ataq']}</td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['prot']}</td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['vida']}</td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['puntosencontrar']}</td>
										<td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['valor']}</td>
									  </tr>";
							} else {
								echo "<tr>
										<td align=\"center\" style=\"padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td>
										<td align=\"center\" style=\"padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td>
										<td align=\"center\" style=\"padding-left: 5px;\">{$resource['tipo']}</td>
										<td align=\"center\" style=\"padding-left: 5px;\">{$resource['ataq']}</td>
										<td align=\"center\" style=\"padding-left: 5px;\">{$resource['prot']}</td>
										<td align=\"center\" style=\"padding-left: 5px;\">{$resource['vida']}</td>
										<td align=\"center\" style=\"padding-left: 5px;\">{$resource['puntosencontrar']}</td>
										<td align=\"center\" style=\"padding-left: 5px;\">{$resource['valor']}</td>
									  </tr>";
							}
						}
					}
					echo '</table><br>';
					for ($j = 1; $j <= $pags; $j++) {
						if ($j == $actualPage) {
							echo '<strong><a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a></strong>';
						} else {
							echo '<a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a>';
						}
						if ($j < $pags) {
							echo ' - ';
						}
					}
					echo $volver;
				}
				break;
			case 3: // Libros
				echo '<h2 style="font-family: Arial;">Libros:</h2>';
				if (isset($_REQUEST['i'])) {
					$img = $_REQUEST['i'];
					$p = $_REQUEST['p'];
					if (isset($_REQUEST['r'])) {
						$recipe = $_REQUEST['r'];
						$getRecipe = db_query("SELECT re.*,ob.img,ob.ataq,ob.prot,ob.vida,ob.niveluso,ob.usos,ob.pasivas,ob.tipo FROM `contiene` as co JOIN `recetas` as re ON (co.resultado = re.resultado) JOIN `objetos` as ob ON (re.resultado = ob.nombreobj) WHERE co.id = {$recipe}");
						$rec = mysqli_fetch_assoc($getRecipe);
						$exito = 100 - $rec['dificultadhacer'];

						$item = $rec;
						$objeto = getItemFabricarResultado(null, $item);
						echo "<div class=\"item\">";
						echo "<strong>Receta:</strong> {$objeto}";
						echo "<br/></div>";

						echo "Posibilidad de éxito: {$exito}%<br>
						Coste de energía: {$rec['energia']}<br>";
						if ($rec['perderingredientes'] == 1) {
							echo "<strong>¡Perderás los ingredientes si fallas!</strong><br>";
						}
						echo "Ingredientes necesarios:<br>";
						$getResources = db_query("SELECT ing.*,ob.img,ob.ataq,ob.prot,ob.vida,ob.niveluso,ob.usos,ob.pasivas,ob.tipo FROM `ingrediente` as ing JOIN `objetos` as ob ON (ing.nombreobj = ob.nombreobj) WHERE ing.resultado = '{$rec['resultado']}'");
						for ($i = 0; $i < mysqli_num_rows($getResources); $i++) {
							$res = mysqli_fetch_assoc($getResources);
							$subitem = $res;
							$subobjeto = getItemFabricarIngrediente(null, $subitem);
							echo "<div class=\"item\">";
							echo "{$subobjeto}";
							echo "<br/></div>";
						}
						echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}&i={$img}";
						if ($q != "")
							echo '&q=' . $q;
						echo "\">Volver</a>";
					} else {
						$getResource = db_query("SELECT * FROM `objetos` WHERE `img`='{$img}'");
						$res = mysqli_fetch_assoc($getResource);
						$descript = $res['descripcion'] != null ? $res['descripcion'] : '???';
						echo '<table>
							<tr><th align="right">Imagen:</th><td style="padding-left: 10px;"><img src="' . $imgroot . $img . '.gif"></td></tr>
							<tr><th align="right">Nombre:</th><td style="padding-left: 10px;">' . $res['nombreobj'] . '</td></tr>
							<tr><th align="right">Descripción:</th><td style="padding-left: 10px;">';
						if ($us['admin'] == 1) {
							echo '<form action="wikilifo.php" method="post">
								<textarea name="des">' . $descript . '</textarea>
								<p>' . $descript . '</p>';
							echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
								<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
								<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
								<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>";
							echo '<br><input type="submit" name="moddes" value="Modificar"/></form>';
						} else {
							echo $descript;
						}
						echo '</td></tr>
							<tr><th align="right">Tipo:</th><td style="padding-left: 10px;">' . $res['tipo'] . '</td></tr>
							<tr><th align="right">Coste de Energía:</th><td style="padding-left: 10px;">-' . $res['ataq'] . '</td></tr>
							<tr><th align="right">Experiencia:</th><td style="padding-left: 10px;">' . $res['puntosencontrar'] . '</td></tr>
							<tr><th align="right">Valor:</th><td style="padding-left: 10px;">' . $res['valor'] . '</td></tr>
							</table>
							<h3 style="font-family: Arial;">Este libro contiene las siguientes recetas:</h3>';
						mysqli_free_result($getResource);
						$getResource = db_query("SELECT sub.id, sub.resultado, sub.dificultadaprender, obj.img FROM (SELECT co.`id`,co.`resultado`,co.`dificultadaprender` 
						FROM `contiene` as co JOIN `objetos` as o ON (co.nombreobj = o.nombreobj) 
						WHERE o.img = '{$img}') as sub JOIN objetos as obj ON (sub.resultado = obj.nombreobj)");
						echo '<table><tr><th></th><th align="center">Nombre</th><th>Aprendizaje</th></tr>';
						for ($i = 0; $i < mysqli_num_rows($getResource); $i++) {
							$res = mysqli_fetch_assoc($getResource);
							echo "<tr><td align=\"center\"><img src=\"{$imgroot}{$res['img']}.gif\"></td><td align=><a href=\"wikilifo.php?u={$type}&p={$p}&i={$img}&r={$res['id']}\">{$res['resultado']}</a></td><td align=\"center\">"
								. getDificultad(100 - $res['dificultadaprender']) . "</td></tr>";
						}
						echo '</table>';
						echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}";
						if ($q != "")
							echo '&q=' . $q;
						echo "\">Volver</a>";
					}
				} else {
					echo '<table cellspacing="0" style="border: 1px solid black;"><tr><th align="center" style="padding-left: 5px;">Imagen</th><th align="center">Nombre</th><th align="center">Energía</th><th align="center" style="padding-left: 5px;">Experiencia</th><th align="center">Valor</th></tr>';
					$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (3) ORDER BY `ataq` DESC");
					$totalRows = mysqli_num_rows($getResources);
					$pags = ceil($totalRows / 25);
					$actualPage = 1;
					if (isset($_REQUEST['p'])) {
						$actualPage = $_REQUEST['p'];
					}
					for ($i = 0, $count = 1; $i < $totalRows; $i++, $count++) {
						$resource = mysqli_fetch_assoc($getResources);
						if ($actualPage == ceil($count / 25)) {
							if ($count % 2 == 0) {
								echo "<tr><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">-{$resource['ataq']}</td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['puntosencontrar']}</td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['valor']}</td></tr>";
							} else {
								echo "<tr><td align=\"center\" style=\"padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"padding-left: 5px;\">-{$resource['ataq']}</td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['puntosencontrar']}</td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['valor']}</td></tr>";
							}
						}
					}
					echo '</table><br>';
					for ($j = 1; $j <= $pags; $j++) {
						if ($j == $actualPage) {
							echo '<strong><a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a></strong>';
						} else {
							echo '<a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a>';
						}
						if ($j < $pags) {
							echo ' - ';
						}
					}
					echo $volver;
				}
				break;
			case 7: // Mapas
				echo '<h2 style="font-family: Arial;">Mapas:</h2>';
				if (isset($_REQUEST['i'])) {
					$img = $_REQUEST['i'];
					$p = $_REQUEST['p'];
					$getResource = db_query("SELECT * FROM `objetos` WHERE `img`='{$img}'");
					$res = mysqli_fetch_assoc($getResource);
					$descript = $res['descripcion'] != null ? $res['descripcion'] : '???';
					echo '<table>
						<tr><th align="right">Imagen:</th><td style="padding-left: 10px;"><img src="' . $imgroot . $img . '.gif"></td></tr>
						<tr><th align="right">Nombre:</th><td style="padding-left: 10px;">' . $res['nombreobj'] . '</td></tr>
						<tr><th align="right">Descripción:</th><td style="padding-left: 10px;">';
					if ($us['admin'] == 1) {
						echo '<form action="wikilifo.php" method="post">
							<textarea name="des">' . $descript . '</textarea>
							<p>' . $descript . '</p>';
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>";
						echo '<br><input type="submit" name="moddes" value="Modificar"/></form>';
					} else {
						echo $descript;
					}
					echo '</td></tr>
						<tr><th align="right">Tipo:</th><td style="padding-left: 10px;">' . $res['tipo'] . '</td></tr>
						<tr><th align="right">Nivel mínimo:</th><td style="padding-left: 10px;">' . $res['niveluso'] . '</td></tr>
						<tr><th align="right">Energía:</th><td style="padding-left: 10px;">-' . $res['ataq'] . '</td></tr>
						<tr><th align="right">Valor:</th><td style="padding-left: 10px;">' . $res['valor'] . '</td></tr>
						</table>
						<h3 style="font-family: Arial;">En este mapa se pueden encontrar los siguientes objetos:</h3>';

					$getObjetosMapa = db_query(
						"SELECT explo.id, explo.nombreobj, obj.img, explo.probabilidad, explo.oculto 
						FROM exploracion as explo JOIN objetos as obj ON (explo.nombreobj = obj.nombreobj) 
						WHERE explo.mapa='{$res['nombreobj']}'
						ORDER BY explo.probabilidad DESC, obj.tipo ASC, explo.nombreobj ASC"
					);
					echo '<table><tr>';
					if ($us['admin'] == 1) {
						echo '<th></th>';
					}
					echo '<th align="center">Objeto</th><th>Rareza</th>';
					if ($us['admin'] == 1) {
						echo '<th align="center">Probabilidad(%)</th>';
					}
					echo '</tr>';
					for ($i = 0; $i < mysqli_num_rows($getObjetosMapa); $i++) {
						$ret = mysqli_fetch_assoc($getObjetosMapa);
						$prob = $ret['probabilidad'] / 100;
						$oculto = $ret['oculto'];
						echo "<tr>";
						if ($us['admin'] == 1) {
							echo '<td><form action="wikilifo.php" method="post">';
							echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>
							<input type=\"hidden\" name=\"id\" value=\"{$ret['id']}\"/>";
							echo '<input type="submit" name="borrarexplo" value="Borrar"/></form></td>';
						}
						if ($oculto == 0) {
							echo "<td><img src=\"{$imgroot}{$ret['img']}.gif\">{$ret['nombreobj']}</td><td align=\"center\">" . getRareza($ret['probabilidad']) . "</td>";
						} else if ($us['admin'] == 1) {
							echo "<td><img src=\"{$imgroot}{$ret['img']}.gif\">{$ret['nombreobj']}<b>[OCULTO]</b></td><td align=\"center\">" . getRareza($ret['probabilidad']) . "</td>";
						}
						if ($us['admin'] == 1) {
							echo '<td><form action="wikilifo.php" method="post">';
							echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>
							<input type=\"hidden\" name=\"id\" value=\"{$ret['id']}\"/>
							<label>({$prob}%)</label><input type=\"text\" name=\"val\" size=\"3\" value=\"{$ret['probabilidad']}\"/>";
							echo '<input type="submit" name="modexplo" value="Modificar"/></form></td>';
						}
						echo "</tr>";
					}
					echo '</table><br><br>';
					if ($us['admin'] == 1) {
						echo '<form action="wikilifo.php" method="post">';
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>
							<input type=\"hidden\" name=\"mapa\" value=\"{$res['nombreobj']}\"/>";
						echo '<b>[ADMIN]</b> Añadir un objeto este mapa:<br>';
						echo "<table>
							  <tr><td><label>Objeto:</label></td><td><input type=\"text\" name=\"nombreobj\" size=\"15\" value=\"Tomate\"/></td></tr>
							  <tr><td><label>Probabilidad:</label></td><td><input type=\"text\" name=\"probabilidad\" size=\"3\" value=\"1\"/></td></tr>
							  <tr><td><label>Oculto(0:No,1:Sí):</label></td><td><input type=\"text\" name=\"oculto\" size=\"3\" value=\"0\"/></td></tr>
							  </table>";
						echo '<input type="submit" name="addexplo" value="Añadir"/></form>';
						echo '<br><br>';
					}
					echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}";
					if ($q != "")
						echo '&q=' . $q;
					echo "\">Volver</a>";
				} else {
					echo '<table cellspacing="0" style="border: 1px solid black;"><tr><th align="center" style="padding-left: 5px;">Imagen</th><th align="center">Nombre</th><th align="center">Energía</th><th align="center">Valor</th></tr>';
					$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (7) ORDER BY niveluso DESC, ataq DESC, nombreobj DESC");
					$totalRows = mysqli_num_rows($getResources);
					$pags = ceil($totalRows / 25);
					$actualPage = 1;
					if (isset($_REQUEST['p'])) {
						$actualPage = $_REQUEST['p'];
					}
					for ($i = 0, $count = 1; $i < $totalRows; $i++, $count++) {
						$resource = mysqli_fetch_assoc($getResources);
						if ($actualPage == ceil($count / 25)) {
							if ($count % 2 == 0) {
								echo "<tr><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['ataq']}</td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['valor']}</td></tr>";
							} else {
								echo "<tr><td align=\"center\" style=\"padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['ataq']}</td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['valor']}</td></tr>";
							}
						}
					}
					echo '</table><br>';
					for ($j = 1; $j <= $pags; $j++) {
						if ($j == $actualPage) {
							echo '<strong><a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a></strong>';
						} else {
							echo '<a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a>';
						}
						if ($j < $pags) {
							echo ' - ';
						}
					}
					echo $volver;
				}
				break;
			case 6: // Mascotas
				echo '<h2 style="font-family: Arial;">Mascotas:</h2>';
				if (isset($_REQUEST['i'])) {
					$img = $_REQUEST['i'];
					$p = $_REQUEST['p'];
					$getResource = db_query("SELECT * FROM `objetos` WHERE `img`='{$img}'");
					$res = mysqli_fetch_assoc($getResource);
					$descript = $res['descripcion'] != null ? $res['descripcion'] : '???';
					echo '<table>
						<tr><th align="right">Imagen:</th><td style="padding-left: 10px;"><img src="' . $imgroot . $img . '.gif"></td></tr>
						<tr><th align="right">Nombre:</th><td style="padding-left: 10px;">' . $res['nombreobj'] . '</td></tr>
						<tr><th align="right">Descripción:</th><td style="padding-left: 10px;">';
					if ($us['admin'] == 1) {
						echo '<form action="wikilifo.php" method="post">
							<textarea name="des">' . $descript . '</textarea>
							<p>' . $descript . '</p>';
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>";
						echo '<br><input type="submit" name="moddes" value="Modificar"/></form>';
					} else {
						echo $descript;
					}
					echo '</td></tr>
						<tr><th align="right">Tipo:</th><td style="padding-left: 10px;">' . $res['tipo'] . '</td></tr>
						<tr><th align="right">Experiencia:</th><td style="padding-left: 10px;">' . $res['puntosencontrar'] . '</td></tr>
						<tr><th align="right">Valor:</th><td style="padding-left: 10px;">' . $res['valor'] . '</td></tr>
						</table>
						<h3 style="font-family: Arial;">Éstas son las características de la mascota:</h3>';

					$getvalues = db_query("SELECT masc.nombremascota, masc.nombreobj, masc.img, masc.alimento, masc.ataquebase, masc.defensabase, masc.ataquenivel, masc.defensanivel, masc.expbase, masc.expmult, masc.expgana, masc.maxnivel, obj.img, masc.vidabase, masc.vidanivel FROM mascotas as masc JOIN objetos as obj ON (masc.alimento = obj.nombreobj) WHERE masc.img LIKE '{$img}'");
					$pet = mysqli_fetch_row($getvalues);
					$maxlevel = $pet[11];
					$ataque = 0;
					$defensa = 0;
					echo "Su alimento favorito es: <img src=\"{$imgroot}{$pet[12]}.gif\"> <strong>{$pet[3]}</strong><br><br><strong>Niveles:</strong><br>";
					for ($i = 0; $i < $maxlevel; $i++) {
						$level = $i + 1;
						$exp = $pet[8] + $i * $pet[9];
						$ataque = $pet[4] + $i * $pet[6];
						$defensa = $pet[5] + $i * $pet[7];
						$vida = $pet[13] + $i * $pet[14];
						echo "(Nivel: {$level}/{$maxlevel} / Experiencia: 0/{$exp} / Ataque: {$ataque} / Protección: {$defensa} / Vida: {$vida})<br />";
					}
					echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}";
					if ($q != "")
						echo '&q=' . $q;
					echo "\">Volver</a>";
				} else {
					echo '<table cellspacing="0" style="border: 1px solid black;"><tr><th align="center" style="padding-left: 5px;">Imagen</th><th align="center">Nombre</th><th align="center">Valor</th></tr>';
					$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (6) ORDER BY nivelcomprar DESC, nombreobj DESC");
					$totalRows = mysqli_num_rows($getResources);
					$pags = ceil($totalRows / 25);
					$actualPage = 1;
					if (isset($_REQUEST['p'])) {
						$actualPage = $_REQUEST['p'];
					}
					for ($i = 0, $count = 1; $i < $totalRows; $i++, $count++) {
						$resource = mysqli_fetch_assoc($getResources);
						if ($actualPage == ceil($count / 25)) {
							if ($count % 2 == 0) {
								echo "<tr><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['valor']}</td></tr>";
							} else {
								echo "<tr><td align=\"center\" style=\"padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['valor']}</td></tr>";
							}
						}
					}
					echo '</table><br>';
					for ($j = 1; $j <= $pags; $j++) {
						if ($j == $actualPage) {
							echo '<strong><a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a></strong>';
						} else {
							echo '<a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a>';
						}
						if ($j < $pags) {
							echo ' - ';
						}
					}
					echo $volver;
				}
				break;
			case 5: // Premium 
			case 8: // Premium 
			case 10: // Aumento
			case 11: // Cifrado
			case 4: // Recursos
				if ($type == 4) {
					echo '<h2 style="font-family: Arial;">Recursos:</h2>';
				} else if ($type == 10) {
					echo '<h2 style="font-family: Arial;">Aumento:</h2>';
				} else if ($type == 5 || $type==8) {
					echo '<h2 style="font-family: Arial;">Premium:</h2>';
				} else if ($type == 11) {
					echo '<h2 style="font-family: Arial;">Cifrados:</h2>';
				}
				if (isset($_REQUEST['i'])) {
					$img = $_REQUEST['i'];
					$p = $_REQUEST['p'];
					$getResource = db_query("SELECT * FROM `objetos` WHERE `img`='{$img}'");
					$res = mysqli_fetch_assoc($getResource);
					$descript = $res['descripcion'] != null ? $res['descripcion'] : '???';
					echo '<table>
						<tr><th align="right">Imagen:</th><td style="padding-left: 10px;"><img src="' . $imgroot . $img . '.gif"></td></tr>
						<tr><th align="right">Nombre:</th><td style="padding-left: 10px;">' . $res['nombreobj'] . '</td></tr>
						<tr><th align="right">Descripción:</th><td style="padding-left: 10px;">';
					if ($us['admin'] == 1) {
						echo '<form action="wikilifo.php" method="post">
							<textarea name="des">' . $descript . '</textarea>
							<p>' . $descript . '</p>';
						echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
							<input type=\"hidden\" name=\"u\" value=\"{$type}\"/>
							<input type=\"hidden\" name=\"p\" value=\"{$p}\"/>
							<input type=\"hidden\" name=\"i\" value=\"{$img}\"/>";
						echo '<br><input type="submit" name="moddes" value="Modificar"/></form>';
					} else {
						echo $descript;
					}
					echo '</td></tr>
						<tr><th align="right">Tipo:</th><td style="padding-left: 10px;">' . $res['tipo'] . '</td></tr>
						<tr><th align="right">Experiencia:</th><td style="padding-left: 10px;">' . $res['puntosencontrar'] . '</td></tr>
						<tr><th align="right">Valor:</th><td style="padding-left: 10px;">' . $res['valor'] . '</td></tr>
						</table>';
					echo "<br><br><a href=\"wikilifo.php?u={$type}&p={$p}";
					if ($q != "")
						echo '&q=' . $q;
					echo "\">Volver</a>";
				} else {
					echo '<table cellspacing="0" style="border: 1px solid black;"><tr><th align="center" style="padding-left: 5px;">Imagen</th><th align="center">Nombre</th><th align="center" style="padding-left: 5px;">Experiencia</th><th align="center">Valor</th></tr>';
					$getResources = null;
					if ($type == 4) {
						$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (4) ORDER BY `nombreobj` ASC");
					} else if ($type == 10) {
						$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (10) ORDER BY `valor` DESC");
					} else if ($type == 5 || $type==8){
						$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (5,8) ORDER BY `nombreobj` ASC");
					} else if ($type == 11) {
						$getResources = db_query("SELECT * FROM `objetos` WHERE {$search} `usos` in (11) ORDER BY `nombreobj` ASC");
					}
					$totalRows = mysqli_num_rows($getResources);
					$pags = ceil($totalRows / 25);
					$actualPage = 1;
					if (isset($_REQUEST['p'])) {
						$actualPage = $_REQUEST['p'];
					}
					for ($i = 0, $count = 1; $i < $totalRows; $i++, $count++) {
						$resource = mysqli_fetch_assoc($getResources);
						if ($actualPage == ceil($count / 25)) {
							if ($count % 2 == 0) {
								echo "<tr><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['puntosencontrar']}</td><td align=\"center\" style=\"background-color: #C4C4C4; padding-left: 5px;\">{$resource['valor']}</td></tr>";
							} else {
								echo "<tr><td align=\"center\" style=\"padding-left: 5px;\"><img src=\"{$imgroot}{$resource['img']}.gif\"></td><td align=\"center\" style=\"padding-left: 5px;\"><a href=\"wikilifo.php?u={$type}&p={$actualPage}&i={$resource['img']}\">{$resource['nombreobj']}<a/></td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['puntosencontrar']}</td><td align=\"center\" style=\"padding-left: 5px;\">{$resource['valor']}</td></tr>";
							}
						}
					}
					echo '</table><br>';
					for ($j = 1; $j <= $pags; $j++) {
						if ($j == $actualPage) {
							echo '<strong><a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a></strong>';
						} else {
							echo '<a href="wikilifo.php?u=' . $type . '&p=' . $j;
							if ($q != "")
								echo '&q=' . $q;
							echo '">' . $j . '</a>';
						}
						if ($j < $pags) {
							echo ' - ';
						}
					}
					echo $volver;
				}
				break;
			default:
				header('Location: wikilifo.php');
				return 1;
		}
	} else {
		echo "<h2 style=\"font-family: Arial;\">Categorías:</h2>";
		echo '<table>
			  <tr><td><img src="' . $imgroot . 'rrrrmd.gif"> <a href="wikilifo.php?u=2&p=1">Alimentos</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'cenerrojacti.gif"> <a href="wikilifo.php?u=10&p=1">Aumento</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'mgav.gif"> <a href="wikilifo.php?u=0&p=1">Equipamiento</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'ln.gif"> <a href="wikilifo.php?u=3&p=1">Libros</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'rmapaacl.gif"> <a href="wikilifo.php?u=7&p=1">Mapas</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'rrrppat.gif"> <a href="wikilifo.php?u=6&p=1">Mascotas</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'rprem.gif"> <a href="wikilifo.php?u=5&p=1">Premium</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'rrrpma.gif"> <a href="wikilifo.php?u=4&p=1">Recursos</a></td></tr>
			  <tr><td><img src="' . $imgroot . 'cartelvendedor.gif"> <a href="wikilifo.php?u=11&p=1">Cifrados</a></td></tr>
		      </table>';
	}
}

function procesaform()
{
	global $_REQUEST, $tag, $jug, $conftp, $time;

	if (isset($_REQUEST['moddes'])) {
		$u = $_REQUEST['u'];
		$i = $_REQUEST['i'];
		$p = $_REQUEST['p'];
		if (isset($_REQUEST['tag'])) {
			$des = trim($_REQUEST['des']);
			db_query("UPDATE objetos SET descripcion = '{$des}' WHERE img = '{$i}'");
			$_SESSION['mensaje'] = 'Datos modificados.';
		}
		header('Location: wikilifo.php?u=' . $u . '&p=' . $p . '&i=' . $i);
		return 1;
	}

	// EXPLORACIÓN - ACCIONES //
	if (isset($_REQUEST['addexplo'])) {
		$u = $_REQUEST['u'];
		$i = $_REQUEST['i'];
		$p = $_REQUEST['p'];
		if (isset($_REQUEST['tag'])) {
			$mapa = $_REQUEST['mapa'];
			$nombreobj = ucfirst(trim($_REQUEST['nombreobj']));
			$probabilidad = trim($_REQUEST['probabilidad']);
			$oculto = trim($_REQUEST['oculto']);
			db_query("INSERT INTO `exploracion`( `mapa`, `nombreobj`, `probabilidad`, `oculto`) VALUES ('$mapa','$nombreobj',$probabilidad,$oculto)");
			$_SESSION['mensaje'] = 'Objeto añadido con éxito.';
		}
		header('Location: wikilifo.php?u=' . $u . '&p=' . $p . '&i=' . $i);
		return 1;
	}
	if (isset($_REQUEST['modexplo'])) {
		$u = $_REQUEST['u'];
		$i = $_REQUEST['i'];
		$p = $_REQUEST['p'];
		if (isset($_REQUEST['tag'])) {
			$id = $_REQUEST['id'];
			$val = trim($_REQUEST['val']);
			db_query("UPDATE exploracion SET probabilidad = {$val} WHERE id = {$id}");
			$_SESSION['mensaje'] = 'Datos modificados.';
		}
		header('Location: wikilifo.php?u=' . $u . '&p=' . $p . '&i=' . $i);
		return 1;
	}
	if (isset($_REQUEST['borrarexplo'])) {
		$u = $_REQUEST['u'];
		$i = $_REQUEST['i'];
		$p = $_REQUEST['p'];
		if (isset($_REQUEST['tag']) && $_REQUEST['tag'] == $tag) {
			$id = $_REQUEST['id'];
			db_query("DELETE FROM `exploracion` WHERE id = {$id}");
			$_SESSION['error'] = 'Objeto borrado del mapa.';
		}
		header('Location: wikilifo.php?u=' . $u . '&p=' . $p . '&i=' . $i);
		return 1;
	}
	// - //
}
