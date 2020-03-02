class AddRestaurantToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :restaurant, foreign_key: true
  end
end
