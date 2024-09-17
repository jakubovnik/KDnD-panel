<?php
require "check_login_true.php";
require "header.php";
?>
    <title>Home</title>
</head>
<div id="all">
    <?php require "navbar.php";?>
    <div id="character-sheet">
        <div id="main-info-box">
            <!-- add image later -->
            <span id="character-name"><?php echo $_SESSION['cname']?></span>
            <span id="character-circles"><?php echo $_SESSION['circles']?></span>
            <span id="character-money"><?php echo $_SESSION['money']?></span>
        </div>
    </div>
</div>
</html>