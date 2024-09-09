<?php
require "check_login_false.php";
require "header.php"
?>
    <title>Login with character</title>
</head>
<body>
<div id="login">
    <form action="javascript:void(0);">
        <input type="text" id="cname" name="cname" placeholder="enter character name">
        <input type="password" name="password" id="password" placeholder="enter password">
        <input type="submit" id="login-button" name="login-button" value="Login" onclick="loginAttempt()">
    </form>
    <span id="message"></span>
</div>
</body>
</html>
<script>
const cname_input = document.getElementById("cname");
const password_input = document.getElementById("password");
const login_message = document.getElementById("message");

function loginAttempt(){
    var request = new XMLHttpRequest();
    var posted_text = "cname="+cname_input.value+"&password="+password_input.value
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                login_message.innerHTML = "Successfully logged in";
                login_message.style.color = "green";
                setTimeout(function(){ window.location.href = "index.php" }, 800);
            }
            if(this.responseText == "1"){
                login_message.innerHTML = "Character doesn't exist";
                login_message.style.color = "red";
            }
            if(this.responseText == "2"){
                login_message.innerHTML = "Incorrect password";
                login_message.style.color = "red";
            }
        }
    };
    request.open("POST", "login_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
</script>