class AddOpenToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :open, :boolean
  end
end
