<?php
require "php/check_login_true.php";
require "php/check_admin.php";
require "php/header.php";
?>
    <title>Admin links</title>
</head>
<body>
    <span id="message"></span>
    <?php require "php/navbar.php";?>
    <div id="admin-links-container">
        <a href="create-character.php">Create Character</a>
        <a href="upload-image.php">Upload Character Image</a>
        <a href="magic-edit.php">Magic Edit</a>
    </div>

<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>



<?php require "php/js_options.php";?>
</script>
</body>
</html>