ActiveAdmin.register_page "Dashboard" do


content only: [:index, :refresh_orders] do
	render 'index'
end

controller do

	def index
		# fetch all open orders for the Admin's restaurant
		@open_bookings = current_admin_user.restaurant.bookings.where(open:true, ordered:true)
		# create a nested hash for all open orders to display in admin dashboard (as the index)
		@open_orders = Hash.new { |hash, key| hash[key] =[]}
		# iterate through all open bookings, attendees and attendee orders to create a hested hash
		# format of nested hash >> {booking: [{attendee: [order 1, order X...]}]}
		@open_bookings.each do |booking|
			booking.attendees.each do |attendee, booking_id|
				attendee_orders_hash = Hash.new { |hash, key| hash[key] =[]}
				attendee.orders.each do |order, attendee_id, booking_id|
					if (attendee_orders_hash[attendee.id])
						attendee_orders_hash[attendee.id] << order.dish.name
					else
						attendee_orders_hash[attendee.id] = order.dish.name
					end
				end
				# nests the open orders hash as the value of the booking ID key before iterating on to next booking
				@open_orders[booking.id] << attendee_orders_hash
			end
		end
	end


end

end
