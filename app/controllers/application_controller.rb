class ApplicationController < ActionController::Base
  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless session[:user_id].present?
      render 'sessions/new'
    end
  end
end
