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

Item.destroy_all
User.destroy_all

10.times do
  User.create!(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email(domain: ["sportsgear", "hotmail", "google", "icloud"].sample) + ".com",
  password: Faker::Internet.password,
  is_owner: [true, false].sample)
end

20.times do
  Item.create!(
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
    description: ["Perfect", "Ideal", "Good", "Average", "Mediocre"].sample + " for " + ["outdoor adventures", "beating the waves", "a weekend getaway", "extreme sports enthusiasts", "beginner or pro athletes"].sample + ".",
    location: Faker::Address.city + ", " + Faker::Address.country,
    category: ["Winter Sports", "Water Sports", "Racquet Sports", "Cycling", "Outdoor Adventure"].sample,
    image_url: "https://loremflickr.com/300/300/" + ["tennis", "bike", "ball"].sample,
    price_per_day: rand(5..100)
  )
end
