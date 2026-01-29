<?php
require "check_login_true.php";
require "php/header.php";
?>
    <title>Trade</title>
</head>
<body>
<div id=all class="trade-all">
    <?php require "php/navbar.php";?>
    <div>
	
    </div>
</div>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>



<?php require "php/js_options.php";?>
</script>
</body>
</html>
