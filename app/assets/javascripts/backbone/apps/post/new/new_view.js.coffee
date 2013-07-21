@MarionetteBlog.module "PostApp.New", (New, App, Backbone, Marionette, $, _) ->
	
	class New.Post extends App.Views.ItemView
		template: "post/new/new_post"
		
		form:
			buttons:
				placement: "pull-right"
