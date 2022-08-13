<?php
$publico = 1;
$hidelogin = 1;
include('core.php');
function iweb()
{
  global $confadminmail, $confclanmaxmem, $conforonivelataca, $conftp, $imgroot;

  techo('<a name="arriba"></a>Estas son las preguntas más frecuentes sobre el juego y su funcionamiento:');
  gitem('encendido', '<b>¡¿Tengo que dejar mi ordenador encendido y conectado mientras juego?!</b>');
  gitem('reg', '¿Cómo me registro?');
  gitem('hora', 'Soy de un país distinto a España y mi hora local no coincide, ¿qué hago?');
  gitem('reglas', '¿En qué consiste el juego?');
  gitem('guardar', '¿Tengo que guardar mi partida para seguir jugando?');
  gitem('trabajar', '¿En qué consiste trabajar?');
  gitem('inventario', '¿En qué consiste el inventario?');
  gitem('mercader', '¿En qué consiste el mercader?');
  gitem('trueque', '¿En qué consisten los trueques?');
  gitem('clanes', '¿En qué consisten los clanes?');
  gitem('objetos', 'Objetos extraños y artefactos. Objetos de un sólo uso.');
  gitem('fabricar', '¿Cómo fabrico objetos?');
  gitem('comida', '¿Para qué sirven la comida (alimentos) y la energía?');
  gitem('mapas', '¿Para qué sirven los mapas?');
  gitem('online', '¿Qué significan los carteles "online" en la página de clan?');
  gitem('combatir', '¿En qué consiste combatir? ¿Cuándo puedo combatir?');
  gitem('ataqtrab', '¿Puedo ser atacado mientras trabajo?');
  gitem('ganaroro', '¿Cómo puedo ganar oro?');
  gitem('ganarexp', '¿Cómo puedo ganar experiencia?');
  gitem('invitar', '¿Cómo invito a una persona a jugar? ¿Gano algo haciéndolo? ¿Qué son los links para reclutar?');
  gitem('quejas', '¿Puedo quejarme por el comportamiento de un jugador?');
  gitem('cambiarc', '¿Cómo cambio mi dirección de correo electrónico o mi contraseña?');
  gitem('condificil', 'Mi contraseña es muy dificil de recordar, ¿qué hago?');
  gitem('insignias', '¿Qué y para qué son las insignias?');
  gitem('mascotas', '¿Qué y para qué son las mascotas?');
  gitem('bug', 'He encontrado un fallo en el juego, ¿qué hago?');
  gitem('contacto', '¿Cómo contacto con el administrador?');
  gitem('multicuentas', '¿Se permite usar multicuentas (¿varias cuentas por persona?)?');
  gitem('ccuentas', '¿Se permite comerciar, intercambiar, o compartir o prestar cuentas (aunque sea para cuidarlas)?');
  gitem('prohibido', '¿Qué está prohibido?');

  echo '<br/><br/>';

  gshow('encendido', '¡¿Tengo que dejar mi ordenador encendido y conectado mientras juego?!', '¡NO!, puedes empezar a trabajar y desconectarte de internet o apagar el ordenador. El juego continuará en marcha y cuando vuelvas a conectar habrás trabajado el tiempo que haya pasado.');
  gshow('reg', '¿Cómo me registro?', 'Te registras introduciendo el nombre de usuario que quieras y tu dirección de correo (que debe ser válida) en <a href="registro.php">esta página</a>. Sigue el resto de instrucciones que encuentres ahí.');
  gshow('hora', 'Soy de un país distinto a España y mi hora local no coincide, ¿qué hago?', 'Ve a la sección Mi cuenta y elige tu zona horaria. Todas las horas del juego se adaptarán automáticamente.');
  gshow('reglas', '¿En qué consiste el juego?', 'El juego consiste en trabajar, combatir, encontrar y comerciar con objetos, y comunicarte con otros jugadores.');
  gshow('guardar', '¿Tengo que guardar mi partida para seguir jugando?', 'No, la partida está en continuo desarrollo, aunque tú no estés conectado a internet otros jugadores pueden atacarte y jugar. No puedes anular acciones ya realizadas ni "volver a cargar".');
  $times = '<br/><br/>Actualmente es posible trabajar durante una serie de tiempos determinados:<br/>';
  db_lock("{$conftp}trabajos READ");
  $retval = db_query("SELECT nombre FROM {$conftp}trabajos WHERE premium=0 ORDER BY segundos");
  db_unlock();
  $numrows = mysqli_num_rows($retval);
  for ($i = 0; $i < $numrows; $i++) {
    $ret = mysqli_fetch_row($retval);
    $times .= "{$ret[0]}<br/>";
  }
  mysqli_free_result($retval);
  gshow('trabajar', '¿En qué consiste trabajar?', "Al trabajar, indicas una cantidad de tiempo a trabajar. Durante ese tiempo no puedes combatir, y puedes desconectar de internet o visitar otras páginas. Al pasar ese tiempo, estés o no estés conectado, se te otorgará experiencia y oro, y es posible que encuentres objetos. Sabrás que así ha sido porque aparecerá un nuevo mensaje en mensajería, indicándote lo sucedido. Puedes dejar de trabajar en cualquier momento y ganarás oro y experiencia proporcional al tiempo que has trabajado. {$times}");
  gshow('inventario', '¿En qué consiste el inventario?', 'El inventario te muestra los objetos que tienes. Desde ahí puedes decidir qué objeto de cada clase utilizarás en tus combates, basándose en su ataque y protección. También te permite escoger como insignia uno de tus objetos.');
  gshow('mercader', '¿En qué consiste el mercader?', 'El mercader vende unos tipos determinados de objetos, y compra cualquier clase de objeto. Las compras y ventas se realizan de una en una (es decir, si tienes dos armas de una clase y eliges vender, sólo venderás una) y siempre son a cambio de oro. El mercader te enseñará los objetos que puedes pagar o usar. Hay una serie de objetos, ya sean artefactos u objetos con atributos mágicos, que sólo pueden ser encontrados, pero el mercader los venderá si algún otro jugador se los ha vendido.');
  gshow('trueque', '¿En qué consisten los trueques?', 'Los trueques son intercambios de objetos con otros jugadores. Para realizar un trueque, inicia un trueque nuevo en la sección de trueques con el jugador que te interese. Luego añade los objetos que te interese cambiar y/o espera a que él añada los objetos que le interese cambiar. Una vez estéis conformes, ambos debéis aceptar el trueque y los objetos serán intercambiados entre vuestros inventarios. Para que el trueque no pueda aprovecharse para pasar objetos entre un mismo jugador se toman dos medidas: Se igualan los valores del total de objetos intercambiados entre los dos jugadores utilizando oro como relleno, y aparte el mercader cobra un 10% en total del valor de los objetos intercambiados por los jugadores.');
  gshow('clanes', '¿En qué consisten los clanes?', "En cualquier momento puedes fundar un clan, los demás jugadores podrán solicitar entrar al clan y tú podrás concederles o denegarles la entrada. Entre miembros de un mismo clan disponeis de una opción en mensajería (especificando como destino una arroba (@)) para comunicaros entre vosotros, y no podreis atacaros los unos a los otros. Debe verse como un equipo de jugadores que se defenderá si resultan atacados por el resto de jugadores. El límite de jugadores que forman parte de un clan es de {$confclanmaxmem}, y el lider o fundador del clan puede delegar el liderazgo en otro miembro del clan o expulsar a miembros del mismo.");
  gshow('objetos', 'Objetos extraños y artefactos. Objetos de un sólo uso.', 'Existen una serie de objetos extraños y artefactos que no pueden ser adquiridos en el mercader si este no los posée, es decir, en principio únicamente pueden ser encontrados. La posibilidad de encontrar alguno de estos objetos depende del objeto en sí. Estos objetos tienen características distintas a los objetos normales, por ejemplo ataque muy elevado, protección muy elevada, o precio de venta muy elevado. Ten en cuenta que los objetos tienen niveles mínimos, necesitas tener o superar ese nivel para poder usar ese objeto. Hay una serie de objetos de un sólo uso como pociones y hechizos, al combatir mientras se están usando se consume una unidad de ese objeto y te proporciona los bonus que ofrece.');
  gshow('fabricar', '¿Cómo fabrico objetos?', 'Para fabricar objetos, primero debes aprender a fabricarlos, leyendo libros. Una vez sabes fabricar un objeto y dispones de los ingredientes y la energía necesarios, puedes fabricarlos desde la sección "Fabricar".');
  gshow('comida', '¿Para qué sirven la comida (alimentos) y la energía?', 'La comida te da energía, y la energía sirve para llevar a cabo acciones especiales (fabricar objetos por ejemplo) e influye levemente en los combates. Sólo puedes comer una vez cada cierto tiempo.');
  gshow('mapas', '¿Para qué sirven los mapas?', 'Los mapas te permiten explorar zonas del mundo. Según qué zonas explores y cuántas veces lo hagas podrás encontrar objetos distintos. Sólo puedes explorar una vez cada cierto tiempo.');
  gshow('online', '¿Qué significan los carteles "online" en la página de clan?', 'Un cartel ONLINE brillante significa que el jugador indicado está activo en la página. Esto es, que hace menos de 5 minutos que se ha desplazado de una sección a otra. Un cartel ONLINE poco brillante significa que el jugador indicado ha estado activo hace 30 minutos o menos en la página.');
  gshow('combatir', '¿En qué consiste combatir? ¿Cuándo puedo combatir?', "Combatiendo te enfrentas contra otro jugador. Para combatir necesitas cumplir una serie de requisitos (no haber atacado a nadie hace poco tiempo, y poseer al menos {$conforonivelataca} monedas de oro por cada nivel que tengas). Sólo puedes atacar a los jugadores que tengan dos niveles de diferencia contigo como mucho, y al menos posean {$conforonivelataca} monedas de oro por nivel. Al atacar a alguien, esta persona quedará protegida por algún tiempo. Ambos recibís un informe del ataque en vuestra mensajería, donde veis entre otras cosas la experiencia ganada o perdida, el oro ganado o perdido, y los objetos que utilizaba el contrincante. Durante el combate no se pueden perder objetos, únicamente oro y experiencia. Si estás protegido y atacas a alguien, pierdes tu protección. Puedes consultar cuánto tiempo te queda sin atacar o cuánto tiempo te queda protegido en el Estado. Aun si pierdes un combate, puede que aprendas de él y ganes experiencia. No necesariamente si eres de nivel superior a un jugador y tienes mejores objetos ganarás el combate, aunque es bastante probable que lo hagas. También puedes ser atacado mientras estás trabajando. En el caso de que un combate sea largo, se rendirá aquel que más puntos de resistencia ha perdido, no aquel que menos puntos de resistencia conserva.");
  gshow('ataqtrab', '¿Puedo ser atacado mientras trabajo?', 'Sí, puedes ser atacado mientras trabajas, y tu personaje se defenderá como siempre.');
  gshow('ganaroro', '¿Cómo puedo ganar oro?', '- Trabajando.<br/>- Combatiendo<br/>- Invitando a una persona a jugar o haciendo que visiten uno de tus <a href="#invitar">links de reclutamiento</a> (máximo una vez por ip al día).<br/>- Cuando uno de tus subordinados invite a una persona a jugar o haga que visiten uno de sus links de reclutamiento.');
  gshow('ganarexp', '¿Cómo puedo ganar experiencia?', '- Trabajando.<br/>- Combatiendo<br/>- Encontrando objetos.');
  gshow('invitar', '¿Cómo invito a una persona a jugar? ¿Gano algo haciéndolo? ¿Qué son los links para reclutar?', 'En la página de Estado, abajo del todo, dispones de una serie de links trampa de reclutamiento. Puedes utilizarlos como firma de foro, firma de e-mails, como nick de tu cliente de mensajería instantanea favorito, o diréctamente dárselos a gente. Al acceder alguien a ese link te proporcionará una cantidad determinada de oro, y si se registra en el juego, te volverá a proporcionar oro, y además será tu subordinado. Cuando una persona entra a un link de reclutar de uno de tus subordinados, tú también ganas oro, y si esa persona se acaba registrando en el juego, vuelves a ganar oro (sin tú haber hecho nada). Sólo es necesario que una persona entre a un link cualquiera de los disponibles, se facilitan varios para que los puedas usar en diferentes lugares sin levantar sospechas (de todas formas, es tu responsabilidad no hacer publicidad indiscriminada).');
  gshow('quejas', '¿Puedo quejarme por el comportamiento de un jugador?', 'Única y exclusívamente si el jugador te envía mensajes insultantes, o en los casos de amenazas no relacionadas con el juego, debes utilizar el botón "Informar al administrador de este mensaje" que aparece en la mensajería para cada mensaje enviado por otro usuario.');
  gshow('cambiarc', '¿Cómo cambio mi dirección de correo electrónico o mi contraseña?', 'Desde la sección "Mi cuenta", estando identificado, y facilitando tu contraseña actual y bien la dirección de correo electrónico nueva, la contraseña nueva, o ambas.');
  gshow('condificil', 'Mi contraseña es muy dificil de recordar, ¿qué hago?', 'Desde la sección "Mi cuenta" puedes cambiarla por una más fácil, aunque se recomienda no utilizar una contraseña que ya estés usando en otro lugar o cuenta.');
  gshow('insignias', '¿Qué y para qué son las insignias?', 'Las insignias son una marca con la que firmarás los mensajes que envíes a otros usuarios, tus combates, y tu nombre en la clasificación. La puedes elegir en el inventario a partir de un objeto cualquiera que tengas, y la perderás si vendes la última unidad que tengas de ese objeto. Cualquier usuario puede escoger cualquier insignia de entre sus objetos, así que un objeto raro con pocas posibilidades de aparecer será utilizado como insignia por muy pocos usuarios.');
  gshow('mascotas', '¿Qué y para qué son las mascotas?', 'Las mascotas son unas criaturas que te ayudarán en los combates. Para obtener una mascota debes hacerte primero con ella (fabricándola si es viable, o encontrándola) y utilizarla en tu inventario. A partir de ese momento podrás mantenerla a tu lado en los combates, donde la mascota ganará experiencia. Cada vez que la mascota alcanza una experiencia límite puedes alimentarla utilizando su comida preferida para que suba de nivel. Puedes tener tantas mascotas como quieras, pero sólo una de cada tipo.');
  gshow('bug', 'He encontrado un fallo en el juego, ¿qué hago?', "Sólo se considerará fallo aquello que sea incorrecto desde el punto de vista lógico de un juego. Por ejemplo:<br/>- No es un fallo perder un combate contra un contrincante más débil, puede haber tenido suerte.<br/>- Sería un fallo que al vender un objeto determinado tu oro disminuya en lugar de aumentar.<br/>En caso de que aun creas haber encontrado un fallo, envia un email a {$confadminmail}.");
  gshow('contacto', '¿Cómo contacto con el administrador?', "Puedes contactar con el administrador enviando un e-mail a {$confadminmail}. No se aceptarán peticiones de privilegios sobre el juego ni en el juego.");
  gshow('multicuentas', '¿Se permite usar multicuentas (¿varias cuentas por persona?)?', "Sí, no habrá problema, siempre y cuando: <b>1º)</b> el hacerlo no te de beneficios que no tendrías si no las utilizaras y <b>2º)</b> no superes el número máximo de cuentas por persona<b>(3 cuentas máximo)</b>. Pueden ser sancionadas con una reducción del número de puntos, entre otras, las siguientes actuaciones: numerosos combates con multicuentas, combates con multicuentas desarmadas, etc. Puedes intuir cuando algo que estás haciendo con multicuentas está prohibido si el hacerlo te da ventaja.<br><br>Por su naturaleza limitada, sí está permitido cualquier tipo de comercio entre multicuentas.");
  gshow('ccuentas', '¿Se permite comerciar, intercambiar, o compartir o prestar cuentas (aunque sea para cuidarlas)?', 'El comercio con cuentas, intercambio de cuentas, y la compartición o prestado (aunque sea para "cuidarlas") o regalado de cuentas NO ESTÁN SOPORTADOS. Todos los mensajes de este estilo que aparezcan en los foros serán causa de ban. Se castigará a los ladrones de cuentas y no se devolverá ninguna cuenta robada a nadie, no se admitirá ninguna reclamación.<br/><br/>No DEIS cuentas ni ACEPTEIS cuentas que os quieran dar, podrá provocar un ban.<br/><br/>Aclaración final: Esto viene a significar que si hay algún problema con una cuenta, todas las cuentas que yo considere relacionadas (por parte de cualquiera de los jugadores que la usan) podrán ser baneadas indefinidamente. Si prestáis cuentas sabéis a qué ateneros.');
  gshow('prohibido', '¿Qué está prohibido?', "Los ataques al servidor, el robo de cuentas, los insultos y palabras malsonantes, comentarios racistas, sexistas, y demás, parafernalia política o militar, provocaciones, abuso de multicuentas u abuso de secundarias, envío masivo de mensajes al foro o a otros jugadores, la publicidad, provocaciones a otros jugadores, amenazas, y aprovechamiento de fallos del juego. Todas estas actividades podrán ser sancionadas con ban (prohibición de entrada al juego) o reducciones de experiencia, eliminación de objetos, y demás medidas, según la gravedad de la actividad.");

  echo '<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>';
}
function gitem($id, $item)
{
  echo "- <a href=\"#{$id}\">{$item}</a><br/>";
}
function gshow($id, $item, $texto)
{
  echo "<a name=\"{$id}\"></a><b>{$item}</b><br/><br/>{$texto}<br/><br/><a href=\"#arriba\">Volver arriba</a><br/><br/><br/>";
}
