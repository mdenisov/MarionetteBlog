@MarionetteBlog.module "FileUploadApp.Upload", (Upload, App, Backbone, Marionette, $, _) ->
  
  class Upload.Controller extends App.Controllers.Base
    initialize: ->
      @layout = @getLayoutView()
      @listenTo @layout, "show", =>
        @uploadRegion()

      @show @layout

    uploadRegion: ->
      uploadRegion = @getUploadRegion()
      @layout.uploadRegion.show uploadRegion

    getUploadRegion: ->
      new Upload.Upload

    getLayoutView: ->
      new Upload.Layout
