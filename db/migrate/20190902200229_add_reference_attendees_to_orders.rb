class AddReferenceAttendeeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference(:orders, :attendees)
  end
end
