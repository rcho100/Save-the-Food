class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_many :recipe_ingredient_lists
  has_many :ingredients, through: :recipe_ingredient_lists
end
