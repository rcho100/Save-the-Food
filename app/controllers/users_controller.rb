class UsersController < ApplicationController
  def new
    @user = User.new
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
