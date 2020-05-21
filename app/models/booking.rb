class Booking < ApplicationRecord
  before_validation :set_price
  belongs_to :user
  belongs_to :pet
  validates :start_date, :end_date, presence: true

  def set_price
    self.days = (end_date - start_date).to_i
    self.price = days * pet.price
  end
end
