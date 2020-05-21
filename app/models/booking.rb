require 'date'

class Booking < ApplicationRecord
  before_validation :set_price
  belongs_to :user
  belongs_to :pet
  validates :start_date, :end_date, presence: true

  def set_price
    if self.start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    else
      self.days = (end_date - start_date).to_i
      self.price = days * pet.price
    end
  end

end
