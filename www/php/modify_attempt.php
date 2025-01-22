<?php
session_start();
require "dbconnect.php";
$sql = "UPDATE kdnd.inventory SET ".$_POST["type"]." = ".$_POST["value"].
        " WHERE id=".$_POST["id"];
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>