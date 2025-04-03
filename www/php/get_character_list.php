<?php
session_start();
require "dbconnect.php";
$sql = "SELECT 
            *
        FROM
            `character`";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    
}
$conn->close();
?>