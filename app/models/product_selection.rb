class ProductSelection < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :units, presence: true
  validates :kg, presence: true

end
