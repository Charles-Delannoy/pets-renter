class AddAddressToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :address, :string
  end
end
