<?php
$dbc = '';

/* db_connect() Conecta a la base de datos. Devuelve algo si todo ha ido bien. */
function db_connect() {
  global $confdbhost,$confdbport,$confdbuser,$confdbname,$confdbpass,$dbc;
  $dbc = new mysqli($confdbhost, $confdbuser, $confdbpass, $confdbname, $confdbport);
  if ($dbc->connect_error) {
    echo 'Error conectando a la BD. Parece que el servidor está muy cargado.<br>Espera unos segundos y presiona actualizar en tu navegador.<br>Si el error perdura, es posible que la base de datos se encuentre en mantenimiento.';
    exit();
  }
  mysqli_set_charset($dbc,"utf8");
  return $dbc;
}

/* db_select_db() Selecciona una base de datos. Devuelve algo si todo ha ido bien. */
function db_select_db() {
  global $confdbname,$dbc;
  return mysqli_select_db($dbc,$confdbname);
}

/* db_lock($tables) Bloquea las tablas. */
function db_lock($tables) {
  global $dbc;
  return mysqli_query($dbc,"LOCK TABLES {$tables}");
}

/* db_unlock() Desbloquea las tablas. */
function db_unlock() {
  global $dbc;
  return mysqli_query($dbc,"UNLOCK TABLES");
}

/* db_query($query) Ejecuta una consulta en el servidor y devuelve el resource. Devuelve algo si todo ha ido bien. */
function db_query($query) {
  global $dbc,$time;
  $res = mysqli_query($dbc,$query);
  $err = mysqli_error($dbc);
  if ($err) {
	$errno = mysqli_errno($dbc);
    switch ($errno) {
      case 145:
      case 1194:
      case 1195:
      case 1459:
      case 1034:
      case 1035:
      case 1013:
      case 1014:
      case 1016:
      case 1017:
      case 1023:
      case 1024:
      case 1026:
      case 1028:
      case 1039:
          db_fix();
     }
  }
  return $res;
}

function db_fix() {
  global $dbc,$time;
  $query = mysqli_query($dbc,"SHOW TABLES");
  $tables = '';
  for ($i = 0;$i < mysqli_num_rows($query);$i++) {
   $r = mysqli_fetch_row($query);
   $tables .= "{$r[0]},";  
  }
  $tables = substr($tables,0,strlen($tables)-1);
  $timedel = $time-86400*7;
  $q2 = mysqli_query($dbc,"REPAIR TABLE {$tables}");
  $q3 = mysqli_query($dbc,"OPTIMIZE TABLE {$tables}");
  mysqli_free_result($query);
  mysqli_free_result($q2);
  mysqli_free_result($q3);
}

/* db_affected() Devuelve el número de columnas afectadas. */
function db_affected() {
  global $dbc;
  return mysqli_affected_rows($dbc);
}

/* db_close() Cierra la conexión con la base de datos. */
function db_close() {
  global $dbc;
  return mysqli_close($dbc);
}

?>
