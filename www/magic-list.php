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
    <div id="magic-search-inputs">
        <input type="text" id="magic-search-name" onkeyup="updateMagicList('name')" placeholder="Search by name">
        <input type="text" id="magic-search-origin" onkeyup="updateMagicList('origin')" placeholder="Search by origin">
        <input type="text" id="magic-search-complexity" onkeyup="updateMagicList('complexity')" placeholder="Search by complexity">
        <input type="text" id="magic-search-fail" onkeyup="updateMagicList('fail')" placeholder="Search by fail rate">
        <input type="text" id="magic-search-cast" onkeyup="updateMagicList('cast')" placeholder="Search by cast time">
    </div>
    <div id="learn-magic-background" style="display: none;">
        <div id="learn-magic-box">
            <span id="learn-magic-id" class="learn-magic-text"></span>
            <span id="learn-magic-name" class="learn-magic-text"></span>
            <input type="number" placeholder="New Complexity" id="learn-magic-complexity" class="learn-magic-number">
            <input type="number" placeholder="New Fail Rate" id="learn-magic-fail" class="learn-magic-number">
            <input type="number" placeholder="New Cast Time" id="learn-magic-cast" class="learn-magic-number">
        </div>
        <img src="images/remove.png" alt="Hide adding menu" id="add-item-hide" onclick="hide_learn_magic()">
        <img src="images/add.png" alt="confirm adding item" id="add-item-confirm" onclick="learn_magic()">
    </div>
    <div id="magic-all">
        <div id="magic-list-container">
            <table id="magic-list">
            </table>
        </div>
        <div id="magic-info-container">
            <div class='magic-info' id='magic-info-0'>
                <span>effects</span>
                <div class='magic-detail-info'>
                    <span>limits</span>
                    <span>rules</span>
                    <span>other</span>
                </div>
                <span>tags</span>
            </div>
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
function blurAll(){
    var tmp = document.createElement("input");
    document.body.appendChild(tmp);
    tmp.focus();
    document.body.removeChild(tmp);
}

var shown_id = 0;
function reveal_details(id){
    if(shown_id != 0){
        document.getElementById("magic-info-"+shown_id).style.display = "none";
    }
    document.getElementById("magic-info-"+id).style.display = "flex";
    shown_id = id;
}
function hide_details(){
    if(shown_id == 0){
        return;
    }
    document.getElementById("magic-info-"+shown_id).style.display = "none";
    shown_id = 0;
}

function updateMagicList(type) {
    const magic_list = document.getElementById("magic-list");
    var input, filter, spells, a, i, txtValue;
    input = document.getElementById('magic-search-'+type);
    filter = input.value.toUpperCase();
    spells = magic_list.getElementsByClassName('magic');
    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < spells.length; i++) {
        a = spells[i].getElementsByClassName("magic-"+type)[0];
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
var learn_magic_menu = false;
const learn_magic_background = document.getElementById("learn-magic-background");
const learn_magic_id = document.getElementById("learn-magic-id");
const learn_magic_name = document.getElementById("learn-magic-name");
function reveal_learn_magic(id){
    learn_magic_menu = true;
    learn_magic_background.style.display = "flex";
    learn_magic_id.innerHTML = id;
    learn_magic_name.innerHTML = document.getElementById("magic-name-"+id).innerHTML;
    document.getElementById("learn-magic-complexity").focus();
}
function hide_learn_magic(id){
    learn_magic_menu = false;
    learn_magic_background.style.display = "none";
    blurAll();
}
function learn_magic_request(name, type_id, charges_max, description){
    var request = new XMLHttpRequest();
    var posted_text = "name="+name+"&type_id="+type_id+"&charges_max="+charges_max+"&description="+description;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully added "+ name);
                refresh_inventory();
            }else if(this.responseText == "1"){
                display_message("something went wrong with adding", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "add_item_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function check_form(){
    if(add_item_name.value == ""){
        display_message("Item needs a name", 1);
        return 1;
    }
    if(add_item_type.value == ""){
        display_message("Item needs a type", 1);
        return 1;
    }
    if(add_item_charge_max.value == ""){
        display_message("Item needs a max charge (just put 0 if it doesnt have charges)", 1);
        return 1;
    }else if(!isPositiveNumber(add_item_charge_max.value)){
        display_message("Max charge must be a whole positive number", 1)
        return 1;
    }
    if(add_item_description.value == ""){
        display_message("Item needs a description", 1);
        return 1;
    }
    return 0;
}
function add_item(){
    if(check_form()){
        return;
    }
    add_item_request(
        add_item_name.value,
        add_item_type.value,
        add_item_charge_max.value,
        add_item_description.value
    );
    add_item_name.value = "";
    add_item_charge_max.value = "";
    add_item_description.value = "";
    hide_add_item();
}

window.onload=function() {
    document.onkeydown = keypress;
}
function keypress(event) {
    if (event.keyCode == 27) {
        hide_learn_magic();
        hide_details();
    }
    if (event.keyCode == 13){
        if(learn_magic_menu){
            learn_magic();
        }//else{
        //     reveal_learn_magic();
        // }
    }
    if (event.keyCode == 82){
        refresh_magic();
    }
}
refresh_magic();
</script>
</html>