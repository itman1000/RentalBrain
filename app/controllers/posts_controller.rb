class PostsController < ApplicationController
  layout 'default_layouts'

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to Post
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render action: :edit, status: :unprocessable_entity
    end
  end  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to Post, status: :see_other }
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
