<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Wiki</title>
</head>
<body id="all">
    <?php require "php/navbar.php";?>
    <div id="wiki-data">
        <?php
            require "php/dbconnect.php";
            if(isset($_GET['s'])){
                $searched_lore = $_GET['s'];
            }else{
                $searched_lore = "KDnD";
            }
            $sql = "SELECT * FROM `wiki` WHERE `name`='".$searched_lore."';";
            $result = $conn->query($sql);
            if($result->num_rows > 0){
                $row = $result->fetch_assoc();
            }
            if(isset($row)){
                if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                    echo "<span id='wiki-id' style='display:none;'>".$row['id']."</span>";
                    echo '<input type="text" id="wiki-name" class="wiki-text-field" value="'.$row['name'].'">';
                    echo "<input type='text' id='wiki-tags' class='wiki-text-field' value='".$row['tags']."'>";
                    echo "<select id='wiki-access' class='wiki-text-field'>";
                        $sql = "SELECT * FROM `role` ORDER BY id";
                        $result = $conn->query($sql);
                        while($raw = $result->fetch_assoc()){
                            echo '<option value="'.$raw['id'].'"';
                            if($raw['id'] == $row['access']){
                                echo ' selected';
                            }
                            echo '>'.$raw['name'].'</option>';
                        }
                    echo "</select>";
                    echo "<input type='text' id='wiki-exceptions' class='wiki-text-field' value='".$row['exceptions']."'>";
                    echo '<button id="wiki-save-button" class="wiki-text-field" onclick="edit_wiki()">save</button>';
                    echo '<a id="wiki-new-button" class="wiki-text-field" href="?s=">+</a>';
                }else{
                    echo "<span id='wiki-id' style='display:none;'>".$row['id']."</span>";
                    echo '<span id="wiki-name" class="wiki-text-field">'.$row['name'].'</span>';
                    echo "<span id='wiki-tags' class='wiki-text-field' title='".$row['tags']."'>".$row['tags']."</span>";
                }
            }else{
                if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                    echo "<span id='wiki-id' style='display:none;'></span>";
                    if(isset($_GET['s'])){
                        echo '<input type="text" id="wiki-name" class="wiki-text-field" value="'.$_GET['s'].'">';
                    }else{
                        echo '<input type="text" id="wiki-name" class="wiki-text-field" value="Name">';
                    }
                    echo "<input type='text' id='wiki-tags' class='wiki-text-field' value='#unfinished'>";
                    echo "<select id='wiki-access' class='wiki-text-field'>";
                        $sql = "SELECT * FROM `role` ORDER BY id";
                        $result = $conn->query($sql);
                        while($raw = $result->fetch_assoc()){
                            echo '<option value="'.$raw['id'].'"';
                            if($raw['id'] == "1"){
                                echo ' selected';
                            }
                            echo '>'.$raw['name'].'</option>';
                        }
                    echo "</select>";
                    echo "<input type='text' id='wiki-exceptions' class='wiki-text-field' value=';'>";
                    echo '<button id="wiki-save-button" class="wiki-text-field" onclick="edit_wiki()">save</button>';
                    echo '<a id="wiki-new-button" class="wiki-text-field" href="?s=">+</a>';
                }else{
                    echo "<span id='wiki-id' style='display:none;'></span>";
                    echo '<span id="wiki-name" class="wiki-text-field">Not found</span>';
                    echo "<span id='wiki-tags' class='wiki-text-field'>#BLANK</span>";
                }
            }
            $conn->close();
        ?>
    </div>
    <div id="wiki">
        <div id="wiki-content">
            <?php
                if(isset($row)){
                    $spoiler = 0;
                    if($_SESSION['role'] > $row['access']){
                        if(strpos($row['exceptions'], ";".$_SESSION['cname'].";") === FALSE){
                            $spoiler = 1;
                        }
                    }
                    if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                        echo "<textarea id='wiki-content-edit'>".$row['content']."</textarea>";
                    }elseif($spoiler == 0){
                        echo $row['content']; // TODO: add images of character here (if the lore is about a character and if there are any images), also add links to follow-up lore
                    }else{
                        echo "YOOOOOO ur, like, fr not supposed to be here. This page contains, like, soooo many spoilers <br>O_O<br> oooOOOOOooooo scaaary.<br>
                        Anyways, here's our lord and saviour, the almighty Kasane Teto:<br>
                        <a href='https://youtu.be/vx4iWiDQOuk?si=470sf7WY8q7f3OTG&t=30'><img src='images/teto-fumo.gif' style='width: 100%; height:auto;'></a>";
                    }
                }else{
                    if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                        echo "<textarea id='wiki-content-edit'></textarea>";
                    }else{
                        echo "something went wrong (search failed, the lore doesnt exist or it has spoilers o_o)";
                    }
                }
            ?>
        </div>
        <div id="lore-search-button">
            <img src="images/search.png" alt="mobile search button" id="lore-search-button-image" onclick="toggle_lore_list()">
        </div>
        <div id="lore-list-container">
            <div id="lore-search-box">
                <input type="text" placeholder="serach lore" id="search-lore-input" class='wiki-text-field'>
                <button id="search-lore-type-button" class='wiki-text-field' onclick="switch_button()">name</button>
            </div>
            <div id="lore-list"></div>
        </div>
    </div>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>
