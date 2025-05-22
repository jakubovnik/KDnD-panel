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
        <input type="checkbox" id="edit-magic-ismod">ismod?
        <div class="edit-magic-row" id="edit-magic-row-5">
            <div>
                <input type="text" id="search-magic-input">
                <button id="search-magic-type-button" onclick="switch_button()">name</button>
            </div>
            <button id="edit-magic-button" onclick="edit_magic()">Save</button>
        </div>
    </div>
    <div id="magic-all">
    </div>

<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>

search_input = document.getElementById("search-magic-input");
search_type_button = document.getElementById("search-magic-type-button");

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

function load_data(id){
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    edit_magic_id.innerHTML = ""+id;
    edit_magic_name.value = document.getElementById("magic-name-"+id).innerHTML;
    edit_magic_origin.value = document.getElementById("magic-origin-"+id).innerHTML;
    edit_magic_complexity.value = document.getElementById("magic-complexity-"+id).innerHTML;
    edit_magic_fail_rate.value = document.getElementById("magic-fail-"+id).innerHTML.slice(0,-1);
    edit_magic_cast_time.value = document.getElementById("magic-cast-"+id).innerHTML.slice(0,-2);
    edit_magic_rules.value = document.getElementById("magic-rules-"+id).innerHTML;
    edit_magic_effects.value = document.getElementById("magic-effects-"+id).innerHTML;
    edit_magic_limits.value = document.getElementById("magic-limits-"+id).innerHTML;
    edit_magic_tags.value = document.getElementById("magic-tags-"+id).innerHTML;
    edit_magic_other.value = document.getElementById("magic-other-"+id).innerHTML;
    if(document.getElementById("magic-ismod-"+id).innerHTML == "0"){
        edit_magic_ismod.checked = false;
    }else{
        edit_magic_ismod.checked = true;
    }
}

function check_inputs(){
    if(edit_magic_name.value == ""){
        display_message("Name cannot be empty", 1);
        return 1;
    }
    if(edit_magic_origin.value == ""){
        display_message("Origin cannot be empty", 1);
        return 1;
    }
    if(edit_magic_complexity.value == ""){
        display_message("Complexity cannot be empty", 1);
        return 1;
    }
    if(edit_magic_fail_rate.value == ""){
        display_message("Fail rate cannot be empty", 1);
        return 1;
    }
    if(edit_magic_cast_time.value == ""){
        display_message("Cast time cannot be empty", 1);
        return 1;
    }
    if(edit_magic_rules.value == ""){
        display_message("Rules cannot be empty (at least put a dash)", 1);
        return 1;
    }
    if(edit_magic_effects.value == ""){
        display_message("Effects cannot be empty (at least put a dash)", 1);
        return 1;
    }
    if(edit_magic_limits.value == ""){
        display_message("limits cannot be empty (at least put a dash)", 1);
        return 1;
    }
    if(edit_magic_tags.value == ""){
        display_message("Tags cannot be empty (at least input a magic-system tag)", 1);
        return 1;
    }
    if(edit_magic_other.value == ""){
        display_message("Other info cannot be empty (at least put a dash)", 1);
        return 1;
    }
    return 0;
}

function edit_magic_attempt(id, name, origin, complexity, fail_rate, cast_time, rules, effects, limits, other, tags, ismod){
    var request = new XMLHttpRequest();
    var posted_text = "id=" + id + 
                    "&name=" + name + 
                    "&origin=" + origin + 
                    "&complexity=" + complexity + 
                    "&fail_rate=" + fail_rate + 
                    "&cast_time=" + cast_time +
                    "&rules=" + encodeURIComponent(rules) +
                    "&effects=" + encodeURIComponent(effects) +
                    "&limits=" + encodeURIComponent(limits) +
                    "&other=" + encodeURIComponent(other) +
                    "&tags=" + encodeURIComponent(tags) +
                    "&ismod=" + ismod;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when updating the magic", 1);
            }else if(this.responseText == "0"){
                display_message("magic \""+name+"\" updated");
                clear_inputs();
                refresh_magic();
            }else{
                display_message(this.responseText, 1); // again, might return gibberish
            }
        }
    };
    request.open("POST", "php/edit_magic.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}

function edit_magic(){
    if(check_inputs()){return;}
    if(edit_magic_id.innerHTML != "-1"){
        if(!window.confirm("Overwrite existing magic?")){return;}
    }
    if(edit_magic_ismod.checked == true){
        ismod_value = "1";
    }else{
        ismod_value = "0";
    }
    edit_magic_attempt(
        edit_magic_id.innerHTML,
        edit_magic_name.value,
        edit_magic_origin.value,
        edit_magic_complexity.value,
        edit_magic_fail_rate.value,
        edit_magic_cast_time.value,
        edit_magic_rules.value,
        edit_magic_effects.value,
        edit_magic_limits.value,
        edit_magic_other.value,
        edit_magic_tags.value,
        ismod_value
    );
}


var sort_type = "name";
function refresh_magic(){
    const magic_all = document.getElementById("magic-all"); //TODO: maybe put this in global vars?
    var request = new XMLHttpRequest();
    var posted_text = "sort=" + sort_type + "&edit=true" + "&search=" + search_input.value + "&type=" + search_type_button.innerHTML;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when refreshing the magic list", 1);
            }else{
                magic_all.innerHTML = this.responseText;
            }
        }
    };
    request.open("POST", "php/get_magic.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function set_magic_sorting(sort = "name"){
    sort_type = sort;
    refresh_magic();
}
refresh_magic();

function switch_button(){
    if(search_type_button.innerHTML == "name"){
        search_type_button.innerHTML = "origin";
    }else if(search_type_button.innerHTML == "origin"){
        search_type_button.innerHTML = "tags";
    }else if(search_type_button.innerHTML == "tags"){
        search_type_button.innerHTML = "name";
    }
    refresh_magic();
}
fetchMagicTimeout = setTimeout(refresh_magic, 1);
search_input.addEventListener('keyup', () => {
    clearTimeout(fetchMagicTimeout);
    fetchMagicTimeout = setTimeout(refresh_magic, 300);
});

document.addEventListener("keydown", function (event) { // copied from chatgpt (but also improved by me (somewhat (i guess)))
    if (event.ctrlKey && event.key === "Enter") {
        event.preventDefault();
        edit_magic();
    }
});
<?php require "php/js_options.php";?>
</script>
</body>
</html>