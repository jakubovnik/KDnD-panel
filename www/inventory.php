<?php
require "check_login_true.php";
require "header.php";
?>
    <title>Character's inventory</title>
</head>
<body>
<div id="all">
    <?php require "navbar.php";?>
    <div id="inventory">
        <div class="item-box" onclick="reveal_details(0)">
            <span class="item-name" id="item-name-0">Example item</span>
            <span class="item-type" id="item-type-0">Example type</span>
            <div class="item-numbers">
                <div class="button" id="decrease-amount-0" onclick="decrease_amount(0)">-</div>
                <div class="item-amount" id="item-amount-0">1</div>
                <div class="button" id="increase-amount-0" onclick="increase_amount(0)">+</div>
                <div class="button" id="decrease-charge-0" onclick="decrease_charge(0)">-</div>
                <div class="item-charges">
                    <span class="item-charge" id="item-charge-0">2</span>/<span class="item-charge-max" id="item-charge-max-0">4</span>
                </div>
                <div class="button" id="increase-charge-0" onclick="increase_charge(0)">+</div>
            </div>
            <span class="item-description" id="item-description-0">example example example example example example example example example example example</span>
        </div>
        <?php
        require "dbconnect.php";
        $sql = "SELECT inventory.id, inventory.name, type.name as type, inventory.amount, inventory.charges, inventory.charges_max, inventory.description 
            FROM kdnd.inventory INNER JOIN kdnd.type ON inventory.type_id=type.id";
        if($_SESSION['role'] != 1){
            $sql = $sql." WHERE inventory.character_id=".$_SESSION['cid'];
        }
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()){
            echo "<div class='item-box' onclick='reveal_details(".$row['id'].")'>";
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
                echo "<span class='item-description' id='item-description-".$row['id']."'>".$row['description']."</span>";
            echo "</div>";
        }
        ?>
    </div>
    <span id="message">notheng</span>
</div>
</body>
</html>
<script>
var shown_id = 0;
function reveal_details(id){
    // if(shown_id != 0){//TODO: put back once the Example item gets removed
        document.getElementById("item-description-"+shown_id).style.display = "none";
    // }
    document.getElementById("item-description-"+id).style.display = "block";
    shown_id = id;
}
function modify_number(id, type, action){//TODO: finish this thing and then add it to all of the functions below
    const modify_message = document.getElementById("message");
    const target = document.getElementById("item-amount-"+id);
    var request = new XMLHttpRequest();
    var posted_text = "id="+cname_input.value+"&password="+password_input.value
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                modify_message.innerHTML = "Successfully logged in";
                modify_message.style.color = "green";
                setTimeout(function(){ window.location.href = "index.php" }, 800);
            }
            if(this.responseText == "1"){
                modify_message.innerHTML = "Character doesn't exist";
                modify_message.style.color = "red";
            }
            if(this.responseText == "2"){
                modify_message.innerHTML = "Incorrect password";
                modify_message.style.color = "red";
            }
        }
    };
    request.open("POST", "login_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function decrease_amount(id){
    const target = document.getElementById("item-amount-"+id);
    if(target.innerHTML == 1){
        return;
    }
    target.innerHTML = target.innerHTML - 1;
}
function increase_amount(id){
    const target = document.getElementById("item-amount-"+id);
    target.innerHTML = Number(target.innerHTML) + 1;
}
function decrease_charge(id){
    const target = document.getElementById("item-charge-"+id);
    if(target.innerHTML == 1){
        return;
    }
    target.innerHTML = target.innerHTML - 1;
}
function increase_charge(id){
    const target = document.getElementById("item-charge-"+id);
    if(target.innerHTML == document.getElementById("item-charge-max-"+id).innerHTML){
        return;
    }
    target.innerHTML = Number(target.innerHTML) + 1;
}
</script>