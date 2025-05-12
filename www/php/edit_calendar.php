<?php
session_start(); 
if($_SESSION['role'] != 1){
    echo "1";
    exit; //TODO: test this thing (admin privelage check)
}
require "dbconnect.php";
$data = json_decode($_POST['data'], true); // dunno if the true is nescessary since its not an assoc array


if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
    $sql = "SELECT * FROM `calendar` ORDER BY id";
    $result = $conn->query($sql);
    $sql = "";
    $existing_rows = array();
    while($row = $result->fetch_assoc()){
        array_push($existing_rows, "".$row['id']);
    }
    for($i = 0; $i < count($data); $i++){
        if(in_array("".$data[$i][0], $existing_rows)){
            $sql = $sql."
                UPDATE `calendar`
                SET `date`='".$data[$i][1]."'
                WHERE `id`=".$data[$i][0]."; 
            ";
        }else{
            $sql = $sql."
                INSERT INTO `calendar` (`date`)
                VALUES ('".$data[$i][1]."'); 
            ";
        }
    }
    if ($conn->multi_query($sql)) {
        do {
            // Optional: check for result set and free it
            if ($result = $conn->store_result()) {
                $result->free();
            }
            // Go to next result
        } while ($conn->more_results() && $conn->next_result());
    } else {
        echo "Multi-query failed: " . $conn->error;
    }
}
$sql = "SELECT * FROM `character_calendar` WHERE `character_id`=".$_SESSION['cid'];
$result = $conn->query($sql);
$existing_rows = array();
while($row = $result->fetch_assoc()){
    array_push($existing_rows, "".$row['calendar_id']);
}
$sql = "";
for($i = 0; $i < count($data); $i++){
    if(in_array("".$data[$i][0], $existing_rows)){
        $sql = $sql."
            UPDATE `character_calendar`
            SET `available`='".$data[$i][2]."', `note`='".$data[$i][3]."' 
            WHERE `calendar_id`='".$data[$i][0]."' AND `character_id`=".$_SESSION['cid']."; 
        ";
    }else{
        $sql = $sql."
            INSERT INTO `character_calendar` (`character_id`, `calendar_id`, `available`, `note`)
            VALUES (".$_SESSION['cid'].", ".$data[$i][0].", ".$data[$i][2].", '".$data[$i][3]."'); 
        ";
    }
}
if ($conn->multi_query($sql)) {
    do {
        // Optional: check for result set and free it
        if ($result = $conn->store_result()) {
            $result->free();
        }
        // Go to next result
    } while ($conn->more_results() && $conn->next_result());
} else {
    echo "Multi-query failed: " . $conn->error;
}

echo "0";
$conn->close();
?>