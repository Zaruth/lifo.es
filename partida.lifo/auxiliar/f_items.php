<?php
include_once 'f_encantamientos.php';

/**
 * F: Método genérico que devuelve un Objeto completo para ser printado por pantalla(HTML).
 *	 
 * Input:    $item - Array con todos los datos del item. Para acceder a
 *				    sus valores usar 'prot', 'vida', etc...
 *			(Valores(OBLIGATORIOS): nombreobj, tipo, img, nivelcomprar, nivelencontrar, 
 *			 		  niveluso, valor, prot, ataq, vida, posibilidad, 
 *					  puntosencontrar, usos, pasivas, descripcion)
 *			(valores(Opcional):		cantidad,usado)
 *
 * Output: $textHTML - Cadena con el Objeto.
 */
function getItemInventario($jug,$item)
{
	global $imgroot;
	$textHTML = "";
	if (isset($item['encantamiento']) && $item['encantamiento']!=0)
		$textHTML = getImgEnchanted($item['img'], $item['tipo'], $item['encantamiento']);
	else
		$textHTML = "<img src=\"{$imgroot}{$item['img']}.gif\" alt=\"{$item['tipo']}\"/>";
	if (isset($item['cantidad'])) {
		$textHTML .= "<b>x{$item['cantidad']}</b>";
	}
	switch ($item['usos']) {
		case 1:
		case 2:
		case 3:
		case 9:
		case 10:
			$usos = ' / UN SOLO USO';
			break;
		default:
			$usos = '';
			break;
	}
	if ($item['pasivas'] != null) {
		$pasives = explode("#", $item['pasivas']);
		$pasivas = "/ Beneficios: ";
		$count = 0;
		foreach ($pasives as $pasive) {
			$count++;
			$p = explode("$", $pasive);
			switch ($p[0]) {
				case 1:
					$pasivas .= "<font style=\"color: darkred;\">{$p[1]}{$p[2]} Daño</font>";
					break;
				case 2:
					$pasivas .= "<font style=\"color: darkgreen;\">{$p[1]}{$p[2]} Vida</font>";
					break;
				case 3:
					$pasivas .= "<font style=\"color: darkblue;\">{$p[1]}{$p[2]} Crítico</font>";
					break;
				case 4:
					$pasivas .= "<font style=\"color: chocolate;\">{$p[1]}{$p[2]} Evasión</font>";
					break;
				case 5:
					$pasivas .= "<font style=\"color: darkslategray;\">{$p[1]}{$p[2]} Bloqueo</font>";
					break;
				case 6:
					$pasivas .= "<font style=\"color: olive;\">{$p[1]}{$p[2]} Espinas</font>";
					break;
				case 7:
					$pasivas .= "<font style=\"color: indigo;\">{$p[1]}{$p[2]} Toque vampírico</font>";
					break;
			}
			if ($count < count($pasives)) {
				$pasivas .= ", ";
			}
		}
	} else $pasivas = '';
	$textHTML .= " {$item['nombreobj']} ";
	switch ($item['usos']) {
		case 0: //Equipo
		case 1: //Equipo (Un solo uso)
			$swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
			$shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
			$heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
			$textHTML .= "(";
			if ($item['ataq']!=0){
				$textHTML .= "{$swordIcon}: {$item['ataq']} / ";
			}
			if ($item['prot']!=0){
				$textHTML .= "{$shieldIcon}: {$item['prot']} / ";
			}
			if ($item['vida']!=0){
				$textHTML .= "{$heartIcon}: {$item['vida']} / ";
			}
			$niveljug = getJugador($jug)['nivel'];
			if(!isset($item['enniveluso'])||(isset($item['enniveluso']) && $item['niveluso']>=$item['enniveluso'])){
				if($niveljug<$item['niveluso']){
					$textHTML .= "<span class=\"txt_encantado\" style=\"color:red;\">Nivel: {$item['niveluso']}</span>";
				} else {
					$textHTML .= "Nivel: {$item['niveluso']}";
				}
			} else {
				if($niveljug<$item['enniveluso']){
					$textHTML .= "<span class=\"txt_encantado\" style=\"color:red;\">Nivel: {$item['enniveluso']}</span>";
				} else {
					$textHTML .= "Nivel: {$item['enniveluso']}";
				}
			}
			break;
		case 2: //Comida
			$textHTML .= "(Energía: +{$item['prot']}";
			break;
		case 3: //Libro
			$textHTML .= "(Energía: -{$item['ataq']}";
			break;
		case 4: //Recurso
		case 8: //Esquirla
			$textHTML .= "(Sin uso";
			break;
		case 5: //Premium
			$textHTML .= "(consumir para obtener 1 semana premium";
			break;
		case 6: //Mascota
			$textHTML .= "(MASCOTA";
			break;
		case 7: //Mapa
			$textHTML .= "(Energía: -{$item['ataq']} / Nivel: {$item['niveluso']} / MAPA";
			break;
		case 9: //Cofre
			$textHTML .= "(¿Qué tendrá dentro?";
			break;
		case 10: //Aumento
			$textHTML .= "(" . getCristalEner($item['ataq']) . " de energía máxima";
			break;
		case 11: //Cofre
				$textHTML .= "(<i>Contiene un mensaje</i>";
				break;
	}


	$textHTML .= $pasivas . $usos . ')';
	$textHTML .= isset($item['encantamiento']) && $item['encantamiento'] != 0 ? getTxtEncantamiento($item['encantamiento']) : '';

	return $textHTML;
}

