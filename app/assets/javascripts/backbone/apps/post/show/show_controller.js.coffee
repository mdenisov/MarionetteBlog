@MarionetteBlog.module "PostApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { post, id } = options

      post or= App.request "post:entity", id

      @listenTo post, "destroy", ->
        App.vent.trigger "post:destroyed", post

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

      @listenTo postRegion, "post:show:back:clicked", (args) ->
        App.vent.trigger "post:show:back:clicked", args.model

      @listenTo postRegion, "post:show:edit:clicked", (args) ->
        App.vent.trigger "post:edit", args.model

      @listenTo postRegion, "post:show:delete:clicked", (args) ->
        model = args.model 
        if confirm "Are you sure you want to delte this Post?" then model.destroy() else false

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

