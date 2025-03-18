<?php
session_start();
require "dbconnect.php";
$sql = "INSERT INTO `inventory` (`name`, `type_id`, `amount`, `charges`, `charges_max`, `description`, `character_id`) 
VALUES
('".$_POST['name']."',
'".$_POST['type_id']."',
'1',
'".$_POST['charges_max']."',
'".$_POST['charges_max']."',
'".$_POST['description']."',
'".$_SESSION['cid']."');";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>