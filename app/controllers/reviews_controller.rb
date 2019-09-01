class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
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