# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'
# key= Cloudinary::Uploader.upload("./app/assets/images/tour_guide.jpg")["asset_key"]

puts "Cleaning database"
Tour.destroy_all
Booking.destroy_all
User.destroy_all

# # var Amadeus = require('test.api.amadeus.com/v1/shopping/activities');

# # var amadeus = new Amadeus({
# #   clientId: '[API Key]',
# #   clientSecret: '[API Secret]'
# # });

User.create(email: "john@gmail.com", password: "123456", age: 30, guide: true, about_me: "Hi", language: "English", first_name: "John", last_name: "Doe")

CATEGORIES = ["Walking Tour", "Van Tour", "Bus Tour", "Free Tour", "Boat Tour"]

require 'faker'
16.times do |i|
  tour = Tour.new(user: User.first, name: "Tour in #{Faker::Address.city} with #{Faker::Superhero.name}", location: Faker::Address.city, description: Faker::TvShows::GameOfThrones.quote, duration_in_hours: Faker::Number.within(range: 1..8), price: Faker::Number.within(range: 15..105), category: CATEGORIES.sample)
  # photoUrl = "https://cdn.getyourguide.com/img/tour/02804a4e26cd4eaf7102b59fbeffc4fd14f80b48eb0af36e2dddeeb5b5ead364.jpg/98.jpg"
  tour.photo.attach(io: File.open("./app/assets/images/tour_guide.jpg"), filename: 'atenasAcropolis.png', content_type: 'image/png')
  tour.save!
  puts "created #{i} tours"
end
puts "All done!"

# # validates :email, presence: true
# # validates :encrypted_password, presence: true
# # validates :age, presence: true, numericality: { only_integer: true }
# # validates :guide, inclusion: { in: [true,false]}
# # validates :language, presence: true
# # validates :first_name, presence: true
# # validates :last_name, presence: true
