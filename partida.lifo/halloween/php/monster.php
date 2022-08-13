<?php

class Monster{
	public $id;
    public $name;
	public $level = 0;
	public $cost = 0;
	public $mingold = 0;
	public $maxgold = 0;
	public $minexp = 0;
	public $maxexp = 0;
    public $dmg = 0;
    public $hp = 0;
    public $hpTotal = 0;
    public $crit = 10;
    public $evasion = 10;
    public $blocking = 0;
	public $thorns = 0;
	public $lifeStealing = 0;
    public $skills = [];
	public $img;
	public $pasives;
	public $score;
	//public $items = [];

    public function __construct() {}
	
	public function setMonsterData($infoDB) {
		$result = null;
		
		try {
			$this->id = $infoDB[0];
			$this->name = $infoDB[1];
			$this->level = $infoDB[2];
			$this->cost = $infoDB[3];
			$this->mingold = $infoDB[4];
			$this->maxgold = $infoDB[5];
			$this->minexp = $infoDB[6];
			$this->maxexp = $infoDB[7];
			$this->dmg = $infoDB[8];
			$this->hp = $infoDB[9];
			$this->hpTotal = $infoDB[9];
			$this->crit = $infoDB[10];
			$this->evasion = $infoDB[11];
			$this->blocking = $infoDB[12];
			if ($infoDB[13] != null) {$this->skills = $infoDB[13];}
			//if ($infoDB[14] != null) {$this->items = $infoDB[14];}
			$this->img = $infoDB[14];
			$this->pasives = $infoDB[15];
			$this->score = $infoDB[16];
			
			$dmgPercent = 0;
			$hpPercent = 0;
			if ($this->pasives != null) {
				$pasives = explode("#",$this->pasives);
				$count = 0;
				foreach($pasives as $pasive) {
					$count++;
					$p = explode("$", $pasive);
					switch ($p[0]) {
						case 1:
							$dmgPercent += $p[1];
							break;
						case 2:
							$hpPercent += $p[1];
							break;
						case 3:
							$this->crit += $p[1];
							break;
						case 4:
							$this->evasion += $p[1];
							break;
						case 5:
							$this->blocking += $p[1];
							break;
						case 6:
							$this->thorns += $p[1];
							break;
						case 7:
							$this->lifeStealing += $p[1];
							break;
					}
				}
			}
			if($dmgPercent != 0){
				$this->dmg = floor($this->dmg + ($this->dmg * ($dmgPercent/100)));
			}
			if($hpPercent != 0){
				$this->hp = floor($this->hp + ($this->hp * ($hpPercent/100)));
				$this->hpTotal = $this->hp;
			}
			
			$this->checkVariables();
		} catch (Exception $e) {
			$result = $e;
		}
		
		return $result; 
	}
	
	public function hitDmg ($dmg) {
		$this->hp -= $dmg;
		if ($this->hp < 0) {
			$this->hp = 0;
		}
	}
	
	public function healHp ($hp) {
		$this->hp += $hp;
		if ($this->hp > $this->hpTotal) {
			$this->hp = $this->hpTotal;
		}
	}
	
	public function getGold () {
		return rand($this->mingold , $this->maxgold);
	}
	
	public function getExp () {
		return rand($this->minexp , $this->maxexp);
	}
	
	public function checkVariables () {
		if ($this->dmg < 0){
			$this->dmg = 0;
		}
		if ($this->hp < 0 || $this->hpTotal < 0) {
			$this->hp = 1;
			$this->hpTotal = 1;
		}
		if ($this->crit < 0) {
			$this->crit = 0;
		} else if ($this->crit > 100) {
			$this->crit = 100;
		}
		if ($this->evasion < 0) {
			$this->evasion = 0;
		} else if ($this->evasion > 100) {
			$this->evasion = 100;
		}
		if ($this->blocking < 0) {
			$this->blocking = 0;
		} else if ($this->blocking > 100) {
			$this->blocking = 100;
		}
		if ($this->thorns < 0) {
			$this->thorns = 0;
		} else if ($this->thorns > 100) {
			$this->thorns = 100;
		}
		if ($this->lifeStealing < 0) {
			$this->lifeStealing = 0;
		} else if ($this->lifeStealing > 100) {
			$this->lifeStealing = 100;
		}
		
	}

}

function getMonstersDB() {
	global $conftp;
	$monsterList = [];
	$monstersDB = db_query("SELECT `id`, `nombre`, `nivel`, `coste`, `oromin`, `oromax`, `expmin`, `expmax`, `dmg`, `hp`, `crit`, `evasion`, `blocking`, `skills`, `img`, `pasives`, `puntuacion` FROM {$conftp}`monstruos`");
	for ($i = 0;$i < mysql_num_rows($monstersDB);$i++) {
		$monsterDB = mysql_fetch_row($monstersDB);
		$monster = new Monster();
		$monster->setMonsterData($monsterDB);
		array_push($monsterList, $monster);
	}
	return $monsterList;
}

function getMonsterDB($id) {
	global $conftp;
	$monstersDB = db_query("SELECT `id`, `nombre`, `nivel`, `coste`, `oromin`, `oromax`, `expmin`, `expmax`, `dmg`, `hp`, `crit`, `evasion`, `blocking`, `skills`, `img`, `pasives`, `puntuacion` FROM {$conftp}`monstruos` WHERE `id` = {$id}");
	$monsterDB = mysql_fetch_row($monstersDB);
	$monster = new Monster();
	$monster->setMonsterData($monsterDB);
	return $monster;
}

?>