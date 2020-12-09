class Shop < ApplicationRecord
  after_touch :calculate_rating
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_selections, through: :products
  has_one_attached :photo
  has_many :likes, dependent: :destroy
  has_many :chatrooms
  validates :name, presence: true, length: { minimum: 2 }
  validates :website, presence: true
  validates :address, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def calculate_rating
    total_rating = 0
    self.ratings.each do |rating|
      total_rating += rating.rating
    end
    rating = total_rating/self.ratings.count.to_f
    rating.round(2)
  end

  def ugly_foods
    self.products.all.where(status: 0)
  end

  def old_foods
    oldies = self.products.all.where(status: 1)
    oldies.select do |oldie|
      oldie.produce_type.category == "vegetable" || oldie.produce_type.category == "fruit"
    end
  end

  def flowers
    oldies = self.products.all.where(status: 1)
    oldies.select do |oldie|
      oldie.produce_type.category == "flower"
    end
  end

  def confirmed_orders
    self.product_selections.joins(:cart).where(carts: {status: "confirmed"})
  end

  def past_confirmed_orders
    self.confirmed_orders.joins(:cart).where("carts.pick_up_date < ?" , Date.today)
  end

  def upcoming_confirmed_orders
    self.confirmed_orders.joins(:cart).where("carts.pick_up_date >= ?" , Date.today)
  end

  def filtered_by_produce
    shop = self.where()
  end

  def filtered_by_flowers
  end

  def amnt_saved
    flower_sum = 0
    units_ugly_sum = 0
    kg_ugly_sum = 0
    units_old_sum = 0
    kg_old_sum = 0
    self.product_selections.each do |selection|
        if selection.product.produce_type.category == "flower" && selection.cart.status == "confirmed"
          if selection.units
          flower_sum += selection.units
          end
        elsif selection.product.status == "ugly" && selection.cart.status == "confirmed"
          if selection.kg
            kg_ugly_sum += selection.kg
          end
          if selection.units
            units_ugly_sum += selection.units
          end
        elsif selection.product.status == "old" && selection.cart.status == "confirmed"
          if selection.kg
            kg_old_sum += selection.kg
          end
          if selection.units
            units_old_sum += selection.units
          end
        end
    end
    return {
      flower_sum: flower_sum,
      units_ugly_sum: units_ugly_sum,
      kg_ugly_sum: kg_ugly_sum,
      units_old_sum: units_old_sum,
      kg_old_sum: kg_old_sum
    }
  end

end
