<?php
session_start(); 
if($_SESSION['role'] != 1){
    echo "1";
    exit; //TODO: test this thing (admin privelage check)
}
require "dbconnect.php";
if($_POST['id'] == "-1"){
    $table_id_name = "";
    $table_id_value = "";
}else{
    $table_id_name = ", `id`";
    $table_id_value = ", '".$_POST['id']."'";
}

$sql = "REPLACE INTO `magic` (`name`, `origin`, `complexity`, `fail_rate`, `cast_time`, `rules`, `effects`, `limits`, `other`, `tags`, `is_mod`$table_id_name) 
VALUES
('".$_POST['name']."',
'".$_POST['origin']."',
'".$_POST['complexity']."',
'".$_POST['fail_rate']."',
'".$_POST['cast_time']."',
'".urldecode($_POST['rules'])."',
'".urldecode($_POST['effects'])."',
'".urldecode($_POST['limits'])."',
'".urldecode($_POST['other'])."',
'".urldecode($_POST['tags'])."',
'".$_POST['ismod']."'$table_id_value);";
if($conn->query($sql) === TRUE){
    echo "0";
}else{
    echo "1";
}
$conn->close();
?>