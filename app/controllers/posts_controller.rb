class PostsController < ApplicationController
  layout 'default_layouts'
  before_action :require_login, only: [:confirm, :edit, :index, :new, :show, :commit]
  before_action :ensure_correct_post_user, only: [:edit, :update, :destroy]

  def index
      @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @answer_user = User.find_by(id: @post.answer&.user_id)
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new(user_id: @current_user.id)
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    render :new if @post.invalid?
  end
  
  def answer
    @post = Post.find(params[:id])
    @answer = @post.build_answer
  end

  def answer_confirm
    @post = Post.find(params[:id])
    @answer = @post.build_answer(answer_params)
    render :answer if @answer.invalid?
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if params[:back] || !@post.save
      render :new
    else
      redirect_to action: :index
    end
  end

  def answer_create
    @post = Post.find(params[:id])
    @answer = @post.build_answer(answer_params)
    if params[:back] || !@answer.save
      render :answer
    else
      redirect_to post_path(@post)
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
    redirect_to posts, status: :see_other
  end

  def answer_delete
    @post = Post.find(params[:id])
    @post.answer.destroy
    redirect_to post_path(@post)
  end

  def commit
    @post = Post.find(params[:id])
    if !@post.commit
      @post.commit = @current_user.id
    else
      @post.commit = nil
    end
    @post.save
    redirect_to post_path(@post)
  end

  def ensure_correct_post_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :reward, :commit)
  end

  def answer_params
    params.require(:answer).permit(:content, :post_id, :user_id)
  end

end
