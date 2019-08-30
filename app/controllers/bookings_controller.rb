class BookingsController < ApplicationController

  def show
    @booking = Booking.last
  end
end
