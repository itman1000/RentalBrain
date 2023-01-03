class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @like = nil
    @likes_count = 0
    @likeid = 0

    if @post.answer.presence
      @answer = @post.answer
      @answer_user = User.find_by(id: @answer.user_id)

      if @answer.likes.presence
        @likes_count = @answer.likes.count
      end  
    end

    @like = @post.answer.likes.create(user_id: @current_user.id)
    render "posts/show"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @user = @post.user
    @like = nil
    @likes_count = 0
    @likeid = 0
  
    if @post.answer.presence
      @answer = @post.answer
      @answer_user = User.find_by(id: @answer.user_id)

      if @answer.likes.presence
        @likes_count = @answer.likes.count
        @like = @post.answer.likes.find_by(user_id: @current_user.id)
        @post.answer.likes.destroy(@like)
        @likeid = @like.id
      end  
    end
  
    render 'posts/show'
  end

end
