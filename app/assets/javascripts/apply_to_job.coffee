window.App.ApplyToJob =
  highlight_instructions: (instructions_element, anchor_element) ->
    anchor_element.scrollIntoView()
    instructions_element.classList.add("item-highlight")

    setTimeout ( ->
      instructions_element.classList.remove("item-highlight")
    ), 1000

$(document).on "click", "[data-behavior~=apply-to-job]", ->
  instructions_element = document.getElementById(this.dataset.instructions)
  anchor_element       = document.getElementById(this.dataset.anchor)
  App.ApplyToJob.highlight_instructions(instructions_element, anchor_element)
  return false
