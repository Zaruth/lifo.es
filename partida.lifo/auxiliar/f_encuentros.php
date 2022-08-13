<?php
include_once './auxiliar/f_entity.php';

function realizar_encuentro($nombrejug, $mapa)
{
    global $imgroot, $time, $conf_noencuentrohasta, $conf_noencuentrohastapremium, $confascension;

    $Jugador = new Jugador($nombrejug);
    $idMon = Monstruo::getMonstruo($mapa);
    if ($idMon != null) {
        $Monstruo = new Monstruo($idMon);

        $textoCombate = '';
        $textoCombate .= "<b>¡Combate!</b> ";
        $textoCombate .= getInsigniaJug($Jugador->nombre) . " " . getName($Jugador->nombre, 1) . " (nivel {$Jugador->nivel})";
        $textoCombate .= " <b>contra</b> ";
        $textoCombate .= "<img src=\"{$imgroot}{$Monstruo->img}.gif\"/> <strong>{$Monstruo->nombre}</strong> (nivel {$Monstruo->nivel})<br>";


        $textoCombate .= "<b>[COMIENZA EL COMBATE]</b><br>";

        // COMBATE //
        $turno = rand(0, 1); // 0 Jugador | 1 Monstruo
        $comienzo = $turno;
        if ($turno == 0) $textoCombate .= "¡<b>{$Jugador->nombre}</b> comienza golpeando!<br>";
        else $textoCombate .= "¡<b>{$Monstruo->nombre}</b> comienza golpeando!";
        $textoCombate .= vidaActual($Jugador, $Monstruo);
        $i = 1;
        while ($Jugador->vidaTotal > 0 && $Monstruo->vidaTotal > 0) {
            $textoCombate .= "<b>Turno {$i}:</b><br>";

            // Golpe al monstruo
            if ($turno == 0) $textoCombate .= gestionaGolpe($Jugador, $Monstruo);
            // Golpe al jugador
            else $textoCombate .= gestionaGolpe($Monstruo, $Jugador);
            
            $textoCombate .= vidaActual($Jugador, $Monstruo);
            if ($turno == 1) $turno = 0;
            else $turno = 1;

            if ($i == 20 && ($Jugador->vidaTotal > 0 && $Monstruo->vidaTotal > 0)) {
                $textoCombate .= "<b>[{$Monstruo->nombre} entra en furia y te asesta Muerte súbita]</b>";
                $Jugador->vidaTotal = 0;
                $textoCombate .= vidaActual($Jugador, $Monstruo);
            }
            $i++;
        }
        // //


        // COMPROBACIÓN DE GANADOR //
        $ganador = true;
        if ($Jugador->vidaTotal == 0 && $Monstruo->vidaTotal == 0) {
            $textoCombate .= "¡{$Jugador->nombre} y {$Monstruo->nombre} están sin vida!<br>";
            if ($comienzo == 1)
                $ganador = false;
        } else if ($Jugador->vidaTotal == 0) {
            $ganador = false;
            $textoCombate .= "¡{$Jugador->nombre} está sin vida!<br>";
        } else {
            $textoCombate .= "¡{$Monstruo->nombre} está sin vida!<br>";
        }
        // //

        $textoCombate .= "<b>[FIN DEL COMBATE]</b><br><br>";
        $exp = $Monstruo->getExp($Jugador->nivel);
        $oro = $Monstruo->getOro();
        // ASIGNACIÓN DE RECOMPENSAS //
        if ($ganador == false) {    // Gana Monstruo
            $textoCombate .= "¡{$Jugador->nombre} pierde el encuentro!<br>";
            $textoCombate .= "¡{$Jugador->nombre} pierde {$exp} puntos de experiencia!<br>";
            $textoCombate .= "¡{$Jugador->nombre} pierde {$oro} monedas de oro!<br>";

            $exp = -$exp;
            $oro = -$oro;
        } else {    // Gana Jugador
            $exp = floor($exp*((($Jugador->ascensiones*$confascension)+100)/100));
            $textoCombate .= "¡{$Jugador->nombre} gana el encuentro!<br>";
            $textoCombate .= "¡{$Jugador->nombre} gana {$exp} puntos de experiencia!<br>";
            $textoCombate .= "¡{$Jugador->nombre} gana {$oro} monedas de oro!<br>";

            if ($Jugador->m_expGanada != null) {
                if ($Jugador->m_apodo != '') {
                    $textoCombate .= "Tu mascota, {$Jugador->m_apodo}, se siente fuerte.<br>";
                } else {
                    $textoCombate .= 'Tu mascota se siente fuerte.<br>';
                }
                db_query("UPDATE tienemascotas SET experiencia=experiencia+{$Jugador->m_expGanada} WHERE nombrejug='{$Jugador->nombre}' AND nombremascota='{$Jugador->m_nombremascota}'");
            }

            if($Monstruo->loot!=null){
                $hayLoot = false;
                $items = '';
                for ($i=0; $i < count($Monstruo->loot); $i++) {
                    $item = $Monstruo->loot[$i]; // idMonstruo, nombreobj, cantidad, posibilidad
                    if(rand(1,10000) <= $item['posibilidad']){
                        $hayLoot = true;
                        $can = rand(1,$item['cantidad']);
                        dale_objeto($Jugador->nombre,$item['nombreobj'],$can);
                        $items .= "<img src=\"{$imgroot}".getObjId($item['nombreobj']).".gif\"/> <strong>x{$can}</strong> {$item['nombreobj']}<br>";
                    }
                }
                if($hayLoot){
                    $textoCombate .= '<br><strong>'.$Monstruo->nombre.'</strong> al morir suelta:<br>'.$items;
                }
            }
        }
        $textoCombate .= '<br>';
        // //

        $Jugador->puntossuma += $exp;
        $Jugador->oro += $oro;
        if ($Jugador->oro < 0) $Jugador->oro = 0;
        if ($Jugador->premiumhasta >= $time) $Jugador->noencuentrohasta = $time + $conf_noencuentrohastapremium;
        else $Jugador->noencuentrohasta = $time + $conf_noencuentrohasta;

        sumaEncuentro($Jugador, $mapa, $ganador);
        $Jugador->consumeConsumibles();
        db_query("UPDATE jugadores SET puntossuma={$Jugador->puntossuma},oro={$Jugador->oro},noencuentrohasta={$Jugador->noencuentrohasta} WHERE nombrejug='{$Jugador->nombre}'");
        db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo,visto) VALUES ('{$Jugador->nombre}','@',{$time},'{$textoCombate}','Encuentros',0)");
        sumapuntos($Jugador->nombre);
    }
    return $idMon;
}

