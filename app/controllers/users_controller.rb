class UsersController < ApplicationController
  before_action :check_for_login, :only => [:edit, :show, :destroy]
  before_action :check_for_user, :only => [:edit, :destroy]
  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
      @user.save
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      user.image = req["public_id"]
      user.save
    end
    redirect_to user
  end


  def show
  @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    user = user.destroy
    redirect_to root_path
  end

private
  def user_params
  params.require(:user).permit(:name, :image, :email, :password, :password_confirmation)
  end
end
