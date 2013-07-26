Backbone.Syphon.InputReaders.register "checkbox", (el) ->
  checked = el.prop "checked"
  el.val() if checked