function realizar_desafio($nombrejug, $nombremon)
{
    global $imgroot, $time, $conf_noencuentrohasta, $conf_noencuentrohastapremium;

    $Jugador = new Jugador($nombrejug);
    $idMon = Monstruo::getIdPorNombre($nombremon);
    $ganado = null;
    if ($idMon != null) {
        $Monstruo = new Monstruo($idMon);

        $textoCombate = '';
        $textoCombate .= "<b>¡Combate!</b> ";
        $textoCombate .= getInsigniaJug($Jugador->nombre) . " " . getName($Jugador->nombre, 1) . " (nivel {$Jugador->nivel})";
        $textoCombate .= " <b>contra</b> ";
        $textoCombate .= "<img src=\"{$imgroot}{$Monstruo->img}.gif\"/> <strong>{$Monstruo->nombre}</strong> (nivel {$Monstruo->nivel})<br>";


        $textoCombate .= "<b>[COMIENZA EL COMBATE]</b><br>";

        // COMBATE //
        $turno = rand(0, 1); // 0 Jugador | 1 Monstruo
        $comienzo = $turno;
        if ($turno == 0) $textoCombate .= "¡<b>{$Jugador->nombre}</b> comienza golpeando!<br>";
        else $textoCombate .= "¡<b>{$Monstruo->nombre}</b> comienza golpeando!<br>";
        $textoCombate .= vidaActual($Jugador, $Monstruo);
        $i = 1;
        while ($Jugador->vidaTotal > 0 && $Monstruo->vidaTotal > 0) {
            $textoCombate .= "<b>Turno {$i}:</b><br>";

            // Golpe al monstruo
            if ($turno == 0) $textoCombate .= gestionaGolpe($Jugador, $Monstruo);
            // Golpe al jugador
            else $textoCombate .= gestionaGolpe($Monstruo, $Jugador);

            $textoCombate .= vidaActual($Jugador, $Monstruo);
            if ($turno == 1) $turno = 0;
            else $turno = 1;

            if ($i == 20 && ($Jugador->vidaTotal > 0 && $Monstruo->vidaTotal > 0)) {
                $textoCombate .= "<b>[{$Monstruo->nombre} entra en furia y te asesta Muerte súbita]</b><br>";
                $Jugador->vidaTotal = 0;
                $textoCombate .= vidaActual($Jugador, $Monstruo);
            }
            $i++;
        }
        // //


        // COMPROBACIÓN DE GANADOR //
        $ganador = true;
        if ($Jugador->vidaTotal == 0 && $Monstruo->vidaTotal == 0) {
            $textoCombate .= "¡{$Jugador->nombre} y {$Monstruo->nombre} están sin vida!<br>";
            if ($comienzo == 1)
                $ganador = false;
        } else if ($Jugador->vidaTotal == 0) {
            $ganador = false;
            $textoCombate .= "¡{$Jugador->nombre} está sin vida!<br>";
        } else {
            $textoCombate .= "¡{$Monstruo->nombre} está sin vida!<br>";
        }
        // //

        $textoCombate .= "<b>[FIN DEL COMBATE]</b><br><br>";
        $exp = $Monstruo->getExp($Jugador->nivel);
        $oro = $Monstruo->getOro();
        // ASIGNACIÓN DE RECOMPENSAS //
        if ($ganador == false) {    // Gana Monstruo
            $ganado = false;
            $textoCombate .= "¡{$Jugador->nombre} pierde el encuentro!<br>";
            $textoCombate .= "¡{$Jugador->nombre} pierde {$exp} puntos de experiencia!<br>";
            $textoCombate .= "¡{$Jugador->nombre} pierde {$oro} monedas de oro!<br>";

            $exp = -$exp;
            $oro = -$oro;
        } else {    // Gana Jugador
            $ganado = true;
            $textoCombate .= "¡{$Jugador->nombre} gana el encuentro!<br>";
            $textoCombate .= "¡{$Jugador->nombre} gana {$exp} puntos de experiencia!<br>";
            $textoCombate .= "¡{$Jugador->nombre} gana {$oro} monedas de oro!<br>";

            if ($Jugador->m_expGanada != null) {
                if ($Jugador->m_apodo != '') {
                    $textoCombate .= "Tu mascota, {$Jugador->m_apodo}, se siente fuerte.<br>";
                } else {
                    $textoCombate .= 'Tu mascota se siente fuerte.<br>';
                }
                db_query("UPDATE tienemascotas SET experiencia=experiencia+{$Jugador->m_expGanada} WHERE nombrejug='{$Jugador->nombre}' AND nombremascota='{$Jugador->m_nombremascota}'");
            }
        }
        $textoCombate .= '<br>';
        // //

        $Jugador->puntossuma += $exp;
        $Jugador->oro += $oro;
        if ($Jugador->oro < 0) $Jugador->oro = 0;
        if ($Jugador->premiumhasta >= $time) $Jugador->noencuentrohasta = $time + $conf_noencuentrohastapremium;
        else $Jugador->noencuentrohasta = $time + $conf_noencuentrohasta;

        $Jugador->consumeConsumibles();
        db_query("UPDATE jugadores SET puntossuma={$Jugador->puntossuma},oro={$Jugador->oro} WHERE nombrejug='{$Jugador->nombre}'");
        db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo,visto) VALUES ('{$Jugador->nombre}','@',{$time},'{$textoCombate}','Encuentros',0)");
        sumapuntos($Jugador->nombre);
    }
    return $ganado;
}

