<?php
$form = 1;
include('core.php');
function iweb() {
    global $jug, $_REQUEST, $time, $conftp, $imgroot, $local;
	$retval = db_query("SELECT admin FROM jugadores WHERE nombrejug='{$jug}'");
	$ret = mysqli_fetch_row($retval);
	if (!$ret[0])
		return;
	
	$libro = 'Manual de creación de artilugios';
	$retval = db_query("SELECT resultado FROM contiene WHERE nombreobj='{$libro}'");
	$query = "SELECT nombrejug, COUNT(*) as num FROM conoce WHERE resultado IN (";
	$numrows = mysqli_num_rows($retval);
	while($ret = mysqli_fetch_row($retval)){
		$query .= "'{$ret[0]}',";
	}
	$query = substr($query, 0, -1);
	$query .= ") GROUP BY nombrejug";
	
	$retval = db_query($query);
	
	while($ret = mysqli_fetch_row($retval)){
		if($ret[1]==4){
			echo $ret[0].' '.$ret[1].' -> ';
			$q = db_query("SELECT * FROM aprendido WHERE nombrejug='{$ret[0]}' AND resultado='{$libro}'");
			if(mysqli_num_rows($q))
				echo 'Aprendido';
			else
				echo 'No';
			echo '<br>';
		}
	}
}
function procesaform() {
    global $_REQUEST, $jug, $time, $_SESSION, $conftp, $imgroot, $confmail;
	$retval = db_query("SELECT admin FROM jugadores WHERE nombrejug='{$jug}'");
	$ret = mysqli_fetch_row($retval);
	if (!$ret[0])
		header('Location: estado.php');
}