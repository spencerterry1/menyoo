class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @restaurant = @booking.restaurant
    @users = User.all
    @attendee = Attendee.new

    @attendee_user = Attendee.where(user: current_user, booking: @booking)

    # calls search_for_users method if a user tries to type in the search bar to add another use to the table
    search_for_users if params[:search]
  end


  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.new()
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.restaurant = @restaurant
    @booking.save

    @attendee = Attendee.new(accepted: true, payment: false)
    @attendee.user = current_user
    @attendee.booking = @booking
    @attendee.save

    redirect_to restaurant_booking_path(@restaurant, @booking)
  end


  def summary
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @orders = @booking.orders
    @attendees = @booking.attendees

    # calculates total order price, stored in @order_total
    @order_total = 0
    @orders.each do |order|
      @order_total += order.dish.price
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking.ordered = true
    @booking.save
    redirect_to restaurant_booking_summary_path(@restaurant, @booking)
  end

  def pay
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @orders = @booking.orders
    @attendees = @booking.attendees
    @order_total = 0

    @orders.each do |order|
      order_price = order.dish.price.to_i
      @order_total += order_price
    end

    # call function 'convert_to_pence'

    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

    charge = Stripe::Charge.create(
      customer:     customer.id,  # You should store this customer id and re-use it.
      amount:       @order_total,
      description:  "Payment for Table Booking #{@booking}",
      currency:     "gbp"
    )

    @attendees.each do |attendee|
      attendee.payment = true
      attendee.save
    end

    # @order.update(payment: charge.to_json, state: 'paid')
    flash[:alert] = "Your bill has been paid"

    redirect_to restaurants_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to restaurant_booking_summary_path(@restaurant, @booking)
  end


  private

  def search_for_users
    @attendees = Attendee.all
    @search = params[:search]
    if @search.present?
      @name = @search[:name].capitalize
      @user = User.where(first_name: @name).first
    end
  end

  def booking_params
    params.require(:booking).permit(:date)
  end

end
