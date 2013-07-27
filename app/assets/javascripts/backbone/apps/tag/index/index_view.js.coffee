@MarionetteBlog.module "TagApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.Layout extends App.Views.Layout
    template: 'tag/index/index_layout'

    regions:
      panelRegion:  '#panel-region'
      newRegion:    '#new-region'
      tagsRegion:   '#tags-region'

  class Index.Tag extends App.Views.ItemView
    template: 'tag/index/_tag'
    tagName:  'tr'

    triggers:
      "click #edit-tag"     :       "edit:tag:clicked"
      "click #delete-tag"   :       "delete:tag:clicked"

  class Index.Empty extends App.Views.ItemView
    template: 'tag/index/_empty'
    tagName:  'tr'

  class Index.Panel extends App.Views.ItemView
    template: 'tag/index/_panel'

    triggers:
      "click #new-tag"      :       "new:tag:clicked"

  class Index.Tags extends App.Views.CompositeView
    template: 'tag/index/_tags'
    itemView: Index.Tag
    emptyView:  Index.Empty
    itemViewContainer:  '#tags'

