<?php
echo '<!DOCTYPE html>';
echo '<html lang="en">';
echo '<head>';
if(!isset($_SESSION['style'])){
    echo '    <link rel="stylesheet" href="../css/style.css">';
}else{
    echo '<meta name="viewport" content="width=device-width, user-scalable=no">'; // WEB ON PHONES CAN SUCK MY ASS, WHAT THE FUCK IS THIS SHIT. I DONT WANT YOUR DOGSHIT STUPID FUKIN DUMBASS AUTOZOOM
    echo '    <link rel="stylesheet" href="../css/'.$_SESSION['style'].'?">';
}
echo '    <link rel="icon" type="image/x-icon" href="../images/d20.png">';
/*
<?php
require "check_login_true.php";
require "php/header.php";
?>
    <title>title</title>
</head>
*/
?>