<?php
include_once './auxiliar/f_encantamientos.php';

class Entity
{
    // Características comunes
    public $nombre;
    public $img;
    public $nivel;

    // Estadisticas base
    public $ataque = 0;
    public $armadura = 0;
    public $vida = 0;
    public $reduccion = 0;
    public $absorcion = 0;
    public $evasion = 10;
    public $critico = 5;
    public $dcritico = 50;
    public $parmadura = 0;
    public $espinas = 0;
    public $vampirismo = 0;

    // Estadisticas mod
    public $m_ataque = 0;
    public $m_armadura = 0;
    public $m_vida = 0;
    public $m_reduccion = 0;
    public $m_absorcion = 0;
    public $m_evasion = 10;
    public $m_critico = 5;
    public $m_dcritico = 50;
    public $m_parmadura = 0;
    public $m_espinas = 0;
    public $m_vampirismo = 0;

    // Características combate
    public $vidaTotal = 0;


    /**
     * Asesta una ataque.
     * 
     * @return array ['danio','esCri'] 
     */
    public function asestaGolpe()
    {
        $danio = rand($this->m_ataque * 0.9, $this->m_ataque * 1.1);
        $cri = rand(1, 100);
        $esCri = false;
        if ($cri <= $this->m_critico) {
            $danio *= (($this->m_dcritico + 100) / 100);
            $esCri = true;
        }
        $danio = floor($danio);
        return ['danio' => $danio, 'esCri' => $esCri];
    }

    /**
     * Recibe un golpe.
     * 
     * @param float $danio Daño asestado
     * @param float $parmadura Penetracion de armadura
     * @return float recibido
     */
    public function recibeGolpe(float $danio, float $parmadura)
    {
        // Penetracion de armadura
        $dparmadura = floor($danio * ($parmadura / 100));
        $dnoparmadura = $danio - $dparmadura;

        // Absorcion
        $absorcion = 0;
        if ($this->m_absorcion > 0) {
            $absorcion = floor($this->m_armadura * ($this->m_absorcion / 100));
        }
        $dnoparmadura -= $absorcion;
        if ($dnoparmadura < 0) $dnoparmadura = 0;

        //Reduccion
        $dnoparmadura -= floor($dnoparmadura * ($this->m_reduccion / 100));
        if ($dnoparmadura < 0) $dnoparmadura = 0;

        $this->vidaTotal -= $dparmadura + $dnoparmadura;
        if ($this->vidaTotal < 0) $this->vidaTotal = 0;

        return $dparmadura + $dnoparmadura;
    }

    /**
     * Comprueba si el personaje evade el golpe.
     */
    public function evade()
    {
        $recibido = false;
        $esqui = rand(1, 100);
        if ($esqui < $this->m_evasion) $recibido = true;
        return $recibido;
    }

    /**
     * Cura vida al personaje
     */
    public function absorveVida(float $danio)
    {
        $curado = floor($danio * ($this->m_vampirismo / 100));
        $this->vidaTotal += $curado;
        if ($this->vidaTotal > $this->m_vida) $this->vidaTotal = $this->m_vida;
        return $curado;
    }

    /**
     * Realiza al personaje danio de espinas
     */
    public function danioEspinas(Entity $ent)
    {
        $danioRecibido = floor($ent->m_armadura * ($ent->m_espinas/100));
        $this->vidaTotal -= $danioRecibido;
        if ($this->vidaTotal < 0) $this->vidaTotal = 0;
        return $danioRecibido;
    }
}


class Jugador extends Entity
{
    public $oro;
    public $puntossuma;
    public $premiumhasta;
    public $noencuentrohasta;
    public $m_nombremascota;
    public $m_expGanada;
    public $m_apodo;
    public $sets;
    public $totalBonusSet;
    public $ascensiones;

