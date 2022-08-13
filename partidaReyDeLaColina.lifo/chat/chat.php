<?php
include 'chat/msg.php';
$chatroot = "chat/";
$chat = '<h3><i>Chat de clan</i></h3>
<div class="chat" alt="Bandeja de mensajes" title="Bandeja de mensajes">
    <img class="background" src="' . $chatroot . 'img/chat_background.png">
    <ul id="messages">
        <li># No hay mensajes nuevos #</li>
    </ul>
</div><br>
<div class="message_box">
    <img class="background" src="' . $chatroot . 'img/message_chatbox.png">
    <label><b>></b></label>
    <form action="./chat/msg.php" method="post" id="sendform">
        <input class="message_box" name="content" id="content" type="text" alt="Cuadro de mensaje" title="Cuadro de mensaje"> <button type="submit" class="send" alt="Enviar mensaje" title="Enviar mensaje"></button>
    </form>
</div>
<audio id="audios">
    <source src="chat/newmessage.ogg" type="audio/ogg">
</audio>
<br><br>';
$chat .= '<link rel="stylesheet" href="' . $chatroot . 'estilos/chats.css">' . "
<script type=\"text/javascript\">
    // <![CDATA[
    $(document).ready(function(){
        // Remove the \"loading…\" list entry
        $('ul#messages > li').remove();
        
        $('#sendform').submit(function(){
            var form = $(this);
            var name =  \"{$jug}\";
            var content =  form.find(\"input[name='content']\").val();
            var clan = \"{$us['clan']}\";
            
            // Only send a new message if it's not empty (also it's ok for the server we don't need to send senseless messages)
            if (name == '' || content == '' || clan == '')
                return false;
            
            // Append a \"pending\" message (not yet confirmed from the server) as soon as the POST request is finished. The
            // text() method automatically escapes HTML so no one can harm the client.
            $.post(form.attr('action'), {'name': name, 'content': content, 'clan': clan}, function(data, status){
                $('<li class=\"pending\" />').text('['+name+']: '+content).appendTo('ul#messages');
                $('ul#messages').scrollTop( $('ul#messages').get(0).scrollHeight );
                form.find(\"input[name='content']\").val('').focus();
            });
            return false;
        });
        
        var notification = document.getElementById(\"audios\");
        var counter = 0;

        // Poll-function that looks for new messages
        var colors = ['red','green','yellow','purple','blue','orange','white','peru','LightSkyBlue','LimeGreen'];
        var usercolors = [];
        var messagessave = [];
        var poll_for_new_messages = function(){
            $.ajax({url: 'chat/chats/{$us['clan']}.json', dataType: 'json', ifModified: true, timeout: 2000, success: function(messages, status){
                // Skip all responses with unmodified data
                if (!messages)
                    return;
                
                if(!objectsEqual(JSON.stringify(messagessave),JSON.stringify(messages))){
                    messagessave = messages;
                    if (counter != 0) {
                        notification.play();
                    }
                    counter++;
                }
                // Remove the pending messages from the list (they are replaced by the ones from the server later)
                $('ul#messages > li.pending').remove();
                
                // Get the ID of the last inserted message or start with -1 (so the first message from the server with 0 will
                // automatically be shown).
                var last_message_id = $('ul#messages').data('last_message_id');
                if (last_message_id == null)
                    last_message_id = -1;
                
                // Add a list entry for every incomming message, but only if we not already inserted it (hence the check for
                // the newer ID than the last inserted message).
                
                
                for(var i = 0; i < messages.length; i++)
                {
                        var msg = messages[i];
                        if (msg.id > last_message_id)
                        {
                            var date = new Date(msg.time * 1000);
                            var hours = date.getHours() < 10 ? '0'+date.getHours():date.getHours();
                            var minutes = date.getMinutes() < 10 ? '0'+date.getMinutes():date.getMinutes();
                            var seconds = date.getSeconds() < 10 ? '0'+date.getSeconds():date.getSeconds();
                            
                            var contenido = false;
                            var j=0;
                            for(j;j<usercolors.length;j++){
                                if(usercolors[j].usuario==msg.name){
                                    contenido = true;
                                break;
                                }
                            }
                            var colorr='';
                            if(contenido){
                                colorr = usercolors[j].color;
                            }else{
                                colorr = colors[Math.floor(Math.random() * colors.length)];
                                var obj = {usuario:msg.name, color:colorr};
                                usercolors.push(obj);
                            }
                            
                            

                            $('<li/>').html('['+hours+':'+minutes+':'+seconds+']<span style=\"color: '+colorr+';\">['+msg.name+']</span>: '+msg.content).appendTo('ul#messages');
                            $('ul#messages').data('last_message_id', msg.id);
                            
                        }
                    
                }
                // Remove all but the last 50 messages in the list to prevent browser slowdown with extremely large lists
                // and finally scroll down to the newes message.
                $('ul#messages > li').slice(0, -50).remove();
                $('ul#messages').scrollTop( $('ul#messages').get(0).scrollHeight );
            }});
        };
        
        // Kick of the poll function and repeat it every two seconds
        poll_for_new_messages();
        setInterval(poll_for_new_messages, 2000);
    });
    // ]]>
    const objectsEqual = (o1, o2) => 
    typeof o1 === 'object' && Object.keys(o1).length > 0 
        ? Object.keys(o1).length === Object.keys(o2).length 
            && Object.keys(o1).every(p => objectsEqual(o1[p], o2[p]))
        : o1 === o2;
</script>";