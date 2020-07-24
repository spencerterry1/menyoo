ActiveAdmin.register_page "Dashboard" do

menu :priority => 1


content only: [:index, :refresh_orders] do
	render 'index'
end

page_action :refresh_orders, method: :get do
end

page_action :update_service_status, method: :patch do
end

controller do

	def index
		# Checked in bookings
		@checkedin_bookings_hash = get_checkedin_bookings
		# Bookings with open orders
		@open_orders = get_new_orders
		# Paid bookings
		@paid_bookings_hash = get_paid_bookings
	end


	def refresh_orders
      @checkedin_bookings_hash = get_checkedin_bookings
      @open_orders = get_new_orders
      @paid_bookings_hash = get_paid_bookings
      respond_to do |format|
        format.html { render partial: 'shared/ad_dashboard'}
        format.js {render :action => "refresh_orders.js"} 
      end
    end


    def update_service_status
    	booking = Booking.find(params[:booking])
    	if (booking.service_status == true)
    		booking.service_status = false
    	elsif (booking.service_status == false)
    		booking.service_status = true
    	end
    	booking.save!
    	redirect_to admin_dashboard_path
    end


   def get_checkedin_bookings
   		@checkedin_bookings = current_admin_user.restaurant.bookings.where(checkedin: true, open:true, ordered:false)
		@checkedin_bookings = @checkedin_bookings.sort_by {|booking| booking.checkin_time }

		@checkedin_bookings_hash = Hash.new

		@checkedin_bookings.each do |booking|
			@attendees_array = []
			booking.attendees.each do |attendee, booking_id|
				@attendees_array << attendee
				end
			@checkedin_bookings_hash[booking.id] = @attendees_array
		end
		@checkedin_bookings_hash
   end

    def get_new_orders # same method as in DASHBOARD / INDEX
		@open_bookings = current_admin_user.restaurant.bookings.where(checkedin: true, open:true, ordered:true, bill_payment:false)
		@open_bookings = @open_bookings.sort_by {|booking| booking.ordertime }
		# create a nested hash for all open orders to display in admin dashboard (as the index)
		@open_orders = Hash.new { |hash, key| hash[key] =[]}
		# iterate through all open bookings, attendees and attendee orders to create a hested hash
		# format of nested hash >> {booking: [{attendee: [order 1, order X...]}]}
		@open_bookings.each do |booking|
			booking.attendees.each do |attendee, booking_id|
				attendee_orders_hash = Hash.new { |hash, key| hash[key] =[]}
				attendee.orders.each do |order, attendee_id, booking_id|
					if (attendee_orders_hash[attendee.id] && order.ordered == true)
						attendee_orders_hash[attendee.id] << order.dish.name
					elsif (order.ordered == true)
						attendee_orders_hash[attendee.id] = order.dish.name
					end
				end
				# nests the open orders hash as the value of the booking ID key before iterating on to next booking
				@open_orders[booking.id] << attendee_orders_hash
			end
		end
		@open_orders
   end

   def get_paid_bookings

   		@paid_bookings = current_admin_user.restaurant.bookings.where(bill_payment:true)
		@paid_bookings = @paid_bookings.sort_by {|booking| booking.ordertime }

		@paid_bookings_hash = Hash.new { |hash, key| hash[key] =[]}

		@paid_bookings.each do |booking|
			booking.attendees.each do |attendee, booking_id|
				attendee_orders_hash = Hash.new { |hash, key| hash[key] =[]}
				attendee.orders.each do |order, attendee_id, booking_id|
					if (attendee_orders_hash[attendee.id] && order.ordered)
						attendee_orders_hash[attendee.id] << order.dish.name
					elsif (order.ordered == true)
						attendee_orders_hash[attendee.id] = order.dish.name
					end
				end
				# nests the open orders hash as the value of the booking ID key before iterating on to next booking
				@paid_bookings_hash[booking.id] << attendee_orders_hash
			end
		end
		@paid_bookings_hash
   end

# end of controller
end

end
