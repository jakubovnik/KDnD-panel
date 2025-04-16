<?php
require "php/check_login_false.php";
require "php/header.php"
?>
    <link rel="stylesheet" href="css/login-style.css">
    <title>Login with character</title>
</head>
<body id="login-body">
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
<script src="js/default.js"></script>
<script>
const cname_input = document.getElementById("cname");
const password_input = document.getElementById("password");
var mobile_style = "false";

function loginAttempt(){
    if(window.innerWidth < 1000){
        mobile_style = "true";
    }
    var request = new XMLHttpRequest();
    var posted_text = "cname="+cname_input.value+"&password="+password_input.value+"&mstyle="+mobile_style;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                setTimeout(function(){ window.location.href = "index.php" }, 700);
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
    request.open("POST", "php/login_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
</script>
</body>
</html>