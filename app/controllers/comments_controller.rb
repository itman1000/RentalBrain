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

  def dummy2
    @post = Post.find_by(id: params[:post_id])
    @target_comment = @post.comments.find_by(id: params[:id])
    if !@target_comment.presence
      redirect_to posts_path
    end
  end
  
  def destroy
    @post = Post.find_by(post_id: params[:post_id])
    @target = Comment.find_by(id: params[:id])
    @post.commetns.destroy(@target)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
