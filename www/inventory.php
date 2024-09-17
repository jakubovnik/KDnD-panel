<?php
require "check_login_true.php";
require "header.php";
?>
    <title>Character's inventory</title>
</head>
<body>
<div id="all">
    <?php require "navbar.php";?>
    <span id="message"></span>
    <img src="images/add.png" alt="add button" id="add-button" onclick="reveal_add_item()">
    <div id="add-item-background" style="display: none;">
        <div id="add-item-box">
            <input type="text" placeholder="New Item Name" id="add-item-name">
            <select name="add-item-type" id="add-item-type">
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
            <input type="number" placeholder="Max Charges" id="add-item-charge-max">
            <textarea name="add-item-description" id="add-item-description" placeholder="New Item Description"></textarea>
        </div>
        <img src="images/remove.png" alt="Hide adding menu" id="add-item-hide" onclick="hide_add_item()">
    </div>
    <div id="inventory">
        <?php
        require "dbconnect.php";
        $sql = "SELECT inventory.id, inventory.name, type.name as type, inventory.amount, inventory.charges, inventory.charges_max, inventory.description 
            FROM kdnd.inventory INNER JOIN kdnd.type ON inventory.type_id=type.id
            WHERE is_deleted=0";
        if($_SESSION['role'] != 1){
            $sql = $sql." AND inventory.character_id=".$_SESSION['cid'];
        }
        $result = $conn->query($sql);
        // somewhere here add colors based on item type
        while($row = $result->fetch_assoc()){
            echo "<div class='item-box' id='item-box-".$row['id']."' onclick='reveal_details(".$row['id'].")'>";
                echo '<img src="images/remove.png" alt="rmv button" class="remove-button" id="remove-button-'.$row['id'].'" onclick="remove_item('.$row['id'].')">';
                echo "<span class='item-name' id='item-name-".$row['id']."'>".$row['name']."</span>";
                echo "<span class='item-type' id='item-type-".$row['id']."'>".$row['type']."</span>";
                echo '<div class="item-numbers">';
                    echo '<div class="button" id="decrease-amount-'.$row['id'].'" onclick="decrease_amount('.$row['id'].')">-</div>';
                    echo '<div class="item-amount" id="item-amount-'.$row['id'].'">'.$row['amount'].'</div>';
                    echo '<div class="button" id="increase-amount-'.$row['id'].'" onclick="increase_amount('.$row['id'].')">+</div>';
                    echo '<div class="button" id="decrease-charge-'.$row['id'].'" onclick="decrease_charge('.$row['id'].')">-</div>';
                    echo '<div class="item-charges">';
                        echo '<span class="item-charge" id="item-charge-'.$row['id'].'">'.$row['charges'].'</span>/
                        <span class="item-charge-max" id="item-charge-max-'.$row['id'].'">'.$row['charges_max'].'</span>';
                    echo '</div>';
                    echo '<div class="button" id="increase-charge-'.$row['id'].'" onclick="increase_charge('.$row['id'].')">+</div>';
                echo '</div>';
            echo "</div>";
            echo "<span class='item-description' id='item-description-".$row['id']."' onclick='hide_details(".$row['id'].")'>".$row['description']."</span>";
        }
        $conn->close();
        ?>
    </div>
</div>
</body>
</html>
<script>
const message = document.getElementById("message");
const add_item_background = document.getElementById("add-item-background");
const add_item_box = document.getElementById("add-item-box");// Propably not nescesarry
const add_item_name = document.getElementById("add-item-name");
const add_item_type = document.getElementById("add-item-type");
const add_item_charge_max = document.getElementById("add-item-charge-max");
const add_item_description = document.getElementById("add-item-description");

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

var shown_id = 0;
function reveal_details(id){
    if(shown_id != 0){
        document.getElementById("item-description-"+shown_id).style.display = "none";
    }
    document.getElementById("item-description-"+id).style.display = "block";
    shown_id = id;
}
function hide_details(id){//doesnt work and i have no idea why |||UPDATE: it works now for some unknown reason :D
    document.getElementById("item-description-"+id).style.display = "none";
    shown_id = 0;
}

function reveal_add_item(){
    add_item_background.style.display = "flex";
}
function hide_add_item(){
    add_item_background.style.display = "none";
    if(add_item_name.value == ""){
        display_message("Item needs a name", 1);
        return;
    }
    if(add_item_type.value == ""){
        display_message("Item needs a type", 1);
        return;
    }
    if(add_item_charge_max.value == ""){
        display_message("Item needs a max charge (just put 0 if it doesnt have charges)", 1);
        return;
    }
    if(add_item_description.value == ""){
        display_message("Item needs a description", 1);
        return;
    }
    add_item();
}
function add_item_request(name, type_id, charges_max, description){
    var request = new XMLHttpRequest();
    var posted_text = "name="+name+"&type_id="+type_id+"&charges_max="+charges_max+"&description="+description;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully added "+ name);
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
function add_item(){
    add_item_request(
        add_item_name.value,
        add_item_type.value,
        add_item_charge_max.value,
        add_item_description.value
    );
    add_item_name.value = "";
    add_item_charge_max.value = "";
    add_item_description.value = "";
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
</script>