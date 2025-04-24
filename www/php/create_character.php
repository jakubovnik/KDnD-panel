<?php
session_start();
require "dbconnect.php";
if($_POST['id'] == "-1"){
    $sql = "INSERT INTO `character` (`name`, `password`, `age`, `circles`, `description`, `money`, `role_id`) 
    VALUES
    ('".$_POST['name']."',
    '".$_POST['password']."',
    '".$_POST['age']."',
    '".$_POST['circles']."',
    '".$_POST['description']."',
    '".$_POST['money']."',
    '".$_POST['role_id']."');";
}else{
    $sql = "UPDATE `character` SET ".
    "name='".$_POST['name']."', ".
    "password='".$_POST['password']."', ".
    "age='".$_POST['age']."', ".
    "circles='".$_POST['circles']."', ".
    "description='".$_POST['description']."', ".
    "money='".$_POST['money']."', ".
    "role_id='".$_POST['role_id']."' ".
    "WHERE id=".$_POST['id'];
}
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>