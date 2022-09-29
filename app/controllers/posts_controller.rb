class PostsController < ApplicationController
  layout 'default_layouts'

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to action: "index"
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
