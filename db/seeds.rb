puts 'Cleaning databases...'
User.destroy_all
Restaurant.destroy_all
Dish.destroy_all
Booking.destroy_all
Review.destroy_all


puts 'Creating Users...'

# USERS
spencer = User.new(first_name: 'Spencer',
  last_name: 'Terry',
  email: 'spencer@test.com',
  password: 'secret'
)
spencer.remote_photo_url = "http://res.cloudinary.com/bywalterc/image/upload/v1565441366/yp2k2funhrqlgvjecz0b.jpg"
spencer.save

ana = User.new(first_name: 'Ana',
  last_name: 'Bebic',
  email: 'anabebic.x@gmail.com',
  password: 'secret',
  )
ana.remote_photo_url = "https://res.cloudinary.com/bywalterc/image/upload/v1565441302/gijfiyet0ja2cy57oalc.jpg"
ana.save

walter = User.new(
  first_name: 'Walter',
  last_name: 'Cegarra',
  email: 'walter.cegarra@icloud.com',
  password: 'secret'
  )
walter.remote_photo_url =  'http://res.cloudinary.com/bywalterc/image/upload/v1565440435/uppm4cqhkiyobjurvrw7.jpg'
walter.save

simona = User.new(first_name: 'Simona',
  last_name: 'Cappeddu',
  email: 'simona@test.com',
  password: 'secret')
simona.remote_photo_url = "https://res.cloudinary.com/bywalterc/image/upload/v1565441484/t67gth7jc1setf7wgqzk.jpg"
simona.save

puts "Finished!"

# RESTAURANTS
puts 'Creating Restaurants...'

italian = Restaurant.new(name: "Gloria",
  address: "54-56 Great Eastern St, Hackney, London",
  category: "Italian")

italian.remote_photo_url = "https://media.timeout.com/images/105478409/630/472/image.jpg"
italian.save

french = Restaurant.new(name: "Brasserie Zédel",
  address: "20 Sherwood St, Soho, London",
  category: "French")

french.remote_photo_url = "https://blog.opentable.co.uk/wp-content/uploads/sites/110/2018/04/BrasserieZedel.jpg"
french.save

british = Restaurant.new(name: "Dean Street Townhouse",
  address: "69 - 71 Dean St, London",
  category: "British")

british.remote_photo_url = "https://assets.londonist.com/uploads/2018/09/i875/35082736_1720743961366613_6460102714125713408_n.jpg"
british.save

vegan = Restaurant.new(name: "Kalifornia Kitchen",
  address: "19 Percy St, London",
  category: "Vegan")

vegan.remote_photo_url = "https://camillajlovell.com/wp-content/uploads/2019/07/LRG_DSC02751.jpg"
vegan.save

puts "Finished!"


# DISHES
puts 'Creating Dishes...'

italian_dish_one = Dish.new(name: "La gran carbonara",
  description: "Homemade spaghetti chitarra, pecorino, crispy guanciale, egg yolk, parmigiano, a lot of pepper",
  price: 12,
  prep_time: 15)

italian_dish_one.restaurant = italian
italian_dish_one.remote_photo_url = "https://s23209.pcdn.co/wp-content/uploads/2014/03/IMG_2622edit.jpg"
italian_dish_one.save

italian_dish_two = Dish.new(name: "Filippo spicy balls",
  description: "Spicy slow-cooked pork and nduja meatballs, three hour San Marzano tomato sauce,rainbow chard, pecorino",
  price: 14,
  prep_time: 10)

italian_dish_two.restaurant = italian
italian_dish_two.remote_photo_url = "https://www.flavcity.com/wp-content/uploads/2018/06/meatballs-tomato-sauce.jpg"
italian_dish_two.save

italian_dish_three = Dish.new(name: "Polpo caesar",
  description: "Octopus, little gem, chicory, crispy Tuscan ham, punchy anchovy-garlic dressing, pane carasau",
  price: 13,
  prep_time: 10)

italian_dish_three.restaurant = italian
italian_dish_three.remote_photo_url = "https://www.cucinare.it/uploads/wp-content/uploads/2015/04/Insalata_di_Polpo_Prezzemolata-1-1.jpg"
italian_dish_three.save

italian_dish_four = Dish.new(name: "Pizza fritta",
  description: "Fried mini pizza filled with ricotta, burned tomato sauce with anchovies",
  price: 7,
  prep_time: 15)

italian_dish_four.restaurant = italian
italian_dish_four.remote_photo_url = "https://www.foodiecrush.com/wp-content/uploads/2015/10/Fried-Pizza-foodiecrush.com-011-1-500x500.jpg"
italian_dish_four.save


french_dish_one = Dish.new(name: "Soupe à l’Oignon Gratinée",
  description: "",
  price: 5.95,
  prep_time: 10)

french_dish_one.restaurant = french
french_dish_one.remote_photo_url = "https://static.cuisineaz.com/610x610/i22753-soupe-a-l-oignon-gratinee.jpg"
french_dish_one.save

french_dish_two = Dish.new(name: "Boeuf Bourguignon",
  description: "Beef braised in a Burgundy wine sauce",
  price: 15.50,
  prep_time: 15)

french_dish_two.restaurant = french
french_dish_two.remote_photo_url = "https://www.cookomix.com/wp-content/uploads/2017/08/boeuf-bourguinon-thermomix-800x600.jpg"
french_dish_two.save

french_dish_three = Dish.new(name: "Sardines à la Provençale",
  description: "Butterflied’ sardines, tomatoes and olives",
  price: 12.75,
  prep_time: 15)

french_dish_three.restaurant = french
french_dish_three.remote_photo_url = "https://www.soleou.fr/img/cms/fotolia_98188624.jpg"
french_dish_three.save

french_dish_four = Dish.new(name: "Profiteroles, Sauce au Chocolat",
  description: "",
  price: 6.5,
  prep_time: 10)

french_dish_four.restaurant = french
french_dish_four.remote_photo_url = "https://static.cuisineaz.com/610x610/i94023-profiteroles-au-chocolat-maison.jpg"
french_dish_four.save

puts "Finished!"





# BOOKINGS
puts "Creating Bookings..."

booking_one = Booking.new(date: DateTime.strptime("10/14/2019", "%m/%d/%Y"))
booking_one.user = ana
booking_one.restaurant = french
booking_one.save

booking_two = Booking.new(date: DateTime.strptime("11/16/2019", "%m/%d/%Y"))
booking_two.user = spencer
booking_two.restaurant = italian
booking_two.save

booking_three = Booking.new(date: DateTime.strptime("11/15/2019", "%m/%d/%Y"))
booking_three.user = ana
booking_three.restaurant = british
booking_three.save

booking_four = Booking.new(date: DateTime.strptime("11/18/2019", "%m/%d/%Y"))
booking_four.user = simona
booking_four.restaurant = vegan
booking_four.save

puts "Creating Reviews..."

  def random_rating
    result = Random.new
    result = result.rand(3..5)
    return result
  end

  review_one = Review.new
  review_one.booking = booking_one
  review_one.content = "Recommended in a magazine as a great late night venture, this was just the most amazing place."
  review_one.rating = random_rating
  review_one.user = walter
  review_one.save

  review_two = Review.new
  review_two.booking = booking_two
  review_two.content = "Loved the food and atmosphere, great music too!"
  review_two.rating = random_rating
  review_two.user = spencer
  review_two.save


puts "Finished!"


