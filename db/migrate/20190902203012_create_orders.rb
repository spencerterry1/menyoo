class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :ordered
      t.integer :quantity
      t.integer :price
      t.references :dish, foreign_key: true
      t.references :attendee, foreign_key: true

      t.timestamps
    end
  end
end
