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
      @dishes_for_restaurant = @restaurant.dishes.search_by_dish(params[:query])
      @dishes_for_restaurant_all = @restaurant.dishes
    else
      @dishes_for_restaurant = @restaurant.dishes
      @dishes_for_restaurant_all = @restaurant.dishes
    end


    if user_signed_in?
      @booking = bookings_open_for_user_restaurant(current_user, @restaurant).last
      @attendee = Attendee.where(user: current_user, booking: @booking).last
      @order = Order.new

    end
  end

  def reviews
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

end
