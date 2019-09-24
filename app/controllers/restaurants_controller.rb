class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_first_booking
  before_action :set_first_restaurant

  def index
    if params[:query].present?
      @restaurants = Restaurant.search_by_restaurant(params[:query]).geocoded
      @restaurants_all = Restaurant.geocoded
    else
      @restaurants = Restaurant.geocoded
      @restaurants_all = Restaurant.geocoded
    end

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant }),
        image_url: helpers.asset_url('menyoo-marker.png')
      }
    end

  end

  def show
    @restaurant = Restaurant.find(params[:id])

    if params[:query].present?
      @dishes_for_restaurant = @restaurant.dishes.search_by_dish(params[:query]).order(:name)
    else
      @dishes_for_restaurant = @restaurant.dishes.order(:name)
    end
    @categories = @dishes_for_restaurant.map(&:category).uniq.sort
    if @categories.include?("Desserts")
      @categories.delete("Desserts")
      @categories.push("Desserts")
    end


    if user_signed_in?
      if any_booking_open_for_user_restaurant?(current_user, @restaurant)
        @booking = bookings_open_for_user_restaurant(current_user, @restaurant).last
      else
        @booking = Booking.new
      end
      @attendee = Attendee.where(user: current_user, booking: @booking).last
      @order = Order.new
    end
  end

  def reviews
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.joins(:booking).where("restaurant_id = #{@restaurant.id}").order("bookings.date DESC")
  end


  private

  # def set_first_booking
  #   if user_signed_in?
  #     if bookings_open_for_user(current_user).count !=0
  #       @bookings_open = bookings_open_for_user(current_user).sort_by &:date
  #       @booking_first = @bookings_open[0]
  #     end
  #     return nil
  #   end
  #   return nil
  # end

  # def set_first_restaurant
  #   if user_signed_in?
  #     if bookings_open_for_user(current_user).count !=0
  #       @bookings_open = bookings_open_for_user(current_user).sort_by &:date
  #       @booking_first = @bookings_open[0]
  #       @restaurant_first = @booking_first.restaurant
  #     end
  #     return nil
  #   end
  #   return nil
  # end
end
