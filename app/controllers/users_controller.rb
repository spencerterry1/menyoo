class UsersController < ApplicationController
  before_action :set_first_booking
  before_action :set_first_restaurant

  def show
    @user = current_user
    # Get the Attendee where User is Attendee, not yet accepted and Booking open (Add opento Booking model)
    @attendee_invitation = attendee_invitations_for_user(@user).last
  end

  def bookings
    @user = User.find(params[:user_id])
    @bookings = @user.bookings.sort_by(&:date).reverse
  end

  def reviews
    @user = User.find(params[:user_id])
    @reviews = Review.joins(:booking).where("bookings.user_id = #{@user.id}").order("bookings.date DESC")
  end

  def edit
    @user = current_user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to restaurants_path
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
