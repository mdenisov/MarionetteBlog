@MarionetteBlog.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Button extends Entities.Model
		defaults:
			buttonType: "button"
		
	class Entities.ButtonsCollection extends Entities.Collection
		model: Entities.Button
	
	API =
		getFormButtons: (buttons, model) ->
			buttons = @getDefaultButtons buttons, model
			
			array = []
			array.push { type: "cancel", 	className: "btn btn-small",             text: buttons.cancel 												} unless buttons.cancel is false
			array.push { type: "primary", className: "btn btn-small btn-primary", text: buttons.primary, buttonType: "submit" } unless buttons.primary is false
				
			array.reverse() if buttons.placement is "pull-left"
			
			buttonCollection = new Entities.ButtonsCollection array
			buttonCollection.placement = buttons.placement
			buttonCollection
		
		getDefaultButtons: (buttons, model) ->
			_.defaults buttons,
				primary: if model.isNew() then "Create" else "Update"
				cancel: "Cancel"
				placement: "pull-right"
	
	App.reqres.setHandler "form:button:entities", (buttons = {}, model) ->
		API.getFormButtons buttons, model

