@MarionetteBlog.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Post extends App.Entities.Model
		urlRoot: -> Routes.posts_path()
	
	class Entities.PostCollection extends App.Entities.Collection
		model: Entities.Post

		url: -> Routes.posts_path()

  API =
    getPosts: ->
      posts = new Entities.PostCollection
      posts.fetch
        reset: true
      posts

    getPost: (id) ->
      post = new Entities.Post
        id: id
      post.fetch()
      post


  App.reqres.setHandler "posts:entities", ->
    API.getPosts()

  App.reqres.setHandler "crew:entity", (id) ->
    API.getPost id

