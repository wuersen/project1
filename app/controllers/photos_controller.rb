class PhotosController < ApplicationController
  before_action :check_for_login, :only => [:new, :create, :show, :edit]
  before_action :check_for_photo_owner, :only => [:edit, :destroy]

  def index
    @photos = Photo.all
  end

  def new

    @photo = Photo.new
  end

  def create
    photo = Photo.create photo_params
    @current_user.photos << photo   #asssiciate/append photos
    redirect_to users_path
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
    photo = Photo.find params[:id]
    photo.update photo_params
    redirect_to photo
  end

  def show
    @photo = Photo.find params[:id]
    @user = @photo.user

    


  end

  def destroy
    photo = Photo.find params[:id]
    user = photo.user
    photo.destroy
    redirect_to user_path(user.id)
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :description)
  end
end
