<?php
echo '<div id="navbar">';
echo '<a href="index.php">Home</a>';
echo '<a href="inventory.php">Inventory</a>';
echo '<a href="magic-list.php">Magic List</a>';
echo '<span>logged in as ';
echo $_SESSION['cname'];
echo '</span>';
echo '<a href="logout.php">logout</a>';
echo '</div>';
?>