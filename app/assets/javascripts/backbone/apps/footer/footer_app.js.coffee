@MarionetteBlog.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  Api =
    show: ->
      new FooterApp.Show.Controller
        region: App.footerRegion

  FooterApp.on "start", ->
    Api.show()
