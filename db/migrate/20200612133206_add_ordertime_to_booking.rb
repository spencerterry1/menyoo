class AddOrdertimeToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :ordertime, :datetime
  end
end
