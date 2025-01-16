<?php
require "check_login_true.php";
require "header.php"
?>
    <title>User options</title>
</head>
<body>
<div id='all'>
    <?php require "navbar.php";?>
    
</div>
</body>
<script src="default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="mobile.js"></script>';}?>
<script>

</script>
</html>