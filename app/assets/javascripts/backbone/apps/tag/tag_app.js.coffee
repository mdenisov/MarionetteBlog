@MarionetteBlog.module "TagApp", (TagApp, App, Backbone, Marionette, $, _) ->

  class TagApp.Router extends Marionette.AppRouter
    appRoutes:
      "tags"        :     "index"

  API =
    index: ->
      new TagApp.Index.Controller

    newTag: (region, collection) ->
      new TagApp.New.Controller
        region: region
        collection: collection

  App.commands.setHandler "new:tag", (region, collection) ->
    API.newTag region, collection

  App.addInitializer ->
    new TagApp.Router
      controller: API

