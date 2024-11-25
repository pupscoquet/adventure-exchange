# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#seeds products names, descriptions, images(url)
require 'faker'
require 'open-uri'

Review.destroy_all
Booking.destroy_all
Item.destroy_all
User.destroy_all

puts 'Creating 10 users...'
10.times do
  User.create!(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email(domain: ["sportsgear", "hotmail", "google", "icloud"].sample) + ".com",
  password: Faker::Internet.password,
  is_owner: [true, false].sample)
end

puts 'Creating 20 items...'
20.times do
  item = Item.new(
    name: [
      "Mountain Bike",
      "Surfboard",
      "Tennis Racket",
      "Snowboard",
      "Scuba Gear",
      "Kayak",
      "Stand-up Paddleboard",
      "Ski Set",
      "Golf Clubs",
      "Road Bike",
      "Climbing Gear",
      "Yoga Mat",
      "Hiking Backpack",
      "Inline Skates",
      "Camping Tent",
      "Fishing Rod",
      "Kitesurfing Kite",
      "Skateboard",
      "Helmet",
      "Running Shoes"
    ].sample,
    user: User.all.sample,
    location: Faker::Address.city + ", " + Faker::Address.country,
    category: ["Winter Sports", "Water Sports", "Racquet Sports", "Cycling", "Outdoor Adventure"].sample,
    price_per_day: rand(5..100)
  )

  description = case item.name
                when "Mountain Bike"
                  "This rugged mountain bike is designed to handle tough terrains, perfect for adrenaline seekers who love exploring trails and conquering mountains. Built with durability in mind, it offers a smooth ride on challenging surfaces."
                when "Surfboard"
                  "Ride the waves with this sleek and sturdy surfboard, perfect for both beginners and experienced surfers. Its lightweight design allows for easy handling, while the smooth surface ensures a steady ride on water."
                when "Tennis Racket"
                  "This high-performance tennis racket is ideal for players of all skill levels. Featuring a lightweight frame and a grip designed for comfort, it provides optimal control and power on every swing, whether for casual or competitive play."
                when "Snowboard"
                  "Conquer the slopes with this high-quality snowboard, designed for both speed and stability. Whether you're a beginner or an advanced rider, this board offers great control on snowy mountains, ensuring an unforgettable winter adventure."
                when "Scuba Gear"
                  "Explore the depths of the ocean with this complete scuba gear set. From masks to fins, it’s designed for divers who want to experience the beauty of underwater life safely and comfortably. Perfect for both beginners and seasoned explorers."
                when "Kayak"
                  "This durable kayak is your perfect companion for tranquil river paddling or adventurous sea kayaking. Its lightweight design and stable structure ensure an enjoyable experience whether you're exploring calm waters or navigating mild rapids."
                when "Stand-up Paddleboard"
                  "Stand-up paddleboarding offers a unique way to experience the water, and this board is built for stability and ease of use. Great for beginners and pros alike, it’s ideal for exploring lakes, rivers, and oceans while staying fit and having fun."
                when "Ski Set"
                  "Get ready for winter with this complete ski set, featuring skis, poles, and boots designed for optimal performance on the slopes. Whether you're carving through fresh powder or racing down groomed trails, this set is perfect for all types of skiers."
                when "Golf Clubs"
                  "This set of golf clubs provides all the tools you need for a great round of golf. Each club is engineered for precision and power, giving you the confidence to take on any course, whether you're a beginner or a seasoned pro."
                when "Road Bike"
                  "Take on the open road with this lightweight road bike. Designed for speed and endurance, it’s perfect for long-distance cycling, offering a smooth and fast ride on paved surfaces, whether you’re training or just enjoying a weekend ride."
                when "Climbing Gear"
                  "This climbing gear set is essential for anyone looking to scale cliffs and conquer vertical challenges. It includes harnesses, ropes, carabiners, and other tools that ensure safety and reliability while climbing in the outdoors."
                when "Yoga Mat"
                  "Achieve balance and flexibility with this high-quality yoga mat. It offers superior grip and cushioning for all types of yoga, from beginner to advanced poses, ensuring comfort and stability throughout your practice."
                when "Hiking Backpack"
                  "Pack everything you need for your next adventure with this hiking backpack. Designed for comfort and durability, it offers ample storage space and ergonomic straps to carry gear for long treks, whether on a short hike or a multi-day journey."
                when "Inline Skates"
                  "These inline skates are built for speed and comfort, perfect for cruising on pavement or practicing tricks at the skate park. With adjustable sizes and a sleek design, they offer both beginners and experienced skaters an enjoyable ride."
                when "Camping Tent"
                  "This spacious and durable camping tent is perfect for family outings or solo adventures. With weather-resistant fabric and an easy setup, it ensures a comfortable night outdoors, protecting you from the elements while offering ample room for your gear."
                when "Fishing Rod"
                  "This fishing rod is designed for anglers of all experience levels. With a lightweight yet durable build, it offers great sensitivity and control, perfect for catching fish in a variety of environments, from freshwater lakes to the open sea."
                when "Kitesurfing Kite"
                  "Catch the wind with this high-performance kitesurfing kite. Whether you're a seasoned pro or just starting, this kite offers the power and stability needed for thrilling water sports, perfect for both calm and strong winds."
                when "Skateboard"
                  "Cruise the streets or hit the skate park with this high-quality skateboard. Featuring a durable deck and smooth wheels, it’s perfect for beginners or advanced skaters who want to perform tricks or simply enjoy a ride around town."
                when "Helmet"
                  "Stay safe with this lightweight and durable helmet, designed to provide superior protection for cyclists, skaters, and other outdoor enthusiasts. With a comfortable fit and stylish design, it’s perfect for protecting your head during any activity."
                when "Running Shoes"
                  "These running shoes are built for comfort and performance, with a lightweight design and responsive cushioning. Whether you're running on trails or pavement, they offer the support and durability you need for every stride, helping you achieve your personal best."
                else
                  "Perfect for outdoor adventures, this item is designed to provide both comfort and functionality. Whether you're tackling extreme sports or just enjoying a relaxing day outdoors, it's ideal for all levels of experience."
                end

  image_url = case item.name
              when "Mountain Bike"
                "https://cdn.rosebikes.de/cms/cms.64ca512bf2b490.40848535.png?im=Resize=(960)"
              when "Surfboard"
                "https://forward-am.com/wp-content/uploads/2021/01/forward-am-surfboard-header.jpeg"
              when "Tennis Racket"
                "https://146499398.cdn6.editmysite.com/uploads/1/4/6/4/146499398/s829221650548957097_p109_i15_w1200.jpeg"
              when "Snowboard"
                "https://www.skiinluxury.com/blog/wp-content/uploads/2020/03/41273701930_0ae0fb917e_b.jpg"
              when "Scuba Gear"
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2274H2MDbU4kGEFregSwtpDviC6z3qvHiGXeT93oy7fsZRDTyzJ8TZJhjjDy2LdwEO3Y&usqp=CAU"
              when "Kayak"
                "https://media.tacdn.com/media/attractions-splice-spp-674x446/0c/06/30/1f.jpg"
              when "Stand-up Paddleboard"
                "https://nwscdn.com/media/catalog/product/cache/h700xw700/t/o/touring_main.jpg"
              when "Ski Set"
                "https://tourism.valloire.net/content/uploads/2019/01/ski-932188_1920-1293x970.jpg"
              when "Golf Clubs"
                "https://swingloosegolf.com/wp-content/uploads/Golf-Clubs-on-Grass.webp"
              when "Road Bike"
                "https://c02.purpledshub.com/uploads/sites/39/2023/05/Trek-Emonda-AL5-02-2406262.jpg"
              when "Climbing Gear"
                "https://rockrun.com/cdn/shop/articles/climbing_hardware_1600x.jpg?v=1564740009"
              when "Yoga Mat"
                "https://www.marthastewart.com/thmb/TJyyssNA1ipeIXbp8DVDTzrXNZM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-clean-yoga-mat-getty-0623-1fda4b0532ea4f9787d5f248bbedaf8d.jpg"
              when "Hiking Backpack"
                "https://www.camelbak.eu/cdn/shop/files/Hike_Pack_566fb803-3da3-4b13-bf95-afaa171192a6.jpg?crop=center&height=1000&v=1691157067&width=1260"
              when "Inline Skates"
                "https://s3.us-east-1.amazonaws.com/images.gearjunkie.com/uploads/2023/07/offroad-rollerblades.jpg"
              when "Camping Tent"
                "https://m.media-amazon.com/images/I/71Nao63gy7S.jpg"
              when "Fishing Rod"
                "https://blackfinrods.com/cdn/shop/products/DSC04351_535x.jpg?v=1660843276"
              when "Kitesurfing Kite"
                "https://fasewind.com/wp-content/uploads/2021/04/kitesurf.jpg"
              when "Skateboard"
                "https://muralsyourway.vtexassets.com/arquivos/ids/241160/Skateboard-Sunset-Mural-Wallpaper.jpg?v=638164405202200000"
              when "Helmet"
                "https://i.ebayimg.com/00/s/MTYwMFgxNjAw/z/hfQAAOSwKMViulQB/$_57.JPG?set_id=8800005007"
              when "Running Shoes"
                "https://cdn.runrepeat.com/storage/gallery/buying_guide_primary/1508/1508-best-comfortable-running-shoes-16395638-main.jpg"
              end

  item.description = description
  file = URI.parse(image_url).open
  item.photo.attach(io: file, filename: "#{item.name.parameterize}.jpg", content_type: "image/jpg")
  item.save
  puts 'item created'
end



puts 'Creating 10 bookings...'
10.times do
  start_date = Faker::Date.between(from: Date.today, to: 30.days.from_now)
  end_date = start_date + rand(1..7).days
  duration = (end_date - start_date).to_i
  price_per_day = rand(10..50).to_f
  total_price = (price_per_day * duration).round(2)

  Booking.create!(
    start_date: start_date,
    end_date: end_date,
    price: total_price,
    user_id: User.all.sample.id,
    item_id: Item.all.sample.id
  )
end

puts 'All seeds created'
