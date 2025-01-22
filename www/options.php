<?php
require "php/check_login_true.php";
require "php/header.php"
?>
    <title>User options</title>
</head>
<body>
<div id='all'>
    <?php require "php/navbar.php";?>
    
</div>
</body>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

</script>
</html>