ActiveAdmin.register_page "Dashboard" do
  menu priority: 1
  
 content title: proc { I18n.t("active_admin.dashboard") } do

 columns do

    

    column do
      open_bookings = current_admin_user.restaurant.bookings.where(open:true)
      panel "Open Tables" do
	      	open_orders = []
	      	open_bookings.each do |booking|
	      		open_orders << booking.orders.where(ordered:true) 
	      	end
	      	open_orders.flatten!
	      	open_orders.sort_by(&:created_at)


	      	table_for open_orders do
	      		column("Order ID") { |order| order.id }
	      		column("Attendee ID") { |order| order.attendee.id}
	      		column("Booking ID") { |order| order.attendee.booking.id }
	      		column("Ordered?") { |order| order.ordered }
	      		column("Time Ordered") { |order| order.updated_at }
	      		column("Price") { |order| order.price }
	      		column ("Payment Status") { |order| order.attendee.payment }
	      	end	
      end
    end

    column do  
    	panel "Closed Tables" do
    		
    	end
    end

  
  end # end columns
 end
end
