<?php
session_start(); 
if($_SESSION['role'] != 1 || $_SESSION['edit-mode'] != 1){
    echo "1";
    exit; //TODO: test this thing (admin privelage check)
}
require "dbconnect.php";

$sql = "DELETE FROM `character_calendar`";
$result = $conn->query($sql);
$sql = "DELETE FROM `calendar`";
$result = $conn->query($sql);
$sql = "ALTER TABLE `calendar` AUTO_INCREMENT=1";
$result = $conn->query($sql);
$conn->close();
echo "0";
?>