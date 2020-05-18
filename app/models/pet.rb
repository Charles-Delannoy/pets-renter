class Pet < ApplicationRecord
  belongs_to :user
  validates :name, :description, :birthdate, :pet_type, presence: true
end
