<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$time,$conftp,$imgroot,$confmail;
	$retval = db_query("SELECT nombreobj,img FROM {$conftp}objetos ORDER BY tipo");
	echo "Listado de items: <br/><br/>";
	for ($i = 0;$i < mysqli_num_rows($retval);$i++) {
		$ret = mysqli_fetch_row($retval);
		echo "<img src=\"{$imgroot}{$ret[1]}.gif\" alt=\"{$ret[0]}\"/> {$ret[0]}<br>";
	}
	
	$retval = db_query("SELECT nombreobj,img FROM {$conftp}objetos ORDER BY tipo");
	echo "Listado de imagenes: <br/><br/>";
	for ($i = 0;$i < mysqli_num_rows($retval);$i++) {
		$ret = mysqli_fetch_row($retval);
		echo "<img src=\"{$imgroot}{$ret[1]}.gif\" alt=\"{$ret[0]}\"/>";
		if($i % 10 == 0){
			echo "<br>";
		}
	}

}
function procesaform() {
}
?>
