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
                   email: 'spencer@gmail.com',
                   password: 'secret'
                   )
spencer.remote_photo_url = "http://res.cloudinary.com/bywalterc/image/upload/v1565441366/yp2k2funhrqlgvjecz0b.jpg"
spencer.save

ana = User.new(first_name: 'Ana',
               last_name: 'Bebic',
               email: 'ana@g.com',
               password: 'secret',
               )
ana.remote_photo_url = "https://res.cloudinary.com/bywalterc/image/upload/v1565441302/gijfiyet0ja2cy57oalc.jpg"
ana.save

anasere = User.new(first_name: 'Ana',
                   last_name: 'Sere',
                   email: 'anasere@lewagon.org',
                   password: 'secret',
                   )
anasere.remote_photo_url = "https://kitt.lewagon.com/placeholder/users/AnaDaks"
anasere.save

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
                  email: 'simona@gmail.com',
                  password: 'secret')
simona.remote_photo_url = "https://res.cloudinary.com/bywalterc/image/upload/v1565441484/t67gth7jc1setf7wgqzk.jpg"
simona.save

arthur = User.new(
  first_name: 'Arthur',
  last_name: 'Littman',
  email: 'arthur@gmail.com',
  password: 'secret'
)
arthur.remote_photo_url =  'https://kitt.lewagon.com/placeholder/users/arthur-littm'
arthur.save


sarah = User.new(
  first_name: 'Sarah',
  last_name: 'Lafer',
  email: 'sarah@gmail.com',
  password: 'secret'
)
sarah.remote_photo_url =  'https://kitt.lewagon.com/placeholder/users/sarahlafer'
sarah.save


rob = User.new(
  first_name: 'Rob',
  last_name: 'Krok',
  email: 'rob@gmail.com',
  password: 'secret'
)
rob.remote_photo_url =  'https://kitt.lewagon.com/placeholder/users/krokrob'
rob.save


ben = User.new(
  first_name: 'Benjamin',
  last_name: 'Baranger',
  email: 'ben@gmail.com',
  password: 'secret'
)
ben.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-U63SAARK8-cf2c97eaf5f2-72'
ben.save

agota = User.new(
  first_name: 'Agota',
  last_name: 'Kocsis',
  email: 'agota@gmail.com',
  password: 'secret'
)
agota.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-UHAFRJP5H-20ffc3d9bde8-72'
agota.save


sam = User.new(
  first_name: 'Sam',
  last_name: 'Cheesam',
  email: 'sam@gmail.com',
  password: 'secret'
)
sam.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-UHQCP01EG-a6582ce35d87-72'
sam.save

katherine = User.new(
  first_name: 'Katherine',
  last_name: 'Smith',
  email: 'katherine@gmail.com',
  password: 'secret'
)
katherine.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-UCPGN10PQ-92ef96a13b65-72'
katherine.save


johnny = User.new(
  first_name: 'Johnny',
  last_name: 'Smith',
  email: 'johnny@gmail.com',
  password: 'secret'
)
johnny.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-UFC6HPQ56-a45952a987b8-72'
johnny.save



sunny = User.new(
  first_name: 'Sunny',
  last_name: 'Smith',
  email: 'sunnny@gmail.com',
  password: 'secret'
)
sunny.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-UHQCP4P0U-69f9d8fbeecb-72'
sunny.save


marco = User.new(
  first_name: 'Marco',
  last_name: 'Smith',
  email: 'marco@gmail.com',
  password: 'secret'
)
marco.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-U9J238QUR-d300c6040074-72'
marco.save

alex = User.new(
  first_name: 'Alex',
  last_name: 'Smith',
  email: 'alex@gmail.com',
  password: 'secret'
)
alex.remote_photo_url =  'https://ca.slack-edge.com/T02NE0241-U1LDR6C7M-203275a6b9d3-72'
alex.save










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

italianPolpo.remote_photo_url = "https://www.cityam.com/wp-content/uploads/2019/05/bright-5be0480c1c4ac.jpg"
italianPolpo.save

