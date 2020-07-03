ActiveAdmin.register Dish do

config.filters = false
menu :priority => 3

collection_action :get_menu_items, method: :get do
end

index do
	div do
		render partial: 'index'
	end
end


controller do
    def scoped_collection
      end_of_association_chain.where(restaurant: current_admin_user.restaurant)
    end
 end

end
