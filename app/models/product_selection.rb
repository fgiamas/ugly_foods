class ProductSelection < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :cart, touch: true
  after_save :edit_stock
  has_one :shop, through: :product
  validate :check_units_or_kg
  validate :check_stock

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

  def check_stock
    if self.units
      unless self.product.total_units >= self.units
        errors.add(:units, "there is insufficient stock")
      end
    else
      unless self.product.total_kg >= self.kg
        errors.add(:kg, "there is insufficient stock")
      end
    end
  end

  def total_price
    self.units ? quantity = self.units : quantity = self.kg
    total_price = (quantity * (self.product.price_per_unit * (self.product.discount_percent/100.to_f))).round(2)
    return total_price
  end

  def edit_stock
    self.product.total_units ? self.product.update(total_units: self.product.total_units - self.units) : self.product.update(total_kg: self.product.total_kg - self.kg)
  end

end
