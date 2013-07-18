@MarionetteBlog.module "PostApp", (PostApp, App, Backbone, Marionette, $, _) ->

  class PostApp.Router extends Marionette.AppRouter
    appRoutes:
      "posts"         :     "index"
      "posts/:title"  :     "show"

  API =
    index: ->
      new PostApp.Index.Controller

    show: (id, post) ->
      new PostApp.Show.Controller
        id: id
        post: post
      
  App.vent.on "post:read-more:clicked", (post) ->
    App.navigate Routes.post_path(post.id)
    API.show post.title, post

  App.vent.on "post:show:back:clicked", (post) ->
    App.navigate Routes.posts_path()
    API.index()

  App.addInitializer ->
    new PostApp.Router
      controller: API
