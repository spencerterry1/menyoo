ActiveAdmin.register_page "Analytics" do


menu :priority => 5

content only: [:index] do
	render 'index'
end


controller do

	def index

		reviews = Review.all
		@reviews_array = []
		reviews.each do |review|
			if review.booking.restaurant == current_admin_user.restaurant
				@reviews_array << review
			end
		end

	end

end



end