function vidaActual(Entity $ent1, Entity $ent2)
{
    return "<br>Puntos de vida [<b>{$ent1->nombre}</b>: {$ent1->vidaTotal}] - [<b>{$ent2->nombre}</b>: {$ent2->vidaTotal}]<br><br>";
}

function gestionaGolpe(Entity &$ent1, Entity &$ent2)
{
    /**
     * ORDEN EN EL GOLPEO
     * 1º DANIO
     * 2º CRI y DCRI
     * 3º EVADE
     * 4º PARMADURA + NO PARMADURA
     * 5º ABSORCION + NO ABSORCION
     * 6º DREDUCIDO = NO ABSORCION * REDUCE
     * 7º VAMPIRISMO = PARMADURA+DREDUCIDO
     * 8º ESPINAS
     */
    $textoCombate = '';

    // ASESTA (1º, 2º y 3º) 
    $golpe = $ent1->asestaGolpe();
    if ($golpe['esCri']) $textoCombate .= '¡';
    $textoCombate .= "<b>{$ent1->nombre}</b> asesta un golpe ";
    if ($golpe['esCri']) $textoCombate .= '<b>CRÍTICO</b> ';
    $textoCombate .= " de <b>{$golpe['danio']}</b> punto" . ($golpe['danio'] > 1 ? 's' : '');
    $evadido = $ent2->evade();
    if ($evadido) $textoCombate .= ", pero <b>{$ent2->nombre}</b> evadió el golpe";
    if ($golpe['esCri']) $textoCombate .= '! ';
    else $textoCombate .= '. ';

    // RECIBE (4º, 5º y 6º)
    if (!$evadido) {
        $drecibido = $ent2->recibeGolpe($golpe['danio'], $ent1->m_parmadura);
        $textoCombate .= "<b>{$ent2->nombre}</b> pierde <b>{$drecibido}</b> punto" . ($drecibido > 1 ? 's' : '');

        // VAMPIRISMO (7º)
        if ($ent1->m_vampirismo > 0) {
            $curado = $ent1->absorveVida($drecibido);
            $textoCombate .= " y <b>{$ent1->nombre}</b> se cura <b>{$curado}</b> punto" . ($curado > 1 ? 's' : '');
        }
        $textoCombate .= '.';

        // ESPINAS (8º)
        if ($ent2->m_espinas > 0) {
            $espinas = $ent1->danioEspinas($ent2);
            if ($espinas > 0) {
                $textoCombate .= "<br><b>{$ent1->nombre}</b> recibe <b>{$espinas}</b> punto" . ($curado > 1 ? 's' : '') . " de daño de espinas";
                $textoCombate .= '.';
            }
        }
    }

    return $textoCombate;
}

/**
 * Suma un combate ganado y total al mapa del jugador
 * 
 * @param Jugador $Jugador Jugador pasado
 * @param string $mapa Mapa del combate
 * @param bool $ganado Ganado o perdido
 */
function sumaEncuentro(Jugador $Jugador, string $mapa, bool $ganado)
{
    $query = db_query("SELECT ganados, totales FROM encuentros WHERE nombrejug LIKE '{$Jugador->nombre}' AND mapa LIKE '{$mapa}'");
    if (!mysqli_num_rows($query)) {
        db_query("INSERT INTO `encuentros`(`nombrejug`, `mapa`) VALUES ('{$Jugador->nombre}','{$mapa}')");
        $query = db_query("SELECT ganados, totales FROM encuentros WHERE nombrejug LIKE '{$Jugador->nombre}' AND mapa LIKE '{$mapa}'");
    }
    $row = mysqli_fetch_assoc($query);
    $ganados = $row['ganados'];
    if ($ganado) $ganados += 1;
    $totales = $row['totales'] + 1;
    db_query("UPDATE `encuentros` SET `ganados`={$ganados},`totales`={$totales} WHERE nombrejug LIKE '{$Jugador->nombre}' AND mapa LIKE '{$mapa}'");
}
