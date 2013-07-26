@MarionetteBlog.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Tag extends App.Entities.Model
		urlRoot: -> Routes.tags_path()
	
	class Entities.TagsCollection extends App.Entities.Collection
		model: Entities.Tag

		url: -> Routes.tags_path()

  API =
    getTags: ->
      tags = new Entities.TagsCollection
      tags.fetch
        reset: true
      tags

    getTag: (id) ->
      tag = new Entities.Tag
        id: id
      tag.fetch()
      tag

    getNewTag: ->
      new Entities.Tag

  App.reqres.setHandler "tags:entities", ->
    API.getTags()

  App.reqres.setHandler "tag:entity", (id) ->
    API.getTag id

  App.reqres.setHandler "new:tag:entity", ->
    API.getNewTag()


