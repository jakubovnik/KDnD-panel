<?php
if(session_status() === PHP_SESSION_NONE){
    session_start();
}
require "dbconnect.php";
$sql = "SELECT inventory.id, 
                inventory.name, 
                inventory.description
        FROM `inventory` 
        WHERE is_deleted=0 AND
                is_equipped=1 AND
                character_id=".$_SESSION['cid'].
        " ORDER BY type_id";

$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    echo "<div id='equipped-item-".$row['id']."' class='equipped-item'>";
        echo $row['name'];
        echo "<div id='equipped-item-description-".$row['id']."' class='equipped-item-description'>";
            echo $row['description'];
        echo "</div>";
    echo "</div>";
}
?>