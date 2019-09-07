class UsersController < ApplicationController

  def show
    @user = current_user
    # Get the Attendee where User is Attendee, not yet accepted and Booking open (Add opento Booking model)
    @attendee_invitation = attendee_invitations_for_user(@user).last
  end

  def previous_bookings
    @bookings = current_user.bookings
  end

end
