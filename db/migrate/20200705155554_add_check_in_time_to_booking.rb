class AddCheckInTimeToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :checkin_time, :datetime
  end
end
