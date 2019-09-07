class UsersController < ApplicationController

  def show
    @user = current_user
    # Get the Attendee where User is Attendee, not yet accepted and Booking open (Add opento Booking model)
    # @attendee_user = Attendee.where(user: current_user, booking: @booking)
  end

  def previous_bookings
    @bookings = current_user.bookings
  end

  private

  def attendees_for_user(user)
    @attendees_user_unaccepted = Attendee.where(user: user, accepted: false)
    @attendees_user_invitations = []
    @attendees_user_unaccepted.each do |attendee|

    end
  end

end
