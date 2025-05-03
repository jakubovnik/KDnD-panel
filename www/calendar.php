<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Calendar</title>
</head>
<body id="all">
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <input type="date">
    

<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>



<?php require "php/js_options.php";?>
</script>
</body>
</html>