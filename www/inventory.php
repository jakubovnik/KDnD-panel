<?php
require "check_login_true.php";
require "header.php";
?>
    <title>Character's inventory</title>
</head>
<body>
<div id="all" class="inventory-background">
    <?php require "navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <img src="images/add.png" alt="add button" id="add-button" onclick="reveal_add_item()">
    <div id="add-item-background" style="display: none;">
        <div id="add-item-box">
            <input type="text" placeholder="New Item Name" id="add-item-name" class="add-item-text" oninput="this.size = this.value.length">
            <select name="add-item-type" id="add-item-type" class="add-item-text" oninput="this.size = this.value.length">
                <?php
                    require "dbconnect.php";
                    $sql = "SELECT * FROM kdnd.type ORDER BY id";
                    $result = $conn->query($sql);
                    while($row = $result->fetch_assoc()){
                        echo '<option value="'.$row['id'].'">'.$row['name'].'</option>';
                    }
                    $conn->close();
                ?>
            </select>
            <input type="text" placeholder="Max Charges" id="add-item-charge-max" class="add-item-text" oninput="this.size = this.value.length">
            <textarea name="add-item-description" placeholder="New Item Description" id="add-item-description" class="add-item-text"></textarea>
        </div>
        <img src="images/remove.png" alt="Hide adding menu" id="add-item-hide" onclick="hide_add_item()">
        <img src="images/add.png" alt="confirm adding item" id="add-item-confirm" onclick="add_item()">
    </div>
    <input type="text" id="item-search-name" onkeyup="updateItemList('name')" placeholder="Search by name">
    <div id="inventory">
    </div>
</div>
</body>
</html>
<script>
function isPositiveNumber(str) { //copied from chatgpt
    return /^\d+$/.test(str);
}

const message = document.getElementById("message");
const inventory = document.getElementById("inventory");
const add_item_background = document.getElementById("add-item-background");
const add_item_box = document.getElementById("add-item-box");// Propably not nescesarry
const add_item_name = document.getElementById("add-item-name");
const add_item_type = document.getElementById("add-item-type");
const add_item_charge_max = document.getElementById("add-item-charge-max");
const add_item_description = document.getElementById("add-item-description");

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

function refresh_inventory(sort="default"){
    var request = new XMLHttpRequest();
    var posted_text = "sort=" + sort;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when refreshing inventory", 1);
            }else{
                inventory.innerHTML = this.responseText;
                display_message("Inventory refreshed", 0, 1000);
            }
        }
    };
    request.open("POST", "get_inventory.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}

function updateItemList(type){
    const item_list = document.getElementById("inventory");
    var input, filter, items, a, i, txtValue;
    input = document.getElementById('item-search-'+type);
    filter = input.value.toUpperCase();
    items = item_list.getElementsByClassName('item-box');
    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < items.length; i++) {
        a = items[i].getElementsByClassName("item-"+type)[0];
        txtValue = a.innerHTML;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            items[i].style.display = "";
        } else {
            items[i].style.display = "none";
        }
    }
}

var shown_id = 0;
function reveal_details(id){
    if(shown_id != 0){
        document.getElementById("item-description-"+shown_id).style.display = "none";
    }
    document.getElementById("item-description-"+id).style.display = "block";
    shown_id = id;
}
function hide_details(){//doesnt work and i have no idea why |||UPDATE: it works now for some unknown reason :D
    if(shown_id != 0){
        document.getElementById("item-description-"+shown_id).style.display = "none";
    }
    shown_id = 0;
}

var add_item_menu = false;
function reveal_add_item(){
    add_item_background.style.display = "flex";
    add_item_menu = true;
    document.getElementById("add-item-name").focus();
}
function hide_add_item(){
    add_item_background.style.display = "none";
    add_item_menu = false;
}
function add_item_request(name, type_id, charges_max, description){
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

function modify_number_request(id, type, value){
    const target = document.getElementById("item-amount-"+id);
    var request = new XMLHttpRequest();
    var posted_text = "id="+id+"&type="+type+"&value="+value;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully changed "+document.getElementById("item-name-"+id).innerHTML + "'s " + type + " to " + value + " (item id: " + id + ")");
                if(type == "is_deleted"){
                    const removed_item = document.getElementById("item-box-"+id);
                    removed_item.remove();
                }
            }else if(this.responseText == "1"){
                display_message("something went wrong with modifying", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "modify_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function remove_item(id){
    //TODO: make a timeout or something for reverting the deletion
    modify_number_request(id, "is_deleted", 1);
    return;
}
function decrease_amount(id){
    const target = document.getElementById("item-amount-"+id);
    if(target.innerHTML == 1){
        return;
    }
    if(modify_number_request(id,"amount",target.innerHTML - 1)==0){
        return;
    }
    target.innerHTML = target.innerHTML - 1;
}
function increase_amount(id){
    const target = document.getElementById("item-amount-"+id);
    if(modify_number_request(id,"amount",Number(target.innerHTML) + 1)==0){
        return;
    }
    target.innerHTML = Number(target.innerHTML) + 1;
}
function decrease_charge(id){
    const target = document.getElementById("item-charge-"+id);
    if(target.innerHTML == 0){
        return;
    }
    if(modify_number_request(id,"charges",target.innerHTML - 1)==0){
        return;
    }
    target.innerHTML = target.innerHTML - 1;
}
function increase_charge(id){
    const target = document.getElementById("item-charge-"+id);
    if(target.innerHTML == document.getElementById("item-charge-max-"+id).innerHTML){
        return;
    }
    if(modify_number_request(id,"charges",Number(target.innerHTML) + 1)==0){
        return;
    }
    target.innerHTML = Number(target.innerHTML) + 1;
}
window.onload=function() {
    document.onkeydown = keypress;
}
function keypress(event) {
    if (event.keyCode == 27) {
        hide_add_item();
        hide_details();
    }
    if (event.keyCode == 13){
        if(add_item_menu){
            add_item();
        }else{
            reveal_add_item();
        }
    }
    if (event.keyCode == 82){
        refresh_inventory();
    }
}
refresh_inventory();
refresh_interval = setInterval(refresh_inventory, 60000);
</script>