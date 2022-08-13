<?php
$form = 1;
include('core.php');
function iweb() {
}
function procesaform() {
	global $imgroot,$time;
	if(isset($_REQUEST['s'])){
		try {
			$string = $_REQUEST['s'];
			require_once('xor.php');
			$string = desencryptXor($string);
			$values = explode("#", $string);
			$retval = db_query("SELECT verificado FROM jugadores WHERE nombrejug='{$values[0]}' AND email='{$values[1]}'");
			$a = mysqli_num_rows($retval);
			if($a>0){
				$ret = mysqli_fetch_row($retval);
				if ($ret[0]==0) {
					db_query("UPDATE `jugadores` SET `verificado`=1 WHERE nombrejug='{$values[0]}'");
					$_SESSION['mensaje'] = '¡Cuenta verificada! Recuerda tus credenciales para poder entrar.';
					$mensaje = "
					Has conseguido los objetos:<br> 
					<strong>x1</strong> <img src=\"{$imgroot}cupeq.gif\"> Cuchillo (Ataque: 1 / Protección: 0 / Nivel: 1)<br>
					<strong>x1</strong> <img src=\"{$imgroot}esroto.gif\"> Escudo roto (Ataque: 0 / Protección: 2 / Nivel: 1)<br>
					Equípatelos y ¡prepárate para la batalla!";
					dale_objeto($values[0],'Escudo roto');
					dale_objeto($values[0],'Cuchillo');
					db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$values[0]}','@',{$time},'{$mensaje}')");
				} else {
					$_SESSION['error'] = 'Error, la cuenta ya fue verificada.';
				}
			} else {
				$_SESSION['error'] = 'Error, no existe el usuario.';
			}
		} catch (Exception $e) {
			$_SESSION['error'] = 'Hubo un error inesperado: '.$e;
		}
		header('Location: estado.php');
		return 1;
	}
}
?>
