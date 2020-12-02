class Product < ApplicationRecord
  belongs_to :shop
  has_many :product_selections, dependent: :destroy
  belongs_to :produce_type
  enum status: { ugly: 0, old: 1 }

  validates :discount_percent, presence: true
  validates :price_per_unit, presence: true
  validates :lifespan, presence: true, inclusion: 6..12
  validates :status, presence: true
  validates :total_kg, presence: true
  validates :total_units, presence: true
  validates :days_to_expiry, presence: true
end
