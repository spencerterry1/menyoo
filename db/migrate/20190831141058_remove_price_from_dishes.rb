class RemovePriceFromDishes < ActiveRecord::Migration[5.2]
  def change
    remove_column :dishes, :price, :integer
  end
end
