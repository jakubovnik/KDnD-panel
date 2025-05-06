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
        WHERE ".$_POST['type']." LIKE '%".$_POST['search']."%'";
if($_SESSION['role'] != 1 || $_SESSION['edit-mode'] != 1){
    $sql = $sql." AND `name` NOT REGEXP '^[0-9]'";
}
$sql = $sql." ORDER BY `tags`, `name`;";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    $lore_restricted = "";
    $lore_name = $row['name'];
    if($_SESSION['role'] > $row['access']){
        if(strpos($row['exceptions'], ";".$_SESSION['cname'].";") === FALSE){
            $lore_restricted = " lore-restricted";
            // $lore_name = "spoiler"; //This here makes more sense proffesionally, however, it is not as funny as the alternative
        }else{
            $lore_restricted = " lore-exception";
        }
    }
    echo '<div id="lore-item-'.$row['id'].'" class="lore-item">';
        echo "<span id='lore-item-id-".$row['id']."' style='display:none;'>".$row['id']."</span>";
        if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
            echo '<span id="lore-item-access-'.$row['id'].'" class="lore-item-access" title="'.$row['exceptions'].'">'.$row['access'].'</span>';
        }
        echo '<a href="?s='.$lore_name.'" class="lore-item-name'.$lore_restricted.'">'.$row['name'].'</a>';
    echo '</div>';
}
$conn->close();
?>