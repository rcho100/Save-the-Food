class Ingredient < ApplicationRecord
  has_many :recipe_ingredient_lists
  has_many :recipes, through: :recipe_ingredient_lists
end
