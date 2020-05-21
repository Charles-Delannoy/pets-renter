class Pet < ApplicationRecord
  belongs_to :user

  has_many :bookings
  validates :name, :description, :birthdate, :pet_type, :address, presence: true
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
