class SessionsController < ApplicationController
  def welcome
  end

  def new
    
  end

  def create
    user = User.find_by(name: params[:name])
    user.authenticate(params[:password])

    session[:user_id] = user.id
    redirect_to user_path(user)

  end
end