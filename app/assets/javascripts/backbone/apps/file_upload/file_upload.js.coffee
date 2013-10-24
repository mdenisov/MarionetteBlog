@MarionetteBlog.module "FileUploadApp", (FileUploadApp, App, Backbone, Marionette, $, _) ->
  class FileUploadApp.Router extends Marionette.AppRouter
    appRoutes:
      "file_upload"               :   "upload"
      "file_upload/:id"           :   "show_file"

  API =
    upload: ->
      new FileUploadApp.Upload.Controller
    show_file: (id, file)->
      new FileUploadApp.ShowFile.Controller
        id: id
        file: file

  App.addInitializer ->
    new FileUploadApp.Router
      controller: API

