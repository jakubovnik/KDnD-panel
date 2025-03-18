<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Home</title>
</head>
<div id="all">
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <div id="character-info">
        <div id="character-sheet">
            <div id="main-info-box">
                <div id="character-name"><?php echo $_SESSION['cname']?></div>
                <div id="character-circles">Circles: <?php echo $_SESSION['circles']?></div>
                <div id="character-money"><div id="character-money-text">Muns: 
                    <div id="character-money-number"></div></div>
                    <div id="character-money-actions">
                        <div id="character-money-actions-row">
                            <div id="character-money-button--1" class="character-money-button" onclick="add_money('-1',1)">-1</div>
                            <div id="character-money-button-1" class="character-money-button" onclick="add_money('1',1)">+1</div>
                            <input type="text" id="character-money-input">
                        </div>
                        <div id="character-money-actions-row">
                            <div id="character-money-button--10" class="character-money-button" onclick="add_money('-10',1)">-10</div>
                            <div id="character-money-button-10" class="character-money-button" onclick="add_money('10',1)">+10</div>
                            <div id="character-money-button-add" class="character-money-button" onclick="add_money()">add</div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="secondary-info-box">
                <div id="character-age">Age: <?php echo $_SESSION['age'] ?></div>
                <div id="character-role"><?php 
                    require "php/dbconnect.php";
                    $sql = "SELECT role.name FROM `role` WHERE id=".$_SESSION['role'];
                    $result = $conn->query($sql);
                    while($row = $result->fetch_assoc()){
                        echo $row['name'];
                    }
                ?></div>
            </div>
            <div id="character-description"><?php echo $_SESSION['description']?></div>
        </div>
        <div id="character-visual">
            <?php
                $sql = "SELECT id, title, description FROM `character_image` WHERE character_id=".$_SESSION['cid']." ORDER BY id";
                $result = $conn->query($sql);
                $image_count = 0;
                if($result->num_rows <= 0){
                    echo '<div id="character-image-title-0" class="character-image-title">Default title</div>';
                    echo '<div id="character-image-description-0" class="character-image-description">Default descriptions</div>';
                    echo '<img src="images/temp-missing-image.png" alt="no image yet" class="character-image" id="character-image-0">';
                }else{
                    while($row = $result->fetch_assoc()){
                        echo '<div id="character-image-title-'.$image_count.'" class="character-image-title" style="display:none">'.$row['title'].'</div>';
                        echo '<div id="character-image-description-'.$image_count.'" class="character-image-description" style="display:none">'.$row['description'].'</div>';
                        echo '<img src="php/get_character_image.php?image_id='.$row['id'].'" onclick="show_next_image()"';
                        echo ' alt="character image" class="character-image" id="character-image-'.$image_count.'" style="display:none">';
                        $image_count = $image_count + 1;
                    }
                }
                $conn->close();
            ?>
            <div id="equipped-items">
                <?php
                    require "php/get_equipped_items.php";
                ?>
            </div>
        </div>
    </div>
</div>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>
var money_input = document.getElementById("character-money-input");
var money_number = document.getElementById("character-money-number");

function refresh_money_amount(shutUp = 0){
    var request = new XMLHttpRequest();
    var posted_text = "";
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "error"){
                display_message("something went wrong when fetching your wallet", 1);
            }else{
                money_number.innerHTML = this.responseText;
                if(shutUp){
                    display_message("Wallet refreshed", 0, 1000);
                }
            }
        }
    };
    request.open("POST", "php/get_money_amount.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}

function add_money_attempt(amount, reset_input=0){
    var request = new XMLHttpRequest();
    var posted_text = "amount="+amount;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully added " + amount + " to your wallet");
                if(reset_input == 1){
                    money_input.value = "";
                }
                refresh_money_amount();
            }else if(this.responseText == "1"){
                display_message("something went wrong your wallet", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "php/add_money_attempt.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function check_form(){
    if(money_input.value == ""){
        display_message("Input field is empty", 1);
        return 1;
    }
    if(!isWholeNumber(money_input.value)){
        display_message("Amount has to be a whole number", 1);
        return 1;
    }
    return 0;
}
function add_money(amount="0", button=0){
    if(button == 1){
        add_money_attempt(amount);
        return;
    }
    if(!check_form()){
        add_money_attempt(money_input.value, 1);
    }
}

var last_image_index = 0;
function set_last_image_index(index){
    last_image_index = index;
}
var current_image_index = 0;
setTimeout(() => {
    document.getElementById("character-image-title-0").style.display = "block";
    document.getElementById("character-image-description-0").style.display = "block";
    document.getElementById("character-image-0").style.display = "inline-block";
}, 100);
function show_next_image(){
    document.getElementById("character-image-title-"+current_image_index).style.display = "none";
    document.getElementById("character-image-description-"+current_image_index).style.display = "none";
    document.getElementById("character-image-"+current_image_index).style.display = "none";
    current_image_index = current_image_index + 1;
    if(current_image_index >= last_image_index){
        current_image_index = 0;
    }
    document.getElementById("character-image-title-"+current_image_index).style.display = "block";
    document.getElementById("character-image-description-"+current_image_index).style.display = "block";
    document.getElementById("character-image-"+current_image_index).style.display = "inline-block";
}
refresh_money_amount();
refresh_interval = setInterval(refresh_money_amount, 10000);
</script>
<?php require "php/js_options.php";?>
<?php
echo "<script>set_last_image_index(".$image_count.");</script>";
?>
</html>