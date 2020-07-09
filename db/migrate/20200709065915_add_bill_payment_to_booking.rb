class AddBillPaymentToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :bill_payment, :boolean
  end
end
