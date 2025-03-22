<?php
session_start();
require "dbconnect.php";
$sql = "SELECT 
            `id`,
            `name`,
            `tags`,
            `access`,
            `exceptions`
        FROM
            `wiki`
        WHERE ".$_POST['type']." LIKE '%".$_POST['search']."%' 
        ORDER BY `name`;";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    echo '<div id="lore-item-"'.$row['id'].' class="lore-item">';
        echo '<a href="?search='.$row['name'].'" class="lore-item-name">'.$row['name'].'</a>';
    echo '</div>';
}

$conn->close();
?>