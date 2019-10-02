class User < ApplicationRecord
  has_many :recipes
  has_many :reviews
  has_many :reviewed_recipes, through: :reviews, source: :recipe
  has_secure_password

  validates :name, :email, uniqueness: true
  validates :name, :email, presence: true

end
