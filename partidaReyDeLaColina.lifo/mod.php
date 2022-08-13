<?php
$form = 1;
include('core.php');
function iweb() {
  global $jug,$imgroot,$time,$conftp,$us,$tag;
  if (($us['admin']) || ($us['moderador']))
    $esmodera = 1;
  else
    $esmodera = 0;
  if ($esmodera) {
	techo('Bienvenido a la página de los moderadores. Desde aquí puedes añadir y eliminar silenciamientos a los jugadores conflictivos y ver los mensajes reportados. La implementación no es muy limpia, lo he hecho todo con prisa, aquí tenéis un par de detalles que debéis conocer: Pueden existir varios silenciamientos para un jugador o ip, siempre que haya uno activo el usuario estará silenciado. Al eliminar un silenciamiento determinado se eliminan todos los correspondientes a ese jugador (incluso los de ip) pues se entiende que se quiere dar permiso a ese jugador para hablar de nuevo. <b>No abuseis de los silenciamientos de ip, sólo debeis usarlos cuando un jugador insiste en molestar repetidas veces (silenciamiento corto al usuario+ip), ya que podéis causar problemas a otros jugadores si están conectando desde un cibercafé u otro lugar público</b>. Por norma general os bastará con utilizar silenciamientos al usuario :)');
	if (isset($_GET['vers'])){
		echo '<h3>Silencios activos:</h3>';
		echo '<b>Ver y eliminar silencios activos (si no sale nada aquí debajo es que no quedan silencios por revisar).</b><br/><br/>';
		db_lock("{$conftp}silencio READ");
		$conan = db_query("SELECT string,isip,autor,horapuesto,horafin,stringip,motivo FROM {$conftp}silencio WHERE horafin>{$time} order by horafin");
		db_unlock();
		$n = mysqli_num_rows($conan);
		if ($n > 0) {
			for ($i = 0;$i < $n;$i++) {
			  $r = mysqli_fetch_row($conan);
			  $dia_t = ahora_dia($r[4]);
			  $hora_t = ahora_hora($r[4]);
			  $e = $i+1;
			  echo "<form action=\"mod.php\" method=\"post\"><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"str\" value=\"{$r[5]}\"/><input type=\"submit\" onclick=\"return c()\" value=\"Eliminar\" name=\"eliminar\"/> ";
			  if ($r[1] == 1)
				echo "{$e}. Silenciamiento a la ip de <b>{$r[5]}</b> puesto por <b>{$r[2]}</b> hasta el {$dia_t} a las {$hora_t}";
			  else
				echo "{$e}. Silenciamiento al usuario <b>{$r[5]}</b> puesto por <b>{$r[2]}</b> hasta el {$dia_t} a las {$hora_t}";
			  echo " [#] <b>Motivo:</b> {$r[6]}";
			  echo "</br></form>";
			}
		}
		mysqli_free_result($conan);
		echo '<br/><br/><a href="mod.php">Volver</a>';
	} else if(isset($_GET['verr'])) {
		echo '<h3>Reportes activos:</h3>';
		echo '<b>Ver y eliminar mensajes reportados (si no sale nada aquí debajo es que no quedan mensajes por revisar).</b><br/><br/>';
		db_lock("{$conftp}mensajes READ");
		$retval = db_query("SELECT idmensaje,nombrejug,remitente,hora,mensaje FROM {$conftp}mensajes WHERE reportado=1");
		db_unlock();
		$num = mysqli_num_rows($retval);
		if ($num > 0) {
			for ($i = 0;$i < $num;$i++) {
			$ret = mysqli_fetch_row($retval);
			$dia = ahora_dia($ret[3]);
			$hora = ahora_hora($ret[3]);
			echo "<form action=\"mod.php\" method=\"post\"><input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/><input type=\"hidden\" name=\"idmens\" value=\"{$ret[0]}\"/><input type=\"submit\" name=\"borramens\" onclick=\"return c()\" value=\"Borrar!\"/><u>Mensaje de <b>{$ret[2]}</b> recibido Y REPORTADO el {$dia} a las {$hora} POR <b>{$ret[1]}</b>.</u><br/>{$ret[4]}<br/><br/></form>";
			}
		}
		echo '<br/><br/><a href="mod.php">Volver</a>';
	} else {
	  $retvalu = db_query("SELECT COUNT(*) FROM {$conftp}silencio WHERE horafin > {$time} AND eliminado LIKE ''"); 
      $silenciosActivos = mysqli_fetch_array($retvalu);
	  echo '<b>Ver silencios activos:</b> <a href="mod.php?vers">Ver ('.$silenciosActivos[0].' Activos)</a><br/>';
	  $retvali = db_query("SELECT COUNT(*) FROM {$conftp}mensajes WHERE reportado=1"); 
	  $hayReports = mysqli_fetch_array($retvali);
	  echo '<b>Ver resportes activos:</b> <a href="mod.php?verr">Ver ('.$hayReports[0].' Activos)</a><br/><br/>';
	  echo '<table><tr><td>';
	  echo "<b>Aplicar silencio:</b><br/><br/><form action=\"mod.php\" method=\"post\" id=\"silencioform\">
	  <input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
	  <label>Nombre de usuario:</label><input type=\"text\" name=\"usuario\" value=\"\"/><br/><br/>
	  <label>Acción sobre:</label> <select name=\"destino\" form=\"silencioform\">
		  <option value=\"us\">Usuario</option>
		  <option value=\"ip\">IP</option>
		  <option value=\"usip\">Usuario e IP</option></select>
	  <label>Tiempo:</label>
		<select name=\"tiempo\" form=\"silencioform\">
		  <option value=\"h2\">2 Horas</option>
		  <option value=\"h6\">6 Horas</option>
		  <option value=\"d1\">1 Día</option>
		  <option value=\"d3\">3 Días</option>
		  <option value=\"d7\">7 Días</option>
		  <option value=\"m1\">1 Mes</option>
		  <option value=\"m3\">3 Meses</option>
		  <option value=\"a5\">5 Años</option>
		</select><br/><br>
	  <label>Motivo (<b>obligatorio</b>, ya que será visto por el usuario):</label><br><textarea name=\"motivo\"></textarea><br/><br/>
	  <input type=\"submit\" value=\"Silenciar\" onclick=\"return c()\" name=\"silenciar\"/></form>";
	  echo '</td><td style="padding-left: 40px;">';
	  echo "<b>Aplicar <img src=\"{$imgroot}banned.gif\">:</b><br/><br/><form action=\"mod.php\" method=\"post\" id=\"banform\">
	  <input type=\"hidden\" name=\"tag\" value=\"{$tag}\"/>
	  <label>Nombre de usuario:</label><input type=\"text\" name=\"usuario\" value=\"\"/><br/><br/>
	  <label>Acción sobre:</label> <select name=\"destino\" form=\"banform\">
		  <option value=\"us\">Usuario</option>
		  <option value=\"ip\">IP</option>
		  <option value=\"usip\">Usuario e IP</option></select>
	  <label>Tiempo:</label>
		<select name=\"tiempo\" form=\"banform\">
		  <option value=\"h2\">2 Horas</option>
		  <option value=\"h6\">6 Horas</option>
		  <option value=\"d1\">1 Día</option>
		  <option value=\"d3\">3 Días</option>
		  <option value=\"d7\">7 Días</option>
		  <option value=\"m1\">1 Mes</option>
		  <option value=\"m3\">3 Meses</option>
		  <option value=\"a5\">5 Años</option>
		  <option value=\"p10\">PERMANENTE</option>
		</select><br/><br>
	  <label>Motivo (<b>obligatorio</b>, ya que será visto por el usuario):</label><br><textarea name=\"motivo\"></textarea><br/><br/>
	  <input type=\"submit\" value=\"Banear\" onclick=\"return c()\" name=\"banear\"/></form>";
	  echo '</td></tr></table>';
	  
	}
  }
  else
    return;
}

