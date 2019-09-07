class PaymentsController < ApplicationController

  def new
    # display the Stripe button
  end

  def create
    # callback from Stripe
    # store information about payment
  end


  private

  def set_order
    # need to include Order where Order.attendee.payment =
    @order = Order.find(params[:order_id])
  end

end
