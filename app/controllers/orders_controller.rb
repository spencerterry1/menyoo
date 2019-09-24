class OrdersController < ApplicationController

  # before_action :set_attendee, except: [:destroy]
  before_action :set_first_booking
  before_action :set_first_restaurant

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

    @dish = Dish.find(params[:order][:dish_id])

    # @booking = @attendee.booking
    @booking = bookings_open_for_user_restaurant(current_user, @restaurant).last

    @attendee = Attendee.where(user: current_user, booking: @booking).last
    @order.attendee = @attendee

    if @order.save
      respond_to do |format|
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
      # redirect_to restaurant_path(@restaurant)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    order = Order.find(params[:id])
    order.delete
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @attendee = Attendee.find(params[:attendee_id])
    redirect_to restaurant_booking_attendee_orders_path(@restaurant, @booking, @attendee)
  end

end

def order_params
  params.require(:order).permit(:dish_id, :price, :quantity, :ordered)
end

# def set_attendee
#   @attendee = Attendee.find(params[:id])
# end
