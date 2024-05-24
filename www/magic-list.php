<!DOCTYPE html>
<html>
<head>
  <title>Magic List</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="all">
    <?php require "navbar.php";?>
    <input type="text" id="magic-search" onkeyup="updateMagicList()" placeholder="Search magic">
    <ul id="magic-list">
      <li class="magic">
        <span class="magic-name">bruh</span>
        <span class="magic-origin">origin</span>
        <span class="magic-complexity">3</span>
        <span class="magic-fail">20%</span>
        <span class="magic-cast">2</span>
      </li>
      <li class="magic">
        <span class="magic-name">dough</span>
        <span class="magic-origin">origin</span>
        <span class="magic-complexity">3</span>
        <span class="magic-fail">20%</span>
        <span class="magic-cast">2</span>
      </li>
      <li class="magic">
        <span class="magic-name">fack</span>
        <span class="magic-origin">origin</span>
        <span class="magic-complexity">3</span>
        <span class="magic-fail">20%</span>
        <span class="magic-cast">2</span>
      </li>
    </ul>
  </div>
</body>
<script>
function updateMagicList() {
  // Declare variables
  var input, filter, ul, li, a, i, txtValue;
  input = document.getElementById('magic-search');
  filter = input.value.toUpperCase();
  ul = document.getElementById("magic-list");
  li = ul.getElementsByTagName('li');

  // Loop through all list items, and hide those who don't match the search query
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("span")[0];
    txtValue = a.innerHTML;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}
</script>
</html>