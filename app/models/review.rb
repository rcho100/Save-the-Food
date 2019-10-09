class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :content, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def self.three_stars(user_id)
    joins(:user).where("rating > 3").where("user_id == ?", user_id)
  end
end
