<?php
session_start();
if(!isset($_SESSION['extra_allowed'])){
    $_SESSION['extra_allowed'] = 0;
}
if($_SESSION['extra_allowed'] == 0){
    header("Location: ../index.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" type="image/x-icon" href="../images/d20.png">
</head>
<h1>bruh</h1>
</html>