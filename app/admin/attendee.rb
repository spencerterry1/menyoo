ActiveAdmin.register Attendee, as: 'Past Order' do

menu :priority => 4

filter :id
filter :booking_id
filter :created_at

controller do

	def scoped_collection # scope DB collection to current admin user's restaurant
		current_admin_user.restaurant.attendees
	end

end

permit_params :accepted, :payment

index do
    selectable_column
    id_column
    column :user
    column :booking_id
    column :payment
    column :created_at
    actions
end


show do

 	attendee = Attendee.find(params[:id])
	past_restaurant_bookings_array = []
	Attendee.all.each do |attendee|
		attendee.orders.each do |order|
		past_restaurant_bookings_array << order
	end



	end
	  panel "Orders for Attendee" do
	   	table_for(past_restaurant_bookings_array) do |attendee_order|
		    attendee_order.column("Order ID") {|order| order.id }
		  	attendee_order.column("Dish") {|order| order.dish.name }
		    attendee_order.column("Ordered?") {|order| order.ordered }
		    attendee_order.column("Price") {|order| humanized_money_with_symbol(order.price) }
		    attendee_order.column("Date") {|order| order.created_at }
	    end
	end
	end

end