    function __construct($nombre)
    {
        $query = db_query("SELECT nombrejug, insignia, nivel, puntossuma, oro, premiumhasta, noencuentrohasta, ascension FROM jugadores WHERE nombrejug='{$nombre}'");
        $jug = mysqli_fetch_assoc($query);
        $this->nombre = $jug['nombrejug'];
        $this->img = $jug['insignia'];
        $this->nivel = $jug['nivel'];
        $this->oro = $jug['oro'];
        $this->puntossuma = $jug['puntossuma'];
        $this->premiumhasta = $jug['premiumhasta'];
        $this->noencuentrohasta = $jug['noencuentrohasta'];
        $this->ascensiones = $jug['ascension'];

        $this->loadStats();

        $this->sets = ItemSet::getSetsJugador($this->nombre);
        $this->totalBonusSet = new ItemSet(0);
        if ($this->sets != null) {

            for ($i = 0; $i < count($this->sets); $i++) {
                $this->totalBonusSet->sumSet($this->sets[$i]);
            }
        }

        $this->m_ataque = $this->ataque + floor(($this->ataque * ($this->totalBonusSet->ataque / 100)));
        $this->m_armadura = $this->armadura + floor(($this->armadura * ($this->totalBonusSet->armadura / 100)));
        $this->reduccion = Jugador::getReducDanio($this->nivel, $this->m_armadura);
        $this->m_vida = $this->vida + floor(($this->vida * ($this->totalBonusSet->vida / 100)));
        $this->m_reduccion = round($this->reduccion + $this->totalBonusSet->reduccion, 2);
        $this->m_absorcion = round($this->absorcion + $this->totalBonusSet->absorcion, 2);
        $this->m_evasion = round($this->evasion + $this->totalBonusSet->evasion, 2);
        $this->m_critico = round($this->critico + $this->totalBonusSet->critico, 2);
        $this->m_dcritico = round($this->dcritico + $this->totalBonusSet->dcritico, 2);
        $this->m_parmadura = round($this->parmadura + $this->totalBonusSet->parmadura, 2);
        $this->m_espinas = round($this->espinas + $this->totalBonusSet->espinas, 2);
        $this->m_vampirismo = round($this->vampirismo + $this->totalBonusSet->vampirismo, 2);
        $this->vidaTotal = $this->m_vida;
    }

    /**
     * Carga las stats basicas del jugador
     */
    public function loadStats()
    {
        global $confvidabase, $confvidanivel;

        // Stats base
        $this->ataque += 10 + floor($this->nivel / 3);
        $this->armadura += 10 + floor($this->nivel / 10);
        $this->vida += $confvidabase + $this->nivel * $confvidanivel;

        // Stats equipo
        $query = db_query("SELECT SUM(ataq),SUM(prot),SUM(vida) FROM tiene,objetos WHERE usado=1 AND tiene.nombreobj=objetos.nombreobj AND nombrejug='{$this->nombre}'");
        $stats1 = mysqli_fetch_row($query);
        $this->ataque += $stats1[0];
        $this->armadura += $stats1[1];
        $this->vida += $stats1[2];

        // Stats mascotas
        $query = db_query("SELECT tienemascotas.nombremascota,img,nivel,experiencia,alimento,ataquebase,defensabase,vidabase,ataquenivel,defensanivel,vidanivel,expbase,expmult,expgana,maxnivel,usado,tienemascotas.apodo FROM tienemascotas,mascotas WHERE tienemascotas.nombremascota=mascotas.nombremascota AND nombrejug='{$this->nombre}' AND usado=1");
        if (mysqli_num_rows($query)) {
            $rrr = mysqli_fetch_row($query);
            $rg2 = db_query("SELECT img FROM objetos WHERE nombreobj='{$rrr[4]}'");
            $rg3 = db_query("SELECT cantidad FROM tiene WHERE nombreobj='{$rrr[4]}' AND nombrejug='{$this->nombre}'");
            if (mysqli_num_rows($rg3)) {
                $rrt = mysqli_fetch_row($rg3);
            } else
                $rrt[0] = 0;
            mysqli_free_result($rg2);
            mysqli_free_result($rg3);

            $this->ataque += $rrr[5] + ($rrr[8] * ($rrr[2] - 1));
            $this->armadura += $rrr[6] + ($rrr[9] * ($rrr[2] - 1));
            $this->vida += $rrr[7] + ($rrr[10] * ($rrr[2] - 1));
            $this->m_nombremascota = $rrr[0];
            $this->m_expGanada = $rrr[13];
            $this->m_apodo = $rrr[16];
        } else {
            $this->m_nombremascota = null;
            $this->m_expGanada = null;
            $this->m_apodo = null;
        }

        // Stats encantamiento
        $encantt = getStatsEncantamientos($this->nombre);
        $this->ataque += $encantt[0];
        $this->armadura += $encantt[1];
        $this->vida += $encantt[2];

        $this->vidaTotal = $this->vida;

        $this->reduccion = Jugador::getReducDanio($this->nivel, $this->armadura);
    }

    /**
     * Devuelve el porcentaje de reducción de daño
     */
    public static function getReducDanio($nivel, $armadura)
    {
        $valueForLevel = ((-7 / 500) * pow($nivel, 2)) + ((91 / 10) * $nivel) + 30; //Calculado sobre estandar de 50%
        $val = round((($armadura * 50) / $valueForLevel), 2);
        if ($val < 0)
            return 0;
        else
            return $val;
    }

