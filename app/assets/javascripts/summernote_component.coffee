class window.SummerNoteComponent
  @bind_enter_key: ->
    form = $(@selector).closest('form')
    form.find('input').keypress (e) ->
      if e.which == 13
        form.submit()
        return false

  @init: (@selector, height) ->
    return unless $(@selector).length > 0

    $(@selector).each ->
      $(this).summernote height: height
      return

    @bind_enter_key()
