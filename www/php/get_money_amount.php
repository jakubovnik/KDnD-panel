<?php
session_start();
require "dbconnect.php";
$sql = "SELECT character.money FROM kdnd.character WHERE id=".$_SESSION['cid'];

$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    echo $row['money'];
}
?>