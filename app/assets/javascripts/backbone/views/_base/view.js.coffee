@MarionetteBlog.module "Views", (Views, App, Backbone, Marionette, $, _ ) ->

  _.extend Marionette.View::,
		
    setInstancePropertiesFor: (args...) ->
      for key, val of _.pick(@options, args...)
        @[key] = val
