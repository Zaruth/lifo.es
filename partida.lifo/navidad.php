<?php
$form = 1;
include('core.php');
function iweb() {
	global $us;
	if($us['admin']==0){
		return;
	}
	echo '
		<form action="navidad.php" method="post">
			<input type="submit" name="creNavidad" value="Crear Navidad">
			<input type="submit" name="delNavidad" value="Borrar Navidad">
		</form>
	';
}

function procesaform() {
	global $jug,$time,$us,$conftp,$imgroot,$confmail,$tag;
	if(isset($_POST['creNavidad'])){
		try {
			db_query("UPDATE objetos SET nivelcomprar=0 WHERE tipo='Navidad'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zbanr'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zbana'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zbanv'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zband'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zar'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zean'");
			db_query("UPDATE objetos SET nivelcomprar=1 WHERE img='zln'");

			$_SESSION['mensaje'] = "Navidad Preparada";
		} catch (\Throwable $th) {
			$_SESSION['error'] = "Fallo";
		}
        header('Location: navidad.php');
        return 1;
	}

	if(isset($_POST['delNavidad'])){
		try {
			db_query("UPDATE objetos SET nivelcomprar=0 WHERE tipo='Navidad'");

			$query = db_query("SELECT ti.nombrejug, ti.nombreobj, ob.img, ti.cantidad FROM tiene AS ti JOIN objetos AS ob ON (ti.nombreobj=ob.nombreobj) WHERE ob.tipo='Navidad'");

			if(mysqli_num_rows($query)){
				while ($row = mysqli_fetch_row($query)) {
					quita_objeto($row[0], $row[1], $row[2], $row[3]);
				}
			}
			
			$_SESSION['mensaje'] = "Navidad Borrada";
		} catch (\Throwable $th) {
			$_SESSION['error'] = "Fallo";
		}
        header('Location: navidad.php');
        return 1;
	}
}
?>