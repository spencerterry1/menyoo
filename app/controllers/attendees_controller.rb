class AttendeesController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @users = User.all
    @attendee = Attendee.new()
  end

  def create
    @attendee = Attendee.find(params[:id])
  end

  def destroy
  end

end
