@MarionetteBlog.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Comment extends App.Entities.Model
		urlRoot: -> Routes.post_comments_path(options.post_id)
	
	class Entities.CommentsCollection extends App.Entities.Collection
		model: Entities.Comments

		url: -> Routes.post_comments_path(options.post_id)

  API =
    getComments: (post_id) ->
      comments = new Entities.CommentsCollection
        post_id: post_id
      comments.fetch
        reset: true
      comments

    getComment: (id, post_id) ->
      comment = new Entities.Comment
        id: id
        post_id: post_id
      comment.fetch()
      comment

    getNewComment: (post_id) ->
      new Entities.Comment
        post_id: post_id


  App.reqres.setHandler "comments:entities", (post_id) ->
    API.getComments(post_id)

  App.reqres.setHandler "comment:entity", (id, post_id) ->
    API.getComment id

  App.reqres.setHandler "new:comment:entity", (post_id) ->
    API.getNewComment post_id

