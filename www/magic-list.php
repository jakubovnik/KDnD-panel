<?php
require "php/check_login_true.php";
require "php/header.php"
?>
    <title>Magic list</title>
</head>
<body>
<div id="all">
    <?php require "php/navbar.php";?>
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
            <input type="text" placeholder="New Complexity" id="learn-magic-complexity" class="learn-magic-number">
            <input type="text" placeholder="New Fail Rate" id="learn-magic-fail" class="learn-magic-number">
            <input type="text" placeholder="New Cast Time" id="learn-magic-cast" class="learn-magic-number">
        </div>
        <img src="images/cancel.png" alt="Hide adding menu" id="add-item-hide" onclick="hide_learn_magic()">
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
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

var shown_id = 0;
var magic_info_container = document.getElementById("magic-info-container"); // for some unknown reason, this doesnt work inside functions
function reveal_details(id){
    if(shown_id != 0){
        document.getElementById("magic-info-"+shown_id).style.display = "none";
    }
    document.getElementById("magic-info-"+id).style.display = "flex";
    shown_id = id;
    <?php if($_SESSION['style'] == "mobile-style.css"){echo 'document.getElementById("magic-info-container").style.display = "flex";';} ?>
}
function hide_details(){
    if(shown_id == 0){
        return;
    }
    document.getElementById("magic-info-"+shown_id).style.display = "none";
    shown_id = 0;
    <?php if($_SESSION['style'] == "mobile-style.css"){echo 'document.getElementById("magic-info-container").style.display = "none";';} ?>
}

function updateMagicList(type) { //chatgpt
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
var sort_type = "default";
function refresh_magic(){
    const magic_all = document.getElementById("magic-all");
    var request = new XMLHttpRequest();
    var posted_text = "sort=" + sort_type;
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
    request.open("POST", "php/get_magic.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function set_magic_sorting(sort = "default"){
    sort_type = sort;
    refresh_magic();
}
var learn_magic_menu = false;
const learn_magic_background = document.getElementById("learn-magic-background");
const learn_magic_id = document.getElementById("learn-magic-id");
const learn_magic_name = document.getElementById("learn-magic-name");
const learn_magic_complexity = document.getElementById("learn-magic-complexity");
const learn_magic_fail = document.getElementById("learn-magic-fail");
const learn_magic_cast = document.getElementById("learn-magic-cast");
function reveal_learn_magic(id){
    learn_magic_menu = true;
    learn_magic_background.style.display = "flex";
    learn_magic_id.innerHTML = "ID: " + id;
    learn_magic_name.innerHTML = document.getElementById("magic-name-"+id).innerHTML;
    document.getElementById("learn-magic-complexity").focus();
}
function hide_learn_magic(id){
    learn_magic_menu = false;
    learn_magic_background.style.display = "none";
    blurAll();
}
function learn_magic_request(name, complexity, fail_rate, cast_time){
    var request = new XMLHttpRequest();
    var posted_text = "magic_name="+name+"&complexity="+complexity+"&fail_rate="+fail_rate+"&cast_time="+cast_time;
    // console.log(posted_text);
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                setTimeout(refresh_magic, 2000);
                display_message("Successfully learned "+ name);
            }else if(this.responseText == "00"){
                setTimeout(refresh_magic, 2000);
                display_message("Successfully updated "+ name);
            }else if(this.responseText == "1"){
                display_message("something went wrong with your learning lol git gud", 1);
            }else{
                display_message(this.responseText, 1, 5000);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "php/learn_magic_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function learn_magic(){
    if(check_form()){
        return 1;
    }
    learn_magic_request(
        learn_magic_name.innerHTML,
        learn_magic_complexity.value,
        learn_magic_fail.value,
        learn_magic_cast.value
    );
    learn_magic_name.innerHTML = "";
    learn_magic_complexity.value = "";
    learn_magic_fail.value = "";
    learn_magic_cast.value = "";
    hide_learn_magic();
}
function check_form(){
    if(!isPositiveNumber(learn_magic_complexity.value)){
        display_message("Complexity must be a whole positive number", 1);
        return 1;
    }
    if(!isPositiveNumber(learn_magic_fail.value)){
        display_message("Fail rate must be a whole positive number", 1);
        return 1;
    }else if(learn_magic_fail.value > 100){
        display_message("Fail rate cannot be higher than 100");
        return 1;
    }
    if(!isWholeNumber(learn_magic_cast.value)){
        display_message("Cast time must be a whole number", 1);
        return 1;
    }
    return 0;
}
// function add_item(){
//     if(check_form()){
//         return;
//     }
//     add_item_request(
//         add_item_name.value,
//         add_item_type.value,
//         add_item_charge_max.value,
//         add_item_description.value
//     );
//     add_item_name.value = "";
//     add_item_charge_max.value = "";
//     add_item_description.value = "";
//     hide_add_item();
// }

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
// setTimeout(() => { // TODO: Remove this. This thing is just for testing
//     reveal_learn_magic(55);
// }, 200);
</script>
</html>