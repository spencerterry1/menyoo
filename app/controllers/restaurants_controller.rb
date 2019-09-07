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
      @booking_array = booking_open(current_user, @restaurant)
      @booking = @booking_array.last
      @order = Order.new
    end
  end

  private

  # Returns an array of Bookings: all the open Bookings for that User, where the User has accepted to be an Attendee.
  def booking_open(user, restaurant)
    bookings_open = []
    # All Attendees for User where User has accepted:
    attendees_user_accepted = Attendee.where(user: user, accepted: true)
    # Create array of Bookings if Booking for that restaurant and Booking open
    attendees_user_accepted.each do |attendee|
      if attendee.booking.restaurant == restaurant && attendee.booking.open == true
        bookings_open << attendee.booking
      end
    end
    return bookings_open
  end
end
