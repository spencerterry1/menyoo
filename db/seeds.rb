puts 'Cleaning databases...'
User.destroy_all
Restaurant.destroy_all
Dish.destroy_all
Booking.destroy_all
Review.destroy_all
Payment.destroy_all
Attendee.destroy_all
Order.destroy_all


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

walter_test = User.new(
  first_name: 'Walter Test',
  last_name: 'Cegarra',
  email: 'walter@test.com',
  password: 'secret'
  )
walter_test.remote_photo_url =  'http://res.cloudinary.com/bywalterc/image/upload/v1565440435/uppm4cqhkiyobjurvrw7.jpg'
walter_test.save

puts "Finished!"

# RESTAURANTS
puts 'Creating Restaurants...'

italian = Restaurant.new(name: "Gloria",
  address: "54-56 Great Eastern St, Hackney, London",
  category: "Italian")

italian.remote_photo_url = "https://static.standard.co.uk/s3fs-public/thumbnails/image/2019/06/20/09/circolo-popolare-2006f.jpg?width=1000&height=614&fit=bounds&format=pjpg&auto=webp&quality=70&crop=16:9,offset-y0.5"
italian.save


italianPolpo = Restaurant.new(name: "Polpo",
  address: "41 Beak Street, Soho, London",
  category: "Italian")

italianPolpo.remote_photo_url = "https://cdn.venuescanner.com/photos/med_1819ade4c63bde2e494a519a23114bb5.jpg"
italianPolpo.save

italianEmilias = Restaurant.new(name: "Emilia’s Pasta",
address: "43 Beak Street, Soho, London",
category: "Italian")


italianEmilias.remote_photo_url = "https://www.abouttimemagazine.co.uk/wp/wp-content/uploads/2018/08/eDSC_0463.jpg"
italianEmilias.save


french = Restaurant.new(name: "Brasserie Zédel",
  address: "20 Sherwood St, Soho, London",
  category: "French")

french.remote_photo_url = "http://www.sorted-pa.com/Brasserie%20Zedel_interior_2%20-%20Copy.jpg"
french.save


french2 = Restaurant.new(name: "Côte Brasserie",
  address: "57 Whitecross St, London",
  category: "French")

french2.remote_photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZsKER0t0noNrpT7VvxuHlY1Og6t_iptfbmtEAo3gX8DezrDuN"
french2.save


british = Restaurant.new(name: "Dean Street Townhouse",
  address: "69 - 71 Dean St, London",
  category: "British")

british.remote_photo_url = "https://www.hot-dinners.com/media/reviews/photos/original/d2/f3/2d/deanst-89-1550062352.jpg"
british.save


british2 = Restaurant.new(name: "The Golden Chippy",
  address: "62 Greenwich High Road, London",
  category: "British")

british2.remote_photo_url = "https://images.ctfassets.net/8vtyxq21iryq/7enojhT4PeKmG4wCEek2WO/473a92e084d25ea2abd841de6069011b/Copyright_TheNed_Zoblers-04.jpg"
british2.save




vegan = Restaurant.new(name: "Kalifornia Kitchen",
  address: "19 Percy St, London",
  category: "Vegan")

vegan.remote_photo_url = "https://assets.londonist.com/uploads/2019/01/i875/0h3a1641.jpg"
vegan.save

puts "Finished!"


# DISHES
puts 'Creating Dishes...'

#italiandishes

italian_dish_one = Dish.new(name: "La gran carbonara",
  description: "Homemade spaghetti chitarra, pecorino, egg and parmesan",
  price: 12.00,
  prep_time: 15,
  category:"main")

italian_dish_one.restaurant = italian
italian_dish_one.remote_photo_url = "https://s23209.pcdn.co/wp-content/uploads/2014/03/IMG_2622edit.jpg"
italian_dish_one.save


italian_dish_two = Dish.new(name: "Filippo spicy balls",
  description: "Spicy pork & nduja meatballs topped with rich tomato sauce",
  price: 14.00,
  prep_time: 10,
  category:"main")

