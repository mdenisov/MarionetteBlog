@MarionetteBlog.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Post extends App.Entities.Model
		urlRoot: -> Routes.posts_path()
	
	class Entities.PostsCollection extends App.Entities.Collection
		model: Entities.Post

		url: -> Routes.posts_path()

  API =
    getPosts: ->
      posts = new Entities.PostsCollection
      posts.fetch
        reset: true
      posts

    getPost: (id) ->
      post = new Entities.Post
        id: id
      post.fetch()
      post

    getNewPost: ->
      new Entities.Post


  App.reqres.setHandler "posts:entities", ->
    API.getPosts()

  App.reqres.setHandler "post:entity", (id) ->
    API.getPost id

  App.reqres.setHandler "new:post:entity", ->
    API.getNewPost()
