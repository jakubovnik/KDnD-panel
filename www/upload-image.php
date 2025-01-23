<?php
require "php/check_login_true.php";
require "php/check_admin.php";
require "php/header.php";
?>
    <title>Upload image for character</title>
</head>
<body>
    <?php require "php/navbar.php";?>
    <form action="upload_image.php" method="post" enctype="multipart/form-data"> <!--upload form-->
        Select image to upload:
        <input type="file" name="imgUpload" id="imgUpload">
        <input type="text" name="descUpload" id="descUpload">
        <input type="submit" value="Upload Image" name="submit">
    </form>
</body>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

</script>
</html>