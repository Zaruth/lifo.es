<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$_REQUEST,$time,$conftp,$imgroot,$tag;
	if (!isAdmin($jug)){ return; }
	echo '<h3>Mascotas</h3>';
	if(isset($_REQUEST['ver'])){
		$getvalues = db_query("SELECT `nombremascota`, `nombreobj`, `img`, `alimento`, `ataquebase`, `defensabase`, `ataquenivel`, `defensanivel`, `expbase`, `expmult`, `expgana`, `maxnivel` FROM {$conftp}`mascotas` WHERE `img` LIKE '{$_REQUEST['img']}'");
		$pet = mysqli_fetch_row($getvalues);
		
		echo "<p>Niveles de la mascota <strong>{$pet[0]}</strong>:<p>";
		$maxlevel = $pet[11];
		$ataque = 0;
		$defensa = 0;
		for ($i = 0;$i<$maxlevel;$i++) {
			$level = $i + 1;
			$exp = $pet[8] + $i * $pet[9];
			$ataque = $pet[4] + $i * $pet[6];
			$defensa = $pet[5] + $i * $pet[7];
			echo "(Nivel: {$level}/{$maxlevel} / Experiencia: 0/{$exp} / Ataque: {$ataque} / Protección: {$defensa})<br />";
			
		}
		$total = $ataque + $defensa;
		echo "<p>Ataque(<b>MAX</b>): {$ataque} / Protección(<b>MAX</b>): {$defensa} // Balance Global: {$total}</p>";
		
		echo '<br /><a href="edititems.php">Volver</a> -- <a href="edititems.php?editar&img='.$pet[2].'">Editar</a>';
	} else if (isset($_REQUEST['editar'])) {
		$getvalues = db_query("SELECT `nombremascota`, `nombreobj`, `img`, `alimento`, `ataquebase`, `defensabase`, `ataquenivel`, `defensanivel`, `expbase`, `expmult`, `expgana`, `maxnivel` FROM {$conftp}`mascotas` WHERE `img` LIKE '{$_REQUEST['img']}'");
		$pet = mysqli_fetch_row($getvalues);
		
		echo "<p>Mascota: <strong>{$pet[0]}</strong>:<p>";
		echo '
		<form method="post" action="edititems.php">
		<input type="hidden" name="tag" value="'.$tag.'"/>
		<input type="hidden" name="oldimg" value="'.trim($pet[2]).'"/>
		<table>
		<tr><td align="right"><label>nombremascota:</label></td><td><input type="text" name="nombremascota" value="'.trim($pet[0]).'"/></td></tr>
		<tr><td align="right"><label>nombreobj:</label></td><td><input type="text" name="nombreobj" value="'.trim($pet[1]).'"/></td></tr>
		<tr><td align="right"><label>img:</label></td><td><input type="text" name="img" value="'.trim($pet[2]).'"/></td></tr>
		<tr><td align="right"><label>alimento:</label></td><td><input type="text" name="alimento" value="'.trim($pet[3]).'"/></td></tr>
		<tr><td align="right"><label>ataquebase:</label></td><td><input type="text" name="ataquebase" value="'.trim($pet[4]).'"/></td></tr>
		<tr><td align="right"><label>defensabase:</label></td><td><input type="text" name="defensabase" value="'.trim($pet[5]).'"/></td></tr>
		<tr><td align="right"><label>ataquenivel:</label></td><td><input type="text" name="ataquenivel" value="'.trim($pet[6]).'"/></td></tr>
		<tr><td align="right"><label>defensanivel:</label></td><td><input type="text" name="defensanivel" value="'.trim($pet[7]).'"/></td></tr>
		<tr><td align="right"><label>expbase:</label></td><td><input type="text" name="expbase" value="'.trim($pet[8]).'"/></td></tr>
		<tr><td align="right"><label>expmult:</label></td><td><input type="text" name="expmult" value="'.trim($pet[9]).'"/></td></tr>
		<tr><td align="right"><label>expgana:</label></td><td><input type="text" name="expgana" value="'.trim($pet[10]).'"/></td></tr>
		<tr><td align="right"><label>maxnivel:</label></td><td><input type="text" name="maxnivel" value="'.trim($pet[11]).'"/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" name="modificar" onclick="return c()" value="Modificar"/></td></tr>
		</table>
		
		</form>
		';
		
		echo '<br /><a href="edititems.php">Volver</a> -- <a href="edititems.php?ver&img='.$pet[2].'">Ver estadísticas</a>';
	} else {
		$getvalues = db_query("SELECT `nombremascota`, `nombreobj`, `img`, `alimento`, `ataquebase`, `defensabase`, `ataquenivel`, `defensanivel`, `expbase`, `expmult`, `expgana`, `maxnivel`, ((`ataquebase` + (`ataquenivel` * (`maxnivel` - 1))) + (`defensabase` + (`defensanivel` * (`maxnivel` - 1)))) as `balance` FROM {$conftp}`mascotas` ORDER BY balance ASC");

		echo '<p><i>*Ordenadas por balance global.</i></p><table border="1">';
		echo '<th>BALANCE</th> <th>NombreMascota</th> <th>NombreObjeto</th> <th>Imagen</th> <th>Alimento</th> <th>AtaqueBase</th> <th>DefensaBase</th> <th>AtaqueNivel</th> <th>DefensaNivel</th> <th>ExpBase</th> <th>ExpMult</th> <th>ExpGana</th> <th>MaxNivel</th> <th>Opciones</th>';
		for ($i = 0;$i< mysqli_num_rows($getvalues);$i++) {
			$pet = mysqli_fetch_row($getvalues);
			echo "<tr>
			<td>{$pet[12]}</td> <td>{$pet[0]}</td> <td>{$pet[1]}</td> <td>{$pet[2]}</td> <td>{$pet[3]}</td> <td>{$pet[4]}</td> <td>{$pet[5]}</td> <td>{$pet[6]}</td> <td>{$pet[7]}</td> <td>{$pet[8]}</td> <td>{$pet[9]}</td> <td>{$pet[10]}</td> <td>{$pet[11]}</td> <td> <a href=\"edititems.php?ver&img={$pet[2]}\">Ver</a> # <a href=\"edititems.php?editar&img={$pet[2]}\">Editar</a> </td>
			</tr>";
		}
		echo '</table><br />';
	}
}

