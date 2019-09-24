class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :bookings_open_for_user
  helper_method :bookings_open_for_user_restaurant
  helper_method :any_booking_open_for_user_restaurant?
  helper_method :attendee_invitations_for_user
  helper_method :set_first_booking
  helper_method :set_first_restaurant

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

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
  def bookings_open_for_user_restaurant(user, restaurant)
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

  # True if there are open bookings for this user in that restaurant
  def any_booking_open_for_user_restaurant?(user, restaurant)
    bookings_open_for_user_restaurant(user, restaurant).count != 0
  end

  # Get the Attendee where User is Attendee, not yet accepted and Booking open (Add opento Booking model)
  def attendee_invitations_for_user(user)
    @attendees_user_unaccepted = Attendee.where(user: user, accepted: false)
    @attendees_user_invitations = []
    @attendees_user_unaccepted.each do |attendee|
      if attendee.booking.open
        @attendees_user_invitations << attendee
      end
    end
    return @attendees_user_invitations
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def set_first_booking
    if user_signed_in?
      user = current_user
      if bookings_open_for_user(user).count !=0
        @bookings_open = bookings_open_for_user(user).sort_by &:date
        @booking_first = @bookings_open[0]
        return @booking_first
      end
      return nil
    end
    return nil
  end

  def set_first_restaurant
    if user_signed_in?
      user = current_user
      if bookings_open_for_user(user).count !=0
        @bookings_open = bookings_open_for_user(user).sort_by &:date
        @booking_first = @bookings_open[0]
        @restaurant_first = @booking_first.restaurant
        return @restaurant_first
      end
      return nil
    end
    return nil
  end

end
