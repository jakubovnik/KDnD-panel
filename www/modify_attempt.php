<?php
session_start();
require "dbconnect.php";
$sql = "UPDATE inventory FROM kdnd.character where id = '".$_POST['cname']."'";
$result = $conn->query($sql);
$conn->close();
?>