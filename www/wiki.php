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
            if(isset($_GET['search'])){
                $searched_lore = $_GET['search'];
            }else{
                $searched_lore = "KDnD";
            }
            $sql = "SELECT * FROM `wiki` WHERE `name`='".$searched_lore."';";
            $result = $conn->query($sql);
            if($result->num_rows > 0){
                $row = $result->fetch_assoc();
            }
            $conn->close();
            if(isset($row)){
                if($_SESSION['role'] == 1 && $_SESSION['edit-mode'] == 1){
                    echo '<input type="text" id="wiki-name" value="'.$row['name'].'">';
                    echo "<input type='text' id='wiki-tags' value='".$row['tags']."'>";
                    echo '<button id="wiki-save-button" onclick="edit_wiki()">save</button>';
                }else{
                    echo '<span id="wiki-name">'.$row['name'].'</span>';
                    echo "<span id='wiki-tags'>".$row['tags']."</span>";
                }
            }else{
                echo '<span id="wiki-name">Not Found</span>';
            }
        ?>
        <div id="wiki-search-box">
            <input type="text" placeholder="serach lore" id="search-lore-input">
            <button id="search-lore-type-button" onclick="switch_button()">name</button>
        </div>
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
                    echo "something went wrong (search failed or the lore doesnt exist)";
                }
            ?>
        </div>
        <div id="lore-list"></div>
    </div>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>
lore_list = document.getElementById("lore-list");
search_input = document.getElementById("search-lore-input");
search_type_button = document.getElementById("search-lore-type-button");

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
        "1",
        ""
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