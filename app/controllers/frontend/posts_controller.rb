class Frontend::PostsController < Frontend::ApplicationController

  def index
    @posts = Post.all
  end

end
