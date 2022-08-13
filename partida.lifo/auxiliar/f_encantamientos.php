<?php
    function getEncantamiento($jug, $nombreobj, $enchant){
        global $imgroot;
        $getEnc = db_query(
            "SELECT ti.nombreobj, ti.encantamiento, enc.nombreobj as encan, enc.prot, enc.ataq, enc.vida 
             FROM `tiene` as ti LEFT JOIN `encantamientos` as enc ON (ti.encantamiento=enc.id)
             WHERE ti.nombrejug='{$jug}' AND ti.nombreobj='{$nombreobj}' AND ti.encantamiento={$enchant}"
        );
        $item = mysqli_fetch_assoc($getEnc);
        $text = "";
        if($item['encantamiento'] != 0) {
            $swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
			$shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
            $heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
            $enchantedIcon = "<img src=\"{$imgroot}enchantedicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Encantado\" title=\"Encantado\">";
            
            $text = " <span class=\"txt_encantado\">[{$enchantedIcon}: <strong>".explode(": ",$item['encan'])[1]."</strong> ";
            if($item['ataq']!=0){
                $text .= "{$swordIcon}: {$item['ataq']}";
                if ($item['prot']!=0 || $item['vida']!=0)
                    $text .= " / ";
            }
            if($item['prot']!=0){
                $text .= "{$shieldIcon}: {$item['prot']}";
                if ($item['vida']!=0)
                    $text .= " / ";
            }
            if($item['vida']!=0)
                $text .= "{$heartIcon}: {$item['vida']}";
            $text .= "]";
        }
        return $text;
    }

    function getTxtEncantamiento($enchant){
        global $imgroot;
        $getEnc = db_query("SELECT nombreobj, prot, ataq, vida FROM `encantamientos` WHERE id={$enchant}");
        $item = mysqli_fetch_assoc($getEnc);
        $text = "";
        if($enchant != 0) {
            $swordIcon = "<img src=\"{$imgroot}espadaicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Ataque\" title=\"Ataque\">";
			$shieldIcon = "<img src=\"{$imgroot}escudoicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Protección\" title=\"Protección\">";
            $heartIcon = "<img src=\"{$imgroot}corazonicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Vida\" title=\"Vida\">";
            $enchantedIcon = "<img src=\"{$imgroot}enchantedicon.png\" style=\"height: 12px;width: 12px;\" alt=\"Encantado\" title=\"Encantado\">";
            
            $text = " <span class=\"txt_encantado\">[{$enchantedIcon}: <strong>".explode(": ",$item['nombreobj'])[1]."</strong> ";
            if($item['ataq']!=0){
                $text .= "{$swordIcon}: {$item['ataq']}";
                if ($item['prot']!=0 || $item['vida']!=0)
                    $text .= " / ";
            }
            if($item['prot']!=0){
                $text .= "{$shieldIcon}: {$item['prot']}";
                if ($item['vida']!=0)
                    $text .= " / ";
            }
            if($item['vida']!=0)
                $text .= "{$heartIcon}: {$item['vida']}";
            $text .= "]</span>";
        }
        return $text;
    }

    function getNameEnchant($enchant){
        $getEnc = db_query("SELECT nombreobj FROM `encantamientos` WHERE id={$enchant}");
        $text = explode(': ',mysqli_fetch_row($getEnc)[0])[1];
        return $text;
    }

    function getStatsEncantamientos($jug){
        $retvalench = db_query(
            "SELECT IFNULL(SUM(encantamientos.ataq), 0), IFNULL(SUM(encantamientos.prot), 0), IFNULL(SUM(encantamientos.vida), 0)
              FROM tiene JOIN objetos ON (tiene.nombreobj=objetos.nombreobj AND tiene.nombrejug='{$jug}') LEFT JOIN encantamientos ON (tiene.encantamiento=encantamientos.id)
                WHERE tiene.usado=1
                ORDER BY objetos.tipo ASC,objetos.ataq+objetos.prot DESC,objetos.posibilidad ASC,objetos.niveluso DESC,objetos.nombreobj ASC"
          );
        return mysqli_fetch_row($retvalench);
    }
