App.Vacancies.New =
  bind_fields: ->
    $('#new_vacancy input').keypress (e) ->
      if e.which == 13
        $('#new_vacancy').submit()
        return false

$(document).on "turbolinks:load", ->
  #TODO monkeypatch to allow the correct behave with summernote
  # Remove when it will be fixed on summernote side

  return unless $(".vacancies.new").length > 0 ||
    $(".vacancies.create").length > 0
  App.Vacancies.New.bind_fields()
