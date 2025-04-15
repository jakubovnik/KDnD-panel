<?php
session_start();
$_SESSION['extra_allowed'] = 0;

if($_POST['cname'] == "epic" && $_POST['password'] == "musical"){
    $_SESSION['extra_allowed'] = 1;
    echo "3";
    exit;
}

require "dbconnect.php";
$sql = "SELECT * FROM `character` where `name` = '".$_POST['cname']."'";
$result = $conn->query($sql);
if ($result->num_rows == 1) {
    while($row = $result->fetch_assoc()){
        if($_POST['password'] == $row['password']){
            $_SESSION['cid'] = $row['id'];
            $_SESSION['cname'] = $row['name'];
            $_SESSION['role'] = $row['role_id'];
            $_SESSION['circles'] = $row['circles'];
            $_SESSION['description'] = $row['description'];
            $_SESSION['money'] = $row['money'];
            $_SESSION['age'] = $row['age'];
            $_SESSION['edit-mode'] = 0;
            $_SESSION['logged'] = true;
            if($_POST['mstyle'] == "true"){
                $_SESSION['style'] = "mobile-style.css";
            }else{
                $_SESSION['style'] = "style.css";
            }
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