class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  add_flash_types :success, :info

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
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
