# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database"
Tour.destroy_all

# var Amadeus = require('test.api.amadeus.com/v1/shopping/activities');

# var amadeus = new Amadeus({
#   clientId: '[API Key]',
#   clientSecret: '[API Secret]'
# });

CATEGORIES = ["Walking Tour", "Van Tour", "Bus Tour", "Free Tour", "Boat Tour"]

require 'faker'
16.times do |i|
  tour = Tour.new(user: { id: 1 }, name: Faker::Superhero.name, location: Faker::Address.city, description: Faker::Address.city, duration_in_hours: Faker::Number.within(range: 1..8), price: Faker::Number.within(range: 15..105), category: CATEGORIES.sample)
  tour.save!
  puts "created #{i} tours"
end
puts "All done!"

# validates :email, presence: true
# validates :encrypted_password, presence: true
# validates :age, presence: true, numericality: { only_integer: true }
# validates :guide, inclusion: { in: [true,false]}
# validates :language, presence: true
# validates :first_name, presence: true
# validates :last_name, presence: true
