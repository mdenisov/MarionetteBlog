@MarionetteBlog.module "PostApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Controller extends App.Controllers.Base

    initialize: ->
      posts = App.request "posts:entities"

      App.execute "when:fetched", posts, =>

        @layout = @getLayoutView posts

        @listenTo @layout, "show", =>
          @panelRegion()
          @postsRegion posts

        @show @layout

    panelRegion: ->
      panelRegion = @getPanelRegion()

      @layout.panelRegion.show panelRegion

    postsRegion: (posts) ->
      postsRegion = @getPostsRegion posts

      @listenTo postsRegion, "childview:post:read-more:clicked", (child, args) ->
        App.vent.trigger "post:read-more:clicked", args.model

      @layout.postsRegion.show postsRegion

    getPanelRegion: ->
      new Index.Panel

    getPostsRegion: (posts) ->
      new Index.Posts
        collection: posts

    getLayoutView: (posts) ->
      new Index.Layout
        collection: posts