function getItemTrueque($item)
{
	global $imgroot;
	$textHTML = "";
	if ($item['encantamiento']!=0)
		$textHTML = getImgEnchanted($item['img'], $item['tipo'], $item['encantamiento']);
	else
		$textHTML = "<img src=\"{$imgroot}{$item['img']}.gif\" alt=\"{$item['tipo']}\"/>";
	if (isset($item['cantidad'])) {
		$textHTML .= "<b>x{$item['cantidad']}</b>";
	}
	switch ($item['usos']) {
		case 1:
		case 2:
		case 3:
		case 9:
		case 10:
			$usos = ' / UN SOLO USO';
			break;
		default:
			$usos = '';
			break;
	}
	if ($item['pasivas'] != null) {
		$pasives = explode("#", $item['pasivas']);
		$pasivas = "/ Beneficios: ";
		$count = 0;
		foreach ($pasives as $pasive) {
			$count++;
			$p = explode("$", $pasive);
			switch ($p[0]) {
				case 1:
					$pasivas .= "<font style=\"color: darkred;\">{$p[1]}{$p[2]} Daño</font>";
					break;
				case 2:
					$pasivas .= "<font style=\"color: darkgreen;\">{$p[1]}{$p[2]} Vida</font>";
					break;
				case 3:
					$pasivas .= "<font style=\"color: darkblue;\">{$p[1]}{$p[2]} Crítico</font>";
					break;
				case 4:
					$pasivas .= "<font style=\"color: chocolate;\">{$p[1]}{$p[2]} Evasión</font>";
					break;
				case 5:
					$pasivas .= "<font style=\"color: darkslategray;\">{$p[1]}{$p[2]} Bloqueo</font>";
					break;
				case 6:
					$pasivas .= "<font style=\"color: olive;\">{$p[1]}{$p[2]} Espinas</font>";
					break;
				case 7:
					$pasivas .= "<font style=\"color: indigo;\">{$p[1]}{$p[2]} Toque vampírico</font>";
					break;
			}
			if ($count < count($pasives)) {
				$pasivas .= ", ";
			}
		}
	} else $pasivas = '';
	$textHTML .= " {$item['nombreobj']} ";
	switch ($item['usos']) {
		case 0: //Equipo
		case 1: //Equipo (Un solo uso)
			$swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
			$shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
			$heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
			$textHTML .= "(";
			if ($item['ataq']!=0){
				$textHTML .= "{$swordIcon}: {$item['ataq']} / ";
			}
			if ($item['prot']!=0){
				$textHTML .= "{$shieldIcon}: {$item['prot']} / ";
			}
			if ($item['vida']!=0){
				$textHTML .= "{$heartIcon}: {$item['vida']} / ";
			}
			$textHTML .= "Nivel: {$item['niveluso']}";
			break;
		case 2: //Comida
			$textHTML .= "(Energía: +{$item['prot']}";
			break;
		case 3: //Libro
			$textHTML .= "(Energía: -{$item['ataq']}";
			break;
		case 4: //Recurso
		case 8: //Esquirla
			$textHTML .= "(Sin uso";
			break;
		case 5: //Premium
			$textHTML .= "(consumir para obtener 1 semana premium";
			break;
		case 6: //Mascota
			$textHTML .= "(MASCOTA";
			break;
		case 7: //Mapa
			$textHTML .= "(Energía: -{$item['ataq']} / Nivel: {$item['niveluso']} / MAPA";
			break;
		case 9: //Cofre
			$textHTML .= "(¿Qué tendrá dentro?";
			break;
		case 10: //Aumento
			$textHTML .= "(" . getCristalEner($item['ataq']) . " de energía máxima";
			break;
		case 11: //Cofre
				$textHTML .= "(<i>Contiene un mensaje</i>";
				break;
	}


	$textHTML .= $pasivas . $usos . ')';
	$textHTML .= $item['encantamiento'] != 0 ? getTxtEncantamiento($item['encantamiento']) : '';

	return $textHTML;
}

