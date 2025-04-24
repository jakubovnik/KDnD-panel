<?php
session_start();
require "dbconnect.php";
$sql = "REPLACE INTO `character` (`name`, `password`, `age`, `circles`, `description`, `money`, `role_id`) 
VALUES
('".$_POST['name']."',
'".$_POST['password']."',
'".$_POST['age']."',
'".$_POST['circles']."',
'".$_POST['description']."',
'".$_POST['money']."',
'".$_POST['role_id']."');";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>