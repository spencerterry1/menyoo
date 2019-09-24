class ReviewsController < ApplicationController
  before_action :set_first_booking
  before_action :set_first_restaurant

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    @attendee = @booking.attendees.find_by(user: current_user)
    @payment = Payment.new(attendee: @attendee, booking: @booking)

    if @payment.save
      if params[:pay_for_all]
        attendee_orders = @booking.attendees.where(payment: false)
        @order_total = 0
        attendee_orders.each do |attendee|
          attendee.orders.each do |order|
            @order_total += order.dish.price
          end
        end
        # price amount for whole table
        @amount = (@order_total.to_i) * 100
      else
        @order_total = @booking.orders.where(attendee: @attendee).where(ordered: true).map(&:price).sum
        # price amount for jsut current user
        @amount = (@order_total.to_i) * 100
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

  def create
    @booking = Booking.find(params[:booking_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_booking_summary_path(@restaurant, @booking) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'booking/show' }
        format.js  # <-- idem
      end
    end
  end


  def destroy
    @review.destroy
    redirect_to booking_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
