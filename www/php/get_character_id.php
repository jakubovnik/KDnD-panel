<?php
session_start();
require "dbconnect.php";
$sql = "SELECT * FROM kdnd.character where name = '".$_POST['name']."'";
$result = $conn->query($sql);
$output = "";
if ($result->num_rows == 1) {
    while($row = $result->fetch_assoc()){
        $output = $row['id'];
    }
}else{
    $output = "-1";
}
echo $output;
$conn->close();
?>