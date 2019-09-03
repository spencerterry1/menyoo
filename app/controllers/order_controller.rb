class OrderController < ApplicationController

  before_action :set_attendee, except: [:destroy]

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

def order_params
  params.require(:order).permit(:dish_id, :price, :quantity, :ordered)
end

def set_attendee
  @attendee = current_user
end