    /**
     * Consume los consumibles de 1 solo uso del jugador
     */
    public function consumeConsumibles()
    {
        $query = db_query("SELECT ti.nombreobj, obj.img, ti.cantidad 
        FROM `tiene` as ti JOIN `objetos` as obj ON (ti.nombreobj=obj.nombreobj) 
        WHERE obj.usos=1 AND ti.usado=1 AND ti.nombrejug='{$this->nombre}'");
        if (mysqli_num_rows($query)) {
            while ($item = mysqli_fetch_assoc($query)) {
                quita_objeto($this->nombre, $item['nombreobj'], $item['img'], 1);
            }
        }
    }
}


class Monstruo extends Entity
{
    public $id;
    public $mapa;
    public $oro;
    public $exp;
    public $posibilidad;
    public $loot;

    function __construct($idm)
    {
        $query = db_query("SELECT * FROM monstruos WHERE id={$idm}");
        $mon = mysqli_fetch_assoc($query);

        $this->id = $mon['id'];
        $this->nombre = $mon['nombre'];
        $this->img = $mon['img'];
        $this->nivel = $mon['nivel'];
        $this->mapa = $mon['mapa'];
        $this->oro = $mon['oro'];
        $this->exp = $mon['exp'];
        $this->posibilidad = $mon['posibilidad'];
        
        $this->ataque = $mon['ataque'];
        $this->armadura = $mon['proteccion'];
        $this->vida = $mon['vida'];
        $this->vidaTotal = $this->vida;
        $this->reduccion = $mon['reduccion'];
        $this->absorcion = $mon['absorcion'];
        $this->evasion = $mon['evasion'];
        $this->critico = $mon['critico'];
        $this->dcritico = $mon['dcritico'];
        $this->parmadura = $mon['parmadura'];
        $this->espinas = $mon['espinas'];
        $this->vampirismo = $mon['vampirismo'];

        $this->loot = Monstruo::getLoot($this->id);

        $this->m_ataque = $this->ataque;
        $this->m_armadura = $this->armadura;
        $this->m_vida = $this->vida;
        $this->m_reduccion = $this->reduccion;
        $this->m_absorcion = $this->absorcion;
        $this->m_evasion = $this->evasion;
        $this->m_critico = $this->critico;
        $this->m_dcritico = $this->dcritico;
        $this->m_parmadura = $this->parmadura;
        $this->m_espinas = $this->espinas;
        $this->m_vampirismo = $this->vampirismo;
        $this->vidaTotal = $this->m_vida;
    }

    /**
     * Devuelve la exp al ganar o perder
     * 
     * @param float $nivel Nivel del usuario
     * @return float Experiencia devuelta
     */
    public function getExp($nivel)
    {
        $diff = 0.05 * ($this->nivel - $nivel);
        if ($diff < -1) {
            $diff = -1;
        }
        $exp = $this->exp + ($this->exp * $diff);
        return floor($exp);
    }

    /**
     * Devuelve el oro al ganar o perder
     * 
     * @return float oro devuelto
     */
    public function getOro()
    {
        return $this->oro;
    }

    /**
     * Devuelve el id de monstruo buscado por nombre
     */
    public static function getIdPorNombre($nombre)
    {
        $query = db_query("SELECT id FROM monstruos WHERE nombre LIKE '{$nombre}' AND mapa IS NULL");
        $id = null;
        if (mysqli_num_rows($query)) {
            $id = mysqli_fetch_assoc($query)['id'];
        }
        return $id;
    }

    /**
     * Devuelve un monstruo aleatorio de un mapa
     */
    public static function getMonstruo($mapa)
    {
        $query = db_query("SELECT id, nombre, posibilidad FROM monstruos WHERE mapa LIKE '{$mapa}'");
        $id = null;
        if (mysqli_num_rows($query)) {
            $pos_total = 0;
            $list_monst = array();
            while ($mon = mysqli_fetch_assoc($query)) {
                $pos_total += $mon['posibilidad'];
                array_push($list_monst, ['id' => $mon['id'], 'posibilidad' => $mon['posibilidad']]);
            }

            $pos_rand = rand(1, $pos_total);
            $i = 0;
            for ($i; $i < count($list_monst) && $pos_rand > 0; $i++) {
                $pos_rand -= $list_monst[$i]['posibilidad'];
            }
            if ($i > 0) $i--;
            $id = $list_monst[$i]['id'];
        }
        return $id;
    }

    /**
     * Devuelve el loot asociado a un monstruo
     */
    public static function getLoot($idMonstruo)
    {
        $loot = null;
        $query = db_query("SELECT * FROM monstruos_loot WHERE idmonstruo={$idMonstruo}");
        if (mysqli_num_rows($query)) {
            $loot = array();
            while ($item = mysqli_fetch_assoc($query)) {
                array_push($loot, $item);
            }
        }
        return $loot;
    }
}


class ItemSet
{
    public $id;
    public $nombreset;
    public $palabraclave;
    public $color;
    public $minpiezas;
    public $maxpiezas;
    public $numpiezasjug = 0;

