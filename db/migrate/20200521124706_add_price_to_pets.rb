class AddPriceToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :price, :integer
  end
end
