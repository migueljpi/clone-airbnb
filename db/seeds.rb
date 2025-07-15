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
Review.delete_all
Booking.delete_all
Tour.delete_all
User.delete_all
puts "Database cleaned"

User.create(email: "john@gmail.com", password: "123456", age: 30, guide: true, about_me: "Hi", language: "English", first_name: "John", last_name: "Doe")

# # var Amadeus = require('test.api.amadeus.com/v1/shopping/activities');

# # var amadeus = new Amadeus({
# #   clientId: '[API Key]',
# #   clientSecret: '[API Secret]'
# # });

CATEGORIES = ["Walking Tour", "Van Tour", "Bus Tour", "Free Tour", "Boat Tour"]

############################### LATEST #################################

# CREATE TOURISTS
puts "Creating tourists"
file1 = URI.parse("https://plus.unsplash.com/premium_photo-1661764174171-c29f85bd8a37?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "John"
last_name = "Doe"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist1 = User.new(
  email: email,
  password: "123456",
  age: 52,
  guide: false,
  language: "English",
  first_name: first_name,
  last_name: last_name,
  about_me: "Adventure lover, discovering cultures, food, and people. When not traveling, I read about history and plan my next trip."
)
tourist1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
tourist1.save!

file2 = URI.parse("https://plus.unsplash.com/premium_photo-1682096348418-dbef9b1d0add?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Joana"
last_name = "Santos"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist2 = User.new(
  email: email,
  password: "123456",
  age: 24,
  guide: false,
  language: "Portuguese",
  first_name: first_name,
  last_name: last_name,
  about_me: "Passionate about exploring new cultures and landscapes. Hiking, trying new cuisines, and learning languages are my favorite things."
)
tourist2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
tourist2.save!

file3 = URI.parse("https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Emily"
last_name = "Smith"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist3 = User.new(
  email: email,
  password: "123456",
  age: 29,
  guide: false,
  language: "English",
  first_name: first_name,
  last_name: last_name,
  about_me: "Nature lover and eco-tourist, hiking and capturing stunning landscapes. Let's explore the world's natural wonders!"
)
tourist3.photo.attach(io: file3, filename: "emily.png", content_type: "image/png")
tourist3.save!

file4 = URI.parse("https://images.unsplash.com/photo-1628375385883-6e086364f66d?q=80&w=3165&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Michael"
last_name = "Johnson"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist4 = User.new(
  email: email,
  password: "123456",
  age: 34,
  guide: false,
  language: "English",
  first_name: first_name,
  last_name: last_name,
  about_me: "Explorer, photographer, and foodie. I seek new culinary delights and capture every meal as an adventure!"
)
tourist4.photo.attach(io: file4, filename: "michael.png", content_type: "image/png")
tourist4.save!

file5 = URI.parse("https://plus.unsplash.com/premium_photo-1665010806447-5f80ee6eb30f?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Sophia"
last_name = "Williams"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist5 = User.new(
  email: email,
  password: "123456",
  age: 26,
  guide: false,
  language: "English",
  first_name: first_name,
  last_name: last_name,
  about_me: "Art, history, and culture enthusiast. I explore museums and historical landmarks to connect with a place's soul."
)
tourist5.photo.attach(io: file5, filename: "sophia.png", content_type: "image/png")
tourist5.save!

file6 = URI.parse("https://plus.unsplash.com/premium_photo-1663957863124-1d8ca3564f80?q=80&w=3237&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Ayesha"
last_name = "Khan"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist6 = User.new(
  email: email,
  password: "123456",
  age: 28,
  guide: false,
  language: "Urdu",
  first_name: first_name,
  last_name: last_name,
  about_me: "Traveling helps me find peace. I love exploring cultures, tasting foods, and learning about different communities."
)
tourist6.photo.attach(io: file6, filename: "ayesha.png", content_type: "image/png")
tourist6.save!

file7 = URI.parse("https://images.unsplash.com/photo-1598627446792-5d89ab3e3540?q=80&w=3136&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Giovanni"
last_name = "Ricci"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist7 = User.new(
  email: email,
  password: "123456",
  age: 35,
  guide: false,
  language: "Italian",
  first_name: first_name,
  last_name: last_name,
  about_me: "Explorer, food lover, and cultural enthusiast. I embrace new experiences, especially through food and history."
)
tourist7.photo.attach(io: file7, filename: "giovanni.png", content_type: "image/png")
tourist7.save!

file8 = URI.parse("https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Carlos"
last_name = "Gomez"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{last_name.downcase.gsub(/\s+/, "")}@tourist.com"
tourist8 = User.new(
  email: email,
  password: "123456",
  age: 40,
  guide: false,
  language: "Spanish",
  first_name: first_name,
  last_name: last_name,
  about_me: "Exploring Latin America's wonders—beaches, mountains, culture, and history. Always seeking new adventures."
)
tourist8.photo.attach(io: file8, filename: "carlos.png", content_type: "image/png")
tourist8.save!

# CREATE TOUR GUIDES
puts "Creating guides"

# Paris Guide
file = URI.parse("https://images.unsplash.com/photo-1645468085508-11d3ee94fcef?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Pierre"
last_name = "Dupont"
city_name = "Paris"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide1 = User.new(
  email: email,
  password: "123456",
  age: 30,
  guide: true,
  language: ["English", "French"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Bonjour! I’m Pierre, a Paris native and tour guide for 6+ years. Let me show you the hidden gems of this beautiful city!"
)
guide1.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide1.save!

# Rome Guide
file = URI.parse("https://images.unsplash.com/photo-1667331623046-7d49f27282ed?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzF8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Marco"
last_name = "Rossi"
city_name = "Rome"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide2 = User.new(
  email: email,
  password: "123456",
  age: 35,
  guide: true,
  language: ["English", "Italian"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Ciao! I’m Marco, a proud Roman guiding tourists for 8 years. Let’s explore Rome’s iconic sights and local treasures!"
)
guide2.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide2.save!

# London Guide
file = URI.parse("https://images.unsplash.com/photo-1597627094703-2a8af9caa749?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Oliver"
last_name = "Smith"
city_name = "London"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide3 = User.new(
  email: email,
  password: "123456",
  age: 32,
  guide: true,
  language: ["English"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Hello! I’m Oliver, a London-born guide with 5+ years of experience. From history to food, I’ll show you the best of London!"
)
guide3.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide3.save!

# Barcelona Guide
file = URI.parse("https://plus.unsplash.com/premium_photo-1716866637402-f42202efe8e0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzAzfHx0b3VyJTIwZ3VpZGV8ZW58MHx8MHx8fDA%3D").open
first_name = "Isabella"
last_name = "Garcia"
city_name = "Barcelona"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide4 = User.new(
  email: email,
  password: "123456",
  age: 29,
  guide: true,
  language: ["English", "Spanish"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Hola! I’m Isabella, a Barcelona guide for 7 years. From Gaudí’s wonders to La Rambla, I’ll help you discover the city’s magic!"
)
guide4.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide4.save!

# Amsterdam Guide
file = URI.parse("https://images.unsplash.com/photo-1495538411606-c9efab92bcbe?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHx0b3VyJTIwZ3VpZGV8ZW58MHx8MHx8fDA%3D").open
first_name = "Lukas"
last_name = "Van Der Meer"
city_name = "Amsterdam"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide5 = User.new(
  email: email,
  password: "123456",
  age: 34,
  guide: true,
  language: ["English", "Dutch"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Hi! I’m Lukas, an Amsterdam local guiding visitors for 6 years. Let’s explore the canals, museums, and hidden gems together!"
)
guide5.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide5.save!

# Berlin Guide
file = URI.parse("https://plus.unsplash.com/premium_photo-1716937389119-37d11a6c8a92?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8dG91ciUyMGd1aWRlfGVufDB8fDB8fHww").open
first_name = "Anna"
last_name = "Schmidt"
city_name = "Berlin"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide6 = User.new(
  email: email,
  password: "123456",
  age: 31,
  guide: true,
  language: ["English", "German"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Hallo! I’m Anna, guiding Berlin tours for 6 years. From the Berlin Wall to Kreuzberg’s street art, I’ll show you the city’s best!"
)
guide6.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide6.save!

# New York Guide
file = URI.parse("https://images.unsplash.com/photo-1621707854626-ffa306e32745?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Ethan"
last_name = "Johnson"
city_name = "New York"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide7 = User.new(
  email: email,
  password: "123456",
  age: 28,
  guide: true,
  language: ["English"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Hey! I’m Ethan, a New York guide for 4 years. From Times Square to Central Park, I’ll show you why NYC never sleeps!"
)
guide7.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide7.save!

# Cairo Guide
file = URI.parse("https://images.unsplash.com/photo-1711745818268-94d8ea00668f?q=80&w=3120&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Fatima"
last_name = "Abdelrahman"
city_name = "Cairo"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide8 = User.new(
  email: email,
  password: "123456",
  age: 33,
  guide: true,
  language: ["English", "Arabic"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Salam! I’m Fatima, guiding in Cairo for 7 years. Let’s explore the Pyramids, bustling markets, and Egypt’s rich history!"
)
guide8.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide8.save!

# Tokyo Guide
file = URI.parse("https://images.unsplash.com/photo-1669296583832-e0ba1d1438ed?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzZ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Yuki"
last_name = "Tanaka"
city_name = "Tokyo"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide9 = User.new(
  email: email,
  password: "123456",
  age: 27,
  guide: true,
  language: ["English", "Japanese"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Konnichiwa! I’m Yuki, a Tokyo guide for 5 years. From ancient temples to Harajuku trends, I’ll take you on an unforgettable tour!"
)
guide9.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide9.save!

# Machu Picchu Guide
file = URI.parse("https://plus.unsplash.com/premium_photo-1718146018854-ad4aa928d9c4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Luis"
last_name = "Quispe"
city_name = "Machu Picchu"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide10 = User.new(
  email: email,
  password: "123456",
  age: 38,
  guide: true,
  language: ["English", "Spanish"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "¡Hola! I’m Luis, guiding at Machu Picchu for 10+ years. Let’s explore Inca history and breathtaking mountain views!"
)
guide10.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide10.save!

# Sydney Guide
file = URI.parse("https://plus.unsplash.com/premium_photo-1716866637657-da951241f2db?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Emily"
last_name = "Williams"
city_name = "Sydney"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide11 = User.new(
  email: email,
  password: "123456",
  age: 29,
  guide: true,
  language: ["English"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "G’day! I’m Emily, a Sydney guide for 6 years. From Bondi Beach to The Rocks, I’ll help you experience the best of Sydney!"
)
guide11.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide11.save!

# Rio de Janeiro Guide
file = URI.parse("https://images.unsplash.com/photo-1654414882149-8417f5de3a63?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzB8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Carlos"
last_name = "Silva"
city_name = "Rio de Janeiro"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide12 = User.new(
  email: email,
  password: "123456",
  age: 31,
  guide: true,
  language: ["English", "Portuguese"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Oi! I’m Carlos, a Rio native guiding for 7 years. Let’s explore Sugarloaf Mountain, Copacabana, and Brazil’s vibrant culture!"
)
guide12.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide12.save!

# Dubai Guide
file = URI.parse("https://plus.unsplash.com/premium_photo-1681489839216-b2d4b5409718?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Layla"
last_name = "Al Farsi"
city_name = "Dubai"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide13 = User.new(
  email: email,
  password: "123456",
  age: 33,
  guide: true,
  language: ["English", "Arabic"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "As-salamu alaykum! I’m Layla, a Dubai guide for 8 years. From Burj Khalifa to desert safaris, I’ll show you the best of Dubai!"
)
guide13.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide13.save!

file = URI.parse("https://images.unsplash.com/photo-1487309078313-fad80c3ec1e5?q=80&w=2648&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Wei"
last_name = "Chen"
city_name = "Hong Kong"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide14 = User.new(
  email: email,
  password: "123456",
  age: 28,
  guide: true,
  language: ["English", "Cantonese", "Mandarin"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "你好! I’m Wei, guiding in Hong Kong for 5 years. Let’s explore the skyline, rich history, and lively culture together!"
)
guide14.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide14.save!

file = URI.parse("https://images.unsplash.com/photo-1489323588428-2cb185f5cd5c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
first_name = "Nikoleta"
last_name = "Papadopoulos"
city_name = "Athens"
email = "#{first_name.downcase.gsub(/\s+/, "")}.#{city_name.downcase.gsub(/\s+/, "")}@guide.com"
guide15 = User.new(
  email: email,
  password: "123456",
  age: 35,
  guide: true,
  language: ["English", "Greek"].join(", "),
  first_name: first_name,
  last_name: last_name,
  about_me: "Kalimera! I’m Nikoleta, and I’ve been sharing the ancient wonders and rich history of Athens with travelers for over 7 years. From the Parthenon to the Acropolis Museum, I’ll guide you through the history that made this city famous!"
)
guide15.photo.attach(io: file, filename: "guide_photo.png", content_type: "image/png")
guide15.save!

# CREATE TOURS
puts "Creating tours"
tour_data = [
  { name: "Paris Walking Tour: City of Love", location: "Paris", guide: guide1, description: "Explore the city of love with a local guide.", price: 50, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1666283181610-b95ee7e55465?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Eiffel Tower, Paris, France", ending_point: "Sacré-Cœur, Paris, France", sights: "Notre-Dame Cathedral of Paris, Paris, France; Louvre Museum, Paris, France; Champs-Élysées, Paris, France; Montmartre, Paris, France" },
  { name: "Paris Hidden Gems Tour", location: "Paris", guide: guide1, description: "Discover the hidden gems of Paris with a local expert.", price: 55, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Montmartre, Paris, France", ending_point: "Le Marais, Paris, France", sights: "Sacré-Cœur, Paris, France; Moulin Rouge, Paris, France; Place des Vosges, Paris, France; Centre Pompidou, Paris, France" },
  { name: "Rome Iconic Landmarks Tour", location: "Rome", guide: guide2, description: "Visit iconic landmarks like the Colosseum and the Vatican.", price: 60, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1552832230-c0197dd311b5?q=80&w=2944&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Colosseum, Rome, Italy", sights: "Trevi Fountain, Rome, Italy; Pantheon, Rome, Italy; Spanish Steps, Rome, Italy; Piazza Navona, Rome, Italy", ending_point: "Vatican City, Rome, Italy" },
  { name: "Rome Ancient Ruins Walking Tour", location: "Rome", guide: guide2, description: "Explore the ancient ruins of Rome.", price: 55, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1531572753322-ad063cecc140?q=80&w=2952&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Roman Forum, Rome, Italy", sights: "Circus Maximus, Rome, Italy; Capitoline Hill, Rome, Italy; Arch of Constantine, Rome, Italy; Trajan's Market, Rome, Italy", ending_point: "Palatine Hill, Rome, Italy" },
  { name: "London Highlights Bus Tour", location: "London", guide: guide3, description: "A day in the British capital, with history and culture.", price: 45, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Big Ben, London, UK", sights: "Buckingham Palace, London, UK; London Eye, London, UK; Westminster Abbey, London, UK; Trafalgar Square, London, UK", ending_point: "Tower of London, London, UK" },
  { name: "London Modern and Historic Walking Tour", location: "London", guide: guide3, description: "Discover the modern and historic sides of London.", price: 50, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1671809692422-4893b9e09119?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "St. Paul's Cathedral, London, UK", sights: "Millennium Bridge, London, UK; Tate Modern, London, UK; Borough Market, London, UK; Shakespeare's Globe, London, UK", ending_point: "The Shard, London, UK" },
  { name: "Barcelona Art and Architecture Tour", location: "Barcelona", guide: guide4, description: "Walk through the city of art and architecture.", price: 40, category: "Free Tour", photo_url: "https://images.unsplash.com/photo-1523531294919-4bcd7c65e216?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Sagrada Familia, Barcelona, Spain", sights: "Casa Batlló, Barcelona, Spain; La Rambla, Barcelona, Spain; Gothic Quarter, Barcelona, Spain; Magic Fountain of Montjuïc, Barcelona, Spain", ending_point: "Park Güell, Barcelona, Spain" },
  # { name: "Barcelona Hidden Gems Walking Tour", location: "Barcelona", guide: guide4, description: "Explore the vibrant neighborhoods of Barcelona.", price: 35, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1583422409516-2895a77efded?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Plaça de Catalunya, Barcelona, Spain", sights: "El Raval, Barcelona, Spain; Born Cultural Center, Barcelona, Spain; Picasso Museum, Barcelona, Spain; Ciutadella Park, Barcelona, Spain", ending_point: "Barceloneta Beach, Barcelona, Spain" },
  { name: "Amsterdam Canal and Museum Boat Tour", location: "Amsterdam", guide: guide5, description: "Explore the beautiful canals and museums.", price: 55, category: "Boat Tour", photo_url: "https://images.unsplash.com/photo-1534351590666-13e3e96b5017?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Central Station, Amsterdam, Netherlands", sights: "Anne Frank House, Amsterdam, Netherlands; Van Gogh Museum, Amsterdam, Netherlands; Dam Square, Amsterdam, Netherlands; Vondelpark, Amsterdam, Netherlands", ending_point: "Rijksmuseum, Amsterdam, Netherlands" },
  { name: "Amsterdam Hidden Gems Walking Tour", location: "Amsterdam", guide: guide5, description: "Discover the hidden gems of Amsterdam.", price: 50, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1605101100278-5d1deb2b6498?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Dam Square, Amsterdam, Netherlands", sights: "Red Light District, Amsterdam, Netherlands; Rembrandt House Museum, Amsterdam, Netherlands; Flower Market, Amsterdam, Netherlands; NEMO Science Museum, Amsterdam, Netherlands", ending_point: "Jordaan, Amsterdam, Netherlands" },
  { name: "Berlin History and Culture Walking Tour", location: "Berlin", guide: guide6, description: "Discover Berlin’s history and modern culture.", price: 50, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1599946347371-68eb71b16afc?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Brandenburg Gate, Berlin, Germany", sights: "Berlin Wall, Berlin, Germany; Reichstag, Berlin, Germany; Checkpoint Charlie, Berlin, Germany; Museum Island, Berlin, Germany", ending_point: "East Side Gallery, Berlin, Germany" },
  { name: "Berlin Alternative Tour", location: "Berlin", guide: guide6, description: "Explore Berlin’s street art and alternative scene.", price: 45, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1587330979470-3595ac045ab0?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Kreuzberg, Berlin, Germany", sights: "Mauerpark, Berlin, Germany; RAW-Gelände, Berlin, Germany; Friedrichshain, Berlin, Germany; Berghain, Berlin, Germany", ending_point: "East Side Gallery, Berlin, Germany" },
  { name: "New York City Best of the City Tour", location: "New York", guide: guide7, description: "Experience all the major landmarks in NYC.", price: 70, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1499092346589-b9b6be3e94b2?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Times Square, New York, USA", sights: "Empire State Building, New York, USA; Statue of Liberty, New York, USA; Central Park, New York, USA; Brooklyn Bridge, New York, USA", ending_point: "Rockefeller Center, New York, USA" },
  { name: "New York City Night Tour", location: "New York", guide: guide7, description: "See the city’s lights at night and its best views.", price: 60, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1492666673288-3c4b4576ad9a?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Times Square, New York, USA", sights: "Empire State Building, New York, USA; Brooklyn Bridge, New York, USA; Central Park, New York, USA; Rockefeller Center, New York, USA", ending_point: "Top of the Rock, New York, USA" },
  { name: "Cairo Pyramids and Sphinx Bus Tour", location: "Cairo", guide: guide8, description: "Tour the Great Pyramids and the Sphinx.", price: 65, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1553913861-c0fddf2619ee?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Egyptian Museum, Cairo, Egypt", ending_point: "Pyramids of Giza, Cairo, Egypt", sights: "Cairo Tower, Cairo, Egypt; Khan el-Khalili, Cairo, Egypt; Al-Azhar Mosque, Cairo, Egypt; Sphinx, Cairo, Egypt" },
  { name: "Cairo Historic Sites Walking Tour", location: "Cairo", guide: guide8, description: "Explore the historic sites of Cairo.", price: 60, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1572252009286-268acec5ca0a?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Al-Rifa'i Mosque, Cairo, Egypt", ending_point: "Mosque of Muhammad Ali, Cairo, Egypt", sights: "Hanging Church, Cairo, Egypt; Sultan Hassan Mosque, Cairo, Egypt; Coptic Museum, Cairo, Egypt" },
  { name: "Tokyo Walking Tour: Vibrant Streets", location: "Tokyo", guide: guide9, description: "Experience the vibrant energy of Tokyo’s streets.", price: 80, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=2988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Shibuya Crossing, Tokyo, Japan", ending_point: "Tokyo Tower, Tokyo, Japan", sights: "Ueno Park, Tokyo, Japan; Meiji Shrine, Tokyo, Japan; Asakusa, Tokyo, Japan; Akihabara, Tokyo, Japan" },
  { name: "Tokyo Walking Tour: Tradition & Modernity", location: "Tokyo", guide: guide9, description: "Discover the traditional and modern sides of Tokyo.", price: 75, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1661914240950-b0124f20a5c1?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Senso-ji Temple, Tokyo, Japan", ending_point: "Roppongi Hills, Tokyo, Japan", sights: "Ginza, Tokyo, Japan; Odaiba, Tokyo, Japan; Tsukiji Fish Market, Tokyo, Japan; Shinjuku Gyoen, Tokyo, Japan" },
  { name: "Machu Picchu Trek: Inca Ruins", location: "Machu Picchu", guide: guide10, description: "Take a trek to the ancient Inca ruins.", price: 90, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1587595431973-160d0d94add1?q=80&w=2952&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Machu Picchu Entrance, Peru", ending_point: "Sun Gate, Machu Picchu, Peru", sights: "Huayna Picchu, Machu Picchu, Peru; Inca Bridge, Machu Picchu, Peru; Temple of the Sun, Machu Picchu, Peru; Intihuatana, Machu Picchu, Peru" },
  { name: "Sydney Boat Tour: Landmarks & Beaches", location: "Sydney", guide: guide11, description: "Explore Sydney’s stunning landmarks and beaches.", price: 60, category: "Boat Tour", photo_url: "https://images.unsplash.com/photo-1546268060-2592ff93ee24?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Sydney Opera House, Sydney, Australia", ending_point: "Bondi Beach, Sydney, Australia", sights: "Taronga Zoo, Sydney, Australia; Harbour Bridge, Sydney, Australia; Darling Harbour, Sydney, Australia; The Rocks, Sydney, Australia" },
  { name: "Sydney Walking Tour: Vibrant Neighborhoods", location: "Sydney", guide: guide11, description: "Discover the vibrant neighborhoods of Sydney.", price: 55, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Circular Quay, Sydney, Australia", ending_point: "Darling Harbour, Sydney, Australia", sights: "Barangaroo, Sydney, Australia; Queen Victoria Building, Sydney, Australia; Hyde Park, Sydney, Australia; Royal Botanic Garden, Sydney, Australia" },
  { name: "Sydney Walking Tour: Iconic Landmarks & Views", location: "Sydney", guide: guide11, description: "Explore Sydney's iconic landmarks and scenic views.", price: 55, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1697730221799-f2aa87ab2c5d?q=80&w=3174&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Circular Quay, Sydney, Australia", ending_point: "Darling Harbour, Sydney, Australia", sights: "Barangaroo, Sydney, Australia; Queen Victoria Building, Sydney, Australia; Hyde Park, Sydney, Australia; Royal Botanic Garden, Sydney, Australia" },
  { name: "Rio de Janeiro Walking Tour: Sun & Culture", location: "Rio de Janeiro", guide: guide12, description: "Soak up the sun and culture of Rio.", price: 75, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1518639192441-8fce0a366e2e?q=80&w=2942&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Christ the Redeemer, Rio de Janeiro, Brazil", ending_point: "Sugarloaf Mountain, Rio de Janeiro, Brazil", sights: "Ipanema Beach, Rio de Janeiro, Brazil; Copacabana Beach, Rio de Janeiro, Brazil; Maracanã Stadium, Rio de Janeiro, Brazil; Selarón Steps, Rio de Janeiro, Brazil" },
  { name: "Rio de Janeiro Walking Tour: Vibrant Neighborhoods", location: "Rio de Janeiro", guide: guide12, description: "Explore the vibrant neighborhoods of Rio.", price: 70, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Santa Teresa, Rio de Janeiro, Brazil", ending_point: "Botanical Garden, Rio de Janeiro, Brazil", sights: "Flamengo Park, Rio de Janeiro, Brazil; Museum of Tomorrow, Rio de Janeiro, Brazil; Cinelândia, Rio de Janeiro, Brazil" },
  { name: "Dubai Bus Tour: Modern Architecture", location: "Dubai", guide: guide13, description: "Visit the stunning modern architecture of Dubai.", price: 85, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Palm Jumeirah, Dubai, UAE", ending_point: "Burj Khalifa, Dubai, UAE", sights: "Dubai Marina, Dubai, UAE; Jumeirah Beach, Dubai, UAE; Dubai Mall, Dubai, UAE; Burj Al Arab, Dubai, UAE" },
  { name: "Dubai Walking Tour: Cultural Heritage", location: "Dubai", guide: guide13, description: "Explore the cultural heritage of Dubai.", price: 80, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1580674684081-7617fbf3d745?q=80&w=3174&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Dubai Creek, Dubai, UAE", ending_point: "Al Fahidi Historical District, Dubai, UAE", sights: "Al Seef, Dubai, UAE; Spice Souk, Dubai, UAE; Dubai Museum, Dubai, UAE; Gold Souk, Dubai, UAE" },
  { name: "Hong Kong Van Tour: Classic Sightseeing", location: "Hong Kong", guide: guide14, description: "A vibrant city tour through Hong Kong.", price: 65, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1518599807935-37015b9cefcb?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Victoria Peak, Hong Kong, China", ending_point: "Tsim Sha Tsui, Hong Kong, China", sights: "Star Ferry, Hong Kong, China; Avenue of Stars, Hong Kong, China; Mong Kok, Hong Kong, China; Hong Kong Disneyland, Hong Kong, China" },
  { name: "Hong Kong Walking Tour: Night Markets & Fun", location: "Hong Kong", guide: guide14, description: "Enjoy a classic Hong Kong sightseeing experience.", price: 60, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1661887292499-cbaefdb169ce?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Temple Street Night Market, Hong Kong, China", ending_point: "Lan Kwai Fong, Hong Kong, China", sights: "Mong Kok, Hong Kong, China; Hong Kong Park, Hong Kong, China; Man Mo Temple, Hong Kong, China; Central, Hong Kong, China" },
  { name: "Athens Van Tour: Ancient Ruins & History", location: "Athens", guide: guide15, description: "Visit ancient ruins and the Acropolis in Athens.", price: 55, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1555993539-1732b0258235?q=80&w=2940&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Acropolis of Athens, Greece", ending_point: "Parthenon, Athens, Greece", sights: "National Archaeological Museum, Athens, Greece; Temple of Olympian Zeus, Athens, Greece; Plaka, Athens, Greece; Monastiraki, Athens, Greece" },
  { name: "Athens Walking Tour: Historic Sites & Ruins", location: "Athens", guide: guide15, description: "Explore the historic sites of Athens.", price: 50, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1668618252814-76fd5206f523?q=80&w=3110&auto=format&fit=crop&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Syntagma Square, Athens, Greece", ending_point: "Ancient Agora, Athens, Greece", sights: "Hadrian's Library, Athens, Greece; Roman Agora, Athens, Greece" }
]

tour_data.each_with_index do |tour_info, i|
  puts "Processing tour #{i + 1} in #{tour_info[:location]}"
  begin
    # Get starting point coordinates
    starting_point_coords = Geocoder.coordinates(tour_info[:starting_point])
    if starting_point_coords.nil?
      puts "Failed to get coordinates for starting point: #{tour_info[:starting_point]}"
      next
    end

    tour = Tour.new(
      user: tour_info[:guide],
      name: tour_info[:name],
      location: tour_info[:location],
      description: tour_info[:description],
      duration_in_hours: Faker::Number.within(range: 1..8),
      price: tour_info[:price],
      category: tour_info[:category],
      starting_point: tour_info[:starting_point],
      ending_point: tour_info[:ending_point],
      sights: tour_info[:sights],
      latitude: starting_point_coords[0],
      longitude: starting_point_coords[1]
    )
    puts "Opening URL: #{tour_info[:photo_url]}"
    tour.photo.attach(io: URI.open(tour_info[:photo_url]), filename: "#{tour_info[:location]}.png", content_type: 'image/png')
    tour.save!
    puts "Created tour #{i + 1} in #{tour_info[:location]}"
  rescue OpenURI::HTTPError => e
    puts "Failed to open URL: #{tour_info[:photo_url]}"
    puts "Error: #{e.message}"
  rescue SocketError, URI::InvalidURIError, Net::ReadTimeout => e
    puts "Failed to process tour #{i + 1} in #{tour_info[:location]}"
    puts "Error: #{e.message}"
  end
end

# CREATE BOOKINGS
puts "Creating bookings"
tourists = User.where(guide: false)
puts "Found #{tourists.count} tourists"
tours = Tour.all
puts "Found #{tours.count} tours"

# Ensure each tour has at least one completed booking
tours.each do |tour|

  booking_date = Faker::Date.between(from: 60.days.ago, to: 30.days.ago)
  booking = Booking.new(
    user: tourists.sample,
    tour: tour,
    status: "Completed",
    date: booking_date,
    pax: Faker::Number.between(from: 1, to: 5)
  )
  booking.save!
  puts "Created completed booking for tour: #{tour.name} on #{booking_date}"
end

# Create additional random bookings
5.times do
  booking_date = Faker::Date.between(from: 60.days.ago, to: 30.days.from_now)
  booking_status = if booking_date < Date.today
                     ["Completed", "Cancelled", "Refunded", "Rejected"].sample
                   else
                     ["Pending", "Confirmed"].sample
                   end

  booking = Booking.new(
    user: tourists.sample,
    tour: tours.sample,
    status: booking_status,
    date: booking_date,
    pax: Faker::Number.between(from: 1, to: 5)
  )
  booking.save!
  puts "Created past booking for tour: #{booking.tour.name} on #{booking_date} with status: #{booking_status}"
end

# CREATE REVIEWS
puts "Creating reviews"
bookings = Booking.all

# Ensure each tour has at least one review
tours.each do |tour|
  completed_booking = bookings.where(tour: tour, status: "Completed").sample
  if completed_booking && Review.where(booking: completed_booking).empty?
    review_content = case tour.category
                      when "Walking Tour"
                        ["Such a great walking tour! The guide made history come alive.",
                        "Perfect pace and awesome stories along the way. Highly recommend!",
                        "Loved exploring on foot—felt like I really got to know the city.",
                        "A fun and easy way to see all the best spots without missing anything.",
                        "Felt like a local wandering through hidden gems. Great experience!",
                        "So much cool info, but never felt overwhelming. Just a great time.",
                        "Awesome mix of history, fun facts, and beautiful sights."] .sample
                      when "Van Tour"
                        ["Super comfy ride with great stories along the way. Worth it!",
                        "Saw so much in just a few hours without feeling rushed. Perfect tour!",
                        "Great way to explore without walking too much. Loved every stop!",
                        "The guide was hilarious and knew so much. Made the trip even better!",
                        "Didn’t expect to enjoy a van tour this much, but it was fantastic!",
                        "Loved how easy and relaxed this was—no stress, just good vibes.",
                        "Perfect for seeing a lot in one go. The guide kept it fun and interesting!"] .sample
                      when "Bus Tour"
                        ["Great way to see everything without exhausting yourself. Totally worth it!",
                        "Loved how well-organized this was. Saw all the highlights with no hassle!",
                        "The bus was comfy, and the guide was a pro. Learned so much!",
                        "Such a fun way to cover a ton of ground. Highly recommend!",
                        "The perfect mix of sightseeing and storytelling. Really enjoyed it!",
                        "A must-do if you want to see the city without too much walking.",
                        "Easy, informative, and fun! Covered way more than I expected."] .sample
                      when "Free Tour"
                        ["Super engaging and informative. Totally worth tipping the guide!",
                        "Loved how passionate the guide was. Made the whole tour special.",
                        "One of the best ways to explore the city. Learned a ton!",
                        "Such a great way to meet people and discover hidden gems."] .sample
                      when "Boat Tour"
                        ["Hands down the most relaxing way to see the city. Loved it!",
                        "The views were unreal, and the guide had the best stories.",
                        "Felt like a little escape from the busy city. So peaceful and fun!",
                        "A perfect mix of sightseeing and just chilling on the water.",
                        "Could’ve stayed on the boat all day—such a cool experience!",
                        "A boat tour just hits different. Great vibe, great views, great info.",
                        "100% the highlight of my trip. Highly recommend!"] .sample
                      else
                        ["Such a well-organized tour! Everything was smooth and enjoyable.",
                        "Had a blast! The guide was funny, informative, and super engaging.",
                        "Didn’t expect to enjoy this as much as I did. Really great tour!",
                        "So glad I booked this—totally worth it and a great experience!",
                        "Just the right balance of history, fun, and cool sights.",
                        "Would absolutely do this again. The guide made it unforgettable!",
                        "Exceeded my expectations in every way. Loved every second!"] .sample
                      end

    review = Review.new(
      booking: completed_booking,
      review_content: review_content,
      tour_rating: Faker::Number.between(from: 3, to: 5),
      guide_rating: Faker::Number.between(from: 3, to: 5)
    )
    review.save!
  end
end

# Ensure each tour guide has at least one review
guides = User.where(guide: true)
guides.each do |guide|
  guide_tours = tours.where(user: guide)
  guide_tours.each do |tour|
    if Review.joins(:booking).where(bookings: { tour: tour }).empty?
      completed_booking = bookings.where(tour: tour, status: "Completed").sample
      if completed_booking
        review_content = case tour.category
                          when "Walking Tour"
                            ["Such a great walking tour! The guide made history come alive.",
                            "Perfect pace and awesome stories along the way. Highly recommend!",
                            "Loved exploring on foot—felt like I really got to know the city.",
                            "A fun and easy way to see all the best spots without missing anything.",
                            "Felt like a local wandering through hidden gems. Great experience!",
                            "So much cool info, but never felt overwhelming. Just a great time.",
                            "Awesome mix of history, fun facts, and beautiful sights."] .sample
                          when "Van Tour"
                            ["Super comfy ride with great stories along the way. Worth it!",
                            "Saw so much in just a few hours without feeling rushed. Perfect tour!",
                            "Great way to explore without walking too much. Loved every stop!",
                            "The guide was hilarious and knew so much. Made the trip even better!",
                            "Didn’t expect to enjoy a van tour this much, but it was fantastic!",
                            "Loved how easy and relaxed this was—no stress, just good vibes.",
                            "Perfect for seeing a lot in one go. The guide kept it fun and interesting!"] .sample
                          when "Bus Tour"
                            ["Great way to see everything without exhausting yourself. Totally worth it!",
                            "Loved how well-organized this was. Saw all the highlights with no hassle!",
                            "The bus was comfy, and the guide was a pro. Learned so much!",
                            "Such a fun way to cover a ton of ground. Highly recommend!",
                            "The perfect mix of sightseeing and storytelling. Really enjoyed it!",
                            "A must-do if you want to see the city without too much walking.",
                            "Easy, informative, and fun! Covered way more than I expected."] .sample
                          when "Free Tour"
                            ["Can't believe this was free! The guide was incredible!",
                            "Seriously one of the best tours I’ve been on. And it was free?!",
                            "Great experience—felt like a paid tour, but without the price tag!",
                            "Super engaging and informative. Totally worth tipping the guide!",
                            "Loved how passionate the guide was. Made the whole tour special.",
                            "One of the best ways to explore the city. Learned a ton!",
                            "Such a great way to meet people and discover hidden gems."] .sample
                          when "Boat Tour"
                            ["Hands down the most relaxing way to see the city. Loved it!",
                            "The views were unreal, and the guide had the best stories.",
                            "Felt like a little escape from the busy city. So peaceful and fun!",
                            "A perfect mix of sightseeing and just chilling on the water.",
                            "Could’ve stayed on the boat all day—such a cool experience!",
                            "A boat tour just hits different. Great vibe, great views, great info.",
                            "100% the highlight of my trip. Highly recommend!"] .sample
                          else
                            ["Such a well-organized tour! Everything was smooth and enjoyable.",
                            "Had a blast! The guide was funny, informative, and super engaging.",
                            "Didn’t expect to enjoy this as much as I did. Really great tour!",
                            "So glad I booked this—totally worth it and a great experience!",
                            "Just the right balance of history, fun, and cool sights.",
                            "Would absolutely do this again. The guide made it unforgettable!",
                            "Exceeded my expectations in every way. Loved every second!"] .sample
                          end

        review = Review.new(
          booking: completed_booking,
          review_content: review_content,
          tour_rating: Faker::Number.between(from: 4, to: 5),
          guide_rating: Faker::Number.between(from: 4, to: 5)
        )
        review.save!
      end
    end
  end
end

# Create additional reviews for completed bookings
bookings.each do |booking|
  if booking.date < Date.today && booking.status == "Completed" && Review.where(booking: booking).empty?
    review_content = case booking.tour.category
                      when "Walking Tour"
                        ["Such a great walking tour! The guide made history come alive.",
                        "Perfect pace and awesome stories along the way. Highly recommend!",
                        "Loved exploring on foot—felt like I really got to know the city.",
                        "A fun and easy way to see all the best spots without missing anything.",
                        "Felt like a local wandering through hidden gems. Great experience!",
                        "So much cool info, but never felt overwhelming. Just a great time.",
                        "Awesome mix of history, fun facts, and beautiful sights."] .sample
                      when "Van Tour"
                        ["Super comfy ride with great stories along the way. Worth it!",
                        "Saw so much in just a few hours without feeling rushed. Perfect tour!",
                        "Great way to explore without walking too much. Loved every stop!",
                        "The guide was hilarious and knew so much. Made the trip even better!",
                        "Didn’t expect to enjoy a van tour this much, but it was fantastic!",
                        "Loved how easy and relaxed this was—no stress, just good vibes.",
                        "Perfect for seeing a lot in one go. The guide kept it fun and interesting!"] .sample
                      when "Bus Tour"
                        ["Great way to see everything without exhausting yourself. Totally worth it!",
                        "Loved how well-organized this was. Saw all the highlights with no hassle!",
                        "The bus was comfy, and the guide was a pro. Learned so much!",
                        "Such a fun way to cover a ton of ground. Highly recommend!",
                        "The perfect mix of sightseeing and storytelling. Really enjoyed it!",
                        "A must-do if you want to see the city without too much walking.",
                        "Easy, informative, and fun! Covered way more than I expected."] .sample
                      when "Free Tour"
                        ["Can't believe this was free! The guide was incredible!",
                        "Seriously one of the best tours I’ve been on. And it was free?!",
                        "Great experience—felt like a paid tour, but without the price tag!",
                        "Super engaging and informative. Totally worth tipping the guide!",
                        "Loved how passionate the guide was. Made the whole tour special.",
                        "One of the best ways to explore the city. Learned a ton!",
                        "Such a great way to meet people and discover hidden gems."] .sample
                      when "Boat Tour"
                        ["Hands down the most relaxing way to see the city. Loved it!",
                        "The views were unreal, and the guide had the best stories.",
                        "Felt like a little escape from the busy city. So peaceful and fun!",
                        "A perfect mix of sightseeing and just chilling on the water.",
                        "Could’ve stayed on the boat all day—such a cool experience!",
                        "A boat tour just hits different. Great vibe, great views, great info.",
                        "100% the highlight of my trip. Highly recommend!"] .sample
                      else
                        ["Such a well-organized tour! Everything was smooth and enjoyable.",
                        "Had a blast! The guide was funny, informative, and super engaging.",
                        "Didn’t expect to enjoy this as much as I did. Really great tour!",
                        "So glad I booked this—totally worth it and a great experience!",
                        "Just the right balance of history, fun, and cool sights.",
                        "Would absolutely do this again. The guide made it unforgettable!",
                        "Exceeded my expectations in every way. Loved every second!"] .sample
                      end

    review = Review.new(
      booking: booking,
      review_content: review_content,
      tour_rating: Faker::Number.between(from: 3, to: 5),
      guide_rating: Faker::Number.between(from: 4, to: 5)
    )
    review.save!
  end
end

puts "All done!"

# # # validates :email, presence: true
# # # validates :encrypted_password, presence: true
# # # validates :age, presence: true, numericality: { only_integer: true }
# # # validates :guide, inclusion: { in: [true,false]}
# # # validates :language, presence: true
# # # validates :first_name, presence: true
# # # validates :last_name, presence: true
