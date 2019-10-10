class ReviewsController < ApplicationController
  before_action :require_login

  def index
    @user = User.find_by_id(params[:user_id])
    unless @user.present?
      redirect_to recipes_path, info: 'That user does not exist'
    end
    @reviews = Review.three_stars(params[:user_id])
  end

  def new
    @recipe = Recipe.find_by_id(params[:recipe_id])
    unless @recipe.present?
      redirect_to recipes_path, info: 'That recipe does not exist'
    end
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
    @review = Review.find_by_id(params[:id])
    personal_access(@review.user_id)
  end

  def update
    @review = Review.find_by_id(params[:id])
    personal_access(@review.user_id)
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render 'edit'
    end
  end
  
  def show
    @review = Review.find_by_id(params[:id])
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    personal_access(@review.user_id)
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :recipe_id, :user_id)
  end

  def personal_access(id)
    unless current_user.id == id
      redirect_to user_path(current_user), info: 'You can only access & modify your reviews'
    end
  end
end
