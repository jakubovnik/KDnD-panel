// <?php if($_SESSION['style'] == "mobile-style.css"){echo '<script src="js/mobile.js"></script>';}?>
const navbar = document.getElementById("navbar");
function toggle_navbar(){
    navbar.classList.toggle("hidden");
}
