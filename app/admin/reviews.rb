ActiveAdmin.register Review do


menu :priority => 6

actions :index, :show

filter :rating
filter :user
filter :booking_id
filter :created_at


index do

	 panel 'Summary' do
	 	reviews = current_admin_user.restaurant.reviews
	 	total_score = reviews.sum {|review| review.rating}
	 	@average_score = total_score / (current_admin_user.restaurant.reviews.count)
	 	@average_score.to_i

	 	@five_stars = current_admin_user.restaurant.reviews.where(rating:5).count
	 	@four_stars = current_admin_user.restaurant.reviews.where(rating:4).count
	 	@three_stars = current_admin_user.restaurant.reviews.where(rating:3).count
	 	@two_stars = current_admin_user.restaurant.reviews.where(rating:2).count
	 	@one_stars = current_admin_user.restaurant.reviews.where(rating:1).count

	 	@total_reviews = current_admin_user.restaurant.reviews.count

	 	this_month = DateTime.now
	 	
	 	@reviews_this_month = (current_admin_user.restaurant.reviews.select {|review| review.created_at - 30 <= this_month}).count



      render partial: 'reviews_summary', locals: { 
      	average_score: @average_score,
      	five_stars: @five_stars,
      	four_stars: @four_stars,
      	three_stars: @three_stars,
      	two_stars: @two_stars,
      	one_stars: @one_stars,
      	total_reviews: @total_reviews,
      	reviews_this_month: @reviews_this_month
      }

    end

    selectable_column
    id_column
    column :title
    column :content
    column :rating
    column :user
    column :booking_id
    column :created_at
    actions
end


controller do
    def scoped_collection
		current_admin_user.restaurant.reviews
    end
 end

	
end



