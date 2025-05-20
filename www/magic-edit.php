<?php
require "php/check_login_true.php";
require "php/check_admin.php";
require "php/header.php";
?>
    <title>Magic edit</title>
</head>
<body>
    <span id="message"></span>
    <?php require "php/navbar.php";?>
    <div id="edit-magic-container">
        <span id="edit-magic-id" onclick="clear_inputs()">-1</span>
        <div class="edit-magic-row" id="edit-magic-row-1">
            <input type="text" class="edit-magic-text" id="edit-magic-name">
            <input type="text" class="edit-magic-text" id="edit-magic-origin">
        </div>
        <div class="edit-magic-row" id="edit-magic-row-2">
            <input type="number" class="edit-magic-text" id="edit-magic-complexity">
            <input type="number" class="edit-magic-text" id="edit-magic-fail-rate">
            <input type="number" class="edit-magic-text" id="edit-magic-cast-time">
        </div>
        <div class="edit-magic-row" id="edit-magic-row-3">
            <textarea class="edit-magic-textarea" id="edit-magic-rules"></textarea>
            <textarea class="edit-magic-textarea" id="edit-magic-effects"></textarea>
            <textarea class="edit-magic-textarea" id="edit-magic-limits"></textarea>
        </div>
        <div class="edit-magic-row" id="edit-magic-row-4">
            <textarea class="edit-magic-textarea" id="edit-magic-tags"></textarea>
            <textarea class="edit-magic-textarea" id="edit-magic-other"></textarea>
        </div>
        <input type="checkbox" id="edit-magic-ismod">ismod
    </div>
    <div id="magic-all">
        <div id="magic-list-container">
            <table id="magic-list">
            </table>
        </div>
        <div id="magic-info-container">
            <div class='magic-info' id='magic-info-0'>
                <span>effects</span>
                <div class='magic-detail-info'>
                    <span>limits</span>
                    <span>rules</span>
                    <span>other</span>
                </div>
                <span>tags</span>
            </div>
        </div>
    </div>

<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

edit_magic_id = document.getElementById("edit-magic-id");
edit_magic_name = document.getElementById("edit-magic-name");
edit_magic_origin = document.getElementById("edit-magic-origin");
edit_magic_complexity = document.getElementById("edit-magic-complexity");
edit_magic_fail_rate = document.getElementById("edit-magic-fail-rate");
edit_magic_cast_time = document.getElementById("edit-magic-cast-time");
edit_magic_rules = document.getElementById("edit-magic-rules");
edit_magic_effects = document.getElementById("edit-magic-effects");
edit_magic_limits = document.getElementById("edit-magic-limits");
edit_magic_tags = document.getElementById("edit-magic-tags");
edit_magic_other = document.getElementById("edit-magic-other");
edit_magic_ismod = document.getElementById("edit-magic-ismod");

function clear_inputs(){
    edit_magic_id.innerHTML = "-1";
    edit_magic_name.value = "";
    edit_magic_origin.value = "";
    edit_magic_complexity.value = "";
    edit_magic_fail_rate.value = "";
    edit_magic_cast_time.value = "";
    edit_magic_rules.value = "";
    edit_magic_effects.value = "";
    edit_magic_limits.value = "";
    edit_magic_tags.value = "";
    edit_magic_other.value = "";
    edit_magic_ismod.checked = false;
}

var sort_type = "default";
function refresh_magic(){
    const magic_all = document.getElementById("magic-all"); //TODO: maybe put this in global vars?
    var request = new XMLHttpRequest();
    var posted_text = "sort=" + sort_type;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when refreshing the magic list", 1);
            }else{
                magic_all.innerHTML = this.responseText;
                
                display_message("Magic list refreshed", 0, 1000);
            }
        }
    };
    request.open("POST", "php/get_magic.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function set_magic_sorting(sort = "default"){
    sort_type = sort;
    refresh_magic();
}
refresh_magic();

</script>
</body>
</html>