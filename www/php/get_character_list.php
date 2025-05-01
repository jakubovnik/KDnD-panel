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
    <th id='character-list-heading-id'>ID</th>
    <th id='character-list-heading-name'>NAME</th>
    <th id='character-list-heading-password'>PASS</th>
    <th id='character-list-heading-age'>AGE?</th>
    <th id='character-list-heading-complexity'>CX</th>
    <th id='character-list-heading-description'>DESC</th>
    <th id='character-list-heading-money'>MONEY</th>
    <th id='character-list-heading-role-id'>ROLE</th>
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