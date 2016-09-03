class Review < ApplicationRecord
  belongs_to :product
  # validates :body, presence: true
  validates :rating, presence: true
  belongs_to :user


  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

end
