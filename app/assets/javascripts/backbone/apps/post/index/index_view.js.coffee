@MarionetteBlog.module "PostApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Layout extends App.Views.Layout
    template: 'post/index/index_layout'

    regions:
      panelRegion:    '#panel-region'
      postsRegion:    '#posts-region'

  class Index.Panel extends App.Views.ItemView
    template: 'post/index/_panel'

    triggers:
      "click #new-post"     :   "panel:new-post:clicked"

  class Index.Post extends App.Views.ItemView
    template: 'post/index/_post'
    # tagName:  'li'
    className: 'row-fluid'

    triggers:
      "click .read-more"    :   "post:read-more:clicked"


  class Index.Empty extends App.Views.ItemView
    template: 'post/index/_empty'

  class Index.Posts extends App.Views.CompositeView
    template: 'post/index/_posts'
    itemView: Index.Post
    emptyView:  Index.Empty
    itemViewContainer:  '#posts'
