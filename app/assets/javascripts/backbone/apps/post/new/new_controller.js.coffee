@MarionetteBlog.module "PostApp.New", (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends App.Controllers.Base

    initialize: ->

      post = App.request "new:post:entity"
      tags = App.request "tags:entities"

      @listenTo post, "created", ->
        App.vent.trigger "post:created", post

      App.execute "when:fetched", tags, =>
        newView = @getNewView post, tags
        formView = App.request "form:wrapper", newView
        
        @listenTo newView, "form:cancel", =>
          App.vent.trigger "post:canceled", post

        @show formView

    getNewView: (post, tags) ->
      new New.Post
        model: post
        tags: tags

