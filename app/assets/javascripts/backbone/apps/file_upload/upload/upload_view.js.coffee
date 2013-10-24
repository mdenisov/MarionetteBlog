@MarionetteBlog.module "FileUploadApp.Upload", (Upload, App, Backbone, Marionette, $, _) ->

  class Upload.Layout extends App.Views.Layout
    template: 'file_upload/upload/upload_layout'

    regions:
      uploadRegion:   '#upload-region'

  class Upload.Upload extends App.Views.ItemView
    template: 'file_upload/upload/_upload_view'
