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
    @review = Review.new(recipe_id: params[:recipe_id], user_id: current_user.id)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to recipe_path(@review.recipe_id)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :recipe_id, :user_id)
  end
end
