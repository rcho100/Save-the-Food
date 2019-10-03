class User < ApplicationRecord
  has_many :recipes
  has_many :reviews
  has_many :reviewed_recipes, through: :reviews, source: :recipe
  has_secure_password

  validates :name, :email, uniqueness: true
  validates :name, :email, presence: true


  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
