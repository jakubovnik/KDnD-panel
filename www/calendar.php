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
                echo "<input type='text' name='calendar-id' id='calendar-id-".$row1['id']."' class='calendar-id' value='".$row1['id']."' readonly>";
                echo "<input type='date' name='calendar-date' id='calendar-date-".$row1['id']."' class='calendar-date' value='".$row1['date']."'";
                if($_SESSION['role'] != 1 || $_SESSION['edit-mode'] != 1){
                    echo " readonly";
                }echo ">";
                echo "<div id='calendar-characters-".$row1['id']."' class='calendar-characters'>";
                $result2 = $conn->query($sql2);
                while($row2 = $result2->fetch_assoc()){
                    if($row2['id'] == $row1['id']){
                        $calendar_character_classes = "calendar-character";
                        $calendar_note = "";
                        if($row2['note'] != ""){
                            $calendar_character_classes = $calendar_character_classes." with-note";
                            $calendar_note = " title='".$row2['note']."'";
                        }
                        echo "<span class='".$calendar_character_classes."'".$calendar_note.">";
                            echo $row2['name'];
                        echo "</span>";
                    }
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