    // [Estadísticas]
    // OJO: TODAS ESTAN EN %
    public $ataque = 0;
    public $armadura = 0;
    public $vida = 0;
    public $reduccion = 0;
    public $absorcion = 0;
    public $evasion = 0;
    public $critico = 0;
    public $dcritico = 0;
    public $parmadura = 0;
    public $espinas = 0;
    public $vampirismo = 0;

    function __construct($idSet)
    {
        if ($idSet == 0) {
            $this->id = 0;
        } else {
            $query = db_query("SELECT * FROM sets WHERE id={$idSet}");
            $set = mysqli_fetch_assoc($query);

            $this->id = $set['id'];
            $this->nombreset = $set['nombreset'];
            $this->palabraclave = $set['palabraclave'];
            $this->color = $set['color'];
            $this->minpiezas = $set['minpiezas'];
            $this->maxpiezas = $set['maxpiezas'];

            $this->ataque = $set['ataque'];
            $this->armadura = $set['armadura'];
            $this->vida = $set['vida'];
            $this->reduccion = $set['reduccion'];
            $this->absorcion = $set['absorcion'];
            $this->evasion = $set['evasion'];
            $this->critico = $set['critico'];
            $this->dcritico = $set['dcritico'];
            $this->parmadura = $set['parmadura'];
            $this->espinas = $set['espinas'];
            $this->vampirismo = $set['vampirismo'];
        }
    }

    /**
     * Suma las stats de un set al actual
     */
    public function sumSet(ItemSet $s)
    {
        $mul = $s->numpiezasjug - $s->minpiezas + 1;
        if ($mul<0) $mul = 0;
        if ($s->numpiezasjug > $s->maxpiezas) $mul = $s->maxpiezas - $s->minpiezas + 1;

        $this->ataque += round($s->ataque * $mul, 2);
        $this->armadura += round($s->armadura * $mul, 2);
        $this->vida += round($s->vida * $mul, 2);
        $this->reduccion += round($s->reduccion * $mul, 2);
        $this->absorcion += round($s->absorcion * $mul, 2);
        $this->evasion += round($s->evasion * $mul, 2);
        $this->critico += round($s->critico * $mul, 2);
        $this->dcritico += round($s->dcritico * $mul, 2);
        $this->parmadura += round($s->parmadura * $mul, 2);
        $this->espinas += round($s->espinas * $mul, 2);
        $this->vampirismo += round($s->vampirismo * $mul, 2);
    }

    public function getBonusString()
    {
        // Guardamos los valores y sus keys
        $values = [
            "Ataque" => $this->ataque,
            "Armadura" => $this->armadura,
            "Vida" => $this->vida,
            "Reducción" => $this->reduccion,
            "Absorción" => $this->absorcion,
            "Evasión" => $this->evasion,
            "Crítico" => $this->critico,
            "Daño crítico" => $this->dcritico,
            "Penetración de armadura" => $this->parmadura,
            "Espinas" => $this->espinas,
            "Vampirismo" => $this->vampirismo
        ];

        // Sacamos el factor a multiplicar
        $mul = $this->numpiezasjug - $this->minpiezas + 1;
        if ($this->numpiezasjug > $this->maxpiezas) $mul = $this->maxpiezas - $this->minpiezas + 1;

        // String a devolver
        $string = '[';
        $count = 0;
        foreach ($values as $key => $value) {
            if ($value != 0) {
                if ($count != 0)
                    $string .= ', ';
                $valmul = round($value * $mul, 2);
                $string .= $key . ': ' . ($valmul > 0 ? '+' : '') . $valmul . '%';
                $count++;
            }
        }
        return $string . ']';
    }

    public static function getSetsJugador($nombre)
    {
        $query = db_query("SELECT COUNT(*) as numpiezas, obj.set
        FROM tiene as ti JOIN objetos as obj ON(ti.nombreobj=obj.nombreobj)
            WHERE ti.nombrejug LIKE '{$nombre}' AND obj.set!=0 AND ti.usado=1
				GROUP BY obj.set");
        $sets = null;
        if (mysqli_num_rows($query)) {
            $sets = array();
            while ($setdb = mysqli_fetch_assoc($query)) {
                $set = new ItemSet($setdb['set']);
                $set->numpiezasjug = $setdb['numpiezas'];
                array_push($sets, $set);
            }
        }
        return $sets;
    }
}
