class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def previous_bookings
    @bookings = current_user.bookings
  end
end
