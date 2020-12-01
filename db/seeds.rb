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
  'Spar',
  'Dirk'
 ]

 FRUITS = [
  'apple',
  'apricot',
  'banana',
  'blueberry',
  'cherries',
  'cranberry',
  'figues',
  'grapfruit',
  'grapes',
  'kiww',
  'lemon',
  'mandarin',
  'orange',
  'pear',
  'peach',
  'pineapple',
  'plums',
  'strawberries',
  'watermelon',
  'pomegranate'
 ]

VEGGIES = [
  'artichoke',
  'asparagus',
  'aragula',
  'beans',
  'brocoli',
  'brussel sprouts',
  'cabage',
  'carrot',
  'cauliflower',
  'celery',
  'corn',
  'cucumber',
  'eggplant',
  'fennel',
  'kale',
  'leaks',
  'lettuce',
  'mushrooms',
  'onion',
  'pepper',
  'potatoe',
  'pumpkin',
]

FLOWERS = [
  'tulipe',
  'rose',
  'orchid',
  'chrysanthemum',
  'poppy',
  'sunflower',
  'daffodil',
  'anemone'
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


puts 'Creating 8 users...'

  user_owner_1 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )

  user_owner_2 = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name::last_name,
      address: ADDRESSES.sample,
      email: EMAILS.sample,
      password: Faker::Internet.password
      )

  user_owner_3 = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name::last_name,
      address: ADDRESSES.sample,
      email: EMAILS.sample,
      password: Faker::Internet.password
      )

  user_owner_4 = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name::last_name,
      address: ADDRESSES.sample,
      email: EMAILS.sample,
      password: Faker::Internet.password
      )

  user_owner_5 = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name::last_name,
      address: ADDRESSES.sample,
      email: EMAILS.sample,
      password: Faker::Internet.password
      )


  user_buyer_1 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )

  user_buyer_2 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )

  user_buyer_3 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )

  user_buyer_4 = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.sample,
    password: Faker::Internet.password
    )

  user_buyer_5 = User.create(
    first_name: 'Donald',
    last_name: 'Trump',
    address: 'USA',
    email: 'donaldtrump@hotmail.com',
    password: '456789'
    )

admin = User.create(
  first_name: "camille",
  last_name: "schull",
  address: "Le wagon",
  email: "lewagon@wagon.com",
  password: "123456"
  )
puts "Created #{User.count} users"


 shop_1 = Shop.create(
    user_id: user_owner_1.id,
    name: "Ekoplaza",
    address: "Van der Hooplaan 104-106",
    city: "Amsterdam",
    post_code: "1185",
    country: "Netherlands",
    phone_number: "020-4418691",
    website: "https://www.ekoplaza.nl"
    )

 shop_2 = Shop.create(
    user_id: user_owner_2.id,
    name: "Marqt",
    address: "Olympiaplein 160",
    city: "Amsterdam",
    post_code: "1076",
    country: "Netherlands",
    phone_number: "020 820 4482",
    website: "https://www.marqt.nl"
    )

 shop_3 = Shop.create(
    user_id: user_owner_3.id,
    name: "Aldi",
    address: "Pijnackerstraat 36",
    city: "Amsterdam",
    post_code: "1072",
    country: "Netherlands",
    phone_number: "075 651 7411",
    website: "https://www.aldi.nl"
    )

 shop_4 = Shop.create(
    user_id: user_owner_4.id,
    name: "Spar",
    address: "Kinkerstraat 252",
    city: "Amsterdam",
    post_code: "1053",
    country: "Netherlands",
    phone_number: "020 820 8319",
    website: "https://www.spar.nl"
    )

 shop_5 = Shop.create(
    user_id: user_owner_5.id,
    name: "Dirk",
    address: "Sierplein 6",
    city: "Amsterdam",
    post_code: "1065",
    country: "Netherlands",
    phone_number: "088 313 4295",
    website: "https://www.dirk.nl"
    )

