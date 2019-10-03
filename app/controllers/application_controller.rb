class ApplicationController < ActionController::Base
  add_flash_types :success, :info

  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id].present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, info: 'You need to be logged in to access that page.'
    end
  end

  def require_not_login
    unless !logged_in?
      redirect_to recipes_path, info: 'You are already logged in.'
    end
  end
end
