<?php
session_start();
require "dbconnect.php";
$sql = "SELECT inventory.id, inventory.name, type.name as type, inventory.amount, inventory.charges, inventory.charges_max, inventory.description 
    FROM kdnd.inventory INNER JOIN kdnd.type ON inventory.type_id=type.id
    WHERE (is_deleted=0)";
if($_SESSION['role'] != 1){
    $sql = $sql." AND (inventory.character_id=".$_SESSION['cid'].")";
}
if($_POST['sort'] == "default"){
    $sql = $sql." ORDER BY type.name DESC,inventory.name ASC";
}
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    echo "<div class='item-box' id='item-box-".$row['id']."'>";
    // echo "<div class='item-box' id='item-box-".$row['id']."' onclick='reveal_details(".$row['id'].")' ";
        echo '<img src="images/cancel.png" alt="rmv button" class="item-remove-button" id="item-remove-button-'.$row['id'].'" onclick="remove_item('.$row['id'].')">';
        echo '<img src="images/information.png" alt="show more button" class="item-description-button" id="item-description-button-'.$row['id'].'" onclick="reveal_details('.$row['id'].')">';
        echo "<span class='item-name";
            if(strlen($row['name']) > 20){
                echo " long-name-item-1";
            }else if(strlen($row['name']) > 14){
                echo " long-name-item-2";
            }
            echo "' id='item-name-".$row['id']."'";
            echo " style='";
            echo "border-color: ";
            switch ($row['type']) {
                case 'misc':
                    echo "rgba(90, 90, 90, 1)";
                    break;
                case 'weapon':
                    echo "rgba(180, 0, 0, 1)";
                    break;
                case 'shield':
                    echo "rgba(0, 120, 180, 1)";
                    break;
                case 'armor':
                    echo "rgba(0, 0, 180, 1)";
                    break;
                case 'headwear':
                    echo "rgba(0, 0, 255, 1)";
                    break;
                case 'gloves':
                    echo "rgba(0, 0, 120, 1)";
                    break;
                case 'accessory':
                    echo "rgba(214, 202, 0, 1)";
                    break;
                case 'consumable':
                    echo "rgba(0, 180, 0, 1)";
                    break;
                case 'key item':
                    echo "rgba(180, 0, 180, 1)";
                    break;
                case 'bag':
                    echo "rgba(180, 100, 0, 1)";
                    break;
                case 'material':
                    echo "rgba(0, 180, 180, 1)";
                    break;
                default:
                    echo "rgba(0, 0, 0, 1)";
                    break;
            }
            echo ";'>".$row['name']."</span>";
        echo "<span class='item-type' id='item-type-".$row['id']."'>".$row['type']."</span>";
        echo '<div class="item-numbers">';
            echo '<div class="button" id="decrease-amount-'.$row['id'].'" onclick="decrease_amount('.$row['id'].')" style="background-color: ';
                switch ($row['type']) {
                    case 'misc':
                        echo "rgba(90, 90, 90, 1)";
                        break;
                    case 'weapon':
                        echo "rgba(180, 0, 0, 1)";
                        break;
                    case 'shield':
                        echo "rgba(0, 120, 180, 1)";
                        break;
                    case 'armor':
                        echo "rgba(0, 0, 180, 1)";
                        break;
                    case 'headwear':
                        echo "rgba(0, 0, 255, 1)";
                        break;
                    case 'gloves':
                        echo "rgba(0, 0, 120, 1)";
                        break;
                    case 'accessory':
                        echo "rgba(214, 202, 0, 1)";
                        break;
                    case 'consumable':
                        echo "rgba(0, 180, 0, 1)";
                        break;
                    case 'key item':
                        echo "rgba(180, 0, 180, 1)";
                        break;
                    case 'bag':
                        echo "rgba(180, 100, 0, 1)";
                        break;
                    case 'material':
                        echo "rgba(0, 180, 180, 1)";
                        break;
                    default:
                        echo "rgba(0, 0, 0, 1)";
                        break;
                }
                echo '">-</div>';
            echo '<div class="item-amount" id="item-amount-'.$row['id'].'">'.$row['amount'].'</div>';
            echo '<div class="button" id="increase-amount-'.$row['id'].'" onclick="increase_amount('.$row['id'].')" style="background-color: ';
                switch ($row['type']) {
                    case 'misc':
                        echo "rgba(90, 90, 90, 1)";
                        break;
                    case 'weapon':
                        echo "rgba(180, 0, 0, 1)";
                        break;
                    case 'shield':
                        echo "rgba(0, 120, 180, 1)";
                        break;
                    case 'armor':
                        echo "rgba(0, 0, 180, 1)";
                        break;
                    case 'headwear':
                        echo "rgba(0, 0, 255, 1)";
                        break;
                    case 'gloves':
                        echo "rgba(0, 0, 120, 1)";
                        break;
                    case 'accessory':
                        echo "rgba(214, 202, 0, 1)";
                        break;
                    case 'consumable':
                        echo "rgba(0, 180, 0, 1)";
                        break;
                    case 'key item':
                        echo "rgba(180, 0, 180, 1)";
                        break;
                    case 'bag':
                        echo "rgba(180, 100, 0, 1)";
                        break;
                    case 'material':
                        echo "rgba(0, 180, 180, 1)";
                        break;
                    default:
                        echo "rgba(0, 0, 0, 1)";
                        break;
                }
                echo '">+</div>';
            echo '<div class="button" id="decrease-charge-'.$row['id'].'" onclick="decrease_charge('.$row['id'].')" style="background-color: ';
                switch ($row['type']) {
                    case 'misc':
                        echo "rgba(90, 90, 90, 1)";
                        break;
                    case 'weapon':
                        echo "rgba(180, 0, 0, 1)";
                        break;
                    case 'shield':
                        echo "rgba(0, 120, 180, 1)";
                        break;
                    case 'armor':
                        echo "rgba(0, 0, 180, 1)";
                        break;
                    case 'headwear':
                        echo "rgba(0, 0, 255, 1)";
                        break;
                    case 'gloves':
                        echo "rgba(0, 0, 120, 1)";
                        break;
                    case 'accessory':
                        echo "rgba(214, 202, 0, 1)";
                        break;
                    case 'consumable':
                        echo "rgba(0, 180, 0, 1)";
                        break;
                    case 'key item':
                        echo "rgba(180, 0, 180, 1)";
                        break;
                    case 'bag':
                        echo "rgba(180, 100, 0, 1)";
                        break;
                    case 'material':
                        echo "rgba(0, 180, 180, 1)";
                        break;
                    default:
                        echo "rgba(0, 0, 0, 1)";
                        break;
                }
                echo '">-</div>';
            echo '<div class="item-charges">';
                echo '<span class="item-charge" id="item-charge-'.$row['id'].'">'.$row['charges'].'</span>/
                <span class="item-charge-max" id="item-charge-max-'.$row['id'].'">'.$row['charges_max'].'</span>';
            echo '</div>';
            echo '<div class="button" id="increase-charge-'.$row['id'].'" onclick="increase_charge('.$row['id'].')" style="background-color: ';
                switch ($row['type']) {
                    case 'misc':
                        echo "rgba(90, 90, 90, 1)";
                        break;
                    case 'weapon':
                        echo "rgba(180, 0, 0, 1)";
                        break;
                    case 'shield':
                        echo "rgba(0, 120, 180, 1)";
                        break;
                    case 'armor':
                        echo "rgba(0, 0, 180, 1)";
                        break;
                    case 'headwear':
                        echo "rgba(0, 0, 255, 1)";
                        break;
                    case 'gloves':
                        echo "rgba(0, 0, 120, 1)";
                        break;
                    case 'accessory':
                        echo "rgba(214, 202, 0, 1)";
                        break;
                    case 'consumable':
                        echo "rgba(0, 180, 0, 1)";
                        break;
                    case 'key item':
                        echo "rgba(180, 0, 180, 1)";
                        break;
                    case 'bag':
                        echo "rgba(180, 100, 0, 1)";
                        break;
                    case 'material':
                        echo "rgba(0, 180, 180, 1)";
                        break;
                    default:
                        echo "rgba(0, 0, 0, 1)";
                        break;
                }
                echo '">+</div>';
        echo '</div>';
    echo "</div>";
    echo "<span class='item-description' id='item-description-".$row['id']."' onclick='hide_details()'>".$row['description']."</span>";
}
$conn->close();
?>