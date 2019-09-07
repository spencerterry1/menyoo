class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def bookings
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
  end

  def reviews
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
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
