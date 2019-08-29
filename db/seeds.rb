puts 'Cleaning databases...'
User.destroy_all
Restaurant.destroy_all

puts 'Creating Users...'


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

puts 'Creating Restaurants...'

italian = Restaurant.new(name: "Padella",
  address: "6 Southwark St, London",
  category: "italian")

italian.remote_photo_url = "https://media.timeout.com/images/104828760/630/472/image.jpg"
italian.save

french = Restaurant.new(name: "Monsieur Le Duck",
  address: "27 Clerkenwell Rd, London",
  category: "french")

french.remote_photo_url = "https://urbanologie.com/media_cache/inner_slider/media/0_Dubai_April/mons.jpg"
french.save

british = Restaurant.new(name: "Rules",
  address: "34-35 Maiden Lane, London",
  category: "british")

british.remote_photo_url = "https://rules.co.uk/wp-content/uploads/2014/01/Hare.jpg"
british.save

vegan = Restaurant.new(name: "Kalifornia Kitchen",
  address: "19 Percy St, London",
  category: "vegan")

vegan.remote_photo_url = "https://camillajlovell.com/wp-content/uploads/2019/07/LRG_DSC02751.jpg"
vegan.save


italian_dish_one = Dish.new
  italian_dish_one.restaurant = italian
  italian_dish_one.name ="Pici cacio e pepe"
  italian_dish_one.description = ""
  italian_dish_one.price = 6
  italian_dish_one.prep_time = 15
  italian_dish_one_photo_url = "https://cdn.shopify.com/s/files/1/1725/5449/products/cacio_for_website_edited.jpg?v=1563466037"
  italian_dish_one.save
