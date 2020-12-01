class Shop < ApplicationRecord
  after_touch :calculate_rating
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :products, dependent: :destroy

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

end
