<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$_REQUEST,$time,$conftp,$imgroot,$tag,$conftitle;
	techo('Bienvenidos al apartado de relatos de Lifo de '.$conftitle.'. Desde aquí podrás visualizar los últimos relatos escritos por los usuarios para eventos diversos.');
	if(isset($_REQUEST['r'])){
		$id = $_REQUEST['r'];
		$getrelato = db_query("SELECT `id`, `autor`, `titulo`, `texto` FROM {$conftp}`relatos` WHERE `id`={$id}");
		$relato = mysqli_fetch_row($getrelato);
		
		echo "<div style=\"text-align: center; max-width: 1000px;\">
				<h3 ><strong>{$relato[2]}</strong></h3>
			  </div>
			  <div style=\"max-width: 1000px;\">
				{$relato[3]}
			  </div>
			  <br>
			  <div>{$relato[1]}.</div>";
		
		echo "<br><a href=\"relato.php\">Volver</a>";
	} else {
		$getrelatos = db_query("SELECT `id`, `autor`, `partida`, `titulo`, `texto` FROM {$conftp}`relatos`");
		$numrelatos = mysqli_num_rows($getrelatos);
		if ($numrelatos > 0) {
			for ($i = 0;$i < $numrelatos;$i++) {
				$relato = mysqli_fetch_row($getrelatos);
				echo "{$relato[2]}-> <a href=\"relato.php?r={$relato[0]}\">{$relato[3]}</a> - {$relato[1]}<br>";
			}
		} else {
			echo '<br>No hay relatos actualmente.';
		}
	}
	
	
}

function procesaform() {
}
?>
