<?php
require "check_login_false.php";
require "header.php"
?>
    <title>Login with character</title>
</head>
<body>
<span id="message"></span>
<div id="login">
    <div>
    <form action="javascript:void(0);" id="login-form">
        <input type="text" id="cname" name="cname" placeholder="enter character name">
        <input type="password" name="password" id="password" placeholder="enter password">
        <input type="submit" id="login-button" name="login-button" value="Login" onclick="loginAttempt()">
    </form>
    </div>
</div>
</body>
</html>
<script>
const cname_input = document.getElementById("cname");
const password_input = document.getElementById("password");
const message = document.getElementById("message");
var message_timeout = setTimeout(() => {message.style.display = "none";}, 2000);
function display_message(new_message, type=0){
    clearTimeout(message_timeout);
    message.style.display = "block";
    if(type == 0){
        message.style.color = "green";
    }else if(type == 1){
        message.style.color = "red";
    }
    message.innerHTML = new_message;
    message_timeout = setTimeout(() => {message.style.display = "none";}, 2000);
}

function loginAttempt(){
    var request = new XMLHttpRequest();
    var posted_text = "cname="+cname_input.value+"&password="+password_input.value
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                setTimeout(function(){ window.location.href = "index.php" }, 1000);
                display_message("Successfully logged in!");
            }
            if(this.responseText == "1"){
                display_message("Character doesn't exist", 1);
            }
            if(this.responseText == "2"){
                display_message("Incorrect password", 1);
            }
        }
    };
    request.open("POST", "login_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
</script>