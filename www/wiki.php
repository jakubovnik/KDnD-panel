<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Wiki</title>
</head>
<body id="all">
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <div id="wiki-search-box">
        <input type="text" placeholder="serach lore">
        <button>name</button>
    </div>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>
//TODO: add the button logic and make the lore name into a primary key in the database
</script>
</body>
</html>