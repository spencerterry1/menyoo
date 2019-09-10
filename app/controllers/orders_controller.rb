class OrdersController < ApplicationController

  # before_action :set_attendee, except: [:destroy]

  def index
    # @restaurant = @booking.restaurant
    @restaurant = Restaurant.find(params[:id])

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
    # for now, order status is set to true so user can progress to payment - to be changed
    @order.ordered = true

    @attendee = Attendee.where(user: current_user, booking: @booking).last
    @order.attendee = @attendee

    # @restaurant = @booking.restaurant
    @restaurant = Restaurant.find(params[:id])

    # @booking = @attendee.booking
    @booking = bookings_open_for_user_restaurant(current_user, @restaurant).last

    if @order.save
      redirect_to restaurant_booking_attendee_orders_path(@restaurant, @booking, @attendee), notice: 'Your new order has been placed'
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
