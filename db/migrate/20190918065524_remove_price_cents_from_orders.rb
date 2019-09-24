class RemovePriceCentsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :price_cents
  end
end
