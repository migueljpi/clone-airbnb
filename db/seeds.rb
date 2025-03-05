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

tour_data = [
  { location: "Paris", guide: guide1, description: "Explore the city of love with a local guide.", price: 50, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1569949381669-ecf31ae8e613?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Rome", guide: guide2, description: "Visit iconic landmarks like the Colosseum and the Vatican.", price: 60, category: "Van Tour", photo_url: "https://plus.unsplash.com/premium_photo-1675975706513-9daba0ec12a8?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "London", guide: guide1, description: "A day in the British capital, with history and culture.", price: 45, category: "Bus Tour", photo_url: "https://plus.unsplash.com/premium_photo-1671809692422-4893b9e09119?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Barcelona", guide: guide2, description: "Walk through the city of art and architecture.", price: 40, category: "Free Tour", photo_url: "https://images.unsplash.com/photo-1539037116277-4db20889f2d4?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Amsterdam", guide: guide1, description: "Explore the beautiful canals and museums.", price: 55, category: "Boat Tour", photo_url: "https://images.unsplash.com/photo-1534351590666-13e3e96b5017?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Berlin", guide: guide2, description: "Discover Berlin’s history and modern culture.", price: 50, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1599946347371-68eb71b16afc?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "New York", guide: guide1, description: "The iconic New York City tour, with must-see attractions.", price: 70, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1483653364400-eedcfb9f1f88?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Cairo", guide: guide2, description: "Tour the Great Pyramids and the Sphinx.", price: 65, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1553913861-c0fddf2619ee?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Tokyo", guide: guide1, description: "Experience the vibrant energy of Tokyo’s streets.", price: 80, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1661902398022-762e88ff3f82?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Machu Picchu", guide: guide2, description: "Take a trek to the ancient Inca ruins.", price: 90, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1587595431973-160d0d94add1?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Sydney", guide: guide1, description: "Explore Sydney’s stunning landmarks and beaches.", price: 60, category: "Boat Tour", photo_url: "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Rio de Janeiro", guide: guide2, description: "Soak up the sun and culture of Rio.", price: 75, category: "Free Tour", photo_url: "https://images.unsplash.com/photo-1518639192441-8fce0a366e2e?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Dubai", guide: guide1, description: "Visit the stunning modern architecture of Dubai.", price: 85, category: "Bus Tour", photo_url: "https://plus.unsplash.com/premium_photo-1661964298224-7747aa0ac10c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Hong Kong", guide: guide2, description: "A cultural blend of Eastern and Western influences.", price: 40, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1518599807935-37015b9cefcb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { location: "Athens", guide: guide1, description: "Visit ancient ruins and the Acropolis in Athens.", price: 55, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1555993539-1732b0258235?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" }
]

tour_data.each_with_index do |tour_info, i|
  puts "Processing tour #{i+1} in #{tour_info[:location]}"
  begin
    tour = Tour.new(user: tour_info[:guide], name: "Tour in #{tour_info[:location]} with #{tour_info[:guide].first_name}",
                    location: tour_info[:location], description: tour_info[:description],
                    duration_in_hours: Faker::Number.within(range: 1..8), price: tour_info[:price],
                    category: tour_info[:category])
    puts "Opening URL: #{tour_info[:photo_url]}"
    tour.photo.attach(io: URI.open(tour_info[:photo_url]), filename: "#{tour_info[:location]}.png", content_type: 'image/png')
    tour.save!
    puts "created tour #{i+1} in #{tour_info[:location]}"
  rescue OpenURI::HTTPError => e
    puts "Failed to open URL: #{tour_info[:photo_url]}"
    puts "Error: #{e.message}"
  end
end

puts "All done!"

# # validates :email, presence: true
# # validates :encrypted_password, presence: true
# # validates :age, presence: true, numericality: { only_integer: true }
# # validates :guide, inclusion: { in: [true,false]}
# # validates :language, presence: true
# # validates :first_name, presence: true
# # validates :last_name, presence: true
