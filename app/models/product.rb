class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :produce_type
  enum category: { vegetable: 0, fruit: 0, flower: 0 }
  enum status: { ugly: 0, old: 0 }
  has_many :product_selections

  validates :discount_percent, presence: true
  validates :price_per_unit, presence: true
  validates :lifespan, presence: true, inclusion: 6..12
  validates :category, presence: true
  validates :status, presence: true
  validates :total_kg, presence: true
  validates :total_units, presence: true
  validates :days_to_expiry, presence: true
end
