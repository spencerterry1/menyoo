class AddCategoryToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :category, :string
  end
end
