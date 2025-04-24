<?php
session_start();
require "dbconnect.php";
$table_id_name = "";
$table_id_value = "";
if($_POST['id'] != "-1"){
    $table_id_name = "`id`, ";
    $table_id_value = "'".$_POST['id']."', ";
}
$sql = "REPLACE INTO `character` (".$table_id_name."`name`, `password`, `age`, `circles`, `description`, `money`, `role_id`) 
VALUES
(".$table_id_value."
'".$_POST['name']."',
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