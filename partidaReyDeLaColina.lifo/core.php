<?php
ini_set('display_errors',0);
ini_set('log_errors',1);
include('w_aux.php');
include('w_config.php');
include('w_database.php');
include('w_check.php');
include('w_runalways.php');
include('w_ini.php');
include('w_interface.php');
if ($confdebug)
  ini_set('display_errors',1);
iface();
db_close();
?>
