<?php
session_start(); 
if($_SESSION['role'] != 1){
    echo "1";
    exit; //TODO: test this thing (admin privelage check)
}
require "dbconnect.php";
// TODO: check if the lore already exists, so that it can replace into correctly (edit the lore, 
// not create a new one with the same name but different id)
// NOTE: I have no Idea why this is nescessary??? Maybe checking the name? 
// (I guess I havent tried to create multiple lore articles with the same name, but that should already be safe due to the database setting)
if($_POST['id'] == "-1"){
    $table_id_name = "";
    $table_id_value = "";
}else{
    $table_id_name = ", `id`";
    $table_id_value = ", '".$_POST['id']."'";
}

$sql = "REPLACE INTO `wiki` (`name`, `content`, `tags`, `access`, `exceptions`$table_id_name) 
VALUES
('".$_POST['name']."',
'".addslashes(urldecode($_POST['content']))."',
'".$_POST['tags']."',
'".$_POST['access']."',
'".$_POST['exceptions']."'$table_id_value);";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>