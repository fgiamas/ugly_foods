class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops, dependent: :destroy
  has_many :ratings
  has_many :carts

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :post_code, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :city, presence: true
  validates :country, presence: true
end
