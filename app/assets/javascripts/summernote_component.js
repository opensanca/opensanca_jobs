window.SummerNoteComponent = class SummerNoteComponent {
  static bind_enter_key() {
    const form = $(this.selector).closest('form');
    return form.find('input').keypress(function(e) {
      if (e.which === 13) {
        form.submit();
        return false;
      }
    });
  }

  static init(selector, height) {
    this.selector = selector;
    if (!($(this.selector).length > 0)) { return; }

    $(this.selector).each(function() {
      $(this).summernote({height});
    });

    return this.bind_enter_key();
  }
};