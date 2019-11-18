document
  .getElementById("resetButton")
  .addEventListener("click", function(event) {
    window.location.href = "/";
  });
if (document.getElementById("playAgain")) {
  element = document.getElementById("playAgain");
  element.focus();
  element.addEventListener("click", function(event) {
    window.location.href = "/";
  });
}
