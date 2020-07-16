class AddServiceStatusToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :service_status, :boolean
  end
end