italianEmilias = Restaurant.new(name: "Emilia’s Pasta",
                                address: "252-254 West End Ln, West Hampstead, London",
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


vegan = Restaurant.new(name: "Kalifornia Kitchen",
                       address: "19 Percy St, London",
                       category: "Vegan")

vegan.remote_photo_url = "https://assets.londonist.com/uploads/2019/01/i875/0h3a1641.jpg"
vegan.save


british = Restaurant.new(name: "Dean St. Townhouse",
                         address: "69 - 71 Dean St, London",
                         category: "British")

british.remote_photo_url = "https://www.hot-dinners.com/media/reviews/photos/original/d2/f3/2d/deanst-89-1550062352.jpg"
british.save

puts "Finished!"


# DISHES
puts 'Creating Dishes...'

#italiandishes

italian_dish_one = Dish.new(name: "La gran carbonara",
                            description: "Homemade spaghetti chitarra, pecorino, egg and parmesan",
                            price: 12.00,
                            prep_time: 15,
                            category:"Mains")

italian_dish_one.restaurant = italian
italian_dish_one.remote_photo_url = "https://s23209.pcdn.co/wp-content/uploads/2014/03/IMG_2622edit.jpg"
italian_dish_one.save


italian_dish_two = Dish.new(name: "Filippo spicy balls",
                            description: "Spicy pork & nduja meatballs topped with rich tomato sauce",
                            price: 14.00,
                            prep_time: 10,
                            category:"Mains")

italian_dish_two.restaurant = italian
italian_dish_two.remote_photo_url = "https://www.flavcity.com/wp-content/uploads/2018/06/meatballs-tomato-sauce.jpg"
italian_dish_two.save

italian_dish_three = Dish.new(name: "Polpo caesar",
                              description: "Octopus, chicory, Tuscan ham, anchovy-garlic dressing",
                              price: 13.00,
                              prep_time: 10,
                              category:"Appetizers")


italian_dish_three.restaurant = italian
italian_dish_three.remote_photo_url = "https://www.cucinare.it/uploads/wp-content/uploads/2015/04/Insalata_di_Polpo_Prezzemolata-1-1.jpg"
italian_dish_three.save

italian_dish_four = Dish.new(name: "Pizza fritta",
                             description: "Fried mini pizza filled with ricotta, tomato sauce and anchovies",
                             price: 7.00,
                             prep_time: 15,
                             category:"Appetizers")


italian_dish_four.restaurant = italian
italian_dish_four.remote_photo_url = "https://www.foodiecrush.com/wp-content/uploads/2015/10/Fried-Pizza-foodiecrush.com-011-1-500x500.jpg"
italian_dish_four.save



italianPolpo_dish_one = Dish.new(name: "Bruschette",
                                 description: "Broad bean, mint and ricotta on sourdough toast",
                                 price: 7.00,
                                 prep_time: 15,
                                 category:"Appetizers")

italianPolpo_dish_one.restaurant = italianPolpo
italianPolpo_dish_one.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--9867_10.jpg?itok=4rSVp4Z3"
italianPolpo_dish_one.save


italianPolpo_dish_two = Dish.new(name: "Sautéed Prawns",
                                 description: "Fresh Prawns served with garlic and chilly",
                                 price: 9.00,
                                 prep_time: 10,
                                 category:"Appetizers")

italianPolpo_dish_two.restaurant = italianPolpo
italianPolpo_dish_two.remote_photo_url = "https://res.cloudinary.com/dw1lypxzb/image/upload/v1580054201/1189-11040-duck-confit-gnocch-1040x650-72dpi-7_595_xfhgit.jpg"
italianPolpo_dish_two.save



italianPolpo_dish_three = Dish.new(name: "Duck Gnocchi",
                                   description: "Fresh potato gnocchi served with black olive & tomato ragù",
                                   price: 9.00 ,
                                   prep_time: 13,
                                   category:"Mains")

italianPolpo_dish_three.restaurant = italianPolpo
italianPolpo_dish_three.remote_photo_url = "https://res.cloudinary.com/dw1lypxzb/image/upload/v1580054201/1189-11040-duck-confit-gnocch-1040x650-72dpi-7_595_xfhgit.jpg"
italianPolpo_dish_three.save


italianPolpo_dish_four = Dish.new(name: "Pizzette",
                                  description: "Mini pizzas with asparagus, prosciutto & tallegio",
                                  price: 12.00 ,
                                  prep_time: 15,
                                  category:"Mains")

italianPolpo_dish_four.restaurant = italianPolpo
italianPolpo_dish_four.remote_photo_url = "https://assets.epicurious.com/photos/560dd7357b55306961bfa96b/6:4/w_620%2Ch_413/234405.jpg"
italianPolpo_dish_four.save



italianPolpo_dish_six = Dish.new(name: "Sea Bass",
                                 description: "Pan-fried sea bass with broad bean & artichoke vignole",
                                 price: 11.00,
                                 prep_time: 20,
                                 category:"Mains")

italianPolpo_dish_six.restaurant = italianPolpo
italianPolpo_dish_six.remote_photo_url = "https://gbc-cdn-public-media.azureedge.net/img49327.768x512.jpg"
italianPolpo_dish_six.save

italianPolpo_dish_seven = Dish.new(name: "Flank Steak",
                                   description: "Premium steak with watercress & Portobello mushrooms",
                                   price: 15.00 ,
                                   prep_time: 15 ,
                                   category:"Mains")

italianPolpo_dish_seven.restaurant = italianPolpo
italianPolpo_dish_seven.remote_photo_url = "https://img.maximummedia.ie/her_ie/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtaGVyLm1heGltdW1tZWRpYS5pZS5zMy5hbWF6b25hd3MuY29tXFxcL3dwLWNvbnRlbnRcXFwvdXBsb2Fkc1xcXC8yMDEzXFxcLzEyXFxcL1NjcmVlbi1zaG90LTIwMTMtMTItMDgtYXQtMTEuMTIuNDkucG5nXCIsXCJ3aWR0aFwiOjc2NyxcImhlaWdodFwiOjQzMSxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3Lmhlci5pZVxcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2hlclxcXC9uby1pbWFnZS5wbmc_aWQ9MGQyZDYyN2MwNTliOWVkY2FiMGRcIixcIm9wdGlvbnNcIjpbXX0iLCJoYXNoIjoiMjUzZWE3MDBhNjBhZTc3NzNhZGFhNjA0NmI3MzEyMzAwYjM4ZDA4ZSJ9/screen-shot-2013-12-08-at-11-12-49.png"
italianPolpo_dish_seven.save



italianPolpo_dish_five = Dish.new(name: "Panna cotta",
                                  description: "Creamy dessert served with cream and strawberries",
                                  price: 7.00 ,
                                  prep_time: 5 ,
                                  category:"Desserts")

italianPolpo_dish_five.restaurant = italianPolpo
italianPolpo_dish_five.remote_photo_url = "https://gbc-cdn-public-media.azureedge.net/img24987.1426x713.jpg"
italianPolpo_dish_five.save



italianPolpo_dish_eight = Dish.new(name: "Arancini",
                                   description: "Rice balls stuffed with nduja, breaded and fried",
                                   price: 4.00 ,
                                   prep_time: 10 ,
                                   category:"Appetizers")

italianPolpo_dish_eight.restaurant = italianPolpo
italianPolpo_dish_eight.remote_photo_url = "https://www.strongertogether.coop/sites/default/files/Arancini%20.jpg"
italianPolpo_dish_eight.save



italianPolpo_dish_nine = Dish.new(name: "Caprese skewers",
                                  description: "Mini mozzarella balls, cherry tomatoes, basil leaves",
                                  price: 3.00 ,
                                  prep_time: 5 ,
                                  category:"Appetizers")

italianPolpo_dish_nine.restaurant = italianPolpo
italianPolpo_dish_nine.remote_photo_url = "https://iowagirleats.com/wp-content/uploads/2012/02/CapreseSkewers_4.jpg"
italianPolpo_dish_nine.save



italianPolpo_dish_ten = Dish.new(name: "Tiramisu pot",
                                 description: "Coffee-flavoured dessert with a mascarpone cheese cream",
                                 price: 5.00 ,
                                 prep_time: 10 ,
                                 category:"Desserts")

italianPolpo_dish_ten.restaurant = italianPolpo
italianPolpo_dish_ten.remote_photo_url = "https://blog.williams-sonoma.com/wp-content/uploads/2013/12/WS_DOD_Tiramisu_3569.jpg"
italianPolpo_dish_ten.save



italianPolpo_dish_eleven = Dish.new(name: "Nutella pizzetta",
                                    description: "Pizza dough, nutella, chocolate chips",
                                    price: 6.00,
                                    prep_time: 5 ,
                                    category:"Desserts")

italianPolpo_dish_eleven.restaurant = italianPolpo
italianPolpo_dish_eleven.remote_photo_url = "https://uncutrecipes.com/Images-Recipes-Nutella/Nutella-Pizza-with-Chocolate-Chips.jpg"
italianPolpo_dish_eleven.save



italianPolpo_dish_twelve = Dish.new(name: "Affogato al caffè",
                                    description: "Vanilla gelato topped with a shot of hot espresso",
                                    price: 4.00,
                                    prep_time: 5 ,
                                    category:"Desserts")

italianPolpo_dish_twelve.restaurant = italianPolpo
italianPolpo_dish_twelve.remote_photo_url = "http://www.veryeatalian.com/wp-content/uploads/2015/03/Affogato-al-caffe-veryEATalian-25.jpg"
italianPolpo_dish_twelve.save



italianEmilias_dish_one = Dish.new(name: "Finely Sliced Bresaol",
                                   description: "Cured beef with rocket & parmesan salad on ciabatta",
                                   price: 7.00,
                                   prep_time: 15,
                                   category:"Appetizers")

italianEmilias_dish_one.restaurant = italianEmilias
italianEmilias_dish_one.remote_photo_url = "https://www.bigtonisitalian.com/images/bresaola-jpg-1008.webp"
italianEmilias_dish_one.save


italianEmilias_dish_two = Dish.new(name: "Burrata with toasted ciabatta",
                                   description: "Creamy cheese drizzeled with virgin Olive Oil",
                                   price: 9.00,
                                   prep_time: 10,
                                   category:"Appetizers")

italianEmilias_dish_two.restaurant = italianEmilias
italianEmilias_dish_two.remote_photo_url = "https://heartbeetkitchen.com/foodblog/wp-content/uploads/2016/09/Burrata-with-Roasted-Tomatoes-21.jpg"
italianEmilias_dish_two.save



italianEmilias_dish_three = Dish.new(name: "Mushroom Linguini",
                                     description: "Creamy walnut and chesnut Mushroom sauce",
                                     price: 12.00,
                                     prep_time: 15,
                                     category:"Mains")

italianEmilias_dish_three.restaurant = italianEmilias
italianEmilias_dish_three.remote_photo_url = "https://i2.wp.com/www.lifeasastrawberry.com/wp-content/uploads/2012/12/creamy-mushroom-garlic-sauce-27.jpg"
italianEmilias_dish_three.save


italianEmilias_dish_four = Dish.new(name: "Tuna Steak",
                                    description: "Tuna fillet with tomato sauce, peperoncino and parsley",
                                    price: 12.00,
                                    prep_time: 15,
                                    category:"Mains")

italianEmilias_dish_four.restaurant = italianEmilias
italianEmilias_dish_four.remote_photo_url = "https://www.miterrunofood.com/wp-content/uploads/2017/04/Southern-Italian-Tuna-Steak-min.jpg"
italianEmilias_dish_four.save


italianEmilias_dish_five = Dish.new(name: "Tiramisu",
                                    description: "Coffee, cream and chocolate cake",
                                    price: 8.00,
                                    prep_time: 5 ,
                                    category:"Desserts")

italianEmilias_dish_five.restaurant = italianEmilias
italianEmilias_dish_five.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2018/01/tiramisu.jpg"
italianEmilias_dish_five.save


french_dish_one = Dish.new(name: "Soupe à l’Oignon Gratinée",
                           description: "Slow-cooked caramelized onions, gruyere and Parmesan cheese",
                           price: 5.00,
                           prep_time: 10,
                           category:"Appetizers")

french_dish_one.restaurant = french
french_dish_one.remote_photo_url = "https://static.cuisineaz.com/610x610/i22753-soupe-a-l-oignon-gratinee.jpg"
french_dish_one.save

french_dish_two = Dish.new(name: "Boeuf Bourguignon",
                           description: "Beef braised in a Burgundy wine sauce",
                           price: 15.00,
                           prep_time: 15,
                           category:"Mains")

french_dish_two.restaurant = french
french_dish_two.remote_photo_url = "https://www.cookomix.com/wp-content/uploads/2017/08/boeuf-bourguinon-thermomix-800x600.jpg"
french_dish_two.save

french_dish_three = Dish.new(name: "Sardines à la Provençale",
                             description: "Butterflied sardines, tomatoes and olives",
                             price: 12.00,
                             prep_time: 15,
                             category:"Appetizers")

french_dish_three.restaurant = french
french_dish_three.remote_photo_url = "https://www.soleou.fr/img/cms/fotolia_98188624.jpg"
french_dish_three.save

french_dish_four = Dish.new(name: "Chocolat Profiteroles",
                            description: "French choux pastry with a sweet cream filling and chocolate",
                            price: 6.00,
                            prep_time: 10,
                            category:"Desserts")

french_dish_four.restaurant = french
french_dish_four.remote_photo_url = "https://www.atelierdeschefs.com/media/recette-e11064-profiterole-a-la-vanille-et-sauce-chocolat.jpg"
french_dish_four.save





british_dish_one = Dish.new(name: "Duck & Pork Terrine",
                            description: "Terrine served with sourdough, pistachios & prunes",
                            price: 10.00,
                            prep_time: 10,
                            category:"Appetizers")

british_dish_one.restaurant = british
british_dish_one.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--441467_11.jpg?itok=CLLyjsjD"
british_dish_one.save


british_dish_two = Dish.new(name: "Mushroom Pate",
                            description: "Pate served with crispy sourdough and tomato jam (v)",
                            price: 9.00,
                            prep_time: 9,
                            category:"Appetizers")

british_dish_two.restaurant = british
british_dish_two.remote_photo_url = "https://realfood.tesco.com/media/images/RFO-1400x919-VEGAN-PATE-Christmas-1b1e10a6-f8d7-4718-aab6-41584cad9aab-0-1400x919.jpg"
british_dish_two.save


british_dish_three = Dish.new(name: "Monkfish & Prawn Curry",
                              description: "British take on an Indian classic, on a bed of wild rice",
                              price: 20.00,
                              prep_time:25 ,
                              category:"Mains")

british_dish_three.restaurant = british
british_dish_three.remote_photo_url = "https://crackingcurries.files.wordpress.com/2013/04/p1010686.jpg"
british_dish_three.save


british_dish_four = Dish.new(name: "Rib-eye steak",
                             description: "Prime aged steak served with chips and  béarnaise sauce",
                             price: 29.00,
                             prep_time: 20,
                             category:"Mains")

british_dish_four.restaurant = british
british_dish_four.remote_photo_url = "https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--15306_12.jpg?itok=ynNfCRVJ"
british_dish_four.save


british_dish_five = Dish.new(name: "Sticky Toffee Pudding",
                             description: "Traditional British Desserts served with Devon Clotted Cream",
                             price: 7.00,
                             prep_time: 10,
                             category:"Desserts")

british_dish_five.restaurant = british
british_dish_five.remote_photo_url = "https://images.buffalonews.com/gallery-images/2019/08/02/big_thumbnail/1013396067%20Black%20Sheep%2015%20Cantillon.JPG"
british_dish_five.save






vegan_dish_one = Dish.new(name: "Roast Vegetable Tagine",
                          description: "Chickpeas, roasted cauliflower, dates, tomatoes & lemon",
                          price: 11.00,
                          prep_time: 15,
                          category: "Appetizers")

vegan_dish_one.restaurant = vegan
vegan_dish_one.remote_photo_url = "https://cdn.sunbasket.com/3a0328a7-5c98-4150-9b87-3d9d55b7511d.jpg"
vegan_dish_one.save



vegan_dish_two = Dish.new(name: "Jackfruit Tacos",
                          description: "Pulled jackfruit, fennel caper salad and roasted tomatoes",
                          price: 13.00,
                          prep_time:15,
                          category: "Mains")

vegan_dish_two.restaurant = vegan
vegan_dish_two.remote_photo_url = "https://cdn77-s3.lazycatkitchen.com/wp-content/uploads/2017/05/pulled-jackfruit-tacos-lunch-800x1200.jpg"
vegan_dish_two.save



vegan_dish_three = Dish.new(name: "Kalifornia Guac Burger",
                            description: "Bean burger, guacamole, rainbow slaw, served with thyme fries",
                            price:14.00,
                            prep_time:20,
                            category: "Mains")

vegan_dish_three.restaurant = vegan
vegan_dish_three.remote_photo_url = "https://www.emilieeats.com/wp-content/uploads/2017/07/sweet-earth-asian-veggie-burgers-mango-cabbage-slaw-sriracha-sauce-vegan-healthy-easy-dinner-12.jpg"
vegan_dish_three.save


vegan_dish_four = Dish.new(name: "Chocolate Orange Mousse Cake",
                           description: "Delicious, creamy, refined sugar free and gluten free",
                           price: 8.00,
                           prep_time: 5,
                           category: "Desserts")

vegan_dish_four.restaurant = vegan
vegan_dish_four.remote_photo_url = "https://i.pinimg.com/564x/d6/e3/e3/d6e3e39afa9b1d64fdeef8237c1b0d1d.jpg"
vegan_dish_four.save




puts "Finished!"


# BOOKINGS
puts "Creating Bookings..."

booking_one = Booking.new(date: DateTime.strptime("06/14/2019", "%m/%d/%Y"))
booking_one.user = walter
booking_one.restaurant = french
booking_one.open = false
booking_one.save

booking_two = Booking.new(date: DateTime.strptime("07/16/2019", "%m/%d/%Y"))
booking_two.user = spencer
booking_two.restaurant = italian
booking_two.open = false
booking_two.save

booking_three = Booking.new(date: DateTime.strptime("04/15/2019", "%m/%d/%Y"))
booking_three.user = ana
booking_three.restaurant = british
booking_three.open = false
booking_three.save

booking_four = Booking.new(date: DateTime.strptime("08/18/2019", "%m/%d/%Y"))
booking_four.user = simona
booking_four.restaurant = vegan
booking_four.open = false
booking_four.save

booking_five = Booking.new(date: DateTime.strptime("01/02/2019", "%m/%d/%Y"))
booking_five.user = sunny
booking_five.restaurant = italianPolpo
booking_five.open = false
booking_five.save


booking_seven = Booking.new(date: DateTime.strptime("01/18/2019", "%m/%d/%Y"))
booking_seven .user = johnny
booking_seven .restaurant = italianPolpo
booking_seven .open = false
booking_seven .save

booking_eight = Booking.new(date: DateTime.strptime("01/30/2019", "%m/%d/%Y"))
booking_eight.user = simona
booking_eight.restaurant = italianPolpo
booking_eight.open = false
booking_eight.save

booking_nine = Booking.new(date: DateTime.strptime("02/03/2019", "%m/%d/%Y"))
booking_nine.user = katherine
booking_nine.restaurant = italianPolpo
booking_nine.open = false
booking_nine.save

booking_ten = Booking.new(date: DateTime.strptime("02/16/2019", "%m/%d/%Y"))
booking_ten.user = spencer
booking_ten.restaurant = italianPolpo
booking_ten.open = false
booking_ten.save

booking_eleven = Booking.new(date: DateTime.strptime("02/19/2019", "%m/%d/%Y"))
booking_eleven.user = ana
booking_eleven.restaurant = italianPolpo
booking_eleven.open = false
booking_eleven.save

booking_twelve = Booking.new(date: DateTime.strptime("02/25/2019", "%m/%d/%Y"))
booking_twelve .user = simona
booking_twelve .restaurant = italianPolpo
booking_twelve .open = false
booking_twelve .save

booking_thirteen = Booking.new(date: DateTime.strptime("03/04/2019", "%m/%d/%Y"))
booking_thirteen.user = walter
booking_thirteen.restaurant = italianPolpo
booking_thirteen.open = false
booking_thirteen.save


booking_fifteen = Booking.new(date: DateTime.strptime("03/20/2019", "%m/%d/%Y"))
booking_fifteen.user = ana
booking_fifteen.restaurant = italianEmilias
booking_fifteen.open = false
booking_fifteen.save

booking_sixteen = Booking.new(date: DateTime.strptime("03/29/2019", "%m/%d/%Y"))
booking_sixteen.user = simona
booking_sixteen.restaurant = italianEmilias
booking_sixteen.open = false
booking_sixteen.save

booking_seventeen = Booking.new(date: DateTime.strptime("04/01/2019", "%m/%d/%Y"))
booking_seventeen.user = walter
booking_seventeen.restaurant = italianEmilias
booking_seventeen.open = false
booking_seventeen.save

booking_eighteen = Booking.new(date: DateTime.strptime("04/16/2019", "%m/%d/%Y"))
booking_eighteen.user = spencer
booking_eighteen.restaurant = italianEmilias
booking_eighteen.open = false
booking_eighteen.save

booking_nineteen = Booking.new(date: DateTime.strptime("04/21/2019", "%m/%d/%Y"))
booking_nineteen.user = ana
booking_nineteen.restaurant = italianEmilias
booking_nineteen.open = false
booking_nineteen.save

booking_twenty = Booking.new(date: DateTime.strptime("04/28/2019", "%m/%d/%Y"))
booking_twenty.user = simona
booking_twenty.restaurant = italianEmilias
booking_twenty.open = false
booking_twenty.save

booking_twentyone = Booking.new(date: DateTime.strptime("05/05/2019", "%m/%d/%Y"))
booking_twentyone.user = walter
booking_twentyone.restaurant = italianEmilias
booking_twentyone.open = false
booking_twentyone.save

booking_twentytwo = Booking.new(date: DateTime.strptime("09/06/2019", "%m/%d/%Y"))
booking_twentytwo.user = spencer
booking_twentytwo.restaurant = italian
booking_twentytwo.open = false
booking_twentytwo.save

booking_twentythree = Booking.new(date: DateTime.strptime("05/15/2019", "%m/%d/%Y"))
booking_twentythree.user = ana
booking_twentythree.restaurant = italian
booking_twentythree.open = false
booking_twentythree.save

booking_twentyfour = Booking.new(date: DateTime.strptime("05/24/2019", "%m/%d/%Y"))
booking_twentyfour.user = simona
booking_twentyfour.restaurant = italian
booking_twentyfour.open = false
booking_twentyfour.save

booking_twentyfive = Booking.new(date: DateTime.strptime("06/07/2019", "%m/%d/%Y"))
booking_twentyfive.user = walter
booking_twentyfive.restaurant = italian
booking_twentyfive.open = false
booking_twentyfive.save

booking_twentysix = Booking.new(date: DateTime.strptime("05/01/2019", "%m/%d/%Y"))
booking_twentysix.user = spencer
booking_twentysix.restaurant = french
booking_twentysix.open = false
booking_twentysix.save

booking_twentyseven = Booking.new(date: DateTime.strptime("08/23/2019", "%m/%d/%Y"))
booking_twentyseven.user = ana
booking_twentyseven.restaurant = french
booking_twentyseven.open = false
booking_twentyseven.save

booking_twentyeight = Booking.new(date: DateTime.strptime("06/30/2019", "%m/%d/%Y"))
booking_twentyeight.user = simona
booking_twentyeight.restaurant = french2
booking_twentyeight.open = false
booking_twentyeight.save

booking_twentynine = Booking.new(date: DateTime.strptime("06/11/2019", "%m/%d/%Y"))
booking_twentynine.user = walter
booking_twentynine.restaurant = french2
booking_twentynine.open = false
booking_twentynine.save

booking_thirty = Booking.new(date: DateTime.strptime("07/29/2019", "%m/%d/%Y"))
booking_thirty.user = spencer
booking_thirty.restaurant = french2
booking_thirty.open = false
booking_thirty.save

booking_thirtyone = Booking.new(date: DateTime.strptime("07/04/2019", "%m/%d/%Y"))
booking_thirtyone.user = ana
booking_thirtyone.restaurant = french2
booking_thirtyone.open = false
booking_thirtyone.save

booking_thirtytwo = Booking.new(date: DateTime.strptime("07/08/2019", "%m/%d/%Y"))
booking_thirtytwo.user = simona
booking_thirtytwo.restaurant = french2
booking_thirtytwo.open = false
booking_thirtytwo.save

booking_thirtythree = Booking.new(date: DateTime.strptime("08/31/2019", "%m/%d/%Y"))
booking_thirtythree.user = walter
booking_thirtythree.restaurant = french2
booking_thirtythree.open = false
booking_thirtythree.save

booking_thirtyfour = Booking.new(date: DateTime.strptime("08/22/2019", "%m/%d/%Y"))
booking_thirtyfour.user = spencer
booking_thirtyfour.restaurant = french2
booking_thirtyfour.open = false
booking_thirtyfour.save

booking_thirtyfive = Booking.new(date: DateTime.strptime("08/10/2019", "%m/%d/%Y"))
booking_thirtyfive.user = ana
booking_thirtyfive.restaurant = british
booking_thirtyfive.open = false
booking_thirtyfive.save

booking_thirtysix = Booking.new(date: DateTime.strptime("09/04/2019", "%m/%d/%Y"))
booking_thirtysix.user = simona
booking_thirtysix.restaurant = british
booking_thirtysix.open = false
booking_thirtysix.save

booking_thirtyseven = Booking.new(date: DateTime.strptime("09/16/2019", "%m/%d/%Y"))
booking_thirtyseven.user = alex
booking_thirtyseven.restaurant = british
booking_thirtyseven.open = false
booking_thirtyseven.save

booking_thirtyeight = Booking.new(date: DateTime.strptime("09/02/2019", "%m/%d/%Y"))
booking_thirtyeight.user = spencer
booking_thirtyeight.restaurant = british
booking_thirtyeight.open = false
booking_thirtyeight.save

booking_thirtynine = Booking.new(date: DateTime.strptime("01/06/2019", "%m/%d/%Y"))
booking_thirtynine.user = ana
booking_thirtynine.restaurant = british
booking_thirtynine.open = false
booking_thirtynine.save

booking_forty = Booking.new(date: DateTime.strptime("01/21/2019", "%m/%d/%Y"))
booking_forty.user = simona
booking_forty.restaurant = british
booking_forty.open = false
booking_forty.save

booking_fortyone = Booking.new(date: DateTime.strptime("02/07/2019", "%m/%d/%Y"))
booking_fortyone.user = sam
booking_fortyone.restaurant = british
booking_fortyone.open = false
booking_fortyone.save

booking_fortytwo = Booking.new(date: DateTime.strptime("02/22/2019", "%m/%d/%Y"))
booking_fortytwo.user = spencer
booking_fortytwo.restaurant = british
booking_fortytwo.open = false
booking_fortytwo.save

booking_fortythree = Booking.new(date: DateTime.strptime("08/05/2019", "%m/%d/%Y"))
booking_fortythree.user = ana
booking_fortythree.restaurant = italianPolpo
booking_fortythree.open = false
booking_fortythree.save

booking_fortyfour = Booking.new(date: DateTime.strptime("04/06/2019", "%m/%d/%Y"))
booking_fortyfour.user = simona
booking_fortyfour.restaurant = vegan
booking_fortyfour.open = false
booking_fortyfour.save

booking_fortyfive = Booking.new(date: DateTime.strptime("05/20/2019", "%m/%d/%Y"))
booking_fortyfive.user = walter
booking_fortyfive.restaurant = vegan
booking_fortyfive.open = false
booking_fortyfive.save

booking_fortysix = Booking.new(date: DateTime.strptime("06/10/2019", "%m/%d/%Y"))
booking_fortysix.user = spencer
booking_fortysix.restaurant = vegan
booking_fortysix.open = false
booking_fortysix.save


booking_fortyseven = Booking.new(date: DateTime.strptime("08/12/2018", "%m/%d/%Y"))
booking_fortyseven.user = arthur
booking_fortyseven.restaurant = italianPolpo
booking_fortyseven.open = false
booking_fortyseven.save

booking_fortyeight = Booking.new(date: DateTime.strptime("10/02/2019", "%m/%d/%Y"))
booking_fortyeight.user = ben
booking_fortyeight.restaurant = italianPolpo
booking_fortyeight.open = false
booking_fortyeight.save


booking_fortynine = Booking.new(date: DateTime.strptime("10/04/2019", "%m/%d/%Y"))
booking_fortynine.user = rob
booking_fortynine.restaurant = italianPolpo
booking_fortynine.open = false
booking_fortynine.save



booking_fiftyone = Booking.new(date: DateTime.strptime("10/04/2018", "%m/%d/%Y"))
booking_fiftyone.user = marco
booking_fiftyone.restaurant = italianPolpo
booking_fiftyone.open = false
booking_fiftyone.save




puts "Finished!"

# REVIEWS
puts "Creating Reviews..."

def random_rating
  result = Random.new
  result = result.rand(1..5)
  return result
end

review_one = Review.new
review_one.booking = booking_one
review_one.content = "Recommended in a magazine as a great late night venture, this was just the most amazing place."
review_one.rating = 5
review_one.user = walter
review_one.save

review_two = Review.new
review_two.booking = booking_two
review_two.content = "Enjoyed the food and atmosphere but the service was very slow!"
review_two.rating = 3
review_two.user = spencer
review_two.save

review_three = Review.new
review_three.booking = booking_three
review_three.content = "An awful place. Why would anyone give this more than 2 stars?"
review_three.rating = 2
review_three.user = ana
review_three.save

review_4 = Review.new
review_4.booking = booking_four
review_4.content = "Absolutely one of the best vegan restaurants in the city"
review_4.rating = 5
review_4.user = simona
review_4.save

review_5 = Review.new
review_5.booking = booking_five
review_5.content = "I've been visiting Polpo for 5+ years and I have to say this one is my favourite! The friendly staff make you feel welcome every single time and the atmosphere is just soooooo nice in there. As always, the seasonal menus are as delicious as the last one."
review_5.rating = 5
review_5.user = sunny
review_5.title = "Just fabulous"
review_5.save



review_7 = Review.new
review_7.booking = booking_seven
review_7.content = "If you’ve never been to Polpo you’ve missed out. The food is always excellent - whatever you have. The staff are awesome too and we always leave very happy."
review_7.rating = 5
review_7.user = johnny
review_7.title = "Amazing"
review_7.save

review_8 = Review.new
review_8.booking = booking_eight
review_8.content = "Fantastic food, great atmosphere, perfect service. One of the few restaurants I actually rate in London!"
review_8.rating = 4
review_8.user = simona
review_8.title = "Best meal ever"
review_8.save

review_9 = Review.new
review_9.booking = booking_nine
review_9.content = "Love this busy bustling bar / restaurant. good for solo eats or with friends. my favourite was the meatballs .. good small dishes to share."
review_9.rating = 5
review_9.user = katherine
review_9.title = "Wow"
review_9.save

review_10 = Review.new
review_10.booking = booking_ten
review_10.content = "I visited this place multiple times. Great ambience and great service. Very well priced, good cuisine. Can't wait to get back."
review_10.rating = 5
review_10.user = walter
review_10.title = "Superb"
review_10.save

review_11 = Review.new
review_11.booking = booking_eleven
review_11.content = "Fantastic place, good atmosphere. The slow cooked Ragu melted in your mouth . All the dishes were tasty and I like the fact they make seasonal changes."
review_11.rating = 5
review_11.user = ana
review_11.title = "Loved it. Will be back again."
review_11.save

review_12 = Review.new
review_12.booking = booking_twelve
review_12.content = "Don't let Polpo's unassuming exterior put you off! This is a little gem serving fabulous tasting Italian food. Everything we ordered was delicious. Excellent and reasonably priced house wine and attentive service added to the whole experience. Would definitely recommend."
review_12.rating = 4
review_12.user = sarah
review_12.title = "Never disappoints. Try the desserts. They are great."
review_12.save

review_13 = Review.new
review_13.booking = booking_thirteen
review_13.content = "Amazing people with great service. I would recommend it to anyone within the area. Some of the finest food that I've ever had"
review_13.rating = 5
review_13.user = arthur
review_13.title = "Real delight"
review_13.save



review_15 = Review.new
review_15.booking = booking_fifteen
review_15.content = "I can see what all the fuss is about but please add more vegan meals to your menu."
review_15.rating = 3
review_15.user = ana
review_15.save

review_16 = Review.new
review_16.booking = booking_sixteen
review_16.content = "This place was a real dissapointment. AWFUL!"
review_16.rating = 2
review_16.user = simona
review_16.save

review_17 = Review.new
review_17.booking = booking_seventeen
review_17.content = "A pretty average, bog standard place."
review_17.rating = 3
review_17.user = walter
review_17.save

review_18 = Review.new
review_18.booking = booking_eighteen
review_18.content = "good"
review_18.rating = 3
review_18.user = spencer
review_18.save

review_19 = Review.new
review_19.booking = booking_nineteen
review_19.content = "I will be reccomending this place to everyone I know. Compliments to the chef."
review_19.rating = 5
review_19.user = ana
review_19.save

review_20 = Review.new
review_20.booking = booking_twenty
review_20.content = "As good as any Michelin star restaurant. Just wish they'd sort out the slow kitchen service."
review_20.rating = 4
review_20.user = simona
review_20.save

review_21 = Review.new
review_21.booking = booking_twentyone
review_21.content = "You will probably get better service at mcDonalds. Very rude staff. Food, just ok."
review_21.rating = 2
review_21.user = walter
review_21.save

review_22 = Review.new
review_22.booking = booking_twentytwo
review_22.content = "We loved celebrating our birthday here. Thank you!"
review_22.rating = 4
review_22.user = spencer
review_22.save

review_23 = Review.new
review_23.booking = booking_twentythree
review_23.content = "Very good!"
review_23.rating = 4
review_23.user = ana
review_23.save

review_24 = Review.new
review_24.booking = booking_twentyfour
review_24.content = "I loved this place. One of the best restaurants in London."
review_24.rating = 5
review_24.user = simona
review_24.save

review_25 = Review.new
review_25.booking = booking_twentyfive
review_25.content = "not bad"
review_25.rating = 3
review_25.user = walter
review_25.save

review_26 = Review.new
review_26.booking = booking_twentysix
review_26.content = "Overrated and full of hipsters!"
review_26.rating = 3
review_26.user = spencer
review_26.save

review_27 = Review.new
review_27.booking = booking_twentyseven
review_27.content = "My mum and dad were very happy with their meal. Great family atmosphere."
review_27.rating = 4
review_27.user = ana
review_27.save

review_28 = Review.new
review_28.booking = booking_twentyeight
review_28.content = "good"
review_28.rating = 5
review_28.user = simona
review_28.save

review_29 = Review.new
review_29.booking = booking_twentynine
review_29.content = "This place is great for people with kids. Cheap too!"
review_29.rating = 5
review_29.user = walter
review_29.save

review_30 = Review.new
review_30.booking = booking_thirty
review_30.content = "bad"
review_30.rating = 2
review_30.user = spencer
review_30.save

review_31 = Review.new
review_31.booking = booking_thirtyone
review_31.content = "A dirty bathroom is always a bad sign. The whole place grotty. We won't be back."
review_31.rating = 2
review_31.user = ana
review_31.save

review_32 = Review.new
review_32.booking = booking_thirtytwo
review_32.content = "not bad"
review_32.rating = 3
review_32.user = simona
review_32.save

review_33 = Review.new
review_33.booking = booking_thirtythree
review_33.content = "good"
review_33.rating = 4
review_33.user = walter
review_33.save

review_34 = Review.new
review_34.booking = booking_thirtyfour
review_34.content = "The waiter made us a feel so at home and made a big deal of our anniversary. We might be back next year. Thanks Marco."
review_34.rating = 3
review_34.user = spencer
review_34.save

review_35 = Review.new
review_35.booking = booking_thirtyfive
review_35.content = "good"
review_35.rating = 5
review_35.user = ana
review_35.save

review_36 = Review.new
review_36.booking = booking_thirtysix
review_36.content = "good"
review_36.rating = 3
review_36.user = simona
review_36.save

review_37 = Review.new
review_37.booking = booking_thirtyseven
review_37.content = "good"
review_37.rating = 3
review_37.user = walter
review_37.save

review_38 = Review.new
review_38.booking = booking_thirtyeight
review_38.content = "good"
review_38.rating = 3
review_38.user = spencer
review_38.save

review_39 = Review.new
review_39.booking = booking_thirtynine
review_39.content = "not bad"
review_39.rating = 3
review_39.user = ana
review_39.save

review_40 = Review.new
review_40.booking = booking_forty
review_40.content = "not bad"
review_40.rating = 3
review_40.user = simona
review_40.save

review_41 = Review.new
review_41.booking = booking_fortyone
review_41.content = "This is THE place to eat. Go check it out."
review_41.rating = 5
review_41.user = walter
review_41.title = "Lives Up to the Hype!"
review_41.save

review_42 = Review.new
review_42.booking = booking_fortytwo
review_42.content = "good"
review_42.rating = 5
review_42.user = spencer
review_42.save

review_43 = Review.new
review_43.booking = booking_fortythree
review_43.content = "My friend and I dined here and enjoyed the wonderful food, charming staff and convenient location. Looking forward to my next visit."
review_43.rating = 5
review_43.user = rob
review_43.title = "Real italian food"
review_43.save

review_44 = Review.new
review_44.booking = booking_fortyfour
review_44.content = "good"
review_44.rating = 4
review_44.user = simona
review_44.save

review_45 = Review.new
review_45.booking = booking_fortyfive
review_45.content = "not bad"
review_45.rating = 3
review_45.user = walter
review_45.save

review_46 = Review.new
review_46.booking = booking_fortysix
review_46.content = "good"
review_46.rating = 5
review_46.user = spencer
review_46.save

review_47 = Review.new
review_47.booking = booking_fortyseven
review_47.content = "This is pretty good. Nice atmosphere and the service wasn't too bad. But, if you're looking for authenticity, go to Italy!"
review_47.rating = 4
review_47.user = alex
review_47.title = "Just OK."
review_47.save

review_48 = Review.new
review_48.booking = booking_fortyeight
review_48.content = "We really enjoyed our dinner. The staff created such a welcoming nice atmosphere. The queue for the toilet was very long, so 5 stars from us."
review_48.rating = 5
review_48.user = ben
review_48.title = "Happppyyy"
review_48.save

review_49 = Review.new
review_49.booking = booking_fortynine
review_49.content = "I had heard so much about this place before going. We will be coming back."
review_49.rating = 5
review_49.user = agota
review_49.title = "Pretty tasty!"
review_49.save

review_51 = Review.new
review_51.booking = booking_fiftyone
review_51.content = "Was ok. Not good enough to come back."
review_51.rating = 3
review_51.user = marco
review_51.title = "This isn't Italy"
review_51.save





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
