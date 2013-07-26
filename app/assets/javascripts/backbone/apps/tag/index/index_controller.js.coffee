@MarionetteBlog.module "TagApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Controller extends App.Controllers.Base

    initialize: ->
      tags = App.request "tags:entities"

      App.execute "when:fetched", tags, =>

        @layout = @getLayoutView tags

        @listenTo @layout, "show", =>
          @panelRegion tags
          @tagsRegion tags

        @show @layout

    tagsRegion: (tags) ->
      tagsRegion = @getTagsRegion tags

      @listenTo tagsRegion, "childview:delete:tag:clicked", (args) ->
        model = args.model
        if confirm "Are you sure you want to delete this Tag?" then model.destroy() else false

      @layout.tagsRegion.show tagsRegion

    panelRegion: (tags) ->
      panelRegion = @getPanelRegion tags

      @listenTo panelRegion, "new:tag:clicked", =>
        @newRegion tags

      @layout.panelRegion.show panelRegion

    newRegion: (tags) ->
      App.execute "new:tag", @layout.newRegion, tags

    getPanelRegion: (tags) ->
      new Index.Panel
        collection: tags

    getTagsRegion: (tags) ->
      new Index.Tags
        collection: tags

    getLayoutView: (tags) ->
      new Index.Layout
        collection: tags

