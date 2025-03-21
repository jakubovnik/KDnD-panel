<?php
require "php/check_login_true.php";
require "php/header.php"
?>
    <title>User options</title>
</head>
<body>
<div id='all'>
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <?php
        if(!empty($_POST)){
            if(isset($_POST['options-form-inventory-refresh'])){
                if($_POST['options-form-inventory-refresh'] == ""){
                    $option_inventory_refresh = "60000";
                }else{
                    $option_inventory_refresh = $_POST['options-form-inventory-refresh'];
                }
            }else{
                $option_inventory_refresh = "60000";
            }
            if(isset($_POST['options-form-magic-refresh'])){
                if($_POST['options-form-magic-refresh'] == ""){
                    $option_magic_refresh = "60000";
                }else{
                    $option_magic_refresh = $_POST['options-form-magic-refresh'];
                }
            }else{
                $option_magic_refresh = "60000";
            }
            if(isset($_POST['options-form-show-message'])){
                $option_show_message = "1";
            }else{
                $option_show_message = "0";
            }
            require "php/dbconnect.php";
            $sql = "REPLACE INTO `options` (character_id, refresh_inventory, refresh_magic, show_message) ".
                    "VALUES ".
                        "(".$_SESSION['cid'].", '".
                        $option_inventory_refresh."', '".
                        $option_magic_refresh."', '".
                        $option_show_message."')";
            $conn->query($sql);
            $conn->close();
        }
    ?>
    <form action="" method="post" id="options-form">
        <input type="number" name="options-form-inventory-refresh" id="options-form-inventory-refresh" class="options-form-text" placeholder="Inventory refresh (in millisec)">
        <input type="number" name="options-form-magic-refresh" id="options-form-magic-refresh" class="options-form-text" placeholder="Magic list refresh (in millisec)">
        <label for="options-form-show-message">Show messages</label>
        <input type="checkbox" name="options-form-show-message" id="options-form-show-message" class="options-form-checkbox">
        <input type="submit" id="options-form-submit" value="Save">
    </form>
</div>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

</script>
</body>
</html>