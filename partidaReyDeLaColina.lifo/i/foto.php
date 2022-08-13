<?php
if (isset($_GET['p'])) {
  $p = $_GET['p'];
}
else
  $p = '';

header("Location: ../registro.php?invita={$p}&f=1");
exit();

?>
