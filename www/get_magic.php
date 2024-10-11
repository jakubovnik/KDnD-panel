<?php
session_start();
require "dbconnect.php";
$sql = "SELECT * FROM kdnd.magic ORDER BY id";
$result = $conn->query($sql);
echo "<div id='magic-list-container'>";
echo "<table id='magic-list'>";
echo "<tr>";
    echo "<th>Name</th>";
    echo "<th>Origin</th>";
    echo "<th>Complexity</th>";
    echo "<th>Fail-rate</th>";
    echo "<th>Cast-time</th>";
echo "</tr>";

while($row = $result->fetch_assoc()){
    echo "<tr class='magic' id='magic-".$row['id']."'>";
        echo "<td class='magic-name' id='magic-name-".$row['id']."'>".$row['name']."</td>";
        echo "<td class='magic-origin' id='magic-origin-".$row['id']."'>".$row['origin']."</td>";
        echo "<td class='magic-complexity' id='magic-complexity-".$row['id']."'>".$row['complexity']."</td>";
        echo "<td class='magic-fail' id='magic-fail-".$row['id']."'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast' id='magic-cast-".$row['id']."'>".$row['cast_time']." t</td>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";
echo "<div id='magic-info-container'>";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
    echo "<div class='magic-info' id='magic-info-".$row['id']."'>";
        echo "<p>".$row['effects']."</p>";
        echo "<div class='magic-detail-info'>";
            echo "<p>".$row['limits']."</p>";
            echo "<p>".$row['rules']."</p>";
            echo "<p>".$row['other']."</p>";
        echo "</div>";
        echo "<p>".$row['tags']."</p>";
    echo "</div>";
}
echo "</div>";
$conn->close();
?>