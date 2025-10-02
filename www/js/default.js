/* <script src="js/default.js"></script> */

const message = document.getElementById("message");
var show_message = 1;
var inventory_refresh_interval = 60000;
var magic_refresh_interval = 60000;

var message_timeout = setTimeout(() => {message.style.display = "none";}, 2000);
function display_message(new_message, type=0, time=2000){
    if(show_message == 0){
        return;
    }
    clearTimeout(message_timeout);
    message.style.display = "block";
    if(type == 0){
        message.style.color = "green";
    }else if(type == 1){
        message.style.color = "red";
    }else if(type == 2){
        message.style.color = "blue";
    }
    message.innerHTML = new_message;
    message_timeout = setTimeout(() => {message.style.display = "none";}, time);
}
function hide_message(){
    clearTimeout(message_timeout);
    message.style.display = "none";
}

function isPositiveNumber(str) { //copied from chatgpt and works through REGEX (and i have no idea how)
    return /^\d+$/.test(str);
}
function isWholeNumber(str) { //copied from chatgpt and works through REGEX (and i have no idea how)
    return /^-?\d+$/.test(str);
}

function blurAll(){
    var tmp = document.createElement("input");
    document.body.appendChild(tmp);
    tmp.focus();
    document.body.removeChild(tmp);
}

function get_character_id(name, output_element){
    var request = new XMLHttpRequest();
    var posted_text = "name=" + name;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "-1"){
                display_message("Character ID NOT found", 1);
            }else{
                output_element.innerHTML = this.responseText;
                display_message("Character ID found", 0, 1000);
            }
        }
    };
    request.open("POST", "php/get_character_id.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}

function getSuperglobal(key) {
    return new URLSearchParams(window.location.search).get(key);
}

function switch_edit_mode(){
    var request = new XMLHttpRequest();
    var posted_text = "huh=huh";
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("Something failed when switching edit modes", 1);
            }else{
                location.reload();
            }
        }
    };
    request.open("POST", "php/switch_edit_mode.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
document.addEventListener("keydown", function (event) {
    if (event.ctrlKey && event.key.toLowerCase() === "e") {
        event.preventDefault();
        switch_edit_mode();
    }
    if (event.ctrlKey && event.key.toLowerCase() === "q") {
        event.preventDefault();
        location.assign("php/logout.php");
    }
});