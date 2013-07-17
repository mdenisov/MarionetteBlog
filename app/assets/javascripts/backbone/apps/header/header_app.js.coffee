@MarionetteBlog.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  Api =
    show: ->
      new HeaderApp.Show.Controller
        region: App.headerRegion

  HeaderApp.on "start", ->
    Api.show()
