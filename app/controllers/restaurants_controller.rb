class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
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

end
