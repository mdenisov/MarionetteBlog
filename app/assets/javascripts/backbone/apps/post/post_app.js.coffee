@MarionetteBlog.module "PostApp", (PostApp, App, Backbone, Marionette, $, _) ->

  class PostApp.Router extends Marionette.AppRouter
    appRoutes:
      "posts"     :     "index"

  API =
    index: ->
      new PostApp.Index.Controller

  App.addInitializer ->
    new PostApp.Router
      controller: API
