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
            <span id="character-circles">Circles: <?php echo $_SESSION['circles']?></span>
            <span id="character-money">Muns: <?php echo $_SESSION['money']?></span>
        </div>
        <div id="secondary-info-box">
            <span id="character-age"><?php echo $_SESSION['age'] ?></span>
            <span id="character-role"><?php 
                require "dbconnect.php";
                $sql = "SELECT role.name FROM kdnd.role WHERE id=".$_SESSION['role'];
                $result = $conn->query($sql);
                while($row = $result->fetch_assoc()){
                    echo $row['name'];
                }
            ?></span>
        </div>
        <span id="character-description"><?php echo $_SESSION['description']?></span>
    </div>
</div>
</html>