class CommentsController < ApplicationController
  layout 'default_layouts'
  before_action :require_login, only: [:new]

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.build
  end

  def confirm
    @comment = Comment.new(comment_params)
    render :new if @comment.invalid?
  end

  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    if params[:back] || !@comment.save
      render :new
    else
      redirect_to post_path(@post)
    end

  end

  def edit
  end

  def edit_confirm
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
