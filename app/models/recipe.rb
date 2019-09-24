class Recipe < ApplicationRecord
  has_many :ingredients
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
end
