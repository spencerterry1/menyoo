ActiveAdmin.register Booking do


  menu :priority => 2

  actions :index, :refresh_orders

  config.filters = false

  before_action :get_new_orders

  collection_action :refresh_orders, method: :get do
  end


  controller do 

    def refresh_orders
      @open_orders = get_new_orders
      respond_to do |format|
        format.html { render partial: 'shared/ad_dashboard'}
        format.js {render :action => "refresh_orders.js"} 
      end
    end

    def get_new_orders # same method as in DASHBOARD / INDEX
    # fetch all open orders for the Admin's restaurant
    @open_bookings = current_admin_user.restaurant.bookings.where(checkedin:true, open:true, ordered:true)
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

    
    end

  # end of controller
  end

end



