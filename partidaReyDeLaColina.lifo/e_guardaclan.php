<?php
$dbc = '';
$confdbhost = 'localhost';
$confdbport = '3306';
$confdbuser = 'lifoes_admin';
$confdbpass = 'rez95vier96el92';
$confdbname = 'lifoes_p3';

function db_connect() {
	global $confdbhost,$confdbport,$confdbuser,$confdbpass,$dbc;
	$dbc = mysqli_connect("{$confdbhost}:{$confdbport}",$confdbuser,$confdbpass);
	return $dbc;
}

function db_select_db() {
	global $confdbname,$dbc;
	return mysqli_select_db($confdbname,$dbc);
}

function db_close() {
	global $dbc;
	return mysqli_close($dbc);
}


db_connect();
db_select_db();
try {
	$clanes = mysqli_query($dbc,"SELECT clan, inicio, fin FROM guardaclan;");
	$numrows = mysqli_num_rows($clanes);
	if($numrows == 0){
		$jugadores = mysqli_query($dbc,"SELECT nombrejug, clan, vencedor FROM `jugadores` WHERE clan IN ('Empire of fire','La estirpe','Patagonia','Fumetas del mundo','Poker Stars','Kapo Mafia','Lifo esports gaming') ORDER BY clan;");
		$numrows = mysqli_num_rows($jugadores);
		for($i=0;$i<$numrows;$i++){
			$juga = mysqli_fetch_array($jugadores);
			mysqli_query($dbc,"INSERT INTO `guardaclan`(`nombrejug`, `clan`, `inicio`, `fin`) VALUES ('{$juga[0]}','{$juga[1]}',{$juga[2]},null);");
		}
	} else {
		$jugadores = mysqli_query($dbc,"SELECT nombrejug, clan, vencedor FROM `jugadores` WHERE clan IN ('Empire of fire','La estirpe','Patagonia','Fumetas del mundo','Poker Stars','Kapo Mafia','Lifo esports gaming') ORDER BY clan;");
		$numrows = mysqli_num_rows($jugadores);
		for($i=0;$i<$numrows;$i++){
			$juga = mysqli_fetch_array($jugadores);
			mysqli_query($dbc,"UPDATE `guardaclan` SET `fin`={$juga[2]} WHERE nombrejug='{$juga[0]}' and clan='{$juga[1]}'");
		}
	}
	mysqli_free_result($clanes);
} catch (Exception $e) {
	db_close();
}
?>