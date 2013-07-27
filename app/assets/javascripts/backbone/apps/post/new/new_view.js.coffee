@MarionetteBlog.module "PostApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	class New.Post extends App.Views.ItemView
    template: 'post/new/new_post'

    initialize: ->
      @setInstancePropertiesFor "tags"

    serializeData: ->
      tags: @tags?.toJSON() ? false
