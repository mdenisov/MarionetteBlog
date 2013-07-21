@MarionetteBlog.module "PostApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base

    initialize: ->

      post = App.request "new:post:entity"

      @listenTo post, "created", ->
        App.vent.trigger "post:created", post

      newView = @getNewView post
      formView = App.request "form:wrapper", newView
      
      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView

    getNewView: (post) ->
      new New.Post
        model: post

