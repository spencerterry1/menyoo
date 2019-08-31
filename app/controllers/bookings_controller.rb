class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new()
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
    params.require(:booking).permit(:date)
  end

end
