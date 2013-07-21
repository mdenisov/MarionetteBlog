@MarionetteBlog.module "PostApp", (PostApp, App, Backbone, Marionette, $, _) ->

  class PostApp.Router extends Marionette.AppRouter
    appRoutes:
      "posts"         :     "index"
      "posts/:title"  :     "show"
      "posts/new"     :     "new"

  API =
    index: ->
      new PostApp.Index.Controller

    show: (id, post) ->
      new PostApp.Show.Controller
        id: id
        post: post

    new: ->
      new PostApp.New.Controller
      
  App.vent.on "post:show:back:clicked post:created post:destroyed", (post) ->
    App.navigate Routes.posts_path()
    API.index()

  App.vent.on "post:read-more:clicked", (post) ->
    App.navigate Routes.post_path(post.id)
    API.show post.title, post

  App.vent.on "post:new-post:clicked", (post) ->
    App.navigate Routes.new_post_path()
    API.new()

  App.addInitializer ->
    new PostApp.Router
      controller: API