function getItemFabricarResultado($jug,$item)
{
	global $imgroot;
	$textHTML = "";
	if (isset($item['encantamiento']) && $item['encantamiento']!=0)
		$textHTML = getImgEnchanted($item['img'], $item['tipo'], $item['encantamiento']);
	else
		$textHTML = "<img src=\"{$imgroot}{$item['img']}.gif\" alt=\"{$item['tipo']}\"/>";
	if (isset($item['cantidadresultado'])) {
		$textHTML .= "<b>x{$item['cantidadresultado']}</b>";
	}
	switch ($item['usos']) {
		case 1:
		case 2:
		case 3:
		case 9:
		case 10:
			$usos = ' / UN SOLO USO';
			break;
		default:
			$usos = '';
			break;
	}
	if ($item['pasivas'] != null) {
		$pasives = explode("#", $item['pasivas']);
		$pasivas = "/ Beneficios: ";
		$count = 0;
		foreach ($pasives as $pasive) {
			$count++;
			$p = explode("$", $pasive);
			switch ($p[0]) {
				case 1:
					$pasivas .= "<font style=\"color: darkred;\">{$p[1]}{$p[2]} Daño</font>";
					break;
				case 2:
					$pasivas .= "<font style=\"color: darkgreen;\">{$p[1]}{$p[2]} Vida</font>";
					break;
				case 3:
					$pasivas .= "<font style=\"color: darkblue;\">{$p[1]}{$p[2]} Crítico</font>";
					break;
				case 4:
					$pasivas .= "<font style=\"color: chocolate;\">{$p[1]}{$p[2]} Evasión</font>";
					break;
				case 5:
					$pasivas .= "<font style=\"color: darkslategray;\">{$p[1]}{$p[2]} Bloqueo</font>";
					break;
				case 6:
					$pasivas .= "<font style=\"color: olive;\">{$p[1]}{$p[2]} Espinas</font>";
					break;
				case 7:
					$pasivas .= "<font style=\"color: indigo;\">{$p[1]}{$p[2]} Toque vampírico</font>";
					break;
			}
			if ($count < count($pasives)) {
				$pasivas .= ", ";
			}
		}
	} else $pasivas = '';
	$textHTML .= " {$item['resultado']} ";
	switch ($item['usos']) {
		case 0: //Equipo
		case 1: //Equipo (Un solo uso)
			$swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
			$shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
			$heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
			$textHTML .= "(";
			if ($item['ataq']!=0){
				$textHTML .= "{$swordIcon}: {$item['ataq']} / ";
			}
			if ($item['prot']!=0){
				$textHTML .= "{$shieldIcon}: {$item['prot']} / ";
			}
			if ($item['vida']!=0){
				$textHTML .= "{$heartIcon}: {$item['vida']} / ";
			}
			$textHTML .= "Nivel: {$item['niveluso']}";
			break;
		case 2: //Comida
			$textHTML .= "(Energía: +{$item['prot']}";
			break;
		case 3: //Libro
			$textHTML .= "(Energía: -{$item['ataq']}";
			break;
		case 4: //Recurso
		case 8: //Esquirla
			$textHTML .= "(Sin uso";
			break;
		case 5: //Premium
			$textHTML .= "(consumir para obtener 1 semana premium";
			break;
		case 6: //Mascota
			$textHTML .= "(MASCOTA";
			break;
		case 7: //Mapa
			$textHTML .= "(Energía: -{$item['ataq']} / Nivel: {$item['niveluso']} / MAPA";
			break;
		case 9: //Cofre
			$textHTML .= "(¿Qué tendrá dentro?";
			break;
		case 10: //Aumento
			$textHTML .= "(" . getCristalEner($item['ataq']) . " de energía máxima";
			break;
		case 11: //Cofre
				$textHTML .= "(<i>Contiene un mensaje</i>";
				break;
	}


	$textHTML .= $pasivas . $usos . ')';
	$textHTML .= isset($item['encantamiento']) && $item['encantamiento'] != 0 ? getTxtEncantamiento($item['encantamiento']) : '';

	return $textHTML;
}

