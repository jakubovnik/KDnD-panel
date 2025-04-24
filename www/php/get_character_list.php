<?php
session_start();
require "dbconnect.php";
$sql = "SELECT 
            *
        FROM
            `character`";
$result = $conn->query($sql);
echo "
<tr>
    <th>ID</th>
    <th>NAME</th>
    <th>PASS</th>
    <th>AGE?</th>
    <th>CX</th>
    <th>DESC</th>
    <th>MONEY</th>
    <th>ROLE</th>
</tr>
";
while($row = $result->fetch_assoc()){
    echo "<tr>";
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['name']."</td>";
        echo "<td>".$row['password']."</td>";
        echo "<td>".$row['age']."</td>";
        echo "<td>".$row['circles']."</td>";
        echo "<td>"."[TODO]"."</td>";
        echo "<td>".$row['money']."</td>";
        echo "<td>".$row['role_id']."</td>";
    echo "</tr>";
}
$conn->close();
?>