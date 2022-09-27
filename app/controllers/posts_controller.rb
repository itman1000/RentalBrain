class PostsController < ApplicationController
  layout 'default_layouts'

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end
end
