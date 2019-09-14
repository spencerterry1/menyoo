class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    @attendee = @booking.attendees.find_by(user: current_user)
    @payment = Payment.new(attendee: @attendee, booking: @booking)
    if @payment.save
      if params[:pay_for_all]
        @orders = @booking.orders.where(ordered: true)
      else
        @orders = @booking.orders.where(attendee: @attendee).where(ordered: true)
      end
      session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: "My orders",
            images: [@restaurant.photo_url],
            amount: @orders.map(&:price).sum * 100,
            currency: 'gbp',
            quantity: 1
          }],
          success_url: restaurant_booking_attendee_orders_url(@restaurant, @booking, @attendee),
          cancel_url: restaurant_booking_attendee_orders_url(@restaurant, @booking, @attendee)
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

  #def show
    #@user = current_user
    #@reviews = Review.find(user_id:@user)
  #end

  def destroy
    @review.destroy
    redirect_to booking_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
