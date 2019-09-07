class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def previous_bookings
    @bookings = current_user.bookings
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
