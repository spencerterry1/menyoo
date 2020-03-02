class RemoveRestaurantsIdFromAdminUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :restaurants_id, :integer
  end
end
