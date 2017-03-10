window.App ||= {}

App.init = ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote height: '400px'
    return

$(document).on "turbolinks:load", ->
  App.init()
