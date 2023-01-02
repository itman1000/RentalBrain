class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @post.answer.likes.create(user_id: @post.answer.user_id)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

end
