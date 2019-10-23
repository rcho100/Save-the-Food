class SessionsController < ApplicationController
  before_action :require_not_login, only: [:new, :create]
  before_action :require_login, only: [:destroy]

  def welcome
  end

  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), success: 'You are now logged in'
      else
        redirect_to login_path, info: "Incorrect password"
      end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user), success: 'Success! You are now logged in'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end