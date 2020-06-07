ActiveAdmin.register Booking do


  actions :index, :refresh_orders

  config.filters = false

  
  collection_action :refresh_orders, method: :get do
  end

  controller do 

    # def index
    #     redirect_to admin_root_path
    # end

    def refresh_orders
      @open_orders = get_new_orders
      respond_to do |format|
        format.html { render partial: 'shared/admin_dashboard'}
        format.js {render :action => "refresh_orders.js"} 
      end
    end

    def get_new_orders
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
      @open_orders
    end

    end

  end

end



