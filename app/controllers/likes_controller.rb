class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @likes_count = @post.answer.likes.count
    @like = @post.answer.likes.create(user_id: @current_user.id)

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @likes_count = @post.answer.likes.count
    @like = @post.answer.likes.find_by(user_id: @current_user.id)
    @post.answer.likes.destroy(@like)
  
    redirect_to @post
  end

end
