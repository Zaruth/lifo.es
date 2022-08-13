<?php
$form = 1;
include('core.php');
function iweb()
{
	global $jug, $tagc, $time, $us, $confdbname, $imgroot;
	if ($us['admin'] != 1) {
		return;
	}
	$pathPost = "emailSender.php";
	$formId = 1;
	
	
	techo('Desde aquí se pueden realizar diversas acciones con los correos de los usuarios del juego.');
	
	$getEmails = db_query("SELECT COUNT(*) FROM lifoes_especial.emails");
	$numEmails = mysqli_fetch_row($getEmails)[0];
	$getProximo = db_query("SELECT cupos, proximo FROM lifoes_especial.postman");
	$proximo = mysqli_fetch_row($getProximo);
	$pro = ahora_hora($proximo[1]+3600);
	if ($proximo[1]+3600 < time())
		$pro = "<b>ENVIANDO</b>";
	$xhoras = floor($numEmails / 100);
	$restante = floor(($numEmails/15)*2);
	$horas = floor($restante/60) + $xhoras;
	$min = floor($restante%60);
	echo "Correos en cola para enviar: <b>{$numEmails}</b><br>
	      Tiempo para completar envio(aprox): <b>{$horas} horas</b> y <b>{$min} minutos</b><br/>
		  Próximo envío: {$pro}<br/>";
	echo '<h3>Envío de correos</h3>';
	
	echo '<h4>Enviar correo de prueba:</h4>';
	echo mkform($pathPost, '<label>Email: </label> <input type="text" name="correoDestino" placeholder="email@..." required><br>
	<label>Asunto: </label> <input type="text" name="subject" placeholder="Asunto..." required><br>
	<label>Correo a enviar (.html):</label> <input type="file" name="correoHtml" accept=".html"><br>
	<button form="form'.$formId.'" type="submit" name="sendTest" onclick="return c()">Enviar</button>', $formId++, 'post', true);
	echo '<hr>';
	
	echo '<h4>Enviar correo informativo:</h4><b style="color: red;">CUIDADO. El correo se envía a todos los correos guardados.</b>';
	echo mkform($pathPost, '<label>Asunto: </label> <input type="text" name="subject" placeholder="Asunto..." required><br>
	<label>Correo a enviar (.html):</label> <input type="file" name="correoHtml" accept=".html"><br>
	<button form="form'.$formId.'" type="submit" name="send" onclick="return c(\'Cuidado, el correo enviará a todos.\')">Enviar</button><br><i>(El envio masivo de correos tarda, paciencia)</i>', $formId++, 'post', true);
	echo '<hr>';
	
	
	
}

function procesaform()
{
	global $_POST, $_SESSION, $jug, $time, $root, $imgroot, $confdbname, $confmailname,$smtpReplytoMail, $smtpVerificationMail, $smtpDefaultMail;
	$location = 'Location: emailSender.php';
	
	if (isset($_POST['sendTest'])) {
		try {
			if (isset($_POST['correoDestino']) && isset($_POST['subject'])){
				$toEmail = $_POST['correoDestino'];
				$subject = $_POST['subject'];
				if (filter_var($toEmail, FILTER_VALIDATE_EMAIL)) {
					$target_dir = "uploads/";
					$fileName = $_FILES["correoHtml"]["name"];
					$target_file = $target_dir . basename($fileName);
					$fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
					if ( $fileType == "html"){
						move_uploaded_file($_FILES["correoHtml"]["tmp_name"], $target_file);	//Crea el archivo en la carpeta de destino
						
						//$correoHtml = fopen($target_file, "r") or die("Unable to open file!");	//Abre fichero(lectura)
						//$mail = fread($correoHtml, filesize($target_file));						//Lee fichero
						//fclose($correoHtml);													//Cierra fichero
						
						//unlink ($target_file);											    //Borra el archivo
						
						$newName = "uploads/mail_".time().".html";
						postEmail($smtpDefaultMail, $toEmail, $subject, $newName);
						rename($target_file, '../common.lifo.es/'.$newName);
						
						//send_mail($smtpReplytoMail, $toEmail, $subject, $mail);
						
						$_SESSION['mensaje'] = "Email encolado.";
					} else {
						$_SESSION['error'] = "ERROR: Archivo no válido.";
					}
				} else {
					$_SESSION['error'] = "ERROR: Email no válido.";
				}
			} else {
				$_SESSION['error'] = "ERROR: Email y/o asunto no válido.";
			}
		} catch(Exception $e){ $error .= $e->getMessage(); }
		if(isset($error)){
			$_SESSION['error'] = "Error capturado: ".$error;
		}
		header($location);
		return 1;
	}
	
	if (isset($_POST['send'])) {
		try {
			if (isset($_POST['subject'])){
				$subject = $_POST['subject'];
				$target_dir = "uploads/";
				$fileName = $_FILES["correoHtml"]["name"];
				$target_file = $target_dir . basename($fileName);
				$fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
				if ( $fileType == "html"){
					move_uploaded_file($_FILES["correoHtml"]["tmp_name"], $target_file);
					$newName = "uploads/mail_".time().".html";
					
					$getDbs = db_query("SELECT SCHEMA_NAME FROM information_schema.schemata WHERE SCHEMA_NAME LIKE 'lifoes_p%'");
					$db = mysqli_fetch_row($getDbs);
					$SELECT = "SELECT DISTINCT(email) FROM {$db[0]}.jugadores WHERE email LIKE '%@%.%' ";
					while ($db = mysqli_fetch_row($getDbs)[0]) {
						$SELECT .= "UNION SELECT DISTINCT(email) FROM {$db}.jugadores WHERE email LIKE '%@%.%' ";
					}
					
					db_query("INSERT INTO lifoes_especial.emails ( `from`, `to`, `subject`, `email`) 
						SELECT '{$smtpDefaultMail}', tab.email, '{$subject}', '{$newName}' FROM ({$SELECT}) as tab");
					rename($target_file, '../common.lifo.es/'.$newName);
					/*
					move_uploaded_file($_FILES["correoHtml"]["tmp_name"], $target_file);	//Crea el archivo en la carpeta de destino
					$correoHtml = fopen($target_file, "r") or die("Unable to open file!");	//Abre fichero(lectura)
					$mail = fread($correoHtml, filesize($target_file));						//Lee fichero
					fclose($correoHtml);													//Cierra fichero
					unlink ($target_file);													//Borra el archivo
					
					$emails = db_query("SELECT email FROM lifoes_especial.emails");
					while ($toEmail = mysqli_fetch_row($emails)[0]) {
						try {
							send_mail($smtpReplytoMail, $toEmail, $subject, $mail);
						} catch(Exception $e) { $error .= $e->getMessage(); }
					}
					*/
					$_SESSION['mensaje'] = "Mensajes enviados a todos los correos .";
				} else {
					$_SESSION['error'] = "ERROR: Archivo no válido.";
				}
			} else {
				$_SESSION['error'] = "ERROR: Asunto no válido.";
			}
		} catch(Exception $e){ $error .= $e->getMessage(); }
		if(isset($error)){
			$_SESSION['error'] = "Error capturado: ".$error;
		}
		header($location);
		return 1;
	}
}
