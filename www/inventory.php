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
        while($row = $result->fetch_assoc()){
            echo "<div class='item-box' id='item-box-".$row['id']."' onclick='reveal_details(".$row['id'].")'>";
                echo '<img src="images/remove.png" alt="rmv button" width="50" height="50" class="remove-button" id="remove-button-'.$row['id'].'" onclick="remove_item('.$row['id'].')">';
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
        ?>
    </div>
</div>
</body>
</html>
<script>
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
function modify_number(id, type, value){
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
            }
            if(this.responseText == "1"){
                display_message("something went wrong with modifying", 1);
            }
        }
    };
    request.open("POST", "modify_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function remove_item(id){
    //TODO: make a timeout or something for reverting the deletion
    modify_number(id, "is_deleted", 1);
    return;
}
function decrease_amount(id){
    const target = document.getElementById("item-amount-"+id);
    if(target.innerHTML == 1){
        return;
    }
    if(modify_number(id,"amount",target.innerHTML - 1)==0){
        return;
    }
    target.innerHTML = target.innerHTML - 1;
}
function increase_amount(id){
    const target = document.getElementById("item-amount-"+id);
    if(modify_number(id,"amount",Number(target.innerHTML) + 1)==0){
        return;
    }
    target.innerHTML = Number(target.innerHTML) + 1;
}
function decrease_charge(id){
    const target = document.getElementById("item-charge-"+id);
    if(target.innerHTML == 1){
        return;
    }
    if(modify_number(id,"charges",target.innerHTML - 1)==0){
        return;
    }
    target.innerHTML = target.innerHTML - 1;
}
function increase_charge(id){
    const target = document.getElementById("item-charge-"+id);
    if(target.innerHTML == document.getElementById("item-charge-max-"+id).innerHTML){
        return;
    }
    if(modify_number(id,"charges",Number(target.innerHTML) + 1)==0){
        return;
    }
    target.innerHTML = Number(target.innerHTML) + 1;
}
</script>