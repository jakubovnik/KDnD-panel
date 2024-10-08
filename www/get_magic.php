<?php
session_start();
require "dbconnect.php";
$sql = "SELECT * FROM kdnd.magic ORDER BY id";
$result = $conn->query($sql);

echo "<tr>";
    echo "<th>Name</th>";
    echo "<th>Origin</th>";
    echo "<th>Complexity</th>";
    echo "<th>Fail-rate</th>";
    echo "<th>Cast-time</th>";
echo "</tr>";

while($row = $result->fetch_assoc()){
    echo "<tr class='magic'>";
        echo "<td class='magic-name'>".$row['name']."</td>";
        echo "<td class='magic-origin'>".$row['origin']."</td>";
        echo "<td class='magic-complexity'>".$row['complexity']."</td>";
        echo "<td class='magic-fail'>".$row['fail_rate']."%</td>";
        echo "<td class='magic-cast'>".$row['cast_time']."t</td>";
    echo "</tr>";
}

$conn->close();
?>