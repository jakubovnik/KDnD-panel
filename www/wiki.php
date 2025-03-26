<?php
require "php/check_login_true.php";
require "php/header.php";
?>
    <title>Wiki</title>
</head>
<body id="all">
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
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
                }else{
                    echo '<span id="wiki-name" class="wiki-text-field">'.$row['name'].'</span>';
                    echo "<span id='wiki-tags' class='wiki-text-field' title='".$row['tags']."'>".$row['tags']."</span>";
                }
            }else{
                if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                    echo '<input type="text" id="wiki-name" class="wiki-text-field" value="Name">';
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
                }else{
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
                    if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                        echo "<textarea id='wiki-content-edit'>".$row['content']."</textarea>";
                    }else{
                        echo $row['content'];
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
        lore_list_container.style.display = "block";
        lore_list_container_visible = 1;
        search_input.focus();
    }else{
        lore_list_container.style.display = "none";
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
function edit_wiki_attempt(name, content, tags, access, exceptions){
    var request = new XMLHttpRequest();
    var posted_text = "name=" + name + 
                    "&content=" + content + 
                    "&tags=" + tags + 
                    "&access=" + access + 
                    "&exceptions=" + exceptions;
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
    edit_wiki_attempt(//TODO: finish this so that there is no more hardcoded testing
        wiki_name.value,
        wiki_content.value,
        wiki_tags.value,
        wiki_access.value,
        wiki_exceptions.value
    );
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
    fetchLoreTimeout = setTimeout(fetch_lore_list, 200);
});
</script>
</body>
</html>