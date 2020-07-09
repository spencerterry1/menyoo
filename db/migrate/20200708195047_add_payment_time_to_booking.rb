class AddPaymentTimeToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :payment_time, :datetime
  end
end
