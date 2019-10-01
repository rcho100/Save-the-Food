class ReviewsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = @user.reviews
    else
      @reviews = Review.all
    end
  end
end
