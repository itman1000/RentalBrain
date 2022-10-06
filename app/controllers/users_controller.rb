class UsersController < ApplicationController
  layout 'default_layouts'

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    @user.image_name = "default_user.png"
    if params[:back] || !@user.save
      render :new
    else
      redirect_to user_path(@user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_confirm
    @user = User.find(params[:id])
    @user.attributes = user_params
    render :edit if @user.invalid?
  end

  def update
    @user = User.find(params[:id])
    if params[:back] || !@user.update(user_params)
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
    params.require(:user).permit(:name, :email)
  end

end
