<?php
$form = 1;
include('core.php');
function iweb() {
	global $jug,$tag,$time,$conforonivelataca,$confdifnivel,$conftp,$us,$imgroot;
	header('Location: estado.php');
	return 1;
	include_once('halloween/php/player.php');
	include_once('halloween/php/monster.php');
	$player = new Player();
	$player->getPlayerDB($jug);
	echo "
	<p>Para el combate contra monstruos, se usan estadísticas distintas del combate convencional.<br>Las que aparecen a continuación son las tuyas actualmente:<br></p>
	<table>
		<tr><td style=\"color: darkred;\">-Daño: </td><td><strong>{$player->dmg}</strong></td><td>(Daño total: Personaje + Mascota + Objetos)</td></tr>
		<tr><td style=\"color: darkgreen;\">-Vida: </td><td><strong>{$player->hp} </strong></td><td>(Armadura total: Personaje + Mascota + Objetos)</td></tr>
		<tr><td style=\"color: darkblue;\">-Crítico: </td><td><strong>{$player->crit}</strong>%</td><td>(Probabilidad de golpe crítico: Base[10] + Objetos)</td></tr>
		<tr><td style=\"color: chocolate;\">-Evasión: </td><td><strong>{$player->evasion}</strong>%</td><td>(Índice de esquiva: Base[10] + Objetos)</td></tr>
		<tr><td style=\"color: darkslategray;\">-Bloqueo: </td><td><strong>{$player->blocking}</strong>%</td><td>(Reducción de daño: Objetos)</td></tr>
		<tr><td style=\"color: olive;\">-Espinas: </td><td><strong>{$player->thorns}</strong>%</td><td>(Daño por contacto: Objetos)</td></tr>
		<tr><td style=\"color: indigo;\">-Toque vampírico: </td><td><strong>{$player->lifeStealing}</strong>%</td><td>(Absorción de vida: Objetos)</td></tr>
	</table>
	<br><p>Esta es tu puntuación actual: <strong>{$player->score}</strong> pts.</p><br>
	<table>
	<tr><td colspan=\"4\"><h4>Monstruos disponibles:</h4></td></tr>";
	
	if ($us['nivel'] < 10) {
		echo "<tr><td colspan=\"4\"><h4 style=\"color: red;\"><strong>Necesitas ser al menos nivel 10 para poder participar.</strong></h4></td></tr>";
	} else {
		$monsterList = getMonstersDB();
		for ($i = 0;$i < count($monsterList);$i++) {
			$m = $monsterList[$i];
			echo "
			<tr>
				<td align=\"center\">{$m->name}</td>
				<td align=\"center\"> <img src=\"halloween/imgs/enemies/{$m->img}.gif\" alt=\"{$m->name}\" title=\"{$m->name}\"> </td>
				<td align=\"center\">
					<form method=\"post\" action=\"hallocombat.php\">
					<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
					<input type=\"hidden\" name=\"enemy\" value=\"{$m->id}\"/>
					<input type=\"hidden\" name=\"cost\" value=\"{$m->cost}\"/>";
			if ($us['energia'] + $m->cost >= 0) {
				echo   "<input type=\"submit\" name=\"combatir\" onclick=\"return c()\" value=\"Combatir\"/>";
			} else {
				echo "<font style=\"color: red;\"><strong>[Energía insuficiente]</strong></font>";
			}
			echo"</form>
				</td>
				<td>({$m->cost} energía) Nivel recomendado: {$m->level}</td>
			</tr>
			";
		}
	}
	
	echo "</table>";
	
	echo "<br><br><a href=\"halloween.php\">Volver<a>";
}

function procesaform() {
	global $_REQUEST,$tag,$jug,$us,$time,$conforonivelataca,$confdifnivel,$conftp;
	if (isset($_REQUEST['combatir'])) {
		$salirnow = 0;
		if (isset($_REQUEST['tag'])) {
			$gtag = $_REQUEST['tag'];
			if ($tag == $gtag) {
				if ($us['nivel'] >= 10) {
					if ($us['energia'] + $_REQUEST['cost'] >= 0) {
						db_query("UPDATE {$conftp}jugadores SET energia = energia + {$_REQUEST['cost']} WHERE nombrejug LIKE '{$jug}'");
						include_once('./halloween/php/fight.php');
						fight($_REQUEST['enemy']);
						$salirnow = 1;
					} else {
						$_SESSION['error'] = '¡No tienes suficiente energía!';
					}
				} else {
					$_SESSION['error'] = '¡No tienes nivel suficiente! Necesitas ser nivel 10 como mínimo.';
				}
			} else {
				$_SESSION['error'] = '¡Intenta de nuevo, por favor!';
			}
		}
		if ($salirnow) {
			header('Location: mensajeria.php');
			sumapuntosMonster();
		}
		else
			header('Location: hallocombat.php');
		return 1;
	}
}

?>