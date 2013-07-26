@MarionetteBlog.module "TagApp.New", (New, App, Backbone, Marionette, $, _) -> 

  class New.Controller extends App.Controllers.Base

    initialize: (options={})->
      tag = App.request "new:tag:entity"

      newView = @getNewView tag, options.collection

      @listenTo newView, "created", ->
        App.vent 'new:tag:created', tag

      formView = App.request "form:wrapper", newView

      @listenTo newView, "form:cancel", =>
        @region.close()

      @show formView

    getNewView: (tag, collection) ->
      new New.Tag
        model: tag
        collection: collection
