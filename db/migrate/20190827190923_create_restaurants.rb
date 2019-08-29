class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :photo
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
