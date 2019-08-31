puts 'Cleaning databases...'
User.destroy_all

puts 'Creating Users...'

# user seeds

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


# fake restaurant seeds

Restaurant.destroy_all

restaurant_one = Restaurant.new(name: "XXX")
restaurant_one.save

restaurant_two = Restaurant.new(name:"YYY")
restaurant_two.save

restaurant_three = Restaurant.new(name: "ZZZ")
restaurant_three.save

restaurant_four = Restaurant.new(name: "Testaurant")
restaurant_four.save

# bookings seeds

puts "creating bookings"

Booking.destroy_all

test_booking_one = Booking.new(user: spencer,
  restaurant: restaurant_one,
  date: Time.new)
test_booking_one.save

test_booking_two = Booking.new(user: ana,
  restaurant: restaurant_two,
  date: Time.new)
test_booking_two.save

test_booking_three = Booking.new(user: walter,
  restaurant: restaurant_three,
  date: Time.new)
test_booking_three.save

test_booking_four = Booking.new(user: simona,
  restaurant: restaurant_four,
  date: Time.new)
test_booking_four.save


puts "finished creating seeds"

