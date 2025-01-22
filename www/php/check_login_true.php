<?php
    session_start();
    if(empty($_SESSION)){
        $_SESSION['logged'] = false;
    }
    if(!($_SESSION['logged'] == true)){
        header("Location: ../login.php");
        exit();
    }
?>