<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Calendar</title>
</head>
<body id="all">
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <!-- NOTE: THIS CODE AND SITE ISNT EFFICIENT OR FAST AT ALL (but it doesnt really matter, since its not gonna be used often) -->
    <button onclick="send_data()">Save</button>
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
                    if($row2['id'] == $row1['id'] && $row2['character_id'] != $_SESSION['cid']){
                        $calendar_character_classes = "calendar-character";
                        $calendar_note_title = "";
                        if($row2['note'] != ""){
                            $calendar_character_classes = $calendar_character_classes." with-note";
                            $calendar_note_title = " title='".$row2['note']."'";
                        }
                        switch($row2['available']){
                            case "0":
                                $calendar_character_classes = $calendar_character_classes." red-text";
                                break;
                            case "1":
                                $calendar_character_classes = $calendar_character_classes." green-text";
                                break;
                            case "2":
                                $calendar_character_classes = $calendar_character_classes." blue-text";
                                break;
                        }
                        echo "<span class='".$calendar_character_classes."'".$calendar_note_title.">";
                            echo $row2['name'];
                        echo "</span>";
                    }
                }
                echo "</div>";
                $result2 = $conn->query($sql2);
                $available0 = "";
                $available1 = "";
                $available2 = "";
                $calendar_note = "";
                while($row2 = $result2->fetch_assoc()){
                    if($row2['character_id'] == $_SESSION['cid'] && $row2['id'] == $row1['id']){
                        switch ($row2['available']){
                            case "0":
                                $available0 = " selected";
                                break;
                            case "1":
                                $available1 = " selected";
                                break;
                            case "2":
                                $available2 = " selected";
                                break;
                        }
                        $calendar_note = $row2['note'];
                    }
                }
                echo "<select id='calendar-available-".$row1['id']."' class='calendar-available'>";
                    echo "<option value='0'".$available0.">NO</option>";
                    echo "<option value='1'".$available1.">YES</option>";
                    echo "<option value='2'".$available2.">MAYBE</option>";
                echo "</select>";
                echo "<input type='text' value='".$calendar_note."' id='calendar-note-".$row1['id']."' class='calendar-note'>";
                echo "</form>";
            }
            $conn->close();
        ?>
    </div>
    <?php
        if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
            echo "<button onclick='add_date()'>add</button>";
            echo "<button onclick='truncate_dates()'>CLEAR EVERYTHING</button>";
        }
    ?>
    <!-- <div id="testing"></div> -->

<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

forms = document.getElementsByClassName("calendar-row");
calendar_data_full = [];

function load_data(){
    calendar_data_full = [];
    for(let i = 0; i < forms.length; i++){
        calendar_data = [];
        calendar_data_id = ""+forms[i].getElementsByClassName("calendar-id")[0].value;
        calendar_data.push(calendar_data_id);
        calendar_data.push(""+document.getElementById("calendar-date-"+calendar_data_id).value);
        calendar_data.push(""+document.getElementById("calendar-available-"+calendar_data_id).value);
        calendar_data.push(""+document.getElementById("calendar-note-"+calendar_data_id).value);
        calendar_data_full.push(calendar_data);
    }
    // TODO: remove this, its just for testing
    // testing_text = "";
    // for(let i = 0; i < calendar_data_full.length; i++){
    //     for(let e = 0; e < calendar_data_full[i].length; e++){
    //         testing_text = testing_text + calendar_data_full[i][e] + "; ";
    //     }
    //     testing_text = testing_text+"<br>";
    // }
    // document.getElementById("testing").innerHTML = testing_text;
}
function truncate_dates(){
    var request = new XMLHttpRequest();
    var posted_text = "";
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully cleared the calendar");
                location.reload();
            }else if(this.responseText == "1"){
                display_message("something went wrong when clearing the calendar", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "php/clear_calendar.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function send_data(){
    load_data();
    var request = new XMLHttpRequest();
    var posted_text = "data="+encodeURIComponent(JSON.stringify(calendar_data_full));
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "0"){
                display_message("Successfully saved the calendar");
                location.reload();
            }else if(this.responseText == "1"){
                display_message("something went wrong with saving the calendar", 1);
            }else{
                display_message(this.responseText, 1);//Might return gibberish but not my problem :P
            }
        }
    };
    request.open("POST", "php/edit_calendar.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
new_id = -1;
function add_date(){
    document.getElementById("calendar-container").insertAdjacentHTML("beforeend",  
        "<form id='calendar-row-"+new_id+"' class='calendar-row'><input type='text' name='calendar-id' id='calendar-id-"+new_id+"' class='calendar-id' value='"+new_id+"'><input type='date' name='calendar-date' id='calendar-date-"+new_id+"' class='calendar-date' value='0000-00-00'><div id='calendar-characters-"+new_id+"' class='calendar-characters'></div><select id='calendar-available-"+new_id+"' class='calendar-available'><option value='0'>NO</option><option value='1'>YES</option><option value='2'>MAYBE</option></select><input type='text' id='calendar-note-"+new_id+"' class='calendar-note'></form>"
    );
    new_id = new_id - 1;
}
document.addEventListener("keydown", function (event) { // copied from chatgpt (but also improved by me (somewhat (i guess)))
    if (event.ctrlKey && event.key === "Enter") {
        event.preventDefault();
        send_data();
    }
});

<?php require "php/js_options.php";?>
</script>
</body>
</html>