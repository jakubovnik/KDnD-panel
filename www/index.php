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
                <span id="character-name"><?php echo $_SESSION['cname']?></span>
                <span id="character-circles">Circles: <?php echo $_SESSION['circles']?></span>
                <span id="character-money">Muns: <?php echo $_SESSION['money']?></span>
            </div>
            <div id="secondary-info-box">
                <span id="character-age"><?php echo $_SESSION['age'] ?></span>
                <span id="character-role"><?php 
                    require "php/dbconnect.php";
                    $sql = "SELECT role.name FROM kdnd.role WHERE id=".$_SESSION['role'];
                    $result = $conn->query($sql);
                    while($row = $result->fetch_assoc()){
                        echo $row['name'];
                    }
                ?></span>
            </div>
            <span id="character-description"><?php echo $_SESSION['description']?></span>
        </div>
        <div id="character-visual">
            
            <!-- TODO: add some kind of description through php -->
            <!-- <img src="images/Nizen.jpg" alt="nizen example" class="character-image" id="character-image"> -->
            <!-- TODO: save images into a database -->
            <?php
                $sql = "SELECT id, title, description FROM kdnd.character_image WHERE character_id=".$_SESSION['cid']." ORDER BY id";
                $result = $conn->query($sql);
                $image_count = 0;
                if($result->num_rows <= 0){
                    echo '<img src="images/Nizen.jpg" alt="nizen example" class="character-image" id="character-image-0">';
                }else{
                    while($row = $result->fetch_assoc()){
                        echo '<div id="character-image-title-'.$image_count.'" class="character-image-title" style="display:none">'.$row['title'].'</div>';
                        echo '<div id="character-image-description-'.$image_count.'" class="character-image-description" style="display:none">'.$row['description'].'</div>';
                        echo '<img src="php/get_character_image.php?image_id='.$row['id'].'" onclick="show_next_image()"';
                        echo ' alt="character image" class="character-image" id="character-image-'.$image_count.'" style="display:none">';
                        $image_count = $image_count + 1;
                    }
                }
                
            ?>
        </div>
    </div>
</div>
</html>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

var last_image_index = 0;
function set_last_image_index(index){
    last_image_index = index;
}

var current_image_index = 0;
// setTimeout(() => {
    document.getElementById("character-image-title-0").style.display = "block";
    document.getElementById("character-image-description-0").style.display = "block";
    document.getElementById("character-image-0").style.display = "inline-block";
// }, 1000);
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
</script>
<?php
echo "<script>set_last_image_index(".$image_count.");</script>";
?>