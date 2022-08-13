<?php
$form = 1;
include('core.php');
function iweb() {
    global $tag,$jug;
    include_once 'auxiliar/f_items.php';

    $getEnchantedItems = db_query(
        "SELECT objetos.*,tiene.cantidad, tiene.usado, tiene.encantamiento
            FROM tiene JOIN objetos ON (tiene.nombreobj=objetos.nombreobj AND tiene.nombrejug='{$jug}')
                WHERE tiene.usado=0 AND tiene.encantamiento!=0
                    ORDER BY objetos.tipo ASC,objetos.ataq+objetos.prot DESC,objetos.posibilidad ASC,objetos.niveluso DESC,objetos.nombreobj ASC");
    echo '<p><b>Objetos encantados (no en uso):</b></p><p>';
    if(mysqli_num_rows($getEnchantedItems)){
        echo '<form action="desencantar.php" method="post">';
        echo "<input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>";
        while($item = mysqli_fetch_assoc($getEnchantedItems)){
            $objeto = getItemInventario($jug,$item);
            echo '<input style="vertical-align: middle;" type="checkbox" name="item[]" value="'.$item['nombreobj'].'#'.$item['img'].'#'.$item['encantamiento'].'">
            <input type="number" name="'.$item['img'].'#'.$item['encantamiento'].'" value="1" min="1" max="'.$item['cantidad'].'">'.$objeto.'<br>';
        }
        echo '<br><input type="submit" name="desAlgunos" value="Desencantar seleccionados" onclick="c()"/> <input type="submit" name="desTodos" value="Desencantar todos" onclick="c()"/>';
        echo '</form>';
    } else {
        echo '<span style="color:red;">No tienes objetos encantados para desencantar.</span>';
    }
    echo '</p>';
    echo '<br><a href="inventario.php">Volver al Inventario</a>';
}

function procesaform() {
    global $tag, $jug, $time, $imgroot;
    include_once 'auxiliar/f_items.php';

    if(isset($_POST['desAlgunos'])){
        $mensajeria = false;
        if (isset($_REQUEST['tag'])) {
            $gtag = $_REQUEST['tag'];
            if ($tag == $gtag){
                if(!empty($_POST['item'])) {
                    try {
                        $good = true;
                        //item = nombreobj, img, encantamiento
                        foreach($_POST['item'] as $value){
                            $item = explode('#',$value); 
                            $cantidad = $_POST[$item[1].'#'.$item[2]];
                            $tieneItem = db_query("SELECT * FROM tiene WHERE nombreobj='{$item[0]}' AND encantamiento={$item[2]} AND cantidad>={$cantidad} AND nombrejug='$jug' AND usado=0");
                            if(!mysqli_num_rows($tieneItem)){
                                $good = false;
                                break;
                            }
                        }
                        if($good){
                            $mens = 'Has desencantado algunos objetos. Has obtenido:<br>';
                            foreach($_POST['item'] as $value){
                                $item = explode('#',$value); 
                                $nombreobj = $item[0];
                                $img = $item[1];
                                $encantamiento = $item[2];
                                $cantidad = $_POST[$item[1].'#'.$item[2]];
                                //$esencia = generaEsencia($encantamiento,$cantidad); //[nombreesencia, imagen, cantidad]
                                //$mens .= '<img src="'.$imgroot.$esencia[1].'.gif"/> <b>x'.$esencia[2].'</b> '.$esencia[0].' (Sin uso)<br>';
                                //dale_objeto($jug,$esencia[0],$esencia[2]);
                                quita_objeto($jug,$nombreobj,$img,$cantidad,$encantamiento);
                                dale_objeto($jug,$nombreobj,$cantidad);
                                $mens .= '<img src="'.$imgroot.$img.'.gif"/> <b>x'.$cantidad.'</b> '.$nombreobj.'<br>';
                            }
                            db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',$time,'{$mens}','General')");
                            $mensajeria = true;
                        } else {
                            $_SESSION['error'] = 'No tienes esa cantidad de objetos.';
                        }
                    } catch (\Throwable $th) {
                        $_SESSION['error'] = 'Error: '.$th;
                    }
                }
            } else {
                $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
            }
        }
        if ($mensajeria)
            header('Location: mensajeria.php');
        else
            header('Location: desencantar.php');
        return 1;
    }

    if(isset($_POST['desTodos'])){
        $mensajeria = false;
        if (isset($_REQUEST['tag'])) {
            $gtag = $_REQUEST['tag'];
            if ($tag == $gtag){
                try {
                    $getItems = db_query("SELECT tiene.*, objetos.img FROM tiene JOIN objetos ON(tiene.nombreobj=objetos.nombreobj) WHERE tiene.nombrejug='{$jug}' AND tiene.usado=0 AND tiene.encantamiento!=0");
                    if(mysqli_num_rows($getItems)){
                        $mens = 'Has desencantado todos los objetos posibles. Has obtenido:<br>';
                        while($item = mysqli_fetch_assoc($getItems)){
                            $nombreobj = $item['nombreobj'];
                            $img = $item['img'];
                            $encantamiento = $item['encantamiento'];
                            $cantidad = $item['cantidad'];
                            //$esencia = generaEsencia($encantamiento,$cantidad); //[nombreesencia, imagen, cantidad]
                            //$mens .= '<img src="'.$imgroot.$esencia[1].'.gif"/> <b>x'.$esencia[2].'</b> '.$esencia[0].' (Sin uso)<br>';
                            //dale_objeto($jug,$esencia[0],$esencia[2]);
                            quita_objeto($jug,$nombreobj,$img,$cantidad,$encantamiento);
                            dale_objeto($jug,$nombreobj,$cantidad);
                            $mens .= '<img src="'.$imgroot.$img.'.gif"/> <b>x'.$cantidad.'</b> '.$nombreobj.'<br>';
                        }
                        db_query("INSERT INTO mensajes (nombrejug,remitente,hora,mensaje,tipo) VALUES ('{$jug}','@',$time,'{$mens}','General')");
                        $mensajeria = true;
                    } else {
                        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
                    }
                } catch (\Throwable $th) {
                    $_SESSION['error'] = 'Error: '.$th;
                }
            } else {
                $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
            }
        }
        if ($mensajeria)
            header('Location: mensajeria.php');
        else
            header('Location: desencantar.php');
        return 1;
    }
}