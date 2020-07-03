ActiveAdmin.register Dish do

config.filters = false
menu :priority => 3

collection_action :get_menu_items, method: :get do
end

index do

	dishes = Dish.where(restaurant: current_admin_user.restaurant)
	appetizers = dishes.where(category:'Appetizers')
	mains = dishes.where(category:'Mains')
	drinks = dishes.where(category:'Drinks')
	desserts = dishes.where(category:'Desserts')
	sides = dishes.where(category:'Sides')



	div do
		render partial: 'index', locals: {
			dishes: dishes,
			appetizers: appetizers,
			mains: mains,
			desserts: desserts,
			drinks: drinks,
			sides: sides
		}
	end
end


controller do
    def scoped_collection
      end_of_association_chain.where(restaurant: current_admin_user.restaurant)
    end
 end

end

