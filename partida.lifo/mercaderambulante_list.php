<?php
$form = 1;
include('core.php');
function iweb()
{
    global $us;
    if ($us['admin'] == 1) {
        echo "<p><b>OFERTAS POSIBLES DEL MERCADER AMBULANTE (COMUNES):</b></p><br>";
        // Tabla //
        echo '<table cellspacing="0"><thead style="text-align: center;"><tr><th></th><th>Ofrecido</th><th>-</th><th>Pedido</th></tr></thead>';
        echo '<tbody>';

        $ofertas = array();
        $of = db_query("SELECT DISTINCT(idoferta) FROM lifoes_especial.ma_ofertas WHERE unica=0");
        while ($off = mysqli_fetch_array($of))
            array_push($ofertas, $off[0]);
        for ($i = 0; $i < count($ofertas); $i++) {
            $objOfrecidos = array();
            $canOfrecidos = array();
            $objPedidos = array();
            $canPedidos = array();
            $oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=1");
            for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
                $obj = mysqli_fetch_assoc($oferta);
                array_push($objOfrecidos, $obj['nombreobj']);
                array_push($canOfrecidos, $obj['cantidad']);
            }
            $oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=0");
            for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
                $obj = mysqli_fetch_assoc($oferta);
                array_push($objPedidos, $obj['nombreobj']);
                array_push($canPedidos, $obj['cantidad']);
            }
            echo getRowOferta($ofertas[$i], $objOfrecidos, $canOfrecidos, $objPedidos, $canPedidos, $i % 2);
        }

        echo '</tbody></table>';
        // //


        echo "<br><br><p><b>OFERTAS UNICAS DEL MERCADER AMBULANTE:</b></p><br>";
        // Tabla //
        echo '<table cellspacing="0"><thead style="text-align: center;"><tr><th></th><th>Ofrecido</th><th>-</th><th>Pedido</th></tr></thead>';
        echo '<tbody>';

        $ofertas = array();
        $of = db_query("SELECT DISTINCT(idoferta) FROM lifoes_especial.ma_ofertas WHERE unica=1");
        while ($off = mysqli_fetch_array($of))
            array_push($ofertas, $off[0]);
        for ($i = 0; $i < count($ofertas); $i++) {
            $objOfrecidos = array();
            $canOfrecidos = array();
            $objPedidos = array();
            $canPedidos = array();
            $oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=1");
            for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
                $obj = mysqli_fetch_assoc($oferta);
                array_push($objOfrecidos, $obj['nombreobj']);
                array_push($canOfrecidos, $obj['cantidad']);
            }
            $oferta = db_query("SELECT * FROM lifoes_especial.ma_ofertas WHERE idoferta={$ofertas[$i]} AND ofrecido=0");
            for ($j = 0; $j < mysqli_num_rows($oferta); $j++) {
                $obj = mysqli_fetch_assoc($oferta);
                array_push($objPedidos, $obj['nombreobj']);
                array_push($canPedidos, $obj['cantidad']);
            }
            echo getRowOferta($ofertas[$i], $objOfrecidos, $canOfrecidos, $objPedidos, $canPedidos, $i % 2);
        }

        echo '</tbody></table>';
        // //
    }
}
function procesaform()
{
}
