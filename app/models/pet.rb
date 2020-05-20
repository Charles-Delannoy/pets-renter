class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :birthdate, :pet_type, presence: true
  has_one_attached :photo
end
