class Frontend::PostsController < Frontend::ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new
    if @post.update_attributes(params)
      render "frontend/posts/show"
    else
      respond_with @post
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params)
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
