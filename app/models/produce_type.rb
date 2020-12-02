class ProduceType < ApplicationRecord
  has_many :products
  enum category: { vegetable: 0, fruit: 1, flower: 2 }
end
