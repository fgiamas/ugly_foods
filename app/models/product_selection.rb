class ProductSelection < ApplicationRecord
  belongs_to :product
  belongs_to :cart, touch: true

  validates :units, presence: true
  validates :kg, presence: true

end
