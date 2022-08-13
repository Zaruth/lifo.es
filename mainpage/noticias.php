<?php
include 'header.php';
echo '<div id="contenido"><h3>Últimas Noticias</h3>';
$baseDir = './noticias';
if (isset($_GET['news'])) {
    $news = $_GET['news'];
} else {
    $news = '';
}
if ($news == '') {
    $cont = 0;
    if ($cdir = scandir($baseDir, 1)) {
        foreach ($cdir as $key => $value) {
            if ($value != '.' && $value != '..') {
                $fn = fopen($baseDir . '/' . $value, "r");
                $portions = explode(".", $value);
                $titulo = fgets($fn);
                $fecha = fgets($fn);
                echo '<a href="noticias.php?news=' . $portions[0] . '">' . $fecha . ' - ' . $titulo . '</a><br><br>';
                $cont++;
                fclose($fn);
            }
        }
    }
    if($cont==0){
        echo '<br>No hay noticias actualmente.';
    }
} else {
    echo '</div><div>';
    $handle = fopen($baseDir . '/' . $news . ".txt", "r");
    if ($handle) {
        $line = fgets($handle);
        $line = fgets($handle);
        $text = '';
        while (($line = fgets($handle)) !== false) {
            $text .= $line;
        }
        fclose($handle);
        echo $text;
    }
    echo '<br><br><a href="noticias.php">Volver</a>';
}
echo '</div>';
include 'footer.php';
