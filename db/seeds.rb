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
# User.destroy_all

10.times do
  User.create!(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email ,
  password: Faker::Internet.password,
  is_owner: [true, false].sample)
end



20.times do
  Item.create!(name: Faker::Book.author,
   user: User.all.sample,
   description: Faker::Lorem.sentence,
   location:Faker::Locations::Australia.location,
   category:["winter", "surfing", "raquets", "biking", "diving"].sample,
   price_per_day: rand(1..50))
end
