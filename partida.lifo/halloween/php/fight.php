<?php
function fight($enemy) {
	global $jug,$us,$imgroot,$time,$conftp;
	include_once('player.php');
	include_once('monster.php');
	
	$player = new Player();
	$player->getPlayerDB($jug); 	//Seteo de jugador
	$monster = new Monster();
	$monster = getMonsterDB($enemy);//Seteo de monstruo
	
	$message = "<strong>¡Combate!</strong> <img src=\"{$imgroot}img/{$us['insignia']}.gif\" alt=\"Insignia jugador \"/>{$jug} (nivel {$us['nivel']}) se enfrenta a {$monster->name} <img src=\"{$imgroot}img/{$monster->img}.gif\" alt=\"Insignia Monstruo\"/><br><br>";
	$message .= getHpTotal($player, $monster);
	
	
	$defeated = 0;
	$turno = 0;
	do {
		$turno++;
		$message .= "<strong>Turno {$turno}:</strong><br>";
		
		//Turno Jugador
		hit($player, $monster, $message);
		//Fin turno Jugador
		
		$defeated = checkIfFinish($player,$monster);
		if($defeated != 0){
			$message .= getHpTotal($player, $monster);
			break;
		}
		
		//Turno Monstruo
		hit($monster, $player, $message);
		//Fin turno Monstruo
		
		$message .= getHpTotal($player, $monster);
		$defeated = checkIfFinish($player,$monster);
	} while ($defeated == 0); 
	
	if ($defeated == 1) {
		$message .= "<br><strong>{$jug} ha perdido el combate.<br>El monstruo \'{$monster->name}\' ";
		switch (rand(1,4)) {
			case 1:
				$message .= "te ha machacado.</strong>";
				break;
			case 2:
				$message .= "te ha hecho papilla.</strong>";
				break;
			case 3:
				$message .= "te ha destrozado.</strong>";
				break;
			case 4:
				$message .= "te ha hecho morder el polvo.</strong>";
				break;
		}
	} else {
		$gold = $monster->getGold();
		$exp = $monster->getExp();
		$message .= "<br><strong>¡{$jug} ha ganado el combate!<br>¡{$jug} consigue {$gold} monedas de oro!<br>¡{$jug} gana {$exp} puntos de experiencia!</strong>";
		
		include_once('lootableitem.php');
		$lootableItems = getLootableItemsByMonster($monster->id);
		$numItems = count($lootableItems);
		if ($numItems > 0) {
			$gotItems = [];
			for ($i = 0; $i < $numItems; $i++) {
				$item = $lootableItems[$i];
				$rand = rand(0,100);
				if (0 < $rand && $rand <= $item->prob){
					array_push($gotItems, $item);
				}
			}
			if (count($gotItems) > 0) {
				$message .= "<br><br>Has obtenido:";
				foreach ($gotItems as $item) {
					$quantity = rand($item->quantityMin, $item->quantityMax);
					dale_objeto($jug, $item->itemName, $quantity);
					$message .= "<br><img src=\"img/{$item->img}.gif\"> x{$quantity} {$item->itemName}";
				}
			}
		}
		
		db_query("UPDATE {$conftp}jugadores SET oro = oro + {$gold},puntossuma = puntossuma + {$exp} WHERE nombrejug='{$jug}'");
		addHalloweenScore($jug, $monster->score);
	}
	
	db_query("INSERT INTO {$conftp}mensajes (nombrejug, remitente, hora,mensaje) VALUES ('{$jug}','@',{$time},'{$message}')");
}

//Golpe
function hit(&$player1, &$player2, &$message){
	$randEvasion = rand(0,100);
	if (0 < $randEvasion && $randEvasion <= $player2->evasion) { //Evasión
		$message .= "<strong>{$player2->name}</strong> esquivó el ataque de <strong>{$player1->name}</strong>.<br>";
	} else {
		
		$dmg = ($player1->dmg) * (rand(90,110)/100);
		$randCrit = rand(0,100);
		if (0 < $randCrit && $randCrit <= $player1->crit) { //Crítico
			$dmg *= 2;
			$crit = true;
		}
		
		$reduction = ($dmg * $player2->blocking) / 100;
		$dmg = floor($dmg - ($reduction));
		if ($dmg < 0) { $dmg = 0; }
		
		
		if (isset($crit) && $crit == true) {
			$message .= "<strong>¡{$player1->name}</strong> asesta un golpe crítico de <strong>{$dmg}</strong> de daño!<br>";
		} else {
			$message .= "<strong>{$player1->name}</strong> asesta un golpe de <strong>{$dmg}</strong> de daño.<br>";
		}
		$player2->hitDmg($dmg);
		
		
		//robo de vida
		if ($player1->lifeStealing > 0 && $dmg > 0) {
			$curacion = floor($dmg * ($player1->lifeStealing / 100));
			if ($curacion > 0) {
				$player1->healHp($curacion);
				$message .= "<strong>{$player1->name}</strong> se cura <strong>{$curacion}</strong> puntos de vida.<br>";
			}
		}
		
		//espinas
		if ($player2->thorns > 0) {
			$thornsDmg = floor($player2->hpTotal * ($player2->thorns / 100));
			if ($thornsDmg > 0) {
				$player1->hitDmg($thornsDmg);
				$message .= "<strong>{$player1->name}</strong> recibe <strong>{$thornsDmg}</strong> puntos de daño de espinas.<br>";
			}
		}
		
	}
}

//Checkeo de vidas del combate
function checkIfFinish($player, $monster){
	if($player->hp <= 0) {
		return 1;
	} else if($monster->hp <= 0) {
		return 2;
	} else {
		return 0;
	}
}

//Devuelve la vida
function getHpTotal($player, $monster){
	global $jug;
	return "Puntos de vida: <strong>{$jug}</strong>(<strong>{$player->hp}</strong>/<strong>{$player->hpTotal}</strong>) - <strong>{$monster->name}</strong>(<strong>{$monster->hp}</strong>/<strong>{$monster->hpTotal}</strong>)<br><br>";
}

//Añade una puntuación al jugador tras ganar
function addHalloweenScore($jug, $score){
	$rowDB = db_query("SELECT * FROM {$conftp}`puntoshalloween` WHERE `nombrejug` = '{$jug}'");
	if (mysql_num_rows($rowDB) == 0) {
		db_query("INSERT INTO {$conftp}puntoshalloween (nombrejug, puntos) VALUES ('{$jug}',{$score})");
	} else {
		db_query("UPDATE {$conftp}puntoshalloween SET puntos = puntos + {$score} WHERE nombrejug = '{$jug}'");
	}
}


?>