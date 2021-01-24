class ApplicationController < ActionController::Base
  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def check_for_user
    user = User.find params[:id]
    redirect_to login_path unless session[:user_id] == user.id
  end

  def check_for_photo_owner
    photo = Photo.find params[:id]
    redirect_to login_path unless session[:user_id] == photo.user.id
  end
end
