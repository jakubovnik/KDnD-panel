<?php
session_start();
require "dbconnect.php";
$sql_default = "SELECT * FROM `magic`";
if($_POST['sort'] == "default"){
    $sql_default = $sql_default." ORDER BY id";
}else{
    $sql_default = $sql_default." ORDER BY ".$_POST['sort'];
}
$sql_learned = "SELECT magic.id, magic.origin, character_magic.character_id, character_magic.magic_name, character_magic.complexity, character_magic.fail_rate, character_magic.cast_time 
FROM `character_magic` 
INNER JOIN `magic` 
ON magic.name=character_magic.magic_name
WHERE character_id='".$_SESSION['cid']."'";
$magic_default = $conn->query($sql_default);
$magic_learned = $conn->query($sql_learned);


echo "<div id='magic-list-container'>";
echo "<table id='magic-list'>";
echo "<tr class='heading-magic'>";
    echo "<th onclick='set_magic_sorting(\"name\")'>Name</th>";
    echo "<th onclick='set_magic_sorting(\"origin\")'>Origin</th>";
    if($_SESSION['style'] == "mobile-style.css"){
        echo "<th onclick='set_magic_sorting(\"complexity\")'><img class='magic-list-icon' src='../images/complexity.png' alt='complexity image' title='Complexity'></th>";
        echo "<th onclick='set_magic_sorting(\"fail_rate\")'><img class='magic-list-icon' src='../images/warning.png' alt='fail rate image' title='Fail rate'></th>";
        echo "<th onclick='set_magic_sorting(\"cast_time\")'><img class='magic-list-icon' src='../images/time.png' alt='cast time image' title='Cast time'></th>";
        echo "<th><img class='magic-list-icon' src='../images/learning.png' alt='learn magic image' title='Learn magic'></th>";
    }else{
        echo "<th onclick='set_magic_sorting(\"complexity\")'>Complexity</th>";
        echo "<th onclick='set_magic_sorting(\"fail_rate\")'>Fail-rate</th>";
        echo "<th onclick='set_magic_sorting(\"cast_time\")'>Cast-time</th>";
        echo "<th>Learn magic</th>";
    }
echo "</tr>";

while($row = $magic_learned->fetch_assoc()){//creating learned magic list
    echo "<tr class='magic learned-magic' id='magic-0".$row['id']."'>";
        echo "<td class='magic-name magic-text' id='magic-name-0".$row['id']."' onclick='reveal_details(".$row['id'].")'>".$row['magic_name']."</td>";
        echo "<td class='magic-origin magic-text' id='magic-origin-0".$row['id']."'>".$row['origin']."</td>";
        echo "<td class='magic-complexity magic-text' id='magic-complexity-0".$row['id']."'>".$row['complexity']."</td>";
        echo "<td class='magic-fail magic-text' id='magic-fail-0".$row['id']."'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast magic-text' id='magic-cast-0".$row['id']."'>".$row['cast_time']." t</td>";
        echo "<td class='magic-learn' id='magic-learn-0".$row['id']."' onclick='reveal_learn_magic(".$row['id'].")'>";
            echo "<img src='../images/idea_2.png' alt='learn magic' class='magic-learn-button' title='Learn this magic'>";
        echo "</td>";
    echo "</tr>";
}
while($row = $magic_default->fetch_assoc()){//creating default magic list
    echo "<tr class='magic' id='magic-".$row['id']."'>";
        echo "<td class='magic-name magic-text' id='magic-name-".$row['id']."' onclick='reveal_details(".$row['id'].")'>".$row['name']."</td>";
        echo "<td class='magic-origin magic-text' id='magic-origin-".$row['id']."'>".$row['origin']."</td>";
        echo "<td class='magic-complexity magic-text' id='magic-complexity-".$row['id']."'>".$row['complexity']."</td>";
        echo "<td class='magic-fail magic-text' id='magic-fail-".$row['id']."'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast magic-text' id='magic-cast-".$row['id']."'>".$row['cast_time']." t</td>";
        echo "<td class='magic-learn' id='magic-learn-".$row['id']."' onclick='reveal_learn_magic(".$row['id'].")'>";
            echo "<img src='../images/idea_1.png' alt='learn magic' class='magic-learn-button' title='Learn this magic'>";
        echo "</td>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";
echo "<div id='magic-info-container' onclick='hide_details()'>";
$magic_default = $conn->query($sql_default);
while($row = $magic_default->fetch_assoc()){//creating info elements
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
            echo "<span class='magic-detail-stats'>CX: ".$row['complexity']." c\nFR: ".$row['fail_rate']."%\nCT: ".$row['cast_time']." t</span>";
            echo "<span class='magic-detail-tags'>".$row['tags']."</span>";
        echo "</div>";
    echo "</div>";
}
echo "</div>";
$conn->close();
?>