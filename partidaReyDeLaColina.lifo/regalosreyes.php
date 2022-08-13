<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$time,$us,$conftp,$imgroot,$confmail,$tag;
	if ($us['admin'] == 0)
		return;
	
	echo "<form action=\"regalosreyes.php\" method=\"post\">
		<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
		<input type=\"submit\" name=\"repartir\" value=\"Repartir regalos\"/>
		</form>";
}

function procesaform() {
	global $_REQUEST,$tag,$jug,$us,$time,$conftp;
	if (isset($_REQUEST['repartir'])) {
		if ((isset($_REQUEST['tag']))) {
			$gtag = $_REQUEST['tag'];
			if ($tag == $gtag) {
				$retval = db_query("SELECT nombrejug, insignia FROM jugadores");
				$mensaje = "OH OH OH... FELICES FIESTAS A TODOS";
				$num = mysqli_num_rows($retval);
				for ($i = 0;$i < $num;$i++) {
					$ret = mysqli_fetch_row($retval);
					db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$ret[0]}','@',$time,'{$mensaje}')");
					if ($ret[1] == 'zarn') {
						quita_objeto($ret[0],'Arbolito de navidad','zarn');
						dale_objeto($ret[0],'Arbolito de navidad con regalos');
						dale_objeto($ret[0],'Cofre festivo');
						db_query("UPDATE jugadores SET insignia='zarnr' WHERE nombrejug='{$ret[0]}'");
					}
				}
				$_SESSION['mensaje'] = "OH OH OH... FELICES FIESTAS A TODOS";
			}
			else{
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		header('Location: regalosreyes.php');
		return 1;
	}
}
?>