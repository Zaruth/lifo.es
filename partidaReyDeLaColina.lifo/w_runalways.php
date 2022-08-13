<?php

$time = time();
l_setdate(-15);
  
$auxlink = pwdgen(); 
$links = Array("{$confurl}i/reclutar.php?p=","{$confurl}i/vervideo.php?vidid={$auxlink}&amp;p=","{$confurl}i/perfil.php?p=","{$confurl}i/foto.php?fotoid={$auxlink}&amp;p=","{$confurl}i/infojugador.php?p=");
      
$ip = $_SERVER['REMOTE_ADDR'];

$path = explode('/',$_SERVER['PHP_SELF']);
$path = $path[count($path)-1];

if (!isset($stop)) {
  ini_set("session.gc_maxlifetime","14400");
  ini_set('arg_separator.output','&amp;');
  db_connect();
  db_select_db();
  session_cache_expire(540);
  session_start();
}
  if(!isset($_SESSION['jugador'])){$_SESSION['jugador']='';}
  /// SILENCIO ///
  $con = db_query("SELECT horafin FROM {$conftp}silencio WHERE ((string='{$_SESSION['jugador']}' AND isip=0) OR ('{$ip}'=string AND isip=1)) AND horafin>{$time} ORDER BY horafin DESC LIMIT 1");
  if (mysqli_num_rows($con)) {
    $rrrcon = mysqli_fetch_row($con);
    $_SESSION['silenciado'] = $rrrcon[0];
  }
  else {
    $_SESSION['silenciado'] = 0;
  }     
  mysqli_free_result($con);
  /// ///
  
  /// BANEO ///
  $con = db_query("SELECT horafin FROM baneado WHERE ((string='{$_SESSION['jugador']}' AND isip=0) OR (string='{$ip}' AND isip=1)) ORDER BY horafin DESC LIMIT 1");
  if (mysqli_num_rows($con)) {
    $rrrcon = mysqli_fetch_row($con);
    $_SESSION['baneado'] = $rrrcon[0];
  }
  else {
    $_SESSION['baneado'] = 0;
  }     
  mysqli_free_result($con);
  /// ///
  
  
/*db_lock("{$conftp}fix2 READ");
$retvalcon2 = db_query("SELECT * FROM {$conftp}fix2");
db_unlock();
$contador2 = mysqli_fetch_row($retvalcon2);
mysqli_free_result($retvalcon2);
if ($contador2[0]<$time) {
  db_lock("{$conftp}fix2 WRITE");
  $time2 = $time+3600;
  $retvalcon2 = db_query("SELECT * FROM {$conftp}fix2");
  $contador2 = mysqli_fetch_row($retvalcon2);
  mysqli_free_result($retvalcon2);
  if ($contador2[0]<$time) {
    db_query("UPDATE {$conftp}fix2 SET contador={$time2}");
    db_unlock();
    db_fix();
  }
  else
    db_unlock();
}

/*Trabajo*/
/*$numrows = 0;
db_lock("{$conftp}contador READ");
$retvalcon = db_query("SELECT * FROM {$conftp}contador");
db_unlock();
$contador = mysqli_fetch_row($retvalcon);
mysqli_free_result($retvalcon);
$hacer = 0;
if ($contador[0]<$time) {
  //db_lock("{$conftp}contador WRITE");
  //db_query("UPDATE {$conftp}contador SET contador={$time}");
  //db_unlock();
  db_lock("{$conftp}jugadores READ");
  $retvalx = db_query("SELECT nombrejug,puntostrabajo,orotrabajo,oro,trabajando,trabajado,puntossuma,fintrabajo FROM {$conftp}jugadores WHERE fintrabajo<{$time} AND trabajando>0");
  db_unlock();
  if (mysqli_num_rows($retvalx)) {
    db_lock("{$conftp}jugadores WRITE,{$conftp}mensajes WRITE");
    $retval = db_query("SELECT nombrejug,puntostrabajo,orotrabajo,oro,trabajando,trabajado,puntossuma,fintrabajo FROM {$conftp}jugadores WHERE fintrabajo<{$time} AND trabajando>0");
    //$numrows = mysqli_num_rows($retval);
    for ($i = 0;$i < $numrows;$i++) {
      $ret = mysqli_fetch_row($retval);
      $njug = $ret[0];
      $oro = $ret[2]+$ret[3];
      $trabajando = $ret[4];
      $trabajado = $ret[5]+$ret[4];
      $puntossuma = $ret[6]+$ret[1];
      if ($puntossuma > 0)
        $hacer = 1;
      $tiempo = ahora_tiempo($trabajando);
      db_query("UPDATE {$conftp}jugadores SET oro={$oro},puntossuma={$puntossuma},trabajado={$trabajado},trabajando=0,fintrabajo=0,puntostrabajo=0,orotrabajo=0 WHERE nombrejug='{$njug}'");
      if (db_affected())
        db_query("INSERT INTO {$conftp}mensajes (nombrejug,remitente,hora,mensaje) VALUES ('{$njug}','@',$ret[7],'Has trabajado durante {$tiempo}.<br/>Has ganado {$ret[1]} puntos de experiencia y {$ret[2]} monedas de oro.')");
    }
    db_unlock();
    mysqli_free_result($retval);
  }
  mysqli_free_result($retvalx);
}
*/
/*Suma puntos*/
/*
if ($hacer)
  sumapuntos();
*/
?>
