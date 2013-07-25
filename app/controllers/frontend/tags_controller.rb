class Frontend::TagsController < Frontend::ApplicationController

  def index
    @tags = Tag.all
  end

end
