class AnswerController < ApplicationController
  layout 'default_layouts'

  def new
    @post = Post.find_by(id: params[:post_id])
    @answer = @post.build_answer
  end

  def answer_confirm
    @answer = Answer.new(answer_params)
    render :new if @answer.invalid?
  end

  def create
    @answer = Answer.new(answer_params)
    @post = @answer.post
    if params[:back] || !@answer.save
      render :new
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @post.answer.destroy
    @post.commit = nil
    @post.save!
    redirect_to post_path(@post)
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :post_id, :user_id)
  end

end
