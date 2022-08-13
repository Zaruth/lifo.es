<?php
include 'core.php';

$dbs = array("p1", "p2", "p3", "p4", "p5", "p6", "p7", "reydelacolinai", "reydelacolinaii", "test");
$time = time();
$date = getdate();
$fecha = $date['mday'].'-'.$date['mon'].'-'.$date['year'];
//$fecha = $date['0'];
$file = fopen('./logs/clear_'.$fecha.'.txt', "w");
$txt = "###\n
# Limpieza de mensajes diaria\n
# [Comenzando proceso]\n###\n";

try{
	l_setdate(-15);
	foreach ($dbs as &$db) {
		// Elección de la base de datos
		$confdbname = 'lifoes_'.$db;
		$txt .= '# Conectando con '.$confdbname."...\n";
		db_connect();
		db_select_db();
		$txt .= "# ¡Conectado!\n";
		
		// Borrado de mensajes de 10 días o más
		$txt .= "# Borrando mensajes... \n";
		$horalimite = floor($time-10*86400);
		db_query("DELETE FROM mensajes WHERE hora<{$horalimite} AND reportado=0");
		$rows=mysqli_affected_rows($dbc);
		$txt .= '# Borrado finalizado. Filas afectadas: '.$rows." \n";
		
		// Cerrado de la base de datos
		$txt .= '# Cerrando conexión con '.$confdbname."...\n";
		db_close();
		$txt .= "# Cerrada\n###\n";
	}
}catch(Exception $e){
	db_close();
	$txt .= "*****\n* ERROR INESPERADO *\n* ".$e."\n*****\n";
}
fwrite($file, $txt);
fclose($file);
?>