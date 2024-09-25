<?php
require "check_login_true.php";
require "header.php";
?>
    <title>Upload image for character</title>
</head>
<body>
    <?php require "navbar.php";?>
    <form action="upload_image.php" method="post" enctype="multipart/form-data"> <!--upload forma-->
        Select image to upload:
        <input type="file" name="imgUpload" id="imgUpload">
        <input type="text" name="descUpload" id="descUpload">
        <input type="submit" value="Upload Image" name="submit">
    </form>
</body>