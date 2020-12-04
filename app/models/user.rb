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
end


