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

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    if params[:back] || !@post.save
      render :new
    else
      redirect_to action: :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def edit_confirm
    @post = Post.find(params[:id])
    @post.attributes = post_params
    render :edit if @post.invalid?
  end

  def update
    @post = Post.find(params[:id])
    if params[:back] || !@post.update(post_params)
      render :edit
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to Post, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
