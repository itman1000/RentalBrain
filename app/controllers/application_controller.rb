class ApplicationController < ActionController::Base
  include UsersHelper

  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def forbid_login_user
    if @current_user
      redirect_to posts_path
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to posts_path
    end
  end

end
