@MarionetteBlog.module "TagApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Controller extends App.Controllers.Base

    initialize: ->
      tags = App.request "tags:entities"

      App.execute "when:fetched", tags, =>

        @layout = @getLayoutView tags

        @listenTo @layout, "show", =>
          # @newRegion()
          @tagsRegion tags

        @show @layout

    newRegion: ->

    tagsRegion: (tags) ->
      tagsRegion = @getTagsRegion tags

      @layout.tagsRegion.show tagsRegion

    getTagsRegion: (tags) ->
      new Index.Tags
        collection: tags

    getLayoutView: (tags) ->
      new Index.Layout
        collection: tags