function procesaform() {
	global $_REQUEST,$jug,$time,$_SESSION,$conftp,$imgroot,$confmail,$tag;
	
	if (isset($_REQUEST['modificar'])) {
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($tag == $gtag) {
				db_query("UPDATE `mascotas` SET 
				nombremascota = '".$_REQUEST['nombremascota']."',
				nombreobj = '".$_REQUEST['nombreobj']."',
				img = '".$_REQUEST['img']."',
				alimento = '".$_REQUEST['alimento']."',
				
				ataquebase =".$_REQUEST['ataquebase'].",
				defensabase =".$_REQUEST['defensabase'].",
				ataquenivel =".$_REQUEST['ataquenivel'].",
				defensanivel =".$_REQUEST['defensanivel'].",
				expbase =".$_REQUEST['expbase'].",
				expmult =".$_REQUEST['expmult'].",
				expgana =".$_REQUEST['expgana'].",
				maxnivel =".$_REQUEST['maxnivel']."
				WHERE img LIKE '".$_REQUEST['oldimg']."'");
				$_SESSION['mensaje'] = 'Objeto modificado.';
			}
			else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		if (isset($_REQUEST['img'])) {
			header( 'Location: edititems.php?editar&img='.$_REQUEST['img'] );
			return 1;
		} else {
			header( 'Location: edititems.php' );
			return 1;
		}
	}
}

?>