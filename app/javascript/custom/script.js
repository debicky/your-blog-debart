$(document).on("turbolinks:load", function() {
  $(".trix-button-group--file-tools").remove();
  document.addEventListener("trix-file-accept", function (event) {
    event.preventDefault();
  });
});