@MarionetteBlog.module "PostApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { post, id } = options

      post or= App.request "post:entity", id

      @listenTo post, "updated", ->
        App.vent.trigger "post:updated", post

      App.execute "when:fetched", post, =>

        editView = @getEditView post
        formView = App.request "form:wrapper", editView

        @listenTo editView, "form:cancel", =>
          App.vent.trigger "post:canceled", post

        @show formView

    getEditView: (post) ->
      new Edit.Post
        model: post

