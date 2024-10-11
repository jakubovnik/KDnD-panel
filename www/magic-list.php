<?php
require "check_login_true.php";
require "header.php"
?>
    <title>Magic list</title>
</head>
<body>
<div id="all">
    <?php require "navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <input type="text" id="magic-search" onkeyup="updateMagicList()" placeholder="Search by name">
    <div id="magic-all">
        <div id="magic-list-container">
            <table id="magic-list">
            </table>
        </div>
        <div id="magic-info-container">
        </div>
    </div>
</div>
</body>
<script>
const message = document.getElementById("message");
var message_timeout = setTimeout(() => {message.style.display = "none";}, 2000);
function display_message(new_message, type=0, time=2000){
    clearTimeout(message_timeout);
    message.style.display = "block";
    if(type == 0){
        message.style.color = "green";
    }else if(type == 1){
        message.style.color = "red";
    }
    message.innerHTML = new_message;
    message_timeout = setTimeout(() => {message.style.display = "none";}, time);
}
function hide_message(){
    clearTimeout(message_timeout);
    message.style.display = "none";
}

function updateMagicList() {
    const magic_list = document.getElementById("magic-list");
    var input, filter, spells, a, i, txtValue;
    input = document.getElementById('magic-search');
    filter = input.value.toUpperCase();
    spells = magic_list.getElementsByClassName('magic');
    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < spells.length; i++) {
        a = spells[i].getElementsByClassName("magic-name")[0];
        txtValue = a.innerHTML;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            spells[i].style.display = "";
        } else {
            spells[i].style.display = "none";
        }
    }
}
function refresh_magic(){
    const magic_all = document.getElementById("magic-all");
    var request = new XMLHttpRequest();
    var posted_text = "";
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when refreshing the magic list", 1);
            }else{
                magic_all.innerHTML = this.responseText;
                display_message("Magic list refreshed", 0, 1000);
            }
        }
    };
    request.open("POST", "get_magic.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
refresh_magic();
</script>
</html>