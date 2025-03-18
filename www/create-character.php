<?php
require "php/check_login_true.php";
require "php/check_admin.php";
require "php/header.php";
?>
    <title>Create character</title>
</head>
<body>
    <span id="message"></span>
    <?php require "php/navbar.php";?>
    <div id="character-create-box">
        <form action="javascript:void(0);" id="character-create-form">
            <input type="text" id="create-name" class="character-create-text" name="create-name" placeholder="character name">
            <input type="text" id="create-password" class="character-create-text" name="create-password" placeholder="password">
            <input type="text" id="create-age" class="character-create-text" name="create-age" placeholder="age">
            <input type="text" id="create-circles" class="character-create-text" name="create-circles" placeholder="circles">
            <input type="text" id="create-description" name="create-description" placeholder="character description">
            <input type="text" id="create-money" class="character-create-text" name="create-money" placeholder="money">
            <select id="create-role" class="character-create-text" name="create-role">
                <?php
                    require "php/dbconnect.php";
                    $sql = "SELECT * FROM `role` ORDER BY id";
                    $result = $conn->query($sql);
                    while($row = $result->fetch_assoc()){
                        echo '<option value="'.$row['id'].'"';
                        if($row['id'] == "2"){
                            echo ' selected';
                        }
                        echo '>'.$row['name'].'</option>';
                    }
                    $conn->close();
                ?>
            </select>
            <input type="submit" id="character-create-submit" name="character-create-submit" value="Create" onclick="createCharacterAttempt()">
        </form>
    </div>
</body>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

function createCharacterRequest(name, password, age, circles, description, money, role_id){
    var request = new XMLHttpRequest();
    var posted_text = "name="+name+"&password="+password+"&age="+age+"&circles="+circles+"&description="+description+"&money="+money+"&role_id="+role_id;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully created "+ name);
            }else if(this.responseText == "1"){
                display_message("something went wrong with creating character", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "php/create_character.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
var create_name = document.getElementById("create-name");
var create_password = document.getElementById("create-password");
var create_age = document.getElementById("create-age");
var create_circles = document.getElementById("create-circles");
var create_description = document.getElementById("create-description");
var create_money = document.getElementById("create-money");
var create_role = document.getElementById("create-role");
function check_form(){
    if(create_name.value == ""){
        display_message("Character needs a name", 1);
        return 1;
    }
    if(create_password.value == ""){
        display_message("Character needs a password", 1);
        return 1;
    }
    if(create_age.value == ""){
        display_message("Character needs an age", 1);
        return 1;
    }else if(!isWholeNumber(create_age.value+"")){// for some unknown reason, it cant find the whole number function || bruh, i didnt change anything and it works...-_-
        display_message("Age must be a whole number", 1);
        return 1;
    }
    if(create_circles.value == ""){
        display_message("Character needs circles", 1);
        return 1;
    }else if(!isPositiveNumber(create_circles.value)){
        display_message("Circle count must be in positive numbers", 1);
        return 1;
    }
    if(create_description.value == ""){
        display_message("Character needs a description", 1);
        return 1;
    }
    if(create_money.value == ""){
        display_message("Character needs money (at least put 0)", 1);
        return 1;
    }else if(!isWholeNumber(create_money.value)){
        display_message("Money count must be a whole number", 1);
        return 1;
    }
    return 0;
}
function createCharacterAttempt(){
    if(check_form()){
        return;
    }
    createCharacterRequest(
        create_name.value,
        create_password.value,
        create_age.value,
        create_circles.value,
        create_description.value,
        create_money.value,
        create_role.value
    );
    create_name.value = "";
    create_password.value = "";
    create_age.value = "";
    create_circles.value = "";
    create_description.value = "";
    create_money.value = "";
}

// setTimeout(() => { // TODO: Remove this. This thing is just for testing
//     window.location.reload(true);
// }, 20000);
</script>
</html>