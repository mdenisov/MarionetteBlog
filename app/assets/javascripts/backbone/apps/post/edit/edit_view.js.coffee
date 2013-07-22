@MarionetteBlog.module "PostApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Post extends App.Views.ItemView
		template: "post/edit/edit_post"
		
		form:
			buttons:
				placement: "pull-right"

