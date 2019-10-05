class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_many :recipe_ingredient_lists
  has_many :ingredients, through: :recipe_ingredient_lists
  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :name, :servings, :time, :directions, presence: true
  validates :name, uniqueness: true
  validates :servings, :time, numericality: { greater_than_or_equal_to: 1 }

  def ingredients_attributes=(attributes)
    attributes.values.each do |value|
      self.ingredients << Ingredient.find_or_create_by(value) if value['name'].present?
    end
  end

  scope :top_three, -> { joins(:reviews).group(:id).order(rating: :desc).limit(3) }
end
