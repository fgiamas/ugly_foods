class Cart < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, confirmed: 0 }
  has_many :product_selections
  validate :expiration_date_cannot_be_in_the_past
  validates :pick_up_date, presence: true

  def expiration_date_cannot_be_in_the_past
    if pick_up_date.present? && pick_up_date < Date.today
      errors.add(:pick_up_date, 'pick up date can’t be in the past')
    end
  end
end
