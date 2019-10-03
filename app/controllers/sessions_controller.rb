class SessionsController < ApplicationController
  before_action :require_not_login, only: [:new, :create]
  before_action :require_login, only: [:destroy]

  def welcome
  end

  def new
    
  end

  def create
    if user = User.find_by(name: params[:name])
      user.authenticate(params[:password])

      session[:user_id] = user.id
      redirect_to user_path(user), success: 'You are now logged in'
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end