class Shop < ApplicationRecord
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
end
