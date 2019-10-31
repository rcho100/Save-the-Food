class RecipesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show, :top_three]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    5.times {@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
    personal_access(@recipe.user_id)
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    personal_access(@recipe.user_id)

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end 

  def destroy
    Recipe.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

  def under_thirty
    @recipes = Recipe.under_thirty
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :servings, :time, :directions, ingredient_ids: [], ingredients_attributes: [:name])
  end

  def personal_access(id)
    unless current_user.id == id
      redirect_to user_path(current_user), info: 'You can only edit your recipes'
    end
  end
end
