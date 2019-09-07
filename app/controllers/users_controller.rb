class UsersController < ApplicationController

  def show
    @user = current_user
    # Get the Attendee where User is Attendee, not yet accepted and Booking open (Add opento Booking model)
    @attendee_invitation = attendee_invitations_for_user(@user).last
  end

  def previous_bookings
    @bookings = current_user.bookings
  end

  private

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

end
