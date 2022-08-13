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
  
  
?>
