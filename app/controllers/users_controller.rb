class UsersController < ApplicationController
  before_action :require_not_login, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), success: 'Signup successful! You are now logged in'
    else
      render "new"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
