class ProductSelection < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :cart, touch: true
  validate :check_units_or_kg

  def check_units_or_kg
    if self.units.nil? && self.kg.nil?
      errors.add(:units, "units or kg value must be present")
    end
  end
end