lore_list = document.getElementById("lore-list");
lore_list_container = document.getElementById("lore-list-container");
search_input = document.getElementById("search-lore-input");
search_type_button = document.getElementById("search-lore-type-button");
lore_list_container_visible = 0;
function toggle_lore_list(){
    if(lore_list_container_visible == 0){
        lore_list_container.style.width = "100vw";
        lore_list_container_visible = 1;
        search_input.focus();
    }else{
        lore_list_container.style.width = "0vw";
        lore_list_container_visible = 0;
    }
}
function fetch_lore_list(){
    var request = new XMLHttpRequest();
    var posted_text = "search=" + search_input.value + "&type=" + search_type_button.innerHTML;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when fetching lore", 1);
            }else{
                lore_list.innerHTML = this.responseText;
            }
        }
    };
    request.open("POST", "php/get_lore_list.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function edit_wiki_attempt(name, content, tags, access, exceptions, id="-1"){
    var request = new XMLHttpRequest();
    var posted_text = "name=" + name + 
                    "&content=" + encodeURIComponent(content) + 
                    "&tags=" + tags + 
                    "&access=" + access + 
                    "&exceptions=" + exceptions +
                    "&id=" + id;
    request.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            if(this.responseText == "1"){
                display_message("something went wrong when updating wiki", 1);
            }else{
                display_message("wiki updated");
            }
        }
    };
    request.open("POST", "php/edit_wiki.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(posted_text);
}
function edit_wiki(){
    wiki_name = document.getElementById("wiki-name");
    wiki_content = document.getElementById("wiki-content-edit");
    wiki_tags = document.getElementById("wiki-tags");
    wiki_access = document.getElementById("wiki-access");
    wiki_exceptions = document.getElementById("wiki-exceptions");
    wiki_id = document.getElementById("wiki-id");
    if(wiki_name.value == ""){
        display_message("please fill in the name", 1);
        return;
    }
    if(wiki_tags.value == ""){
        display_message("please put in at least one tag", 1);
        return;
    }
    if(wiki_content.value == ""){
        display_message("god damn, this bitch empty", 1);
        return;
    }
    if(wiki_id.innerHTML == ""){
        edit_wiki_attempt(
            wiki_name.value,
            wiki_content.value,
            wiki_tags.value,
            wiki_access.value,
            wiki_exceptions.value
        );
    }else{
        if(!window.confirm("Overwrite existing lore?")){return;}
        edit_wiki_attempt(
            wiki_name.value,
            wiki_content.value,
            wiki_tags.value,
            wiki_access.value,
            wiki_exceptions.value,
            wiki_id.innerHTML
        );
    }
}
function switch_button(){
    if(search_type_button.innerHTML == "name"){
        search_type_button.innerHTML = "tags";
    }else{
        search_type_button.innerHTML = "name";
    }
    fetch_lore_list();
}
fetchLoreTimeout = setTimeout(fetch_lore_list, 1);
search_input.addEventListener('keyup', () => {
    clearTimeout(fetchLoreTimeout);
    fetchLoreTimeout = setTimeout(fetch_lore_list, 300);
});
// Here are all the shortcuts
document.addEventListener("keydown", function (event) { // copied from chatgpt (but also improved by me (somewhat (i guess)))
    if (event.ctrlKey && event.key === "Enter") {
        event.preventDefault();
        edit_wiki();
    }
    if (event.ctrlKey && event.key.toLowerCase() === "k") {
        event.preventDefault(); // Prevent default behavior
        let input = document.activeElement;
        if (input && input.tagName === "TEXTAREA") {
            let start = input.selectionStart;
            let end = input.selectionEnd;
            let text = input.value;
            if (start !== end) {
                let selectedText = text.substring(start, end);
                let replacement = `<a href='wiki.php?s='>${selectedText}</a>`;
                // Use execCommand to insert text (keeps it in the undo stack)
                document.execCommand("insertText", false, replacement);
                // Move cursor after "?s="
                let newCursorPosition = start + replacement.indexOf("?s=") + 3;
                input.setSelectionRange(newCursorPosition, newCursorPosition);
            }
        }
    }
    if (event.ctrlKey && event.key === ",") {
        event.preventDefault(); // Prevent default behavior
        let input = document.activeElement;
        if (input && input.tagName === "TEXTAREA") {
            let start = input.selectionStart;
            let end = input.selectionEnd;
            let text = input.value;
            // Find the word if no selection is made
            if (start === end) {
                let wordStart = start;
                let wordEnd = start;
                // Move backwards to find start of word
                while (wordStart > 0 && /\w/.test(text[wordStart - 1])) {
                    wordStart--;
                }
                // Move forwards to find end of word
                while (wordEnd < text.length && /\w/.test(text[wordEnd])) {
                    wordEnd++;
                }
                // Update selection range to cover the whole word
                start = wordStart;
                end = wordEnd;
            }
            if (start !== end) {
                let selectedText = text.substring(start, end);
                let replacement = `<${selectedText}></${selectedText}>`;
                // Use execCommand to preserve undo functionality
                input.setSelectionRange(start,end);
                document.execCommand("insertText", false, replacement);
                // Calculate the new cursor position (right after the opening tag)
                let newCursorPosition = start + selectedText.length + 2; // `<tagName>` length
                input.setSelectionRange(newCursorPosition, newCursorPosition);
            }
        }
    }
});
<?php require "php/js_options.php";?>
</script>
</body>
</html>
