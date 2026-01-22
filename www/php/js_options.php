<?php
require "dbconnect.php";
$sql = "SELECT * FROM `options` WHERE character_id=".$_SESSION['cid'];
$result = $conn->query($sql);
if($result->num_rows > 0){
    $row = $result->fetch_assoc();
    if($row['show_message'] == "1"){
        echo "\nshow_message = 1;\n";
    }else{
        echo "\nshow_message = 0;\n";
    }
}
if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
    echo "\ndisplay_message(\"Warning, you are currently in edit mode\", 2);\n";
}
$conn->close();
?>