italian_dish_two.restaurant = italian
italian_dish_two.remote_photo_url = "https://www.flavcity.com/wp-content/uploads/2018/06/meatballs-tomato-sauce.jpg"
italian_dish_two.save

italian_dish_three = Dish.new(name: "Polpo caesar",
  description: "Octopus, chicory, Tuscan ham, anchovy-garlic dressing",
  price: 13.00,
  prep_time: 10,
  category:"appetizer")


italian_dish_three.restaurant = italian
italian_dish_three.remote_photo_url = "https://www.cucinare.it/uploads/wp-content/uploads/2015/04/Insalata_di_Polpo_Prezzemolata-1-1.jpg"
italian_dish_three.save

italian_dish_four = Dish.new(name: "Pizza fritta",
  description: "Fried mini pizza filled with ricotta, tomato sauce and anchovies",
  price: 7.00,
  prep_time: 15,
  category:"appetizer")


italian_dish_four.restaurant = italian
italian_dish_four.remote_photo_url = "https://www.foodiecrush.com/wp-content/uploads/2015/10/Fried-Pizza-foodiecrush.com-011-1-500x500.jpg"
italian_dish_four.save



italianPolpo_dish_one = Dish.new(name: "Bruschette",
  description: "Broad bean, mint and ricotta on sourdough toast",
  price: 7.50,
  prep_time: 15,
  category:"appetizer")

italianPolpo_dish_one.restaurant = italianPolpo
italianPolpo_dish_one.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--9867_10.jpg?itok=4rSVp4Z3"
italianPolpo_dish_one.save


italianPolpo_dish_two = Dish.new(name: "Sautéed Prawns",
  description: "Fresh Prawns served with garlic and chilly",
  price: 9.50,
  prep_time: 10,
  category:"appetizer")

italianPolpo_dish_two.restaurant = italianPolpo
italianPolpo_dish_two.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/bbcgf_recipe/public/user-recipe/IMG_5639_4.jpg?itok=kO41R7VI"
italianPolpo_dish_two.save



italianPolpo_dish_three = Dish.new(name: "Duck Gnocchi",
  description: "Fresh potato gnocchi served with black olive & tomato ragù",
  price: 9.00 ,
  prep_time: 13,
  category:"main")

italianPolpo_dish_three.restaurant = italianPolpo
italianPolpo_dish_three.remote_photo_url = "https://cdn.shopify.com/s/files/1/1725/5449/products/gnoc_900x.jpg?v=1559559463"
italianPolpo_dish_three.save


italianPolpo_dish_four = Dish.new(name: "Pizzette",
  description: "Mini pizzas with asparagus, prosciutto & tallegio",
  price: 12.00 ,
  prep_time: 15,
  category:"main")

italianPolpo_dish_four.restaurant = italianPolpo
italianPolpo_dish_four.remote_photo_url = "https://assets.epicurious.com/photos/560dd7357b55306961bfa96b/6:4/w_620%2Ch_413/234405.jpg"
italianPolpo_dish_four.save



italianPolpo_dish_six = Dish.new(name: "Sea Bass",
  description: "Pan-fried sea bass with broad bean & artichoke vignole",
  price: 11.00,
  prep_time: 20,
  category:"main")

italianPolpo_dish_six.restaurant = italianPolpo
italianPolpo_dish_six.remote_photo_url = "https://gbc-cdn-public-media.azureedge.net/img49327.768x512.jpg"
italianPolpo_dish_six.save

italianPolpo_dish_seven = Dish.new(name: "Flank Steak",
  description: "Premium steak with watercress & Portobello mushrooms",
  price: 15.00 ,
  prep_time: 15 ,
  category:"main")

