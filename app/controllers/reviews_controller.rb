class ReviewsController < ApplicationController
  def index
    if params[:user_id]
      @reviews = User.find(params[:user_id]).reviews
    else
      @reviews = Review.all
    end
  end
end
