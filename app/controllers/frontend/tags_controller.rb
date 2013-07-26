class Frontend::TagsController < Frontend::ApplicationController
	respond_to :json

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      render 'frontend/tags/show'
    else
      respond_with @tag
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    render json: {}
  end

end
