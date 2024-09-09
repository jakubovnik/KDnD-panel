<?php
require "check_login_true.php";
require "header.php";
?>
    <title>Character's inventory</title>
</head>
<body>
<div id="all">
    <?php require "navbar.php";?>
    <div id="inventory">
        <?php
        require "dbconnect.php";
        $sql = "SELECT inventory.id, inventory.name, type.name as type, inventory.amount, inventory.charges, inventory.charges_max, inventory.description 
            FROM kdnd.inventory INNER JOIN kdnd.type ON inventory.type_id=type.id 
            WHERE inventory.character_id=".$_SESSION['cid'];
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()){
            echo "<div class='item-box' onclick='reveal_details(".$row['id'].")'>";
            echo "<span class='item-name' id='item-name-".$row['id']."'>".$row['name']."</span>";
            echo "<span class='item-type' id='item-type-".$row['id']."'>".$row['type']."</span>";
            echo "<span class='item-description' id='item-description-".$row['id']."'>".$row['description']."</span>";
            echo "</div>";
        }
        ?>
    </div>
</div>
</body>
</html>
<script>
var shown_id = 0;
function reveal_details(id){
    if(shown_id != 0){
        document.getElementById("item-description-"+shown_id).style.display = "none";
    }
    document.getElementById("item-description-"+id).style.display = "block";
    shown_id = id;
}
</script>