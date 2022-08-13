<?php
include 'core.php';

try{
	db_connect();
	db_select_db();

	date_default_timezone_set('Europe/Madrid');

 	// Sacamos las bases de datos existentes
	$databases = db_query("SHOW DATABASES LIKE 'lifoes_p%'");
	$dbs = array();
	while($db = mysqli_fetch_array($databases)[0])
		array_push($dbs,$db);
	array_push($dbs,'lifoes_test');
	
	// Vaciamos las tablas
	$confdbname = 'lifoes_especial';
	db_select_db();
	db_query("DELETE FROM `ma_aparece` WHERE 1");
	db_query("DELETE FROM `ma_ofertado` WHERE 1");

	// Establecimiento de horas por partidas
	foreach ($dbs as $key => $db) {
		$ttime = time();  				// Sacamos el tiempo actual en segundos
		$date = date('H:i:s', $ttime);	// Sacamos horas, minutos y segundos
		$date = explode(':',$date);		// y los guardamos por separado

		$ttime -= ($date[0]*3600) + ($date[1]*60) + $date[2];	// A fecha actual le establecemos
																// horas, minutos y segundos a 0
		$ttime += rand(0,24-$conf_numHorasMercader)*3600;		// Establecemos la hora de salida
		db_query("INSERT INTO `ma_aparece`(`partida`, `hora`) VALUES ('{$db}',{$ttime})");
	}
	
	db_query("DELETE FROM lifoes_p8.`ofertasaceptadas` WHERE unica=0");
	db_query("DELETE FROM lifoes_test.`ofertasaceptadas` WHERE unica=0");

	foreach ($dbs as $key => $db) {
		$of = db_query("SELECT DISTINCT(`idoferta`) FROM ma_ofertas WHERE `unica` = 0 ORDER BY RAND() LIMIT 5");
		while($idof = mysqli_fetch_array($of)[0]){
			db_query("INSERT INTO `ma_ofertado`(`partida`, `idoferta`) VALUES ('{$db}',{$idof})");
		}
	}

	db_close();
}catch(Exception $e){
	db_close();

	echo $e;
}