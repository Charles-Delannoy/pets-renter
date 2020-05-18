class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :description
      t.date :birthdate
      t.string :type
      t.string :race
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
