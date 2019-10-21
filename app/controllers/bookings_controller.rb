class BookingsController < ApplicationController
  before_action :set_first_booking
  before_action :set_first_restaurant

  def index
    @bookings_open = bookings_open_for_user(current_user).sort_by &:date
  end

  def show
    @booking = Booking.find(params[:id])
    @bookings_open = bookings_open_for_user(current_user).sort_by &:date
    @restaurant = @booking.restaurant
    @users = User.all
    @attendee = Attendee.new

    @attendee_user = Attendee.where(user: current_user, booking: @booking).last

    # calls search_for_users method if a user tries to type in the search bar to add another use to the table
    search_for_users if params[:search]

    # Logic to identify index of the Booking considered, the previous and the next, if any
    @booking_index = @bookings_open.index(@booking)
    @number_bookings = @bookings_open.length
    if (@booking_index - 1) >= 0
      @prev_booking_index = @booking_index - 1
      @prev_booking = @bookings_open[@prev_booking_index]
    end
    if (@booking_index + 1) <= (@number_bookings - 1)
      @next_booking_index = @booking_index + 1
      @next_booking = @bookings_open[@next_booking_index]
    end
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

    if @booking.save
      @attendee = Attendee.new(accepted: true, payment: false)
      @attendee.user = current_user
      @attendee.booking = @booking
      @attendee.save
      redirect_to restaurant_booking_path(@restaurant, @booking)
    else
      redirect_to new_restaurant_booking_path(@restaurant)
    end
  end


  def summary
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @orders = @booking.orders
    @attendees = @booking.attendees
    @attendee = Attendee.where(user: current_user, booking: @booking).last
    @orders_for_attendee = @orders.where(attendee: @attendee)
    @review = Review.new

    @orders_not_sent_to_kitchen = @orders.where(ordered: false)
    @orders_not_sent_to_kitchen_hash = {}
    @orders_not_sent_to_kitchen.each do |order|
      if (@orders_not_sent_to_kitchen_hash[order.attendee_id])
        @orders_not_sent_to_kitchen_hash[order.attendee_id] << order
      else
        @orders_not_sent_to_kitchen_hash[order.attendee_id] = [order]
      end
    end

    @orders_sent_to_kitchen = @orders.where(ordered: true)
    @orders_sent_to_kitchen_hash = {}
    @orders_sent_to_kitchen.each do |order|
      if (@orders_sent_to_kitchen_hash[order.attendee_id])
        @orders_sent_to_kitchen_hash[order.attendee_id] << order
      else
        @orders_sent_to_kitchen_hash[order.attendee_id] = [order]
      end
    end

    # calculates total order price (orders sent to kitchen)
    # all_orders = @booking.orders.where(ordered: true)
    # @order_total = 0
    # all_orders.each do |order|
    #   @order_total += order.dish.price
    # end

    @orders_all = @attendees
    @order_table_total = 0.0
    @orders_all.each do |attendee|
      attendee.orders.where(ordered: true).each do |order|
        @order_table_total += order.dish.price
      end
    end

    # calculates total paid
    paid_orders = @attendees.where(payment: true)
    @order_paid = 0.0
    paid_orders.each do |attendee|
      attendee.orders.each do |order|
        @order_paid += order.dish.price
      end
    end

    # calculates total left to pay
    orders_not_paid = @attendees.where(payment: false)
    @order_left_to_pay = 0.0
    orders_not_paid.each do |attendee|
      attendee.orders.where(ordered: true).each do |order|
        @order_left_to_pay += order.dish.price
      end
    end

    # logic for new review on same page

    @amount = 0

    if @order_left_to_pay > 0
      @payment = Payment.new(attendee: @attendee, booking: @booking)

      if @payment.save
        if params[:pay_for_all]
          # attendee_orders = @booking.attendees.where(payment: false)
          # @order_total = 0
          # attendee_orders.each do |attendee|
          #   attendee.orders.each do |order|
          #     @order_total += order.dish.price
          #   end
          # end
          # price amount for whole table
          # @amount = (@order_total.to_i) * 100
          @amount = (@order_left_to_pay.to_i) * 100
          @amount_disp = @order_left_to_pay
        else
          @order_total = @booking.orders.where(attendee: @attendee).where(ordered: true).map(&:price).sum
          # price amount for jsut current user
          @amount = (@order_total.to_i) * 100
          @amount_disp = @order_total
        end

        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
                         name: "My orders",
                         images: [@restaurant.photo_url],
                         amount: @amount,
                         currency: 'gbp',
                         quantity: 1
          }],
          success_url: "http://www.menyoo-app.co.uk/restaurants/#{@restaurant.id}/bookings/#{@booking.id}/summary",
          cancel_url: "http://www.menyoo-app.co.uk/restaurants/#{@restaurant.id}/bookings/#{@booking.id}/summary",
        )
        @payment.update(checkout_session_id: session.id)
      end
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to root_path
  end

  def checkin
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @booking.checkedin = true
    @booking.save
    @attendee = Attendee.where(user: current_user, booking: @booking).last
    redirect_to restaurant_booking_summary_path(@restaurant, @booking, @attendees)
  end

  def update
    @booking = Booking.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @orders = @booking.orders

    @orders.each do |order|
      order.ordered = true
      order.save
    end

    flash[:alert] = "Your table's order has been sent to the kitchen"
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
