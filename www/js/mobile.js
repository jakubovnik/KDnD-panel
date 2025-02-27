// <?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
var navbarVisible = 0;
const navbar = document.getElementById("navbar");
function toggle_navbar(){
    if(navbarVisible == 0){
        navbarVisible = 1;
        navbar.style.display = "flex";
    }else{
        navbarVisible = 0;
        navbar.style.display = "none";
    }
}