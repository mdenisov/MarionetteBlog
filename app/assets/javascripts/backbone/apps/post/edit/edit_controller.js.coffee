@MarionetteBlog.module "PostApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { post, id } = options

      post or= App.request "post:entity", id
      tags = App.request "tags:entities"

      @listenTo post, "updated", ->
        App.vent.trigger "post:updated", post

      App.execute "when:fetched", [post, tags], =>

        editView = @getEditView post, tags
        formView = App.request "form:wrapper", editView

        @listenTo editView, "form:cancel", =>
          App.vent.trigger "post:canceled", post

        @show formView

    getEditView: (post, tags) ->
      new Edit.Post
        model: post
        tags: tags

