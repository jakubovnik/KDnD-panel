<?php
echo '<!DOCTYPE html>';
echo '<html lang="en">';
echo '<head>';
// echo '<meta name="viewport" content="user-scalable=no">'; // WEB ON PHONES CAN SUCK MY ASS, WHAT THE FUCK IS THIS SHIT. I DONT WANT YOUR DOGSHIT STUPID FUKIN DUMBASS AUTOZOOM
if(!isset($_SESSION['style'])){
    echo '    <link rel="stylesheet" href="style.css">';
}else{
    echo '    <link rel="stylesheet" href="'.$_SESSION['style'].'">';
}

echo '    <link rel="icon" type="image/x-icon" href="images/d20.png">';
/*
<?php
require "check_login_true.php";
require "header.php";
?>
    <title>title</title>
</head>
*/
?>