@MarionetteBlog.module "TagApp", (TagApp, App, Backbone, Marionette, $, _) ->

  class TagApp.Router extends Marionette.AppRouter
    appRoutes:
      "tags"        :     "index"

  API =
    index: ->
      new TagApp.Index.Controller


  App.addInitializer ->
    new TagApp.Router
      controller: API