puts "Creating Ratings..."
 Rating.create(
    user_id: user_buyer_1.id,
    content: "Pleasantly surprised by the produce and service...
    prices a bit at the high end but if you are a believer this
    is a good place to shop!",
    shop_id: shop_1.id,
    rating: "4"
    )

 Rating.create(
    user_id: user_buyer_2.id,
    content: "Impressive selection of eko-foods.
    They have all kinds of meat as well as veggie options.
    I buy my truffles here",
    shop_id: shop_2.id,
    rating: "3"
    )

 Rating.create(
    user_id: user_buyer_3.id,
    content: "You get most of groceries here, vegetables and fruits are fresh.
    Also available surinami and indian stuff",
    shop_id: shop_3.id,
    rating: "5"
    )

 Rating.create(
    user_id: user_buyer_4.id,
    content: "Good little supermarket. Too little biological meat for my
    taste. Nice selection of healthy items though",
    shop_id: shop_4.id,
    rating: "4"
    )

 Rating.create(
    user_id: user_buyer_5.id,
    content: "Lots of good stuff, but too few staff to ask when you can t
    find what you want. Also has a section of Polish delicacies.",
    shop_id: shop_5.id,
    rating: "3"
    )

 puts "Created #{Rating.count}"

#FIRST SHOP


puts "Creating product"
5.times do
Product.create(
    discount_percent: [20..40].sample,
    price_per_unit: [2..5].sample,
    lifespan: [6..12].sample,
    category: "vegetable",
    shop_id: shop_1.id,
    total_units: [5..20].sample,
    total_kg: [2..5].sample,
    status: "old",
    sold_status: "",
    days_to_expiry: [1..6],
    produce_type_id: VEGGIES.shuffle!.pop
    )
end


5.times do
Product.create(
    discount_percent: [20..40].sample,
    price_per_unit: [2..5].sample,
    lifespan: [6..12].sample,
    category: "fruit",
    shop_id: shop_1.id,
    total_units: [5..20].sample,
    total_kg: [2..5].sample,
    status: "ugly",
    sold_status: "",
    days_to_expiry: [1..6],
    produce_type_id: FRUITS.shuffle!.pop
    )
end

5.times do
Product.create(
    discount_percent: [20..40].sample,
    price_per_unit: [2..5].sample,
    lifespan: [6..12].sample,
    category: "flower",
    shop_id: shop_1.id,
    total_units: [5..20].sample,
    total_kg: [2..5].sample,
    status: "old",
    sold_status: "",
    days_to_expiry: [1..6],
    produce_type_id: FLOWERS.shuffle!.pop
    )
end

"Created #{Product.count} product"


#SECOND SHOP

5.times do
Product.create(
    discount_percent: [20..40].sample,
    price_per_unit: [2..5].sample,
    lifespan: [6..12].sample,
    category: "vegetable",
    shop_id: shop_2,
    total_units: [5..20].sample,
    total_kg: [2..5].sample,
    status: "ugly",
    sold_status: "",
    days_to_expiry: [1..6],
    produce_type_id: VEGGIES.shuffle!.pop
    )
end


5.times do
Product.create(
    discount_percent: [20..40].sample,
    price_per_unit: [2..5].sample,
    lifespan: [6..12].sample,
    category: "fruit",
    shop_id: shop_2,
    total_units: [5..20].sample,
    total_kg: [2..5].sample,
    status: "old",
    sold_status: "",
    days_to_expiry: [1..6],
    produce_type_id: FRUITS.shuffle!.pop
    )
end

5.times do
Product.create(
    discount_percent: [20..40].sample,
    price_per_unit: [2..5].sample,
    lifespan: [6..12].sample,
    category: "flower",
    shop_id: shop_2,
    total_units: [5..20].sample,
    total_kg: [2..5].sample,
    status: "old",
    sold_status: "",
    days_to_expiry: [1..6],
    produce_type_id: FLOWERS.shuffle!.pop
    )
end


  puts "Created #{Product.count} shops"
