class AddNbreJourEtPrixToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :price, :integer
    add_column :bookings, :days, :integer
  end
end
