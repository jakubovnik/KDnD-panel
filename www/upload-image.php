<?php
require "php/check_login_true.php";
require "php/check_admin.php";
require "php/header.php";
?>
    <title>Upload image for character</title>
</head>
<body>
    <?php require "php/navbar.php";?>
    <span id="message" onclick="hide_message()"></span>
    <div>Note that the image should be in a [TODO: INSERT RATIO LATER] ratio</div>
    <div id="character-id" style="display:none;"></div>
    <form id="image-upload-form" action="javascript:void(0);" enctype="multipart/form-data"> <!--upload form-->
        <input type="text" class="image-upload" name="image-upload-character" id="image-upload-character">
        <input type="text" class="image-upload" name="image-upload-title" id="image-upload-title">
        <input type="file" class="image-upload" name="image-upload-image" id="image-upload-image">
        <input type="text" class="image-upload" name="image-upload-description" id="image-upload-description">
        <input type="submit" value="Upload Image" name="submit" onclick="upload_image()">
    </form>
</body>
<script src="js/default.js"></script>
<?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
<script>
var character_id = document.getElementById("character-id");
var image_upload_character = document.getElementById("image-upload-character");
var image_upload_title = document.getElementById("image-upload-title");
var image_upload_image = document.getElementById("image-upload-image");
var image_upload_description = document.getElementById("image-upload-description");

function image_upload_attempt(){
    let form_data = new FormData();

    form_data.append("character_id", character_id.value);
    form_data.append("title", image_upload_title.value);
    form_data.append("image", image_upload_image.files[0]);
    form_data.append("description", image_upload_description.value);

    let request = new XMLHttpRequest();
    request.open("POST", "php/upload_image.php", true);

    request.onload = function () {
        let response = JSON.parse(request.responseText);
        document.getElementById("message").innerHTML = response.message;
        if (response.status === "success") {
            document.getElementById("preview").innerHTML = `<img src="${response.filepath}" width="200">`; //continue here
        }
    };

    request.send(form_data);
}

function upload_image(){
    if(check_form()){
        return;
    }
    image_upload_attempt();
}
function check_form(){
    if(image_upload_character.value == ""){
        display_message("Image needs a character to assign", 1);
        return 1;
    }
    if(image_upload_character.value == ""){
        display_message("Image needs a character to assign", 1);
        return 1;
    }
    if(!image_upload_image.files[0]){
        display_message("Image needs an image (duh)", 1);
        return 1;
    }
    if(image_upload_description.value == ""){
        display_message("Image needs a description", 1);
        return 1;
    }
    return 0;
}
</script>
</html>