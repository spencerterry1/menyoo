class OrderController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = Order.new()
  end

  def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.restaurant = @restaurant
      @booking.save
      redirect_to restaurant_booking_path(@restaurant, @booking)
  end


    private

  def booking_params
    params.require(:order).permit(:date)
  end
end
