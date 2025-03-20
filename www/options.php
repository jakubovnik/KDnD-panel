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
            if(isset($_POST['options-form-show-message'])){
                $show_message = "1";
            }else{
                $show_message = "0";
            }
            require "php/dbconnect.php";
            $sql = "REPLACE INTO `options` (character_id, refresh_inventory, refresh_magic, show_message) ".
                    "VALUES ".
                        "(".$_SESSION['cid'].", '".
                        $_POST['options-form-inventory-refresh']."', '".
                        $_POST['options-form-magic-refresh']."', '".
                        $show_message."')";
            $conn->query($sql);
            $conn->close();
        }
    ?>
    <form action="" method="post" id="options-form">
        <input type="text" name="options-form-inventory-refresh" id="options-form-inventory-refresh" class="options-form-text" placeholder="Inventory refresh (in millisec)">
        <input type="text" name="options-form-magic-refresh" id="options-form-magic-refresh" class="options-form-text" placeholder="Magic list refresh (in millisec)">
        <label for="options-form-show-message">Show messages</label>
        <input type="checkbox" name="options-form-show-message" id="options-form-show-message" class="options-form-checkbox">
        <input type="submit" id="options-form-submit" value="Save">
    </form>
</div>
</body>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

</script>
</html>