italianPolpo_dish_seven.restaurant = italianPolpo
italianPolpo_dish_seven.remote_photo_url = "https://img.maximummedia.ie/her_ie/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtaGVyLm1heGltdW1tZWRpYS5pZS5zMy5hbWF6b25hd3MuY29tXFxcL3dwLWNvbnRlbnRcXFwvdXBsb2Fkc1xcXC8yMDEzXFxcLzEyXFxcL1NjcmVlbi1zaG90LTIwMTMtMTItMDgtYXQtMTEuMTIuNDkucG5nXCIsXCJ3aWR0aFwiOjc2NyxcImhlaWdodFwiOjQzMSxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3Lmhlci5pZVxcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2hlclxcXC9uby1pbWFnZS5wbmc_aWQ9MGQyZDYyN2MwNTliOWVkY2FiMGRcIixcIm9wdGlvbnNcIjpbXX0iLCJoYXNoIjoiMjUzZWE3MDBhNjBhZTc3NzNhZGFhNjA0NmI3MzEyMzAwYjM4ZDA4ZSJ9/screen-shot-2013-12-08-at-11-12-49.png"
italianPolpo_dish_seven.save



italianPolpo_dish_five = Dish.new(name: "Panna cotta",
  description: "Creamy dessert served with cream and strawberries",
  price: 7.50 ,
  prep_time: 5 ,
  category:"dessert")

italianPolpo_dish_five.restaurant = italianPolpo
italianPolpo_dish_five.remote_photo_url = "https://gbc-cdn-public-media.azureedge.net/img24987.1426x713.jpg"
italianPolpo_dish_five.save




italianEmilias_dish_one = Dish.new(name: "Finely Sliced Bresaol",
  description: "cured beef with rocket & parmesan salad on toasted ciabatta",
  price: 7.50,
  prep_time: 15,
  category:"appetizer")

italianEmilias_dish_one.restaurant = italianEmilias
italianEmilias_dish_one.remote_photo_url = "https://www.bigtonisitalian.com/images/bresaola-jpg-1008.webp"
italianEmilias_dish_one.save


italianEmilias_dish_two = Dish.new(name: "Burrata with toasted ciabatta",
  description: "Creamy cheese drizzeled with virgin Olive Oil",
  price: 9.50,
  prep_time: 10,
  category:"appetizer")

italianEmilias_dish_two.restaurant = italianEmilias
italianEmilias_dish_two.remote_photo_url = "https://heartbeetkitchen.com/foodblog/wp-content/uploads/2016/09/Burrata-with-Roasted-Tomatoes-21.jpg"
italianEmilias_dish_two.save



italianEmilias_dish_three = Dish.new(name: "Mushroom Linguini",
  description: "Creamy walnut and chesnut Mushroom sauce",
  price: 12.00,
  prep_time: 15,
  category:"main")

italianEmilias_dish_three.restaurant = italianEmilias
italianEmilias_dish_three.remote_photo_url = "https://i2.wp.com/www.lifeasastrawberry.com/wp-content/uploads/2012/12/creamy-mushroom-garlic-sauce-27.jpg"
italianEmilias_dish_three.save


italianEmilias_dish_four = Dish.new(name: "Tuna Steak",
  description: "Tuna fillet with tomato sauce, peperoncino and chopped parsley",
  price: 12.00,
  prep_time: 15,
  category:"main")

italianEmilias_dish_four.restaurant = italianEmilias
italianEmilias_dish_four.remote_photo_url = "https://www.miterrunofood.com/wp-content/uploads/2017/04/Southern-Italian-Tuna-Steak-min.jpg"
italianEmilias_dish_four.save


italianEmilias_dish_five = Dish.new(name: "Tiramisu",
  description: "Coffee, cream and chocolate cake",
  price: 8.50,
  prep_time: 5 ,
  category:"dessert")

italianEmilias_dish_five.restaurant = italianEmilias
italianEmilias_dish_five.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2018/01/tiramisu.jpg"
italianEmilias_dish_five.save


