window.App = window.App || {}

App.init = function () {
  SummerNoteComponent.init('[data-provider="summernote"]', '400px')
}

$(document).on("turbolinks:load", function () {
  App.init();
});
