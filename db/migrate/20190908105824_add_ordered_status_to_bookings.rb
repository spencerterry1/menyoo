class AddOrderedStatusToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :ordered, :boolean
  end
end
