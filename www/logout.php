<?php
    session_start();
    session_unset();
    $_SESSION['logged'] = false;
    header("Location: login.php");
?>