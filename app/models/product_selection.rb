class ProductSelection < ApplicationRecord
  belongs_to :product
  belongs_to :cart, touch: true
  has_one :shop, through: :product
  validate :check_units_or_kg

  def check_units_or_kg
    if self.units.nil? && self.kg.nil?
      errors.add(:units, "units or kg value must be present")
    end
  end

  def upcoming_selections
    self.cart.where("pick_up_date < ?", Date.today)
  end

  def past_selections
    self.cart.where("pick_up_date >= ?", Date.today)
  end

end
