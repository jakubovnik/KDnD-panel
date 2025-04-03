<?php
session_start();
require "dbconnect.php";

if($_POST['item_id'] == "-1"){
    $table_id_name = "";
    $table_id_value = "";
}else{
    $table_id_name = "`id`, ";
    $table_id_value = "'".$_POST['item_id']."', ";
}
$sql = "REPLACE INTO `inventory` (".$table_id_name."`name`, `type_id`, `amount`, `charges`, `charges_max`, `description`, `character_id`) 
VALUES
(".$table_id_value."'".$_POST['name']."',
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