@MarionetteBlog.module "PostApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Layout extends App.Views.Layout
    template: 'post/index/index_layout'

    regions:
      panelRegion:    '#panel-region'
      postsRegion:    '#posts-region'

  class Index.Panel extends App.Views.ItemView
    template: 'post/index/_panel'

  class Index.Post extends App.Views.ItemView
    template: 'post/index/_post'

  class Index.Empty extends App.Views.ItemView
    template: 'post/index/_empty'

  class Index.Posts extends App.Views.CompositeView
    template: 'post/index/_posts'
    itemView: Index.Post
    emptyView:  Index.Empty
    itemViewContainer:  'ul'
