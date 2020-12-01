class Shop < ApplicationRecord
  after_touch :calculate_rating
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 2 }
  validates :website, presence: true
  validates :address, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true

  def calculate_rating
    total_rating = 0
    self.ratings.each do |rating|
      total_rating += rating.rating
    end
    total_rating
  end

  def shop_ugly_foods
    fruits_veg = []
    fruits_veg << self.products.select { |product| product.category == 0 }
    fruits_veg << self.products.select { |product| product.category == 1 }
    ugly_foods = fruits_veg.select { |product| product.status == 0 }
  end

  def shop_old_foods

  end

  def shop_flowers

  end
end
