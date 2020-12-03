class ProductSelection < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :cart, touch: true
  has_one :shop, through: :product
  validate :check_units_or_kg

  def check_units_or_kg
    if self.units.nil? && self.kg.nil?
      errors.add(:units, "units or kg value must be present")
    end
  end

  def in_the_past?
    self.cart.pick_up_date <= Date.today

  end



  def in_the_future?
    self.cart.pick_up_date > Date.today

  end

  def total_price
    self.units ? quantity = self.units : quantity = self.kg
    total_price = quantity * (self.product.price_per_unit * (self.product.discount_percent/100.to_f))
    return total_price
  end
end
