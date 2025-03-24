<?php
session_start();
if($_SESSION['role'] != "1"){
    echo "1";
    exit;
}
if($_SESSION['edit-mode'] == 1){
    $_SESSION['edit-mode'] = 0;
}else{
    $_SESSION['edit-mode'] = 1;
}
echo "0";
?>