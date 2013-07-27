@MarionetteBlog.module "PostApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Post extends App.Views.ItemView
    template: 'post/edit/edit_post'

    initialize: ->
      @setInstancePropertiesFor "tags", "model"

    serializeData: ->
      model: @model?.toJSON() ? false
      tags: @tags?.toJSON() ? false
      model_tags: @calculateModelTags() ? false

    calculateModelTags: ->
      _.chain([@model.attributes['tags']]).flatten().pluck("id").value()
