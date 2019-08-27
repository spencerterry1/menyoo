class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :price
      t.integer :prep_time
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