french_dish_one = Dish.new(name: "Soupe à l’Oignon Gratinée",
  description: "Slow-cooked caramelized onions, gruyere and Parmesan cheese",
  price: 5.95,
  prep_time: 10,
  category:"appetizer")

french_dish_one.restaurant = french
french_dish_one.remote_photo_url = "https://static.cuisineaz.com/610x610/i22753-soupe-a-l-oignon-gratinee.jpg"
french_dish_one.save

french_dish_two = Dish.new(name: "Boeuf Bourguignon",
  description: "Beef braised in a Burgundy wine sauce",
  price: 15.50,
  prep_time: 15,
  category:"main")

french_dish_two.restaurant = french
french_dish_two.remote_photo_url = "https://www.cookomix.com/wp-content/uploads/2017/08/boeuf-bourguinon-thermomix-800x600.jpg"
french_dish_two.save

french_dish_three = Dish.new(name: "Sardines à la Provençale",
  description: "Butterflied sardines, tomatoes and olives",
  price: 12.75,
  prep_time: 15,
  category:"appetizer")

french_dish_three.restaurant = french
french_dish_three.remote_photo_url = "https://www.soleou.fr/img/cms/fotolia_98188624.jpg"
french_dish_three.save

french_dish_four = Dish.new(name: "Profiteroles, Sauce au Chocolat",
  description: "French choux pastry with a sweet cream filling and chocolate",
  price: 6.50,
  prep_time: 10,
  category:"dessert")

french_dish_four.restaurant = french
french_dish_four.remote_photo_url = "https://www.atelierdeschefs.com/media/recette-e11064-profiterole-a-la-vanille-et-sauce-chocolat.jpg"
french_dish_four.save





british_dish_one = Dish.new(name: "Duck & Pork Terrine",
  description: "Terrine served with crispy Sourdough, pistachios and prunes",
  price: 10.90,
  prep_time: 10,
  category:"appetizer")

british_dish_one.restaurant = british
british_dish_one.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--441467_11.jpg?itok=CLLyjsjD"
british_dish_one.save


british_dish_two = Dish.new(name: "Mushroom Pate",
  description: "Pate served with crispy sourdough and tomato jam (v)",
  price: 9.00,
  prep_time: 9,
  category:"appetizer")

british_dish_two.restaurant = british
british_dish_two.remote_photo_url = "https://realfood.tesco.com/media/images/RFO-1400x919-VEGAN-PATE-Christmas-1b1e10a6-f8d7-4718-aab6-41584cad9aab-0-1400x919.jpg"
british_dish_two.save


british_dish_three = Dish.new(name: "Monkfish & Prawn Curry",
  description: "British take on an Indian classic, on a bed of wild rice",
  price: 20.00,
  prep_time:25 ,
  category:"main")

british_dish_three.restaurant = british
british_dish_three.remote_photo_url = "https://crackingcurries.files.wordpress.com/2013/04/p1010686.jpg"
british_dish_three.save


british_dish_four = Dish.new(name: "Rib-eye steak",
  description: "Prime aged steak served with chips and  béarnaise sauce",
  price: 29.00,
  prep_time: 20,
  category:"main")

british_dish_four.restaurant = british
british_dish_four.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--15306_12.jpg?itok=ynNfCRVJ"
british_dish_four.save


british_dish_five = Dish.new(name: "Sticky Toffee Pudding",
  description: "Traditional British dessert served with Devon Clotted Cream",
  price: 7.50,
  prep_time: 10,
  category:"dessert")

british_dish_five.restaurant = british
british_dish_five.remote_photo_url = "https://images.buffalonews.com/gallery-images/2019/08/02/big_thumbnail/1013396067%20Black%20Sheep%2015%20Cantillon.JPG"
british_dish_five.save






vegan_dish_one = Dish.new(name: "Roast vegetable tagine",
  description: "Chickpeas, roasted cauliflower, dates, tomatoes & preserved lemon",
  price: 11.00,
  prep_time: 15,
  category: "appetizer")

