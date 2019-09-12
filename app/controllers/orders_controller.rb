class OrdersController < ApplicationController

  # before_action :set_attendee, except: [:destroy]

  def index
    # @restaurant = @booking.restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

    # @booking = @attendee.booking
    @booking = bookings_open_for_user_restaurant(current_user, @restaurant).last

    # @attendee = Attendee.find(params[:id])
    @attendee = Attendee.where(user: current_user, booking: @booking).last

    @orders = @attendee.orders.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    # @restaurant = @booking.restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

    # @booking = @attendee.booking
    @booking = bookings_open_for_user_restaurant(current_user, @restaurant).last

    @attendee = Attendee.where(user: current_user, booking: @booking).last
    @order.attendee = @attendee

    if @order.save
      redirect_to restaurant_booking_attendee_orders_path(@restaurant, @booking, @attendee)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

def order_params
  params.require(:order).permit(:dish_id, :price, :quantity, :ordered)
end

# def set_attendee
#   @attendee = Attendee.find(params[:id])
# end
