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
    echo "<tr class='character-list-row' onclick='edit_character(".$row['id'].")'>";
        echo "<td class='character-list-id'>".$row['id']."</td>";
        echo "<td class='character-list-name' id='character-list-name-".$row['id']."'>".$row['name']."</td>";
        echo "<td class='character-list-password' id='character-list-password-".$row['id']."'>".$row['password']."</td>";
        echo "<td class='character-list-age' id='character-list-age-".$row['id']."'>".$row['age']."</td>";
        echo "<td class='character-list-circles' id='character-list-circles-".$row['id']."'>".$row['circles']."</td>";
        echo "<td class='character-list-description' id='character-list-description-".$row['id']."'>".$row['description']."</td>";
        echo "<td class='character-list-money' id='character-list-money-".$row['id']."'>".$row['money']."</td>";
        echo "<td class='character-list-role-id' id='character-list-role-id-".$row['id']."'>".$row['role_id']."</td>";
    echo "</tr>";
}
$conn->close();
?>