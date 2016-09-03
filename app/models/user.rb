class User < ApplicationRecord
  has_many :products

  has_many :favourites, dependent: :destroy
  has_many :favourites_products, through: :likes, source: :product


  has_many :likes, dependent: :destroy
  has_many :liked_review, through: :likes, source: :review




  # has_many :reviews
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
validates :email, presence: true, uniqueness: true
  # VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validates :email, presence: true, uniqueness: {case_sensitive: false}, format: VALID_EMAIL_REGEX
  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end
end
