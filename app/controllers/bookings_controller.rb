class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @restaurant = @booking.restaurant
    @users = User.all
    @attendee = Attendee.new

    # @attendee_user = current_user.attendees.last
    @attendee_user = Attendee.where(user: current_user, booking: @booking)

    # calls search_for_users method if a user tries to type in the search bar to add another use to the table
    search_for_users if params[:search]
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new()
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.restaurant = @restaurant
    @booking.save

    @attendee = Attendee.new(accepted: false, payment: false)
    @attendee.user = current_user
    @attendee.booking = @booking
    @attendee.save

    redirect_to restaurant_booking_path(@restaurant, @booking)
  end


  private

  def search_for_users
    @attendees = Attendee.all
    @search = params[:search]
    if @search.present?
      @name = @search[:name].capitalize
      @user = User.where(first_name: @name).first
    end
  end

  def booking_params
    params.require(:booking).permit(:date)
  end

end
