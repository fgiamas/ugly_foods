class Shop < ApplicationRecord
  after_touch :calculate_rating
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_selections, through: :products
  has_one_attached :photo

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
    total_rating
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

end
