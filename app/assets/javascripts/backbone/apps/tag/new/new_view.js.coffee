@MarionetteBlog.module "TagApp.New", (New, App, Backbone, Marionette, $, _) -> 

  class New.Tag extends App.Views.ItemView
    template: 'tag/new/new_tag'

		form:
			buttons:
				placement: "pull-right"
