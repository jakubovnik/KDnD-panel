<?php
session_start();
require "dbconnect.php";
if($_FILES['image']['size'] == 0){
    echo "2";
}else{
    $image = $_FILES['image'];
    $imageType = $image['type'];
    $imageContent = addslashes(file_get_contents($image["tmp_name"]));

    $sql = "INSERT INTO kdnd.character_image (`title`, `type`, `image`, `description`, `character_id`) 
    VALUES
    ('".$_POST['title']."',
    '".$imageType."',
    '".$imageContent."',
    '".$_POST['description']."',
    '".$_POST['character_id']."');";
    if($conn->query($sql) === TRUE){
        echo "0";
    }else{
        echo "1";
    }
}

$conn->close();
?>