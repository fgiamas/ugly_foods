class Cart < ApplicationRecord
  after_touch :calculate_price

  belongs_to :user
  enum status: [:pending, :confirmed]
  has_many :product_selections
  validate :pick_up_date_cannot_be_in_the_past
  # enums create these methods automatically
  validates :pick_up_date, presence: true, if: :confirmed?

  def pick_up_date_cannot_be_in_the_past
    if pick_up_date.present? && pick_up_date < Date.today
      errors.add(:pick_up_date, 'pick up date can’t be in the past')
    end
  end

  def calculate_price
    sum = 0
    self.product_selections.each do |product_selection|
      if product_selection.units?
        item_sum = product_selection.product.price * product_selection.units
      else
        item_sum = product_selection.product.price * product_selection.kg
      end
      sum += item_sum
    end
    self.total_price = sum
  end

end
