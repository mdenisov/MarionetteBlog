@MarionetteBlog.module "PostApp", (PostApp, App, Backbone, Marionette, $, _) ->

  class PostApp.Router extends Marionette.AppRouter
    appRoutes:
      "posts"           :     "index"
      "posts/new"       :     "new"
      "posts/:id"       :     "show"
      "posts/:id/edit"  :     "edit"

  API =
    index: ->
      console.info "index"
      new PostApp.Index.Controller

    show: (id, post) ->
      console.info "show"
      new PostApp.Show.Controller
        id: id
        post: post

    new: ->
      console.info "new"
      new PostApp.New.Controller

    edit: (id, post) ->
      console.info "edit"
      new PostApp.Edit.Controller
        id: id
        post: post
      
  App.vent.on "post:show:back:clicked post:created post:destroyed post:canceled", (post) ->
    App.navigate Routes.posts_path()
    API.index()

  App.vent.on "post:read-more:clicked post:updated", (post) ->
    App.navigate Routes.post_path(post.id)
    API.show post.id, post

  App.vent.on "post:new-post:clicked", (post) ->
    App.navigate Routes.new_post_path()
    API.new()

  App.vent.on "post:edit", (post) ->
    App.navigate Routes.edit_post_path(post.id)
    API.edit post.id, post

  App.addInitializer ->
    new PostApp.Router
      controller: API
