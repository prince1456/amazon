class Product < ApplicationRecord
has_many :reviews, dependent: :destroy
belongs_to :category
belongs_to :user


    has_many :favourites, dependent: :destroy
    has_many :users, through: :favourites 


  # validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  # validates :title, uniqueness: true
  validates :price,  inclusion: 0..2500
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  # validates :title, case_sensitive: false
  validates :description, presence: true, length: {minimum: 10}
  #
  # after_initialize :set_defaults
  # # before_save :capitalize_title
  after_save :titleized_title

# deligate line for making relationship beetween two diffrent table
  # delegate :name, to: :category, prefix: true

  def self.search(keyword)
    where(["title ILIKE ? or description ILIKE ?", "%#{keyword}%", "%#{keyword}%"])


  end

  def next
      Product.order(:id).limit(10).offset((@page - 1) * 10)
    end

    def previous
      Product.order(:id).limit(10).offset((@page + 1) * 10)
    end

    def favourite_for(user)
      favourites.find_by_user_id user
    end

  private

  def set_defaults
    self.price ||= 1
  end

  def titleized_title

    self.title.capitalize! if title

  end


end
