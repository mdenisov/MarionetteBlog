@MarionetteBlog.module "TagApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Layout extends App.Views.Layout
    template: 'tag/index/index_layout'

    regions:
      newRegion:    '#new-region'
      tagsRegion:   '#tags-region'

  class Index.Tag extends App.Views.ItemView
    template: 'tag/index/_tag'
    tagName:  'tr'

  class Index.Empty extends App.Views.ItemView
    template: 'tag/index/_empty'

  class Index.Tags extends App.Views.CompositeView
    template: 'tag/index/_tags'
    itemView: Index.Tag
    emptyView:  Index.Empty
    itemViewContainer:  '#tags'

