<?php
session_start();
require "dbconnect.php";
$sql = "INSERT INTO kdnd.character (`name`, `password`, `age`, `circles`, `description`, `money`, `role_id`) 
VALUES
('".$_POST['name']."',
'".$_POST['type_id']."',
'1',
'".$_POST['charges_max']."',
'".$_POST['charges_max']."',
'".$_POST['description']."',
'".$_POST['cid']."');";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>