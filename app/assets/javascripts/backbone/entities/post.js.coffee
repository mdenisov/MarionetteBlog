@MarionetteBlog.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Post extends App.Entities.Model
		urlRoot: -> Routes.posts_path()
	
	class Entities.PostCollection extends App.Entities.Collection
		model: Entities.Crew

		url: -> Routes.posts_path()

  API =
    getPosts: ->
      posts = new Entities.PostCollection
      posts.fetch
        reset: true
      posts


  App.reqres.setHandler "posts:entities", ->
    API.getPosts()

