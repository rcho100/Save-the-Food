class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :content, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }
end
