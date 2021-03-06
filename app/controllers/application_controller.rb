class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to root_url unless current_user? @user
  end

  def admin_only
    unless current_user.try(:admin?)
      flash[:danger] = "Unauthorized action."
      redirect_to root_url
    end
  end

end
