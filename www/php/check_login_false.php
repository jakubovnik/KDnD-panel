<?php
    session_start();
    if(empty($_SESSION)){
        $_SESSION['logged'] = false;
    }
    if(!($_SESSION['logged'] == false)){
        header("Location: ../index.php");
        exit();
    }
?>