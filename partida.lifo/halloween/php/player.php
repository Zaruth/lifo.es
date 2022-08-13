<?php

class Player{
    public $name;
    public $dmg = 0;
    public $hp = 0;
    public $hpTotal = 0;
    public $status = null;
    public $skillStatus = null;
    public $crit = 10;
    public $evasion = 10;
    public $blocking = 0;
	public $thorns = 0;
	public $lifeStealing = 0;
    public $skills = [];
    public $usedSkills = [];
	public $score = 0;
    public function __construct() {}
	
	public function getPlayerDB($playerName) {
		$result = null;
		
		try {
			global $conftp,$us;
			$retScore = db_query("SELECT puntos FROM {$conftp}`puntoshalloween` WHERE `nombrejug` = '{$playerName}'");
			if (mysql_num_rows($retScore) > 0) {
				$row = mysql_fetch_row($retScore);
				$this->score = $row[0];
			}
			
			$retval = db_query("
				SELECT SUM(ataq),SUM(prot) 
					FROM {$conftp}tiene,{$conftp}objetos 
						WHERE usado=1 AND {$conftp}tiene.nombreobj={$conftp}objetos.nombreobj AND nombrejug='{$playerName}'");
			$ret = mysql_fetch_row($retval);
			$ataqo = $ret[0];
			$proto = $ret[1];
			$ataqb = 10+floor($us['nivel']/3);
			$protb = 10+floor($us['nivel']/10);
			if (!$ataqo)
				$ataqo = 0;
			if (!$proto)
				$proto = 0;
			$ataq = $ataqo+$ataqb;
			$prot = $proto+$protb;
			
			$rg1 = db_query("
				SELECT {$conftp}tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,ataquenivel,defensanivel,expbase,expmult,expgana,maxnivel,usado 
					FROM {$conftp}tienemascotas,{$conftp}mascotas 
						WHERE {$conftp}tienemascotas.nombremascota={$conftp}mascotas.nombremascota AND nombrejug='{$playerName}' AND usado=1");
			$rows = mysql_num_rows($rg1);
			if ($rows == 0) {
				$mascataq = 0;
				$mascprot = 0;
			} else {
				$rrr = mysql_fetch_row($rg1);
				$rg3 = db_query("SELECT cantidad FROM tiene WHERE nombreobj='{$rrr[4]}' AND nombrejug='{$playerName}'");
				if (mysql_num_rows($rg3)) {
					$rrt = mysql_fetch_row($rg3);
				} else {
					$rrt[0] = 0;
				}
				mysql_free_result($rg3);

				$mascataq = $rrr[5]+($rrr[7]*($rrr[2]-1));
				$mascprot = $rrr[6]+($rrr[8]*($rrr[2]-1));
			}
			
			$ataq = $ataq+$mascataq;
			$prot = $prot+$mascprot;
			
			$this->name = $playerName;
			$this->dmg = $ataq;
			$this->hp = $prot;
			$this->hpTotal = $prot;
			
			mysql_free_result($retval);
			
			$retval = db_query("SELECT {$conftp}tiene.nombreobj,cantidad,tipo,img,ataq,prot,usado,niveluso,usos,pasivas FROM {$conftp}tiene,{$conftp}objetos WHERE nombrejug='{$playerName}' AND {$conftp}tiene.nombreobj={$conftp}objetos.nombreobj AND {$conftp}tiene.usado = 1 ORDER BY tipo ASC,ataq+prot DESC,posibilidad ASC,niveluso DESC,nombreobj ASC");
			
			$dmgPercent = 0;
			$hpPercent = 0;
			for ($i = 0; $i < mysql_num_rows($retval); $i++) {
				$item = mysql_fetch_row($retval);
				if ($item[9] != null) {
					$pasives = explode("#",$item[9]);
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

?>