class UsersController < ApplicationController
  layout 'default_layouts'
  before_action :require_login, only: [:edit, :index, :show, :destroy]
  before_action :forbid_login_user, only: [:new, :create, :login_form, :login]
  before_action :ensure_correct_user, only: [:edit, :update]


  def login_form
  end

  def login
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render login_form_users_path
    end
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @email_input_flg = nil
    @password_input_flg = nil
  end

  def create
    @user = User.new(user_params)
    if !@user.save
      render :new
    else
      redirect_to confirm_user_path(@user)
    end
  end

  def confirm
    @user = User.find(params[:id])
  end

  def confirmed
    @user = User.find(params[:id])
    if params[:back]
      @user.destroy
      render :new, status: :see_other;
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if !@user.update(user_params)
      render :edit
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to posts_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

end