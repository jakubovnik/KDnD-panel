<?php
session_start();
require "dbconnect.php";
$sql = "SELECT inventory.id, inventory.name, type.name as type, inventory.amount, inventory.charges, inventory.charges_max, inventory.description 
    FROM kdnd.inventory INNER JOIN kdnd.type ON inventory.type_id=type.id
    WHERE is_deleted=0";
if($_SESSION['role'] != 1){
    $sql = $sql." AND inventory.character_id=".$_SESSION['cid'];
}
$result = $conn->query($sql);
//TODO: somewhere here add colors based on item type
while($row = $result->fetch_assoc()){
    echo "<div class='item-box' id='item-box-".$row['id']."' onclick='reveal_details(".$row['id'].")'>";
        echo '<img src="images/remove.png" alt="rmv button" class="remove-button" id="remove-button-'.$row['id'].'" onclick="remove_item('.$row['id'].')">';
        echo "<span class='item-name' id='item-name-".$row['id']."'";
            if(strlen($row['name']) > 14){
                echo " style='font-size:medium'";
            }
            echo ">".$row['name']."</span>";
        echo "<span class='item-type' id='item-type-".$row['id']."'>".$row['type']."</span>";
        echo '<div class="item-numbers">';
            echo '<div class="button" id="decrease-amount-'.$row['id'].'" onclick="decrease_amount('.$row['id'].')">-</div>';
            echo '<div class="item-amount" id="item-amount-'.$row['id'].'">'.$row['amount'].'</div>';
            echo '<div class="button" id="increase-amount-'.$row['id'].'" onclick="increase_amount('.$row['id'].')">+</div>';
            echo '<div class="button" id="decrease-charge-'.$row['id'].'" onclick="decrease_charge('.$row['id'].')">-</div>';
            echo '<div class="item-charges">';
                echo '<span class="item-charge" id="item-charge-'.$row['id'].'">'.$row['charges'].'</span>/
                <span class="item-charge-max" id="item-charge-max-'.$row['id'].'">'.$row['charges_max'].'</span>';
            echo '</div>';
            echo '<div class="button" id="increase-charge-'.$row['id'].'" onclick="increase_charge('.$row['id'].')">+</div>';
        echo '</div>';
    echo "</div>";
    echo "<span class='item-description' id='item-description-".$row['id']."' onclick='hide_details(".$row['id'].")'>".$row['description']."</span>";
}
$conn->close();
?>