class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_restaurant(params[:query]).geocoded.reverse
      @restaurants_all = Restaurant.geocoded
    else
      @restaurants = Restaurant.geocoded.reverse
      @restaurants_all = Restaurant.geocoded
    end

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
       # infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    if user_signed_in?
      @attendee = current_user.attendees.last
      @booking_array = bookings_open_for_user(current_user)
      @booking = @booking_array.last
      @order = Order.new
    end
  end

end
