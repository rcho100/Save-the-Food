class ReviewsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @reviews = @user.reviews
    else
      @reviews = Review.all
    end
  end

  def new
    @review = Review.new(recipe_id: params[:recipe_id])
  end

  private

  def review_params
    params.require(:review).permit(:name, :content, :recipe_id)
  end
end
