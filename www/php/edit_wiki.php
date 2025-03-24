<?php
session_start(); //TODO: check if user has admin privelages
require "dbconnect.php";
$sql = "REPLACE INTO `wiki` (`name`, `content`, `tags`, `access`, `exceptions`) 
VALUES
('".$_POST['name']."',
'".addslashes($_POST['content'])."',
'".$_POST['tags']."',
'".$_POST['access']."',
'".$_POST['exceptions']."');";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>