function procesaform() {
  global $us,$_REQUEST,$tag,$jug,$time,$conftp;
  if (isset($_REQUEST['eliminar'])) {
    if (($us['admin']) || ($us['moderador']))
      $esmodera = 1;
    else
      $esmodera = 0;
    if ($esmodera) {
      $gtag = $_REQUEST['tag'];
      $str = $_REQUEST['str'];
      if ((preg_match('/^[a-zA-Z]+$/',$str)) && (strlen($str) >= 3) && (strlen($str) <= 14))
        $str = strtoupper($str[0]).strtolower(substr($str,1));
      else {
        if (!(preg_match('/^[0-9\.]*$/',$str))) { 
          $str = '';
        }
      }
    if ($str) {
      if ($tag == $gtag) {
        db_lock("{$conftp}silencio READ");
        $conana = db_query("SELECT * FROM {$conftp}silencio WHERE stringip='{$str}' AND horafin>{$time}");
        db_unlock();
        if (mysqli_num_rows($conana)) {
          db_lock("{$conftp}silencio WRITE");
          $conan = db_query("UPDATE {$conftp}silencio SET horafin={$time},eliminado='{$jug}' WHERE stringip='{$str}' AND horafin>{$time}");
          db_unlock();
          $_SESSION['mensaje'] = 'Silenciamiento eliminado.';
        }
        else
          $_SESSION['error'] = 'Ese silenciamiento no existe ya o ya ha caducado.';
        mysqli_free_result($conana);
      }
      else
        $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    else
      $_SESSION['error'] = '¡Intenta de nuevo, por favor!';
    }
    else
      $_SESSION['error'] = 'No eres moderador.';
    header("Location: mod.php");
    return 1;
  }


  if (isset($_REQUEST['borramens'])) {
    if (($us['admin']) || ($us['moderador']))
      $esmodera = 1;
    else
      $esmodera = 0;
    if ($esmodera) {
      $gtag = $_REQUEST['tag'];
      $idmens = $_REQUEST['idmens'];
      if ((is_numeric($idmens)) && ($tag == $gtag)) {
        db_lock("{$conftp}mensajes WRITE");
        $retval = db_query("DELETE FROM {$conftp}mensajes WHERE idmensaje='{$idmens}'");
        db_unlock();
        $_SESSION['mensaje'] = "Borrado mensaje reportado. Si consideras motivo de silenciamiento el contenido del mensaje, adelante.";
      }
      else
        $_SESSION['error'] = "Intenta de nuevo!";
    }
    else
      $_SESSION['error'] = 'No eres moderador.';
    header('Location: mod.php');
    return 1;
  }

  if (isset($_REQUEST['silenciar'])) {
    if (($us['admin']) || ($us['moderador']))
      $esmodera = 1;
    else
      $esmodera = 0;
    if ($esmodera) {
		$gtag = $_REQUEST['tag'];
		if ($tag == $gtag) {
			$tiemposil = 0;
			switch($_REQUEST['tiempo']){
				case 'h2':
					$tiemposil = 2;
					break;
				case 'h6':
					$tiemposil = 6;
					break;
				case 'd1':
					$tiemposil = 1;
					break;
				case 'd3':
					$tiemposil = 3;
					break;
				case 'd7':
					$tiemposil = 7;
					break;
				case 'm1':
					$tiemposil = 8;
					break;
				case 'm3':
					$tiemposil = 9;
					break;
				case 'a5':
					$tiemposil = 5;
					break;
				default:
					$tiemposil = 2;
					break;
			}
			$modosil = 0;
			switch($_REQUEST['destino']){
				case 'us':
					$modosil = 1;
					break;
				case 'ip':
					$modosil = 2;
					break;
				case 'usip':
					$modosil = 3;
					break;
				default:
					$modosil = 1;
					break;
			}
			$motivo = trim($_REQUEST['motivo']);
			if (isset($_REQUEST['motivo']) && $motivo != '') {
				if (($modosil != 0) && ($tiemposil != 0)) {
					$username = check_username($_REQUEST['usuario']);
					if ($username) {
						db_lock("{$conftp}jugadores READ");
						$con = db_query("SELECT iplogin FROM jugadores WHERE nombrejug='{$username}'");
						db_unlock();
						if (mysqli_num_rows($con)) {
							$r = mysqli_fetch_row($con);
							if ($tiemposil == 1) $timmm = 86400;
							if ($tiemposil == 2) $timmm = 7200;
							if ($tiemposil == 3) $timmm = 259200;
							if ($tiemposil == 6) $timmm = 21600;
							if ($tiemposil == 7) $timmm = 604800;
							if ($tiemposil == 8) $timmm = 2419200;
							if ($tiemposil == 9) $timmm = 7257600;
							if ($tiemposil == 5) $timmm = 157680000;

							$horafin = $time+$timmm;
							db_lock("{$conftp}silencio WRITE");
							if (($modosil == 1) || ($modosil == 3))
								db_query("INSERT INTO {$conftp}silencio (string,isip,autor,motivo,eliminado,horapuesto,stringip,horafin) VALUES ('{$username}',0,'{$jug}','{$motivo}','',$time,'{$username}',$horafin)");
							if (($modosil == 2) || ($modosil == 3))
								db_query("INSERT INTO {$conftp}silencio (string,isip,autor,motivo,eliminado,horapuesto,stringip,horafin) VALUES ('{$r[0]}',1,'{$jug}','{$motivo}','',$time,'{$username}',$horafin)");
							db_unlock();


							$_SESSION['mensaje'] = "Silenciamiento definido. Gracias!";
						}
						else
							$_SESSION['error'] = "Esa cuenta no existe.";
					} else
						$_SESSION['error'] = "Nombre de cuenta no válido.";
				} else
				   $_SESSION['error'] = "Datos erroneos.";
			} else 
				$_SESSION['error'] = "Debes especificar un motivo para el silencio.";
		} else
			$_SESSION['error'] = "Intenta de nuevo!";
    }
    else
      $_SESSION['error'] = 'No eres moderador.';
    header('Location: mod.php');
    return 1;
  }
  
  
  if (isset($_REQUEST['banear'])) {
    if (($us['admin']) || ($us['moderador']))
      $esmodera = 1;
    else
      $esmodera = 0;
    if ($esmodera) {
		$gtag = $_REQUEST['tag'];
		if ($tag == $gtag) {
			$tiempoban = 0;
			switch($_REQUEST['tiempo']){
				case 'h2':
					$tiempoban = 2;
					break;
				case 'h6':
					$tiempoban = 6;
					break;
				case 'd1':
					$tiempoban = 1;
					break;
				case 'd3':
					$tiempoban = 3;
					break;
				case 'd7':
					$tiempoban = 7;
					break;
				case 'm1':
					$tiempoban = 8;
					break;
				case 'm3':
					$tiempoban = 9;
					break;
				case 'a5':
					$tiempoban = 5;
					break;
				case 'p10':
					$tiempoban = -1;
					break;
				default:
					$tiempoban = 2;
					break;
			}
			$modoban = 0;
			switch($_REQUEST['destino']){
				case 'us':
					$modoban = 1;
					break;
				case 'ip':
					$modoban = 2;
					break;
				case 'usip':
					$modoban = 3;
					break;
				default:
					$modoban = 1;
					break;
			}
			$motivo = trim($_REQUEST['motivo']);
			if (isset($_REQUEST['motivo']) && $motivo != '') {
				if (($modoban != 0) && ($tiempoban != 0)) {
					$username = check_username($_REQUEST['usuario']);
					if ($username) {
						db_lock("{$conftp}jugadores READ");
						$con = db_query("SELECT iplogin FROM jugadores WHERE nombrejug='{$username}'");
						db_unlock();
						if (mysqli_num_rows($con)) {
							$r = mysqli_fetch_row($con);
								if ($tiempoban!=-1) {
								if ($tiempoban == 1) $timmm = 86400;
								if ($tiempoban == 2) $timmm = 7200;
								if ($tiempoban == 3) $timmm = 259200;
								if ($tiempoban == 6) $timmm = 21600;
								if ($tiempoban == 7) $timmm = 604800;
								if ($tiempoban == 8) $timmm = 2419200;
								if ($tiempoban == 9) $timmm = 7257600;
								if ($tiempoban == 5) $timmm = 157680000;
								$horafin = $time+$timmm;
							} else {
								$horafin = -1;
								db_query("UPDATE jugadores SET insignia = 'banned' WHERE nombrejug = '{$username}'");
							}
							db_lock("{$conftp}baneado WRITE");
							if (($modoban == 1) || ($modoban == 3))
								db_query("INSERT INTO {$conftp}baneado (string,isip,autor,motivo,eliminado,horapuesto,stringip,horafin) VALUES ('{$username}',0,'{$jug}','{$motivo}','',$time,'{$username}',$horafin)");
							if (($modoban == 2) || ($modoban == 3))
								db_query("INSERT INTO {$conftp}baneado (string,isip,autor,motivo,eliminado,horapuesto,stringip,horafin) VALUES ('{$r[0]}',1,'{$jug}','{$motivo}','',$time,'{$username}',$horafin)");
							db_unlock();


							$_SESSION['mensaje'] = "Baneo definido. Gracias!";
						}
						else
							$_SESSION['error'] = "Esa cuenta no existe.";
					} else
						$_SESSION['error'] = "Nombre de cuenta no válido.";
				} else
				   $_SESSION['error'] = "Datos erroneos.";
			} else 
				$_SESSION['error'] = "Debes especificar un motivo para el baneo.";
		} else
			$_SESSION['error'] = "Intenta de nuevo!";
    }
    else
      $_SESSION['error'] = 'No eres moderador.';
    header('Location: mod.php');
    return 1;
  }

}

?>
