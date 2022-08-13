<?php
$form = 1;
$nosetact = 1;
include('core.php');
function iweb() {
	global $jug,$conftp,$imgroot;
	techo("Esta es la pestaña de logros, desde aquí podrás visualizar los logros conseguidos y los que te falten.");
	$query = db_query("SELECT IFNULL(SUM(lo.puntos), 0),(SELECT SUM(puntos) FROM logros), COUNT(*), (SELECT COUNT(*) FROM logros) FROM logros as lo JOIN tienelogros as tie ON (lo.id=tie.id)WHERE tie.nombrejug='{$jug}'");
	$var = mysqli_fetch_row($query);
	mysqli_free_result($query);
	echo "<center><table><tr><td width=\"630\">Puntos actuales: <b>{$var[0]}</b> / <b>{$var[1]}</b> </td></tr><tr><td>Logros obtenidos: <b>{$var[2]}</b> / <b>{$var[3]}</b></td></tr></table><br><table border=\"1\" cellspacing=\"0\" id=\"wiki\">";
	$query = db_query("SELECT lo.id,lo.nombre,lo.descripcion,lo.puntos,tit.descripcion,lo.objetos,tie.fecha FROM logros AS lo LEFT JOIN titulos AS tit ON (lo.tituloid=tit.id) LEFT JOIN tienelogros AS tie ON (lo.id=tie.id AND tie.nombrejug='{$jug}') WHERE lo.oculto=0 ORDER BY lo.id ASC");
	$numrows=mysqli_num_rows($query);
	$query2 = db_query("SELECT lo.id,lo.nombre,lo.descripcion,lo.puntos,tit.descripcion,lo.objetos,tie.fecha FROM logros AS lo LEFT JOIN titulos AS tit ON (lo.tituloid=tit.id) JOIN tienelogros AS tie ON (lo.id=tie.id) WHERE tie.nombrejug='{$jug}' AND lo.oculto=1 ORDER BY lo.id ASC");
	$numrows2=mysqli_num_rows($query2);
	for($i=0;$i<$numrows;$i++){
		$var = mysqli_fetch_row($query);
		$dia = '-- / -- / --';
		$nombreimg = 'logrooculto';
		if($var[6] != null){
			$nombreimg = "logro{$var[0]}";
			$dia = ahora_dia($var[6]);
		}
		echo "<tr><td><img src=\"{$imgroot}{$nombreimg}.gif\"></td><td width=\"300\"><b>{$var[1]}</b>:<br>{$var[2]}</td><td>Recompensa:<br>-Puntos: <b>{$var[3]}</b>";
		if ($var[4]!=null) echo "<br>-Título: <b>{$var[4]}</b>";
		if ($var[5]!=null) {
			$items = explode("#", $var[5]);
			echo "<br>-Objeto: "; 
			for ($j=0;$j<count($items);$j++){
				$itm = explode("$", $items[$j]);
				echo "<b>x{$itm[1]} {$itm[0]}</b>";
				if ($j+1!=count($items)) echo '<br>';
			}
		}
		echo "</td><td align=\"center\">Fecha de obtención:<br><b>{$dia}</b></td></tr>";
	}
	echo "</table></center>";
	mysqli_free_result($query);
	if ($numrows2!=0) {
		echo '<center><br><br><b>(Logros secretos)</b><br><table border="1" cellspacing="0" id="wiki">';
		for($i=0;$i<$numrows2;$i++){
			$var = mysqli_fetch_row($query2);
			$dia = '-- / -- / --';
			$nombreimg = 'logrooculto';
			if($var[6] != null){
				$nombreimg = "logro{$var[0]}";
				$dia = ahora_dia($var[6]);
			}
			echo "<tr><td><img src=\"{$imgroot}{$nombreimg}.gif\"></td><td width=\"300\"><b>{$var[1]}</b>:<br>{$var[2]}</td><td>Recompensa:<br>-Puntos: <b>{$var[3]}</b>";
			if ($var[4]!=null) echo "<br>-Título: <b>{$var[4]}</b>";
			if ($var[5]!=null) {
				$items = explode("#", $var[5]);
				echo "<br>-Objeto: "; 
				for ($j=0;$j<count($items);$j++){
					$itm = explode("$", $items[$j]);
					echo "<b>x{$itm[1]} {$itm[0]}</b>";
					if ($j+1!=count($items)) echo '<br>';
				}
			}
			echo "</td><td align=\"center\">Fecha de obtención:<br><b>{$dia}</b></td></tr>";
		}
		echo '</table></center><br><br>';
	}
	mysqli_free_result($query2);
}
function procesaform() {}
?>
