/* <script src="default.js"></script> */

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