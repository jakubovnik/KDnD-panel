<?php
if(session_status() === PHP_SESSION_NONE){
    session_start();
}
require "dbconnect.php";
$sql = "SELECT inventory.id, 
                inventory.name as item_name, 
		inventory.description,
		type.name as type_name
	FROM `inventory` 
	JOIN
	    type ON type.id=inventory.type_id
        WHERE is_deleted=0 AND
                is_equipped=1 AND
                character_id=".$_SESSION['cid'].
        " ORDER BY inventory.type_id";

$result = $conn->query($sql);
// while($row = $result->fetch_assoc()){
//     echo "<div id='equipped-item-".$row['id']."' class='equipped-item'>";
//         echo $row['item_name'];
//         echo "<div id='equipped-item-description-".$row['id']."' class='equipped-item-description'>";
//             echo $row['description'];
//         echo "</div>";
//     echo "</div>";
// }

?>
