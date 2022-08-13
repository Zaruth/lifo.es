<?php
$root = '';	// dirección raiz de la partida, debe ser accesible desde fuera.
$confdbhost = 'localhost'; 			// host del servidor MySQL
$confdbport = '3306';				// puerto del servidor MySQL
$confdbuser = '';		// usuario para el servidor MySQL
$confdbpass = '';	// contraseña para el usuario
$confdbname = '';		// nombre de la base de datos


$local = 0;
if($local == 1){
	$root = './';					// dirección raiz de la partida, debe ser accesible desde fuera.
	$confdbhost = 'localhost'; 		// host del servidor MySQL
	$confdbport = '3306';			// puerto del servidor MySQL
	$confdbuser = 'root';			// usuario para el servidor MySQL
	$confdbpass = '';				// contraseña para el usuario
	$confdbname = '';	// nombre de la base de datos
}


// cadena de texto con cualquier valor para mejorar el cifrado de las contraseñas
// NO CAMBIAR despues de hacer el emerge
$confpwdsalt = '';

// contraseña por defecto para la cuenta Admin
$confadminpass = '';
// dirección de correo del administrador
$confmail = '';

// nombre del juego
$conftitle = 'Partida 1';

// aviso legal
$confavisolegal = 'Para dar cumplimiento con lo establecido en la Ley 34/2006, de 11 de Enero, de Servicios de la Sociedad de la Información y de Comercio Electrónico, a continuación se proporciona la información correspondiente a este sitio web: <br/>
<br/>
&quot;' . $conftitle . '&quot; de Lifo, accesible a través de la dirección de internet {URL WEB} es una página web personal propiedad de:<br/>
<br/>
{NOMBRE COMPLETO}.<br/>
Residente en la localidad de {LOCALIDAD}, provincia de {PROVINCIA}, {PAÍS}.<br/>
N.I.F.: {DNI}.<br/>
E-mail: {EMAIL}.<br/>
<br/>
Cualquier comunicación puede realizarse de forma directa y efectiva a través de la citada dirección de correo electrónico.<br/>
<br/>
Este sitio esta sometido a las leyes europeas. La accesibilidad del lugar a menores de edad impone no hacer accesibles contenidos de carácter sexualmente explícito, violento, intolerante, difamante, obsceno, de mal gusto o ilegales, así como tampoco de aquellos que hagan apología de violencia, racismo, terrorismo o xenofobia. Se borrarán inmediatamente y se expulsará del sitio al autor a la máxima brevedad posible. Asímismo, el propietario del sitio web no se hace responsable de los contenidos publicados por terceros en el mismo, y se reserva el derecho a proporcionar a las autoridades toda la información posible sobre los usuarios que incumplan este código de conducta.<br/>';



//Zona horaria del servidor
$zonaact = 0;

// Cabeceras y pies de página
$confcontentstart = '<center style="margin-top: 10px;"><a href="">' . hayNoticias() . '</a></center>';
$confcontentend = '';
$confcontentbeffooter = '';


// ¿Está abierta la partida?
$confabierto = 1;
// ¿Está abierto el registro de jugadores?
$confregistro = 1;
// ¿Está abierto el login de jugadores?
$conflogin = 1;


// Modo debug?
$confdebug = 0;

// Nivel mínimo para usar la mensajeria
$confnivelmensaj = 1;
// Nivel mínimo para usar el foro
$confnivelforo = 1;


// Factor BASE para obtener más o menos experiencia de los objetos trabajando o combatiendo
$confencobjbase = 1.10;
// Factor EVENTO para obtener más o menos experiencia de los objetos trabajando o combatiendo
$confencobjeven = 1.10;
// Probabilidad base para encantar
$confenchantbase = 10;
// Experiencia necesaria para encontrar un objeto
$confobj = 1200;
// Experiencia necesaria para subir un nivel
$confnivel = 1200;



// Oro por cada nuevo hijo
$conforonuevohijo = 30;
// Oro por cada nuevo nieto
$conforonuevonieto = 10;
// Oro por cada visita a hijo
$conforovisitahijo = 3;
// Oro por cada visita a nieto
$conforovisitanieto = 1;

// Dias que se mantienen los mensajes leidos
$confdiasmensajes = 30;
// Longitud maxima de mensajes
$confmaxmsg = 4096;

// Intervalo en segundos entre ataques
$confnoatacarhasta = 3600;
// Intervalo en segundos entre ataques, jugadores premium
$confnoatacarhastapremium = 1800;
// Tiempo de protección en segundos tras recibir ataque
$confprotegidohasta = 7200;
// Oro mínimo para atacar
$conforonivelataca = 50;
// Diferencia máxima de niveles para atacar
$confdifnivel = 5;
// Máxima experiencia a ganar en un combate
$confganacombexpmax = 600;
// Mínima experiencia a perder en un combate
$confganacombexpmin = -600;
// Vida base para el combate
$confvidabase = 300;
// Vida incrementada por nivel
$confvidanivel = 5;

// Factor de valor al vender al mercader
$confvalorventa = 0.25;
// Cada cuanto encuentra el mercader objetos
$confmercencuentra = 1000;
// Cuántas veces seguidas encuentra el mercader objetos, como máximo
$confmercvecesmax = 10;
// Cuántos instancias de un objeto puede guardar el mercader
$confmaxoferta = 100;

// Cuántos jugadores mostrar alrededor en la clasificación
$confalredhigh = 3;
// Cuántos clanes mostrar alrededor en la clasificación
$confalredchigh = 3;

// Número máximo de miembros de un clan
$confclanmaxmem = 6;

// Intervalo en segundos entre comer
$confnocomerhasta = 1800; //default = 7200
// Intervalo en segundos entre comer, jugadores premium
$confnocomerhastapremium = 900; //default = 3600

// Porcentaje de aumento de la base de exploración para eventos
$eventexplofactor = 1;
// Numero de objetos máximo al explorar
$confmaxobjexplo = 5;
// Intervalo en segundos entre explorar 
$confnoexplorarhasta = 1800; //default = 4500
// Intervalo en segundos entre explorarm jugadores premium
$confnoexplorarhastapremium = 900; //default = 1800

// Número de elementos a mostrar en cada página de fabricar.
$confmuestrafabricar = 1000;


// Bonus por ascensión
$confascension = 40;


// Horas que está el mercader al aparecer
$conf_numHorasMercader = 2;

// Intervalo en segundos entre encuentros
$conf_noencuentrohasta = 2400; 			// 2400
// Intervalo en segundos entre encuentros premium
$conf_noencuentrohastapremium = 1800; 		// 1800


// no es necesario modificar estos valores
$imgroot = '//img.lifo.es/img/';
$confurl = $root;
$conftitlebar = '<img src="' . $root . 'logo.png" alt="Logo" class="logo"/>';
$confadminmail = $confmail;
$confmailn = $conftitle;
$confmailname = $conftitle;
$confsmtpuser = '';
$confsmtppass = '';
$confsmtp = '127.0.0.1';
$conftp = '';


// SMTP - correos
$smtpHost                = '';
$smtpPort                = 465;
$smtpPassword            = '';
$smtpDefaultMail        = '';
$smtpVerificationMail    = '';
$smtpPassRecoveryMail    = '';
$smtpReplytoMail        = '';



// XOR
$xorPass = '';
