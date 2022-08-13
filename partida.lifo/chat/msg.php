<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/**
 * Simple chat example by Stephan Soller
 * See http://arkanis.de/projects/simple-chat/
 */

if (isset($_POST['clan'])) {
    
    include_once 'w_aux.php';
    include_once 'w_config.php';
    include_once 'w_database.php';
    db_connect();
    db_select_db();
    $filename = "./chats/".$_POST['clan'].".json";
    
    if (!is_file($filename)) {
        $myfile = fopen($filename, "w");
        fclose($myfile);
    }


    // Name of the message buffer file. You have to create it manually with read and write permissions for the webserver.
    $messages_buffer_file = $filename;
    // Number of most recent messages kept in the buffer
    $messages_buffer_size = 999;

    if (isset($_POST['content']) and isset($_POST['name'])) {
        // Open, lock and read the message buffer file
        $buffer = fopen($messages_buffer_file, 'r+b');
        flock($buffer, LOCK_EX);
        $buffer_data = stream_get_contents($buffer);

        // Append new message to the buffer data or start with a message id of 0 if the buffer is empty
        $messages = $buffer_data ? json_decode($buffer_data, true) : array();
        $next_id = (count($messages) > 0) ? $messages[count($messages) - 1]['id'] + 1 : 0;
        $salida = $_POST['content'];
        $user = $_POST['name'];
		switch($_POST['content']){
            case '/stats':
                $stats = stats($user);
				$salida = "Mis stats <span style=\"color: blue;\">[Ataque: {$stats[0]}| Protección: {$stats[1]}| Vida: {$stats[2]}]</span>";
                break;
            case '/roll':
                $salida = $user.' tira dados y saca un <span style="color: red;">'.rand(0,100).'</span>.';
                break;
		}
        $messages[] = array('id' => $next_id, 'time' => time(), 'name' => $_POST['name'], 'content' => $salida);

        // Remove old messages if necessary to keep the buffer size
        if (count($messages) > $messages_buffer_size)
            $messages = array_slice($messages, count($messages) - $messages_buffer_size);

        // Rewrite and unlock the message file
        ftruncate($buffer, 0);
        rewind($buffer);
        fwrite($buffer, json_encode($messages));
        flock($buffer, LOCK_UN);
        fclose($buffer);

        // Optional: Append message to log file (file appends are atomic)
        //file_put_contents('chatlog.txt', strftime('%F %T') . "\t" . strtr($_POST['name'], "\t", ' ') . "\t" . strtr($_POST['content'], "\t", ' ') . "\n", FILE_APPEND);
    }
    db_close();
}