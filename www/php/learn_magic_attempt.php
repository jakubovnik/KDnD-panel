<?php
session_start();
require "dbconnect.php";
$row_exists = false;
$sql = "SELECT * FROM `character_magic` WHERE (character_id = '".$_SESSION['cid']."') AND (magic_name='".$_POST['magic_name']."')";
$result = $conn->query($sql);
if($result->num_rows > 0){
    $row_exists = true;
}

if($row_exists){
    $sql = "UPDATE `character_magic` ".
    "SET ".
    "complexity='".$_POST['complexity']."',".
    "fail_rate='".$_POST['fail_rate']."',".
    "cast_time='".$_POST['cast_time']."' ".
    "WHERE (character_id='".$_SESSION['cid']."') AND (magic_name='".$_POST['magic_name']."')";
    echo "0";
}else{
    $sql = "INSERT INTO `character_magic` (`character_id`, `magic_name`, `complexity`, `fail_rate`, `cast_time`) ".
    "VALUES (".
    "'".$_SESSION['cid']."',".
    "'".$_POST['magic_name']."',".
    "'".$_POST['complexity']."',".
    "'".$_POST['fail_rate']."',".
    "'".$_POST['cast_time']."'".
    ")";
}
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>
