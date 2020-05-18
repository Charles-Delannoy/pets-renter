class RenameTypeColumnForPets < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :type, :pet_type
  end
end
