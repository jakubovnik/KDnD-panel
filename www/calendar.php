<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Calendar</title>
</head>
<body id="all">
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <div id="calendar-container">
        <?php
            require "php/dbconnect.php";
            $sql1 = "SELECT *
                    FROM `calendar`
                    ORDER BY `date`";
            $result1 = $conn->query($sql1);
            $sql2 = "SELECT 
                        character_calendar.calendar_id as id,
                        character_calendar.character_id,
                        character_calendar.available,
                        character_calendar.note,
                        character.name
                    FROM `character_calendar`
                    INNER JOIN `character`
                        ON character_calendar.character_id=character.id";
            while($row1 = $result1->fetch_assoc()){
                echo "<form id='calendar-row-".$row1['id']."' class='calendar-row'>";
                echo 
                echo "<input type='date' name='calendar-id' id='calendar-id-".$row1['id']."' value='".$row1['date']."'";
                if($_SESSION['role'] != 1 || $_SESSION['edit-mode'] != 1){
                    echo " readonly";
                }echo ">";
                echo "<div>";
                $result2 = $conn->query($sql2);
                while($row1 = $result2->fetch_assoc()){
                    echo "<span>";
                        echo
                    echo "</span>";
                }
                echo "</div>";
                echo "</form>";
            }
            $conn->close();
        ?>
    </div>

<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>



<?php require "php/js_options.php";?>
</script>
</body>
</html>