function getItemFabricarIngrediente($jug,$item)
{
	global $imgroot;
	$textHTML = "";
	if (isset($item['encantamiento']) && $item['encantamiento']!=0)
		$textHTML = getImgEnchanted($item['img'], $item['tipo'], $item['encantamiento']);
	else
		$textHTML = "<img src=\"{$imgroot}{$item['img']}.gif\" alt=\"{$item['tipo']}\"/>";
	if (isset($item['cantidad'])) {
		$textHTML .= "<b>x{$item['cantidad']}</b>";
	}
	if (isset($item['cantidadusuario'])) {
		$textHTML .= '<font style="color: #AA00AA;text-shadow: 1px 1px #2A002A;"><strong>('.$item['cantidadusuario'].')</strong></font>';
	}
	switch ($item['usos']) {
		case 1:
		case 2:
		case 3:
		case 9:
		case 10:
			$usos = ' / UN SOLO USO';
			break;
		default:
			$usos = '';
			break;
	}
	if ($item['pasivas'] != null) {
		$pasives = explode("#", $item['pasivas']);
		$pasivas = "/ Beneficios: ";
		$count = 0;
		foreach ($pasives as $pasive) {
			$count++;
			$p = explode("$", $pasive);
			switch ($p[0]) {
				case 1:
					$pasivas .= "<font style=\"color: darkred;\">{$p[1]}{$p[2]} Daño</font>";
					break;
				case 2:
					$pasivas .= "<font style=\"color: darkgreen;\">{$p[1]}{$p[2]} Vida</font>";
					break;
				case 3:
					$pasivas .= "<font style=\"color: darkblue;\">{$p[1]}{$p[2]} Crítico</font>";
					break;
				case 4:
					$pasivas .= "<font style=\"color: chocolate;\">{$p[1]}{$p[2]} Evasión</font>";
					break;
				case 5:
					$pasivas .= "<font style=\"color: darkslategray;\">{$p[1]}{$p[2]} Bloqueo</font>";
					break;
				case 6:
					$pasivas .= "<font style=\"color: olive;\">{$p[1]}{$p[2]} Espinas</font>";
					break;
				case 7:
					$pasivas .= "<font style=\"color: indigo;\">{$p[1]}{$p[2]} Toque vampírico</font>";
					break;
			}
			if ($count < count($pasives)) {
				$pasivas .= ", ";
			}
		}
	} else $pasivas = '';
	$textHTML .= " {$item['nombreobj']} ";
	switch ($item['usos']) {
		case 0: //Equipo
		case 1: //Equipo (Un solo uso)
			$swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
			$shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
			$heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
			$textHTML .= "(";
			if ($item['ataq']!=0){
				$textHTML .= "{$swordIcon}: {$item['ataq']} / ";
			}
			if ($item['prot']!=0){
				$textHTML .= "{$shieldIcon}: {$item['prot']} / ";
			}
			if ($item['vida']!=0){
				$textHTML .= "{$heartIcon}: {$item['vida']} / ";
			}
			$textHTML .= "Nivel: {$item['niveluso']}";
			break;
		case 2: //Comida
			$textHTML .= "(Energía: +{$item['prot']}";
			break;
		case 3: //Libro
			$textHTML .= "(Energía: -{$item['ataq']}";
			break;
		case 4: //Recurso
		case 8: //Esquirla
			$textHTML .= "(Sin uso";
			break;
		case 5: //Premium
			$textHTML .= "(consumir para obtener 1 semana premium";
			break;
		case 6: //Mascota
			$textHTML .= "(MASCOTA";
			break;
		case 7: //Mapa
			$textHTML .= "(Energía: -{$item['ataq']} / Nivel: {$item['niveluso']} / MAPA";
			break;
		case 9: //Cofre
			$textHTML .= "(¿Qué tendrá dentro?";
			break;
		case 10: //Aumento
			$textHTML .= "(" . getCristalEner($item['ataq']) . " de energía máxima";
			break;
		case 11: //Cofre
				$textHTML .= "(<i>Contiene un mensaje</i>";
				break;
	}


	$textHTML .= $pasivas . $usos . ')';
	$textHTML .= isset($item['encantamiento']) && $item['encantamiento'] != 0 ? getTxtEncantamiento($item['encantamiento']) : '';

	return $textHTML;
}