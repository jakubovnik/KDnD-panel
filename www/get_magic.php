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
    echo "<tr class='magic' id='magic-".$row['id']."' onclick='reveal_details(".$row['id'].")'>";
        echo "<td class='magic-name' id='magic-name-".$row['id']."'>".$row['name']."</td>";
        echo "<td class='magic-origin' id='magic-origin-".$row['id']."'>".$row['origin']."</td>";
        echo "<td class='magic-complexity' id='magic-complexity-".$row['id']."'>".$row['complexity']."</td>";
        echo "<td class='magic-fail' id='magic-fail-".$row['id']."'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast' id='magic-cast-".$row['id']."'>".$row['cast_time']." t</td>";
    echo "</tr>";
}
echo "</table>";
echo "</div>";
echo "<div id='magic-info-container' onclick='hide_details()'>";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
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
            echo "<span class='magic-detail-tags'>".$row['tags']."</span>";
        echo "</div>";
    echo "</div>";
}
echo "</div>";
$conn->close();
?>