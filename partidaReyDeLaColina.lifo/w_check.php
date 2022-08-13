<?php

/*  check_username($username) Transforma y comprueba si un nombre de usuario es válido o no. Devuelve el nuevo nombre de usuario. Puede no ser válido por contener caracteres distintos a letras o por ser más largo que 30 caracteres o más corto que 3. */
function check_username($username) {
  $username = trim($username);
  if ((preg_match('/^[a-zA-Z]+$/',$username)) && (strlen($username) >= 3) && (strlen($username) <= 14))
    return strtoupper($username[0]).strtolower(substr($username,1));
}

function check_itemname($username) {
  $username = trim($username);
  if ((preg_match('/^[a-zA-Záéíóú]+$/',$username)) && (strlen($username) >= 3) && (strlen($username) <= 14))
    return strtoupper($username[0]).strtolower(substr($username,1));
}

function check_clan($clan) {
  $clan = trim($clan);
  if ((preg_match('/^[a-zA-Z]{1}([a-zA-Z]+\ ?)*$/',$clan)) && (strlen($clan) >= 8) && (strlen($clan) <= 20))
    return strtoupper($clan[0]).strtolower(substr($clan,1));
}

function check_subject($subject) {
  return htmlentities(trim($subject),ENT_COMPAT,"UTF-8");
}

/* check_email(email) Transforma y comprueba si una dirección e-mail es válida o no. Devuelve el email si es válido. Puede no ser válido por contener caracteres inválidos, no tener forma de email válido, o por ser más largo que 80 caracteres. */
function check_email($email) {
  global $conftp;
  $email = trim($email);
  $retval = db_query("SELECT * FROM {$conftp}jugadores WHERE email = '{$email}' or emailnuevo = '{$email}'");
  if ((preg_match('/^[\_\.a-zA-Z0-9-]*@[\_\.a-zA-Z0-9-]*\.[\_\.a-zA-Z0-9-]*$/',$email)) && (strlen($email) <= 80) && mysqli_num_rows($retval) == 0) {
    $email = strtolower($email);
    if (!preg_match('/(\.gov)|(\.su$)|(\.mil$)|(.fed.us)/',$email))
      return $email;
  }
}
/* check_password(password) Transforma y comprueba si un password es válido o no. Devuelve la contraseña si es válida. Puede no ser válido por ser más corta que 6 caracteres o más larga que 30. */
function check_password($password) {
  $password = trim($password);
  if ((strlen($password) >= 6) and (strlen($password) <= 30) and (preg_match('/^[a-zA-Z0-9\_\-\.\+\:\,\$\#\@\!\%\&\/\(\)\=\\\{\}\|\<\>\á\é\í\ó\ú]+$/',$password))) 
return $password;
}

function check_text($mensaje) {
  $mensaje = trim($mensaje);
  return htmlentities(addslashes(wordwrap(trim(stripslashes($mensaje)),50,' ',1)),ENT_COMPAT,"UTF-8");
}
?>
