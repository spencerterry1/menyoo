class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
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
