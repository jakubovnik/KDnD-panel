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
        ORDER BY `tags`, `name`;";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    $lore_restricted = "";
    $lore_name = $row['name'];
    if($_SESSION['role'] > $row['access']){
        if(strpos($row['exceptions'], ";".$_SESSION['cname'].";") === FALSE){
            $lore_restricted = " lore-restricted";
            $lore_name = "spoiler";
        }
    }
    echo '<div id="lore-item-'.$row['id'].'" class="lore-item">';
        echo "<span id='lore-item-id-".$row['id']."' style='display:none;'>".$row['id']."</span>";
        echo '<a href="?s='.$lore_name.'" class="lore-item-name'.$lore_restricted.'"';
        if($row['access'] == 1){
            echo ' style="color:red;"';
        }
        echo '>'.$row['name'].'</a>';
    echo '</div>';
}
$conn->close();
?>