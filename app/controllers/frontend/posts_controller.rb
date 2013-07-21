class Frontend::PostsController < Frontend::ApplicationController
	respond_to :json

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      render "frontend/posts/show"
    else
      respond_with @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {}
  end

end
