class AttendeesController < ApplicationController
  before_action :set_booking, except: [:destroy]
  before_action :set_first_booking
  before_action :set_first_restaurant

  def index
    @booking = Booking.find(params[:booking_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @attendees = Attendee.all
    @search = params[:search]
    @attendee = Attendee.new
    if @search.present?
      @name = @search[:name].capitalize
      @users = User.where(first_name: @name)
      @user = User.where(first_name: @name).first
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @users = User.all
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    # raise
    @attendee.booking = @booking
    if @attendee.save
      flash[:notice] = "#{@attendee.user.first_name} has been invited"
      redirect_to restaurant_booking_attendees_path(@booking.restaurant, @booking)
    end
  end

  # Custom method to accept an invitation
  def accept
    @user = current_user
    @attendee_invitation = attendee_invitations_for_user(@user).last
    @attendee_invitation.accepted = true
    @attendee_invitation.save
    @booking = @attendee_invitation.booking
    @restaurant = @booking.restaurant
    redirect_to restaurant_booking_path(@restaurant, @booking)
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
