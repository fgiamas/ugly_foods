class Product < ApplicationRecord
  belongs_to :shop
  has_many :product_selections, dependent: :destroy
  belongs_to :produce_type
  enum status: { ugly: 0, old: 1 }

  validates :discount_percent, presence: true
  validates :price_per_unit, presence: true
  validates :lifespan, presence: true, inclusion: 6..12
  validates :status, presence: true
  validates :days_to_expiry, presence: true

  validate :check_units_or_kg

  def check_units_or_kg
    if self.total_units.nil? && self.total_kg.nil?
      errors.add(:total_units, "units or kg value must be present")
    end
  end
end
