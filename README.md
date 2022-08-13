LifoSource
==========

Código fuente del juego de rol online Lifo.

Source code for the multiplayer online roleplaying game Lifo (in Spanish).

Copyright (c) 2006-2013, Luis Quesada Torres - https://github.com/lquesada | www.luisquesada.com

Cómo montar una partida de LifoSource...

Esta versión de LifoSource tiene algunas diferencias respecto a Lifo:
- No se soportan múltiples partidas, ni transferencias de insignias o joyas entre partidas.
- No se pueden enviar correos, por lo que no funciona la opción de recuperar contraseña.
- Hay objetos para los que no se incluyen gráficos.

Paso 1. Servidores web y MySQL.
-------------------------------

Es necesario instalar los siguientes paquetes:
- apache2
- mysql-server
- libapache2-mod-php5
- php5
- php5-mysql

Paso 2. Creación de la base de datos.
-------------------------------------

Seguidamente, debe crearse la base de datos y un usuario en MySQL para la partida de LifoSource.

Se puede hacer conectando como administrador (mysql -uroot -pPASSWORDROOT) y con las siguientes órdenes, cambiando los valores en mayúsculas:

    mysql> create database DATABASENAME;
    mysql> grant usage on *.* to USERNAME@localhost identified by 'PASSWORDLIFOSOURCE';
    mysql> grant all privileges on DATABASENAME.* to USERNAME@localhost;

Paso 3. Configuración de la partida de LifoSource.
--------------------------------------------------

Se abre el fichero web/w_config.php y se modifican, al menos, los siguientes valores:

    // dirección raiz de la partida, debe ser accesible desde fuera.
    $root
    
    // host del servidor MySQL
    $confdbhost 
    // puerto del servidor MySQL
    $confdbport
    // usuario para el servidor MySQL
    $confdbuser
    // contraseña para el usuario
    $confdbpass
    // nombre de la base de datos
    $confdbname
    
    // cadena de texto con cualquier valor para mejorar el cifrado de las contraseñas
    // NO CAMBIAR despues de hacer el emerge
    $confpwdsalt
    
    // contraseña por defecto para la cuenta Admin
    $confadminpass
    // dirección de correo del administrador
    $confmail
    
    // nombre del juego
    $conftitle

    // aviso legal
    $confavisolegal

Es sumamente importante que modifiques la contraseña del administrador.

No des acceso de administrador a nadie, la página de administración no es segura.

Paso 4. Instalación de los ficheros de la web.
----------------------------------------------

Se copian los ficheros del directorio web al directorio público del servidor, por ejemplo, /var/www.

Paso 5. Instanciación de la partida.
------------------------------------

Se abre desde un navegador el fichero emerge/emerge.php a través del servidor apache.

Si todo está configurado correctamente (apache, mysql, php-mysql, usuario, contraseña y base de datos del servidor) se generará la partida y se creará la cuenta Admin con la contraseña indicada en la configuración anterior.

Una vez creada la partida, es MUY IMPORTANTE eliminar el directorio emerge; si no, la partida podrá ser destruido por cualquier jugador que lance el mismo fichero emerge.php.


La partida ya está abierta y disponible.

Se ha creado un jugador llamado Admin con la contraseña indicada en $confadminpass.
