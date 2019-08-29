class DishesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dishes = Dish.all
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.find(params[:id])
  end
end
