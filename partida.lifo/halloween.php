<?php
$form = 1;
include('core.php');
function iweb() {
global $jug,$tag,$time,$conforonivelataca,$confdifnivel,$conftp,$us,$imgroot;
	header('Location: estado.php');
	return 1;
echo "
<p><i>Música ambiental: </i>
	<!--audio controls-->
	<audio controls autoplay loop autobuffer preload=\"metadata\">
	<source src=\"halloween/music/spooky.mp3\" type=\"audio/mpeg\">
	Tu navegador no soporta el elemento de audio.
</audio></p>
<p>Lifo ya no se considera un lugar plácido donde descansar y apoyar el escudo. Los seres oscuros han llegado...</p>
<div style=\"max-width: 1000px;\">
	<h3 style=\"text-align: center;\">
		<img src=\"halloween/imgs/decoration/pumpkin.png\" alt=\"Calabaza decorada\" title=\"Calabaza decorada\"> 
		<u>Evento Halloween</u> 
		<img src=\"halloween/imgs/decoration/pumpkin.png\" alt=\"Calabaza decorada\" title=\"Calabaza decorada\">
	</h3><br>
	<p>Cuando el Caballero Sora fue a visitar a los Chamanes Reales de Lifo al Centro del Volcán en busca de nuevos augurios, éstos no se mostraron nada tranquilos. Las runas les habían mostrado el más terrible de los sucesos. Hablaban de seres infernales provenientes del mismísimo Averno. Criaturas horrendas capaces de destrozar toda la Dimensión. Miedo, Decadencia y Posesión fueron las últimas tres palabras que pronunciaron al unísono.</p>
	<p>Sora no podía estar más abrumado. Les preguntó cuándo se produciría esa hecatombe y los chamanes no emitieron sonido alguno.</p>
	<p>Los días pasaron y la población se vistió con sus mejores armaduras para lo que la profecía aseguraba.</p>
	<p>El verano quedó atrás y el invierno se hizo notar. Las ventiscas de nieve destrozaron las cosechas y las reses morían de hambre. La población estaba en un momento crítico y todos asumieron que esa era la condena sobre la que el Caballero Sora habló aquellos días. </p>
	<p>La noche del 1 de noviembre, cuando todo el mundo dormía, el Volcán entró en erupción y las Bestias del Averno irrumpieron con una brutalidad extrema en la Dimensión Lifo. </p>
	<p>Los Murciélagos se convirtieron en vampiros sedientos de sangre. </p>
	<p>Los Esqueletos de los Cementerios cobraron vida con la única voluntad que destrozar los huesos de los vivos. </p>
	<p>Los ciudadanos muertos por el frío se convirtieron en Zombis y Momias.</p>
	<p>Y los Espíritus vinieron de la Necrópolis, también conocida como la Tierra Maldita.</p>
	<p>La matanza en algunos pueblos de la Comarca fue sanguinaria. Familias degolladas, mutiladas y convertidas en Ejército de Bestias.</p>
	<p>Los Hombres y Mujeres más fuertes de Lifo se dispusieron a luchar contra estas criaturas y frenar el apocalipsis.</p>
	<p>En primera instancia, debían llegar al Cementerio y derrotar a todos los Esqueletos.<br>
	Más adelante se deberían enfrentar a los Zombies y Momias en las Catacumbas.<br>
	Por último, se adentrarían en lo más profundo de la Necrópolis, quedando a merced de las más terribles criaturas, con el objetivo de derrotar a los Vampiros y Espíritus.</p>
	<p>Una vez finalizado cada objetivo, obtendrían un cofre que les permitiría poder seguir adelante.</p>
	<p>Nunca más se supo de los Chamanes Reales que vivían en el interior del Volcán.</p>
</div>
<br>
<div>".'
<font style="color:#1A007F"><strong>¡Por tiempo limitado!</strong></font><br>
Combate contra bestias del Averno:<br>
<button onclick="window.location.href=\'hallocombat.php\';">Ir a combate contra monstruos</button>
'."</div>
";
}

function procesaform() {
}
?>
