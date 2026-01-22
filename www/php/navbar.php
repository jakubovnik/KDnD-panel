<?php
if($_SESSION['style'] == "mobile-style.css"){
    echo '<div id="navbar-button">';
    echo '<img src="../images/menu-bar.png" alt="Navbar show button" id="navbar-button-image" onclick="toggle_navbar()">';
    echo '</div>';
}
echo '<div id="navbar" class="hidden">';
echo '<a href="index.php">Home</a>';
echo '<a href="inventory.php">Inventory</a>';
echo '<a href="magic-list.php">Magic List</a>';
echo '<a href="wiki.php">Lore Wiki</a>';
echo '<a href="calendar.php">Calendar</a>';
echo '<a href="options.php">Options</a>';
if($_SESSION['role'] == 1){
    echo '<a href="admin-links.php">Admin Links</a>';
}
echo '<span>logged in as ';
    echo $_SESSION['cname'];
echo '</span>';
if($_SESSION['role'] == 1 && isset($_SESSION['edit-mode'])){
    if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
        echo '<img src="images/edit.png" alt="edit switch" title="switch edit mode (currently editing)" id="admin-edit-switch" onclick="switch_edit_mode()">';
    }else{
        echo '<img src="images/book.png" alt="edit switch" title="switch edit mode (currently reading)" id="admin-edit-switch" onclick="switch_edit_mode()">';
    }
}
echo '<a href="php/logout.php">logout</a>';
echo '</div>';

// Messages --------------------------------- Messages
echo '<span id="messages"></span>';

?>
