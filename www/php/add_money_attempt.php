<?php
session_start();
require "dbconnect.php";
$sql = "SELECT character.money FROM `character` WHERE id=".$_SESSION['cid'];
$result = $conn->query($sql);
$previous_balance = 0;
while($row = $result->fetch_assoc()){
    $previous_balance = $row['money'];
}
$new_balance = intval(intval($previous_balance) + intval($_POST['amount']));
$sql = "UPDATE `character` SET character.money = ".$new_balance.
        " WHERE id=".$_SESSION["cid"];
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>