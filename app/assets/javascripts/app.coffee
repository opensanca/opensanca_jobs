window.App ||= {}

App.init = ->
  SummerNoteComponent.init('[data-provider="summernote"]', '400px')

$(document).on "turbolinks:load", ->
  App.init()
