<?php
$form = 1;
include('core.php');
function iweb() {
	global $us,$jug,$root,$imgroot,$confenchantbase;

	include_once 'auxiliar/f_logros.php';
	for($i=51;$i<55;$i++)
    	check_logro($i, $jug);

	$getItemTypes = db_query("SELECT COUNT(DISTINCT(obj.tipo)) FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj = obj.nombreobj) WHERE ti.nombrejug = '{$jug}' AND obj.tipo IN ('Amuleto','Anillo','Arma','Botas','Coraza','Escudo','Perneras','Yelmo','Artilugio')");
	$quantity = mysqli_fetch_row($getItemTypes)[0];
	if($quantity==0){
		$_SESSION['error'] = 'No tienes equipamiento en tu inventario.';
		header('Location: inventario.php');
		return 1;
	}
	if($us['nivel']<5){
		$_SESSION['error'] = 'Necesitas ser nivel 5 para poder encantar objetos.';
		header('Location: inventario.php');
		return 1;
	}

	techo("En la zona de encantamientos podrás realizar rituales arcanos con los que imbuir tu equipamiento. No todos los rituales salen bien, por eso deberás agenciarte de esencias y cristales mágicos, que actuaran como catalizadores durante el ritual y aumentando las posibilidades de éxito. ¿Te atreves a introducirte en el mundo de la magia oscura? Quién sabe los objetos prohibidos que podrás crear...");

	$getSpells = db_query("SELECT ti.nombreobj, ti.cantidad, obj.img FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj = obj.nombreobj) WHERE ti.nombrejug = '{$jug}' AND obj.tipo = 'Hechizo'");
	$getItemTypes = db_query("SELECT DISTINCT(obj.tipo) FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj = obj.nombreobj) WHERE ti.nombrejug = '{$jug}' AND obj.tipo IN ('Amuleto','Anillo','Arma','Botas','Coraza','Escudo','Perneras','Yelmo','Artilugio')");
	$getItems = db_query("SELECT ti.nombreobj, obj.tipo, obj.img, ti.cantidad, obj.niveluso FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj = obj.nombreobj) WHERE ti.nombrejug = '{$jug}' AND obj.tipo IN ('Amuleto','Anillo','Arma','Botas','Coraza','Escudo','Perneras','Yelmo','Artilugio') AND ti.encantamiento=0 ORDER BY obj.tipo ASC, obj.nombreobj ASC");
	$getMC = db_query("SELECT IFNULL(SUM(cantidad),0) FROM `tiene` WHERE nombreobj='Cristal de magia' AND nombrejug='{$jug}'");
	$getME = db_query("SELECT IFNULL(SUM(cantidad),0) FROM `tiene` WHERE nombreobj='Esencia mágica' AND nombrejug='{$jug}'");

	$numSpells = mysqli_num_rows($getSpells);
	$numItemTypes = mysqli_num_rows($getItemTypes);
	$numItems = mysqli_num_rows($getItems);

	$magicCristal = mysqli_fetch_row($getMC)[0];
	$magicEsence = mysqli_fetch_row($getME)[0];

	$mcdisabled='';
	if($magicCristal==0)
		$mcdisabled = ' disabled';
	$medisabled='';
	if($magicEsence==0)
		$medisabled = ' disabled';
	
	$prob = $confenchantbase;

	echo '
	<div>
		<form id="enchant_form" action="encantar.php" method="post">
			<label>Hechizo seleccionado: </label>
			<select id="s_spell" name="s_spell" form="enchant_form" onchange="selectSpellImg()" alt="Lista de hechizos" title="Lista de hechizos">
				<option value="0">-- Seleccionar --</option>';
				for($i=0;$i<$numSpells;$i++){
					$spell = mysqli_fetch_row($getSpells);
					$str = explode(": ",$spell[0])[1];
					echo "<option value=\"{$spell[0]}#{$spell[2]}\"";
					if(isset($_COOKIE['s_spell']) && $_COOKIE['s_spell'] == $spell[0].'#'.$spell[2]){
						echo ' selected';
					}
					echo ">{$str} x{$spell[1]}</option>";
				}
	echo '	</select><br><br>
			<label>Tipo de objeto: </label>
			<select id="s_item_type" name="s_item_type" form="enchant_form" onchange="selectItemType()" alt="Lista de tipos de objetos" title="Lista de tipos de objetos">
				<option value="0">-- Seleccionar-- </option>';
				for($i=0;$i<$numItemTypes;$i++){
					$type = mysqli_fetch_row($getItemTypes);
					echo "<option value=\"{$type[0]}\"";
					if(isset($_COOKIE['s_item_type']) && $_COOKIE['s_item_type'] == $type[0]){
						echo ' selected';
					}
					echo ">{$type[0]}</option>";
				}
	echo '	</select>
			<select id="s_item" name="s_item" form="enchant_form" onchange="selectItemImg()" disabled alt="Lista de objetos" title="Lista de objetos">
				<option value="0">-- Seleccionar --</option>';
	echo '	</select><br>
		<p>Probabilidad Base: <b>'.$prob.'%</b></p>
		<input style="vertical-align: middle;" type="checkbox" id="cristal" name="cristal" alt="Cristal de magia" title="Añadir Cristal de magia" value="cristal"'.$mcdisabled.'><label><b>x'.$magicCristal.'</b> <img src="'.$imgroot.'rrrcv.gif"/> Cristal de magia <b>(+5%)</b></label><br>
		<input style="vertical-align: middle;" type="checkbox" id="esencia" name="esencia" alt="Esencia mágica" title="Añadir Esencia mágica" value="esencia"'.$medisabled.'><label><b>x'.$magicEsence.'</b> <img src="'.$imgroot.'magicesence.gif"/> Esencia mágica <b>(+5%)</b></label><br>
		';
	echo '<input id="essenceName" name="essenceName" type="hidden" value="0">
		</form>
		<br>
		<button class="btn_Enchant" id="btn_enchant" onclick="enchant()" disabled title="Comenzar ritual" alt="Comenzar ritual">Encantar</button>
	</div>
	';

	echo '
	<div class="enchant_Container">
		<img id="spell" class="enchant_Spell" src=""/>
		<img id="item" class="enchant_Item" src=""/>
		<img class="enchant_Book" src="'.$imgroot.'enchant/book.png"/>
		<img id="effect" class="enchant_Effect" src="'.$imgroot.'enchant/lightning.gif"/>
		<img id="enchant_Base" class="enchant_Base" src="'.$imgroot.'enchant/enchantBase.png"/>
		<img id="runes" class="enchant_Runes" src="'.$imgroot.'enchant/enchantRunes.png"/>
		<audio id="enchant_Audio"><source src="'.$root.'encantamientos/enchant.mp3" type="audio/mpeg"></audio>
		<script id="script">
			var imgroot="'.$imgroot.'";
			var items = [';
			// ti.nombreobj, obj.tipo, obj.img, ti.cantidad, ti.encantamiento
			for($i=0;$i<$numItems;$i++){
				$item = mysqli_fetch_row($getItems);
				echo "'{$item[0]}#{$item[1]}#{$item[2]}#{$item[3]}#{$item[4]}'";
				if($i != $numItems-1)
					echo ',';
			}
	echo    '];';
	echo	'
			var imgsrc = "'.$imgroot.'";	
		</script>
		<script src="enchant.js"></script>
		<script>selectSpellImg();selectItemType(';
		if(isset($_COOKIE['s_item'])){
			echo '\''.$_COOKIE['s_item'].'\'';
		}
	echo	');selectItemImg();</script>
	</div>
	<br>
	<a href="inventario.php">Volver al Inventario</a>
	';

	mysqli_free_result($getSpells);
	mysqli_free_result($getItemTypes);
	mysqli_free_result($getItems);

	if(isset($_SESSION['enchanted'])){
		echo '<audio autoplay><source src="'.$root.'encantamientos/';
		if($_SESSION['enchanted']){
			echo 'success';
		} else {
			echo 'failure';
		}
		echo '.mp3" type="audio/mpeg"></audio>';
		unset($_SESSION['enchanted']);
	}
}

function procesaform() {
	global $us, $jug, $imgroot, $confenchantbase;
	
	if(isset($_POST['s_spell'])){
		setcookie('s_spell', $_POST['s_spell'], strtotime( '+365 days' ));  /* expira en 1 hora */
	}
	if(isset($_POST['s_item_type'])){
		setcookie('s_item_type', $_POST['s_item_type'], strtotime( '+365 days' ));  /* expira en 1 hora */
	}
	if(isset($_POST['s_item'])){
		setcookie('s_item', explode('#',$_POST['s_item'])[0], strtotime( '+365 days' ));  /* expira en 1 hora */
	}

	if (isset($_POST['encantar'])) {

		if(isset($_POST['s_spell']) && isset($_POST['s_item'])){
			$spell = explode("#",$_POST['s_spell']);
			$item = explode("#",$_POST['s_item']);
			if($spell!=0 && $item!=0){
				$getSpellDB = db_query("SELECT COUNT(*) FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj = obj.nombreobj) WHERE ti.nombrejug = '{$jug}' AND obj.tipo = 'Hechizo' AND ti.nombreobj='{$spell[0]}'");
				$getItem = db_query("SELECT COUNT(*) FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj = obj.nombreobj) WHERE ti.nombrejug = '{$jug}' AND obj.tipo = '$item[1]' AND ti.nombreobj='{$item[0]}' AND ti.encantamiento=0");
				$nSpellDB = mysqli_fetch_row($getSpellDB)[0];
				$nItem = mysqli_fetch_row($getItem)[0];
				if($nSpellDB>0 && $nItem>0){
					$magicCristal = mysqli_fetch_row(db_query("SELECT IFNULL(SUM(cantidad),0) FROM `tiene` WHERE nombreobj='Cristal de magia' AND nombrejug='{$jug}'"))[0];
					$magicEsence = mysqli_fetch_row(db_query("SELECT IFNULL(SUM(cantidad),0) FROM `tiene` WHERE nombreobj='Esencia mágica' AND nombrejug='{$jug}'"))[0];
					$mc = false;
					if(isset($_POST['cristal']) && $magicCristal == 0){
						$mc = true;
					}
					$me = false;
					if(isset($_POST['esencia']) && $magicEsence == 0){
						$me = true;
					}
					if($mc==false && $me==false){
						$prob = $confenchantbase;
						if(isset($_POST['cristal'])){
							quita_objeto($jug,'Cristal de magia','rrrcv');
							$prob +=5;
						}
						if(isset($_POST['esencia'])){
							quita_objeto($jug,'Esencia mágica','magicesence');
							$prob +=5;
						}
						$getSpell = db_query("SELECT id FROM `encantamientos` WHERE nombreobj='{$spell[0]}'");
						$spellId = mysqli_fetch_row($getSpell);
						quita_objeto($jug,$spell[0],$spell[1]);
						$rand = rand(1, 100);
						if($rand <= $prob){
							quita_objeto($jug,$item[0],$item[2]);
							dale_objeto_encantado($jug,$item[0],$spellId[0]);
							$_SESSION['mensaje'] = "<span class=\"txt_encantado\">¡Has encantado el objeto <strong>{$item[0]}</strong> <img style=\"background:url({$imgroot}{$item[2]}.gif)\" src=\"{$imgroot}enchant/enchanted.gif\" alt=\"{$item[1]}\"/> con éxito! ¡Enhorabuena!";
							$_SESSION['enchanted'] = true;
							db_query("UPDATE jugadores SET encantado=encantado+1 WHERE nombrejug='{$jug}'");
						} else {
							$_SESSION['error'] = "¡Algo salió mal y el ritual fracasó! El pergamino se quemó".(isset($_POST['cristal'])||isset($_POST['cristal'])?' y los catalizadores colapsaron.':'.');
							$_SESSION['enchanted'] = false;
						}
					} else {
						$_SESSION['error'] = ($mc?'Te faltan cristales de magia.':'').($me?' Te faltan esencias mágicas.':'');
					}
				} else {
					$_SESSION['error'] = 'Te falta ese hechizo o ese objeto.';
				}
			} else {
				$_SESSION['error'] = 'Selecciona un hechizo y un objeto para el encantamiento.';
			}
		} else {
			$_SESSION['error'] = '¡Error inesperado, intenta de nuevo!';
		}
		header('Location: encantar.php');
		return 1;
	}
}
?>
