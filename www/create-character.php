<?php
require "php/check_login_true.php";
require "php/check_admin.php";
require "php/header.php";
?>
    <title>Create character</title>
</head>
<body>
    <?php require "php/navbar.php";?>
    <form action="javascript:void(0);" id="character-create-form">
        <input type="text" id="create-name" name="create-name" placeholder="character name">
        <input type="password" name="create-password" id="create-password" placeholder="password">
        <input type="number" id="create-age" name="create-age" placeholder="age">
        <input type="number" id="create-circles" name="create-circles" placeholder="circles">
        <input type="text" id="create-description" name="create-description" placeholder="character description">
        <input type="number" id="create-money" name="create-money" placeholder="money">
        <select id="create-role" name="create-role">
            <?php
                require "php/dbconnect.php";
                $sql = "SELECT * FROM kdnd.role ORDER BY id";
                $result = $conn->query($sql);
                while($row = $result->fetch_assoc()){
                    echo '<option value="'.$row['id'].'"';
                    if($row['id'] == "2"){
                        echo ' selected ';
                    }
                    echo '>'.$row['name'].'</option>';
                }
                $conn->close();
            ?>
        </select>
        <input type="submit" id="login-button" name="login-button" value="Create" onclick="createCharacterAttempt()">
    </form>
</body>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

function createCharacterRequest(name, password, age, circles, description, money, role_id){
    var request = new XMLHttpRequest();
    var posted_text = "name="+name+"&type_id="+type_id+"&charges_max="+charges_max+"&description="+description;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully added "+ name);
            }else if(this.responseText == "1"){
                display_message("something went wrong with creating", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "php/create_character.php", true);
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
        display_message("Max charge must be a whole positive number", 1);
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

setTimeout(() => { // TODO: Remove this. This thing is just for testing
    window.location.reload(true);
}, 20000);
</script>
</html>