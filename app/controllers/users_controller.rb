class UsersController < ApplicationController
  layout 'default_layouts'

  def login_form
    @user = User.new
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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
      redirect_to user_path(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # @user.attributes = user_params
    if !@user.update(user_params)
      render :edit
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to User, status: :see_other
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

end