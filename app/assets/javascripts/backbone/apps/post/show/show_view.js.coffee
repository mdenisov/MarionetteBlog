@MarionetteBlog.module "PostApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Author extends App.Views.ItemView
    template: 'post/show/_author'

  class Show.Post extends App.Views.ItemView
    template: 'post/show/_post'
    className: 'well'

    triggers:
      "click #back"         :     "post:show:back:clicked"
      "click #delete-post"  :     "post:show:delete:clicked"


  class Show.Layout extends App.Views.Layout
    template: 'post/show/show_layout'

    className: 'row-fluid'

    regions:
      authorRegion:   '#author-region'
      postRegion:     '#post-region'


