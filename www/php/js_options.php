<?php
require "dbconnect.php";
$sql = "SELECT * FROM kdnd.options WHERE character_id=".$_SESSION['cid'];
$result = $conn->query($sql);
$row = $result->fetch_assoc();
if($row['show_message'] == "1"){
    echo "\nshow_message = 1;\n";
}else{
    echo "\nshow_message = 0;\n";
}
$conn->close();
?>