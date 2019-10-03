module ApplicationHelper
  def logged_in?
    session[:user_id].present?
  end

  def current_user
    current_user ||= User.find_by_id(session[:user_id])
  end
end
