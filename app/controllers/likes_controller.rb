class LikesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
    if !@like.save
      redirect_to posts_path
    end
    
    redirect_to post_path(@like.post_id)
  end
end
