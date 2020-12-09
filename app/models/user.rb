class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :shop, dependent: :destroy
  has_many :ratings
  has_many :carts, dependent: :destroy
  has_many :product_selections, through: :carts
  has_many :products, through: :shop
  has_many :incoming_product_selections, through: :products, class_name: "ProductSelection", source: :product_selectionss
  has_many :likes, dependent: :destroy
  has_many :chatrooms
  has_many :notifications, as: :recipient
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :address, presence: true

  #validates :post_code
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  #validates :city
  #validates :country
  def current_cart
    Cart.find_or_create_by(user: self, status: 0)
  end

  def user_confirmed_carts
    self.carts.where(status: "confirmed")
  end

  def user_upcoming_carts
    self.user_confirmed_carts.where("pick_up_date >= ?", Date.today)
  end

  def user_past_carts
    self.user_confirmed_carts.where("pick_up_date < ?",  Date.today)
  end

  def shops_near_me
    @shops = Shop.near("#{self.address}", 4)
  end

  def ratings_todo
    carts = self.user_past_carts
    past_shops = []
    self.product_selections.each do |selection|
      past_shops << selection.product.shop
    end
    ratings_todo = []
    past_shops.each do |shop|
      unless self.ratings.where(shop: shop).exists?
        ratings_todo << shop
      end
    end
    ratings_todo.uniq!
  end

  def amnt_saved
    flower_sum = 0
    units_ugly_sum = 0
    kg_ugly_sum = 0
    units_old_sum = 0
    kg_old_sum = 0
    self.carts.each do |cart|
      cart.product_selections.each do |selection|
        if selection.product.produce_type.category == "flower"
          if selection.units
          flower_sum += selection.units
          end
        elsif selection.product.status == "ugly"
          if selection.kg
            kg_ugly_sum += selection.kg
          end
          if selection.units
            units_ugly_sum += selection.units
          end
        else
          if selection.kg
            kg_old_sum += selection.kg
          end
          if selection.units
            units_old_sum += selection.units
          end
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

  def units_saved
  end

  def flowers_saved
  end
end
