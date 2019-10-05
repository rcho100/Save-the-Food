class ReviewsController < ApplicationController
  before_action :require_login
  
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

  def edit
    @review = Recipe.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render 'edit'
    end
  end
  
  def show
    @review = Review.find_by_id(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :recipe_id, :user_id)
  end
end
