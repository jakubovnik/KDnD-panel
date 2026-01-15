<?php
$servername = "db";
$username = "root";
$password = "root";
$dbname = "kdnd";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
/*
require "php/dbconnect.php";
$sql = "SELECT * FROM `type` ORDER BY id";
$result = $conn->query($sql);
$conn->close();
*/
?>
