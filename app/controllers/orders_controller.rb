class OrdersController < ApplicationController

  before_action :set_attendee, except: [:destroy]

  def index
    @orders = @attendee.orders.all
    @booking = @attendee.booking
    @restaurant = @booking.restaurant
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # raise
    @order.attendee = @attendee
    @booking = @attendee.booking
    @restaurant = @booking.restaurant
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

def set_attendee
  @attendee = current_user.attendees.last
end
