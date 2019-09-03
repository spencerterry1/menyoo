class OrdersController < ApplicationController

  before_action :set_attendee, except: [:destroy]

  def show
  end

  def new
    @order = Order.new
  end

  def create
     @order = Order.new(order_params)
     # raise
     @order.attendee = @attendee
     if @order.save
      flash[:notice] = 'Your new order has been placed'
    end
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
  @attendee = current_user.attendees.last
end
