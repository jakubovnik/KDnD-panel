<?php
if($_SESSION['style'] == "mobile-style.css"){
    echo '<script src="js/mobile.js"></script>';
}
require "dbconnect.php";
$sql = "SELECT * FROM kdnd.options WHERE character_id=".$_SESSION['cid'];
$result = $conn->query($sql);
$row = $result->fetch_assoc();
echo "<script>\n";
if($row['show_message'] == "1"){
    echo "setShowMessage(true);\n";
}else{
    echo "setShowMessage(false);\n";
}
echo "</script>";
$conn->close();
?>