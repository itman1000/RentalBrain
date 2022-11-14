class LikesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: @current_user.id, post_id: @post.id)
    @like.save
    redirect_to ("/posts/#{params[:post_id]}")
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(user_id: @current_user.id, post_id: @post.id)
    @like.destroy
    redirect_to ("/posts/#{params[:post_id]}"), status: :see_other
  end

end
