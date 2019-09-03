class AttendeesController < ApplicationController

  before_action :set_booking, except: [:destroy]

  def new
    @booking = Booking.find(params[:booking_id])
    @users = User.all
    @attendee = Attendee.new
  end

  def create
     @attendee = Attendee.new(attendee_params)
     # raise
     @attendee.booking = @booking
     if @attendee.save
      flash[:notice] = 'Your new attendee is invited'
    end
  end

  def destroy
  end


  private

  def attendee_params
    params.require(:attendee).permit(:user_id, :accepted, :payment)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

end
