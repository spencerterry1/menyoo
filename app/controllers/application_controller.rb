class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :bookings_open_for_user
  helper_method :booking_open_for_user_restaurant

  # Returns an array of Open Bookings for the given User
  def bookings_open_for_user(user)
    bookings_open = []
    # All Attendees for User where User has accepted:
    attendees_user_accepted = Attendee.where(user: user, accepted: true)

    if attendees_user_accepted.count != 0
      # Create array of Bookings if Booking for that restaurant and Booking open
      attendees_user_accepted.each do |attendee|
        if attendee.booking.open == true
          bookings_open << attendee.booking
        end
      end
    end
    return bookings_open
  end

  # Returns an array of Bookings: all the open Bookings for that User, where the User has accepted to be an Attendee.
  def booking_open_for_user_restaurant(user, restaurant)
    # Using method defined in Application controller
    bookings_open_restaurant = []
    bookings_open_user = bookings_open_for_user(user)
    # Create array of Bookings if Booking for that restaurant and Booking open
    bookings_open_user.each do |booking|
      if booking.restaurant == restaurant
        bookings_open_restaurant << booking
      end
    end
    return bookings_open_restaurant
  end
end
