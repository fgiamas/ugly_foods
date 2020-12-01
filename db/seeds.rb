# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shop.destroy_all
User.destroy_all

ADDRESSES = [
'Maarten Lutherweg 122, 1185 Amstelveen',
'Charley Tooropgracht 843, 1112 Diemen',
'Hovendaal 91, 9660 Brakel',
'Kerkstraat 273, 1017 Amsterdam',
'Leidseplein 15, 1017  Amsterdam',
'Van Breestraat 69, 1071 Amsterdam',
'Tweede Jan van der Heijdenstraat 2, 1073 Amsterdam',
'Lindengracht 23, 1015 Amsterdam',
'Meeuwenlaan 145, 1021 Amsterdam',
'J.J. Cremerplein 45, 1054 Amsterdam'
 ]

 SHOPS = [
  'Ekoplaza',
  'Marqt',
  'Aldi',
  'Spar'
 ]


 CONTENTS = [
  "Rolex is a classic staple of any luxury watch collection. The GMT Master
  and the Submariner are some of the most popular watches Rolex sells.
  This is the "'Pepsi'" version. It has a unique blue/red theme to the dial
  and the GMT hand, which helps add a touch of sportiness to the watch.",
  "This is a very unique watch. It actually comes with two sides(a black dial
  and a white dial), all you have to do is flip it and you get to experience
  an all new watch.",
  "A great looking sporty 44mm chronograph that adds a touch of class thanks
  to the rose gold case and accents.",
  "This is a classic Panerai. It's a 44mm watch that really brings attention
  to your wrist. The crown guard really helps tell everyone who looks that
  the watch is special and the sandwich dial is a simple yet classy feature that
  separates it from the other watches on the market today. And like most PAMs,
  it has a very easy strap changing mechanism.",
  "These watches aren't just watches, they are works of art. With the Vegas
  you get the roulette complication on the watch. Just hit the button on the
  crown to make it spin. A perfect distraction for any occasion that will vow
  everyone around.",
  "A stunning chrono with a very easy to read dial in gray. Powered by the
  1887 movement.",
  "A stunning dress watch with a rare white dial/blue markers combo and a
  coin edge dial.",
  "When people think Breitling, this is usually the model they think of.
  A stunning watch that can be used for many tasks.",
  "This AP is a stunning piece. And these are even rarer in the wild than
  the base 15400 versions.",
  "At 44mm this is undoubtfully the men's version of the watch. Just like
  all Cartiers, this is an elegant watch that adds a touch of class to
  your wrist."
]

 EMAILS = [
  'micciullapiero@gmail.com',
  'monicandreoli@gmail.com',
  'donaldtrump@hotmail.com',
  'christianbale@yahoo.com',
  'timroth@hotmail.com',
  'batman@yahoo.com',
  'robin@gmail.com',
  'miakhalifa@hotmail.com',
  'jamesbond@yahoo.com',
  'brucewillis@hotmail.com'
   ]




puts 'Creating 10 users...'
5.times do
  user_owner = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )
end

5.times do
  user_buyer = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )
end

admin = User.create(
  first_name: "camille",
  last_name: "schull",
  address: "Le wagon",
  email: "lewagon@wagon.com",
  password: "123456"
  )
puts "Created #{User.count} users"




user_owner.all.each do |user_owner|
  shop = Shop.new
  shop.name = BRANDS.sample
  watch.price = rand(700..6000)
  watch.description = DESCRIPTIONS.sample
  shop.address = ADDRESSES.sample
  watch.material = Material.all.sample
  watch.user = user
  watch.photos.attach(io: File.open(File.join(Rails.root,'app','assets','images', "#{watch.brand}1.jpg")), filename: "#{watch.brand}1.jpg")
  watch.photos.attach(io: File.open(File.join(Rails.root,'app','assets','images', "#{watch.brand}2.jpg")), filename: "#{watch.brand}2.jpg")
  watch.photos.attach(io: File.open(File.join(Rails.root,'app','assets','images', "#{watch.brand}3.jpg")), filename: "#{watch.brand}3.jpg")
  watch.save
  end
  puts "Created #{Watch.count} watches"
puts "Creating 10 bookings"
  Booking.create(
    start_date: Date.today,
    end_date: Date.tomorrow,
    watch_id: Watch.last.id,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.today + 1,
    end_date: Date.tomorrow + 3,
    watch_id: Watch.last.id - 1,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.today + 3,
    end_date: Date.tomorrow + 7,
    watch_id: Watch.last.id - 2,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.today + 2,
    end_date: Date.tomorrow + 10,
    watch_id: Watch.last.id - 3,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.today + 4,
    end_date: Date.tomorrow + 13,
    watch_id: Watch.last.id - 4,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.yesterday - 20,
    end_date: Date.tomorrow - 10,
    watch_id: Watch.last.id - 5,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.yesterday - 18,
    end_date: Date.tomorrow - 9,
    watch_id: Watch.last.id - 6,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.yesterday - 16,
    end_date: Date.tomorrow - 7,
    watch_id: Watch.last.id - 7,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.yesterday - 13,
    end_date: Date.tomorrow - 5,
    watch_id: Watch.last.id - 8,
    user_id: (User.last.id)
    )
  Booking.create(
    start_date: Date.yesterday - 10,
    end_date: Date.tomorrow - 2,
    watch_id: Watch.last.id - 9,
    user_id: (User.last.id)
    )
puts "Created #{Booking.count} bookings"
