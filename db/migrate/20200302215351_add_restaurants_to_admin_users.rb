class AddRestaurantsToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :restaurants, foreign_key: true
  end
end


