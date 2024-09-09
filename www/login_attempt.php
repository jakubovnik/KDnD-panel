<?php
session_start();
require "dbconnect.php";
$sql = "SELECT * FROM kdnd.character where name = '".$_POST['cname']."'";
$result = $conn->query($sql);
if ($result->num_rows == 1) {
    while($row = $result->fetch_assoc()){
        if($_POST['password'] == $row['password']){
            $_SESSION['cid'] = $row['id'];
            $_SESSION['cname'] = $row['name'];
            $_SESSION['role'] = $row['role_id'];
            $_SESSION['logged'] = true;
            echo "0";
        }else{
            echo "2";
        }
    }
}else{
    echo "1";
}
$conn->close();
?>