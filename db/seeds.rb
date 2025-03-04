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
require 'faker'

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

#CREATE USERS
puts "Creating users"

file = URI.parse("https://plus.unsplash.com/premium_photo-1661764174171-c29f85bd8a37?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
tourist1 = User.new(email: "tourist1@gmail.com", password: "123456", age: 25,
guide: false, language: "English", first_name: "John", last_name: "Doe",
about_me: Faker::TvShows::GameOfThrones.quote)
tourist1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
tourist1.save!

file2 = URI.parse("https://plus.unsplash.com/premium_photo-1682096348418-dbef9b1d0add?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
tourist2 = User.new(email: "tourist2@gmail.com", password: "123456", age: 23,
guide: false, language: "Portuguese", first_name: "Joana", last_name: "Santos",
about_me: Faker::TvShows::GameOfThrones.quote)
tourist2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
tourist2.save!

file3 = URI.parse("https://images.unsplash.com/photo-1588390801685-1432b35a975b?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
guide1 = User.create(email: "guide1@gmail.com", password: "123456", age: 35,
guide: true, language: "English", first_name: "Charles", last_name: "Dunne",
about_me: Faker::TvShows::GameOfThrones.quote)
guide1.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
guide1.save!

file4 = URI.parse("https://plus.unsplash.com/premium_photo-1716866637657-da951241f2db?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
guide2 = User.create(email: "guide2@gmail.com", password: "123456", age: 33,
guide: true, language: "Portuguese", first_name: "Cláudia", last_name: "Dunas",
about_me: Faker::TvShows::GameOfThrones.quote)
guide2.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
guide2.save!

puts "created 4 users"


#CREATE TOURS
puts "Creating tours"
16.times do |i|
  location = Faker::TvShows::GameOfThrones.city
  guide_array = [guide1, guide2]
  guide = guide_array.sample
  tour = Tour.new(user: guide, name: "Tour in #{location} with #{guide.first_name}", location: location,
  description: Faker::TvShows::GameOfThrones.quote, duration_in_hours: Faker::Number.within(range: 1..8),
  price: Faker::Number.within(range: 15..105), category: CATEGORIES.sample)
  photoUrl = "https://images.unsplash.com/photo-1569949381669-ecf31ae8e613?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  tour.photo.attach(io: URI.open(photoUrl), filename: 'atenasAcropolis.png', content_type: 'image/png')
  tour.save!
  puts "created #{i+1} tours"
end
puts "All done!"

# # validates :email, presence: true
# # validates :encrypted_password, presence: true
# # validates :age, presence: true, numericality: { only_integer: true }
# # validates :guide, inclusion: { in: [true,false]}
# # validates :language, presence: true
# # validates :first_name, presence: true
# # validates :last_name, presence: true
