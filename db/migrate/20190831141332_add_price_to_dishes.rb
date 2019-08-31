class AddPriceToDishes < ActiveRecord::Migration[5.2]
  def change
      add_monetize :dishes, :price, currency: { present: false }
  end
end
