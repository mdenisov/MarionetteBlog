@MarionetteBlog.module "PostApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { post, id } = options

      post or= App.request "crew:entity", id

      console.log post

      App.execute "when:fetched", post, =>

        @layout = @getLayoutView post

        @listenTo @layout, "show", =>
          @authorRegion post
          @postRegion post

        @show @layout

    authorRegion: (post) ->
      authorRegion = @getAuthorRegion post

      @layout.authorRegion.show authorRegion

    postRegion: (post) ->
      postRegion = @getPostRegion post

      @listenTo postRegion, "post:show:back:clicked", (child) ->
        App.vent.trigger "post:show:back:clicked", child

      @layout.postRegion.show postRegion

    getPostRegion: (post) ->
      new Show.Post
        model: post

    getAuthorRegion: (post) ->
      new Show.Author
        model: post

    getLayoutView: (post) ->
      new Show.Layout
        model: post

