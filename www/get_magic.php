<?php
session_start();
require "dbconnect.php";
$sql_default = "SELECT * FROM kdnd.magic";
if($_POST['sort'] == "default"){
    $sql_default = $sql_default." ORDER BY id";
}
$sql_learned = "SELECT magic.id, character_magic.character_id, character_magic.magic_name, character_magic.complexity, character_magic.fail_rate, character_magic.cast_time 
FROM kdnd.character_magic 
INNER JOIN kdnd.magic 
ON magic.name=character_magic.magic_name
WHERE character_id='".$_SESSION['cid']."'";
$magic_default = $conn->query($sql_default);
$magic_learned = $conn->query($sql_learned);


echo "<div id='magic-list-container'>";
echo "<table id='magic-list'>";
echo "<tr>";
    echo "<th>Name</th>";
    echo "<th>Origin</th>";
    echo "<th>Complexity</th>";
    echo "<th>Fail-rate</th>";
    echo "<th>Cast-time</th>";
    echo "<th>Learn magic</th>";
echo "</tr>";

while($row = $magic_learned->fetch_assoc()){//creating learned magic list
    echo "<tr class='magic learned-magic' id='magic-0".$row['id']."' onclick='reveal_details(".$row['id'].")'>";
        echo "<td class='magic-name' id='magic-name-0".$row['id']."'>".$row['magic_name']."</td>";
        echo "<td class='magic-origin' id='magic-origin-0".$row['id']."'>".$_SESSION['cname']."</td>";
        echo "<td class='magic-complexity' id='magic-complexity-0".$row['id']."'>".$row['complexity']."</td>";
        echo "<td class='magic-fail' id='magic-fail-0".$row['id']."'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast' id='magic-cast-0".$row['id']."'>".$row['cast_time']." t</td>";
        echo "<td class='magic-learn' id='magic-learn-0".$row['id']."' onclick='reveal_learn_magic(".$row['id'].")'>";
            echo "<img src='images/d20.png' alt='learn magic' class='magic-learn-button' title='Learn this magic'>";
        echo "</td>";
    echo "</tr>";
}
while($row = $magic_default->fetch_assoc()){//creating default magic list
    echo "<tr class='magic' id='magic-".$row['id']."' onclick='reveal_details(".$row['id'].")'>";
        echo "<td class='magic-name' id='magic-name-".$row['id']."'>".$row['name']."</td>";
        echo "<td class='magic-origin' id='magic-origin-".$row['id']."'>".$row['origin']."</td>";
        echo "<td class='magic-complexity' id='magic-complexity-".$row['id']."'>".$row['complexity']."</td>";
        echo "<td class='magic-fail' id='magic-fail-".$row['id']."'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast' id='magic-cast-".$row['id']."'>".$row['cast_time']." t</td>";
        echo "<td class='magic-learn' id='magic-learn-".$row['id']."' onclick='reveal_learn_magic(".$row['id'].")'>";
            echo "<img src='images/d20.png' alt='learn magic' class='magic-learn-button' title='Learn this magic'>";
        echo "</td>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";
echo "<div id='magic-info-container' onclick='hide_details()'>";
$magic_default = $conn->query($sql_default);
while($row = $magic_default->fetch_assoc()){
    echo "<div class='magic-info' id='magic-info-".$row['id']."'>";
        echo "<div class='magic-detail-info'>";
            echo "<span class='magic-detail-name'>".$row['name']."</span>";
            echo "<span class='magic-detail-effects'>".$row['effects']."</span>";
        echo "</div>";
        echo "<div class='magic-detail-info'>";
            echo "<span class='magic-detail-limits'>".$row['limits']."</span>";
            echo "<span class='magic-detail-rules'>".$row['rules']."</span>";
            echo "<span class='magic-detail-other'>".$row['other']."</span>";
        echo "</div>";
        echo "<div class='magic-detail-info'>";
            echo "<span class='magic-detail-stats'>CX:".$row['complexity']."\nFR:".$row['fail_rate']."\nCT:".$row['cast_time']."</span>";
            echo "<span class='magic-detail-tags'>".$row['tags']."</span>";
        echo "</div>";
    echo "</div>";
}
echo "</div>";
$conn->close();
?>