vegan_dish_one.restaurant = vegan
vegan_dish_one.remote_photo_url = "https://1033651.v1.pressablecdn.com/wp-content/uploads/2017/01/roasted-vegetable-and-chickpea-tagine-with-harissa-b-1200x750.jpg"
vegan_dish_one.save



vegan_dish_two = Dish.new(name: "Jackfruit Tacos",
  description: "Pulled jackfruit, fennel caper salad and roasted tomatoes",
  price: 13.00,
  prep_time:15,
  category: "main")

vegan_dish_two.restaurant = vegan
vegan_dish_two.remote_photo_url = "https://cdn77-s3.lazycatkitchen.com/wp-content/uploads/2017/05/pulled-jackfruit-tacos-lunch-800x1200.jpg"
vegan_dish_two.save



vegan_dish_three = Dish.new(name: "Kalifornia Guac Burger",
  description: "Bean burger, guacamole, rainbow slaw, served with thyme fries",
  price:14.50,
  prep_time:20,
  category: "main")

vegan_dish_three.restaurant = vegan
vegan_dish_three.remote_photo_url = "https://www.emilieeats.com/wp-content/uploads/2017/07/sweet-earth-asian-veggie-burgers-mango-cabbage-slaw-sriracha-sauce-vegan-healthy-easy-dinner-12.jpg"
vegan_dish_three.save


vegan_dish_four = Dish.new(name: "Chocolate Orange Mousse Cake",
  description: "Delicious, creamy, refined sugar free and gluten free",
  price: 8.00,
  prep_time: 5,
  category: "dessert")

vegan_dish_four.restaurant = vegan
vegan_dish_four.remote_photo_url = "https://i.pinimg.com/564x/d6/e3/e3/d6e3e39afa9b1d64fdeef8237c1b0d1d.jpg"
vegan_dish_four.save




puts "Finished!"


# BOOKINGS
puts "Creating Bookings..."

booking_one = Booking.new(date: DateTime.strptime("10/14/2019", "%m/%d/%Y"))
booking_one.user = walter
booking_one.restaurant = french
booking_one.open = false
booking_one.save

booking_two = Booking.new(date: DateTime.strptime("11/16/2019", "%m/%d/%Y"))
booking_two.user = spencer
booking_two.restaurant = italian
booking_two.open = false
booking_two.save

booking_three = Booking.new(date: DateTime.strptime("11/15/2019", "%m/%d/%Y"))
booking_three.user = ana
booking_three.restaurant = british
booking_three.open = false
booking_three.save

booking_four = Booking.new(date: DateTime.strptime("11/18/2019", "%m/%d/%Y"))
booking_four.user = simona
booking_four.restaurant = vegan
booking_four.open = false
booking_four.save



puts "Finished!"

# REVIEWS
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

  review_three = Review.new
  review_three.booking = booking_four
  review_three.content = "Absolutely one of the best vegan restaurants in the city"
  review_three.rating = random_rating
  review_three.user = simona
  review_three.save
puts "Finished!"

# ORDERS
puts "Creating Orders..."


order_one = Order.new
order_one.ordered = true
order_one.quantity = 2
order_one.price = french_dish_four.price
order_one.dish = french_dish_four
order_one.save

puts "Finished!"


# ATTENDEES
puts "Creating attendees"

attendee_one = Attendee.new(accepted: false,
  payment: false)
attendee_one.user = spencer
attendee_one.booking = booking_four
attendee_one.save

attendee_two = Attendee.new(accepted: false,
  payment: false)
attendee_two.user = ana
attendee_two.booking = booking_three
attendee_two.save

attendee_three = Attendee.new(accepted: false,
  payment: false)
attendee_three.user = walter
attendee_three.booking = booking_two
attendee_three.save

attendee_four = Attendee.new(accepted: false,
  payment: false)
attendee_four.user = simona
attendee_four.booking = booking_one
attendee_four.save

puts "Finished!"


