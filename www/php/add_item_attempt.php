<?php
session_start();
require "dbconnect.php";

$table_id_name = "";
$table_id_value = "";
$table_name_value = $_POST['name'];
$table_type_value = $_POST['type_id'];
$table_amount_value = "1";
$table_charge_value = $_POST['charges_max'];
$table_charge_max_value = $_POST['charges_max'];
$table_descritpion_value = $_POST['description'];
$table_owner_value = $_SESSION['cid'];

if($_POST['item_id'] != "-1"){
    $sql = "SELECT * FROM `inventory` WHERE `id`='".$_POST['item_id']."'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();

    $table_id_name = "`id`, ";
    $table_id_value = "'".$_POST['item_id']."', ";
    $table_amount_value = $row['amount'];
    $table_charge_value = $row['charges'];
    $table_owner_value = $row['character_id'];
}


$sql = "REPLACE INTO `inventory` (".$table_id_name."`name`, `type_id`, `amount`, `charges`, `charges_max`, `description`, `character_id`) 
VALUES
(".$table_id_value."'".$table_name_value."',
'".$table_type_value."',
'".$table_amount_value."',
'".$table_charge_value."',
'".$table_charge_max_value."',
'".$table_descritpion_value."',
'".$table_owner_value."');";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>