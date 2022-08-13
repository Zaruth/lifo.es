<?php
$form = 1;
include('core.php');
function iweb() {
	global $imgroot;

$_SESSION['error'] = '"No puedes pasar, solo personal autorizado." <i>-Un gnomo mágico te impide la entrada-</i>';
header('Location: admin.php');
exit();

$joyas='<img src="'.$imgroot.'/rprem.gif" alt="Joyas Premium">';
echo '
<p style="font-family:arial;font-size:12px;">
¡Hola! Sé bienvenido a la pestaña de donaciones. Aquí podrás, si lo deseas, contribuir al mantenimiento del host del servidor y a la evolución y mejora del mismo.
Abajo tienes una serie de ofertas para realizar la donación. Hay que decir también que comprendemos y agradecemos la ayuda, y por ello os recompensamos de vuelta con Joyas Premium.<br><br>
Las Joyas os servirán para mejorar aún más vuestra experiencia de juego, de forma que podréis aumentar vuestras horas de trabajo, comprar exclusivos objetos en la Tienda Premium e incluso comer o combatir cada menos tiempo.
Debéis estar seguros de que queréis donar antes de completar el proceso, y si sois menores pedir la autorización de vuestros padres. No nos hacemos responsables de devoluciones por errores y etc, salvo que la transferencia recibida no corresponda con la enviada. En tal caso contactad con nosotros mediante la mensajería del servidor de forma que podamos estudiar el caso. Si tras 24h no hemos tenido noticias vuestras, supondremos que la transacción es correcta.<br><br>
El juego es gratuito, pero todos los aportes son bienvenidos. Sin embargo, ha de tenerse en cuenta que donar dinero al servidor no te reportará ningún trato de favor por parte de la administración, de modo que si infringes las reglas se te tratará como a cualquier otro usuario.
Aclarado esto, abajo tenéis los enlaces junto a las respectivas compensaciones que os ofrecemos por vuestra generosa aportación.
Muchas gracias y un saludo.<br><br><br>
</p>

<p align="center" style="font-size:18px;"><b><u>***NOTA IMPORTANTE***</u></b></p>

<div style="font-family:arial;font-size:14px;">
<p>
La entrega de joyas se realiza de forma manual. Para ello es necesario que aviséis a algún administrador de dicha donación.<br>
Tened paciencia, puede ser que no haya ningún administrador conectado en el momento que realicéis la donación. Pero no importa, si dejáis enviado el mensaje, éste será leido posteriormente en unas 48h máximo.
</p>

<font color="blue"><b><u>Método</u>: Vía Paypal</b></font><br>
-<u>Opción 1º</u>:  <b>2,5€------->x5'.$joyas.'</b> 

	
<br><br>
-<u>Opción 2º</u>:  <b>5€-------->x12'.$joyas.'</b> 


<br><br>
-<u>Opción 3º</u>:  <b>10€------->x25'.$joyas.'</b> 


<br><br>
-<u>Opción 4º</u>:  <b>25€------->x65'.$joyas.'</b>


<br><br>
<font color="blue"><b><u>Método</u>: Transferencia bancaria</b></font><br>
<p><u>Datos para hacer la transferencia:</u><br><br>
CCC: <b></b><br>
Titular: <b></b><br>
Concepto: <b>DONACIÓN LIFO</b></p>
<p><b>IMPORTANTE:</b> La transferencia bancaria puede tardar en realizarse en 1 o 2 días laborables. En cualquier caso, al igual que con vía paypal, se debe avisar al administrador de la transacción realizada así mismo de importe y nombre de la persona que la ha realizado para poder identificarla.<br><br>
Las cantidades anteriores del método de paypal serán las mismas para la transacción bancaria.</p><br>
</div>';
    }
function procesaform() {}
?>
