window.App.ApplyToJob =
  highlight_instructions: (anchor_element) ->
    $('html').animate({
      scrollTop: $(anchor_element).offset().top - 60
    }, 1000)

    anchor_element.classList.add("item-highlight")

    setTimeout ( ->
      anchor_element.classList.remove("item-highlight")
    ), 5200

$(document).on "click", "[data-behavior~=apply-to-job]", ->
  anchor_element       = document.getElementById(this.dataset.anchor)
  App.ApplyToJob.highlight_instructions(anchor_element)
  return false
