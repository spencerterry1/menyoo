class AddCheckedinToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :checkedin, :boolean
  end
end
