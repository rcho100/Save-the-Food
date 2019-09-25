class SessionsController < ApplicationController
  def welcome
  end

  def new
    
  end

  def create
    if user = User.find_by(name: params[:name])
      user.authenticate(params[:password])

      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end
end