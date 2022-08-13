<?php
include 'core.php';

try{
	db_connect();
	db_select_db();
	
	$query = db_query("SELECT inicio, cupos FROM lifoes_especial.postman");
	$info = mysqli_fetch_row($query);
	mysqli_free_result($query);
	$inicio = $info[0];
	$cupos = $info[1];
	$lim = 5;
	$numemails = db_query("SELECT COUNT(*) FROM lifoes_especial.emails");
	$nemails = mysqli_fetch_row($numemails)[0];
	mysqli_free_result($numemails);
	if (!is_null($inicio) && time() - $inicio > 3600) {
		$inicio == null;
		$cupos == 100;
		db_query("UPDATE lifoes_especial.postman SET inicio=NULL,cupos={$cupos}");
	}
	
	if ($nemails > 0 && ($cupos > 0 || is_null($inicio))) {
		if (is_null($inicio)){
			$inicio = time();
			$cupos = 100;
		}
		$limite = ($cupos > $lim) ? $lim : $cupos;
		if ($limite > $nemails) {
			$limite = $nemails;
		}
		try {
			$emails = db_query("SELECT `from`, `to`, `subject`, `email` FROM lifoes_especial.emails LIMIT {$limite}");
			if (mysqli_num_rows($emails) > 0){
				while ($email = mysqli_fetch_row($emails)){
					$correoHtml = fopen($email[3], "r") or die("Unable to open file!");	//Abre fichero(lectura)
					$mail = fread($correoHtml, filesize($email[3]));					//Lee fichero
					fclose($correoHtml);												//Cierra fichero
					
					send_mail($email[0], $email[1], $email[2], $mail);
					
					db_query("DELETE FROM lifoes_especial.emails WHERE `to`='{$email[1]}'");
				}
				$cupos -= $limite;
			}
			mysqli_free_result($emails);
		} catch(Exception $e){}
		if ($cupos <= 0){
			$cupos = 0;
		}
		db_query("UPDATE lifoes_especial.postman SET inicio={$inicio},cupos={$cupos}");
	}
}catch(Exception $e){
	echo $e->getMessage();
}
db_close();
?>