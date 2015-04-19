$("document").ready ->
  $("#show-import").click (e)->
    e.preventDefault()
    $("#import-form").toggle()
