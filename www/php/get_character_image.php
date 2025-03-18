<?php
require "dbconnect.php";
$sql = "SELECT character_image.image, character_image.type FROM `character_image` WHERE id=".$_GET['image_id'];
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    header("Content-type: ".$row['type']);
    echo $row['image'];
}
$conn.close();
?>