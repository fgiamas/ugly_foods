class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops, dependent: :destroy
  has_many :ratings
  has_many :carts, dependent: :destroy

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
end



