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
file = URI.parse("https://plus.unsplash.com/premium_photo-1661764174171-c29f85bd8a37?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
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
  about_me: "Adventure fuels my soul! 🌍✈️ From wandering ancient ruins to discovering hidden gems in bustling cities, I’m always looking for my next journey. I believe the best way to experience a place is through its culture, food, and people. When I’m not traveling, you’ll find me reading about history, trying new cuisines, or planning my next destination. Let’s explore the world together!"
)
tourist1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
tourist1.save!

file = URI.parse("https://plus.unsplash.com/premium_photo-1682096348418-dbef9b1d0add?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D").open
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
  about_me: "Passionate explorer with a love for new cultures, flavors, and experiences! 🌎✨ Whether it's hiking through breathtaking landscapes or getting lost in charming city streets, I believe every trip tells a story. As a native Portuguese speaker, I enjoy connecting with people from all over the world and sharing the magic of travel. When I’m not on the road, you’ll find me sipping coffee in a cozy café, planning my next adventure, or learning a new language. Let’s make unforgettable memories together!"
)
tourist2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
tourist2.save!

# CREATE TOUR GUIDES
puts "Creating guides"

# Paris Guide
file = URI.parse("https://images.unsplash.com/photo-1645468085508-11d3ee94fcef?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D").open
first_name = "Claire"
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
  about_me: "Bonjour! I'm Claire. I was born and raised in Paris, and I've been guiding tourists for over 6 years. I love sharing the hidden gems of this beautiful city—whether it's a secret café or a quiet corner of Montmartre. Let me show you the Paris that most tourists miss!"
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
  about_me: "Ciao! I'm Marco, a proud Roman who has been guiding tourists around this timeless city for 8 years. From the grandeur of the Colosseum to the charm of Trastevere, I’m here to help you experience Rome like a local!"
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
  about_me: "Hello! I’m Oliver, a Londoner born and bred. I’ve been a guide for over 5 years, and I love showing visitors the best of this vibrant city. Whether you’re into history, food, or the best local pubs, I’ve got a tour for you!"
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
  about_me: "Hola! I’m Isabella, and I’ve been a tour guide in Barcelona for 7 years. From the magnificent architecture of Gaudí to the lively atmosphere of La Rambla, I love showing visitors the heart of my city."
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
  about_me: "Hi there, I’m Lukas. As a proud local of Amsterdam, I’ve been guiding people around my city for 6 years. Whether you’re interested in the art at the Rijksmuseum or discovering the unique history of the canals, I’d love to show you around!"
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
  about_me: "Hallo! I’m Anna, and I’ve been showing people around Berlin for over 6 years. From the history of the Berlin Wall to the cool street art in Kreuzberg, I’ll help you experience all the unique sides of my city."
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
  about_me: "Hey, I’m Ethan, and I’ve been guiding visitors in New York for 4 years. From the bright lights of Times Square to the peaceful spots in Central Park, I’ll show you how this city truly never sleeps."
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
  about_me: "Salam! I’m Fatima, and I’ve been showing visitors around Cairo for over 7 years. I can take you from the majestic Pyramids to the lively markets of Khan el-Khalili. I’ll make sure you get a taste of Egypt’s rich history and vibrant culture!"
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
  about_me: "Konnichiwa! I’m Yuki, and I’ve been guiding visitors in Tokyo for 5 years. Whether you want to see the traditional temples or the latest fashion trends in Harajuku, I’ll take you on an unforgettable journey through Japan’s capital."
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
  about_me: "¡Hola! I’m Luis, and I’ve been guiding tourists around Machu Picchu for over 10 years. This ancient wonder is my passion, and I can’t wait to share the mysteries of Inca culture and breathtaking views with you."
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
  about_me: "G'day! I'm Emily, and I’ve been guiding visitors through Sydney for 6 years. Whether it's a day at Bondi Beach or a cultural tour of The Rocks, I’ll make sure you have a great time experiencing all the beauty Sydney has to offer."
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
  about_me: "Oi! I'm Carlos. As a Rio native, I’ve been showing tourists the magic of this vibrant city for over 7 years. From Sugarloaf Mountain to the beaches of Copacabana, I’ll help you make the most of your Rio adventure."
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
  about_me: "As-salamu alaykum! I’m Layla, and I’ve been guiding visitors through the wonders of Dubai for 8 years. Whether it’s a trip to the Burj Khalifa or a desert safari, I’ll make sure you experience the luxury and excitement that Dubai is famous for!"
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
  about_me: "你好! I’m Wei, your guide to the vibrant and bustling city of Hong Kong! With over 5 years of experience, I’ll show you the best of the city – from the amazing skyline to the rich history and diverse culture. Let’s discover Hong Kong together!"
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

############################### LATEST #################################
#   "https://images.unsplash.com/photo-1588390801685-1432b35a975b?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
#   "https://plus.unsplash.com/premium_photo-1716866637657-da951241f2db?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
#   "https://images.unsplash.com/photo-1535757596010-06fbdd41fd42?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dG91ciUyMGd1aWRlfGVufDB8fDB8fHww",
#   "https://images.unsplash.com/photo-1597627094703-2a8af9caa749?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://plus.unsplash.com/premium_photo-1716937389119-37d11a6c8a92?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8dG91ciUyMGd1aWRlfGVufDB8fDB8fHww",
#   "https://images.unsplash.com/photo-1621707854626-ffa306e32745?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://plus.unsplash.com/premium_photo-1716999413660-cd854b6d6382?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTN8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://plus.unsplash.com/premium_photo-1718146018854-ad4aa928d9c4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://images.unsplash.com/photo-1645468085508-11d3ee94fcef?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://images.unsplash.com/photo-1654414882149-8417f5de3a63?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzB8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://images.unsplash.com/photo-1669296583832-e0ba1d1438ed?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzZ8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://images.unsplash.com/photo-1667331623046-7d49f27282ed?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzF8fHRvdXIlMjBndWlkZXxlbnwwfHwwfHx8MA%3D%3D",
#   "https://images.unsplash.com/photo-1495538411606-c9efab92bcbe?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA0fHx0b3VyJTIwZ3VpZGV8ZW58MHx8MHx8fDA%3D",
#   "https://plus.unsplash.com/premium_photo-1716999410241-d7c1f0450f5d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTM1fHx0b3VyJTIwZ3VpZGV8ZW58MHx8MHx8fDA%3D",
#   "https://plus.unsplash.com/premium_photo-1716866637402-f42202efe8e0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzAzfHx0b3VyJTIwZ3VpZGV8ZW58MHx8MHx8fDA%3D",
#   "https://plus.unsplash.com/premium_photo-1716313544666-3b58ad2a7d5b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fHRvdXIlMjBndWlkZSUyMHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D"
# ]

# CREATE TOURS
puts "Creating tours"
tour_data = [
  { location: "Paris", guide: guide1, description: "Explore the city of love with a local guide.", price: 50, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1666283181610-b95ee7e55465?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Eiffel Tower, Paris, France", ending_point: "Louvre Museum, Paris, France", sights: "Notre-Dame Cathedral of Paris, Paris, France; Champs-Élysées, Paris, France; Sacré-Cœur, Paris, France; Montmartre, Paris, France" },
  { location: "Paris", guide: guide1, description: "Discover the hidden gems of Paris with a local expert.", price: 55, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Montmartre, Paris, France", ending_point: "Le Marais, Paris, France", sights: "Sacré-Cœur, Paris, France; Moulin Rouge, Paris, France; Place des Vosges, Paris, France; Centre Pompidou, Paris, France" },
  { location: "Rome", guide: guide2, description: "Visit iconic landmarks like the Colosseum and the Vatican.", price: 60, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1552832230-c0197dd311b5?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Colosseum, Rome, Italy", sights: "Trevi Fountain, Rome, Italy; Pantheon, Rome, Italy; Spanish Steps, Rome, Italy; Piazza Navona, Rome, Italy", ending_point: "Vatican City, Rome, Italy" },
  { location: "Rome", guide: guide2, description: "Explore the ancient ruins of Rome.", price: 55, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1531572753322-ad063cecc140?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Roman Forum, Rome, Italy", sights: "Circus Maximus, Rome, Italy; Capitoline Hill, Rome, Italy; Arch of Constantine, Rome, Italy; Trajan's Market, Rome, Italy", ending_point: "Palatine Hill, Rome, Italy" },
  { location: "London", guide: guide3, description: "A day in the British capital, with history and culture.", price: 45, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Big Ben, London, UK", sights: "Buckingham Palace, London, UK; London Eye, London, UK; Westminster Abbey, London, UK; Trafalgar Square, London, UK", ending_point: "Tower of London, London, UK" },
  { location: "London", guide: guide3, description: "Discover the modern and historic sides of London.", price: 50, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1671809692422-4893b9e09119?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "St. Paul's Cathedral, London, UK", sights: "Millennium Bridge, London, UK; Tate Modern, London, UK; Borough Market, London, UK; Shakespeare's Globe, London, UK", ending_point: "The Shard, London, UK" },
  { location: "Barcelona", guide: guide4, description: "Walk through the city of art and architecture.", price: 40, category: "Free Tour", photo_url: "https://images.unsplash.com/photo-1523531294919-4bcd7c65e216?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Sagrada Familia, Barcelona, Spain", sights: "Casa Batlló, Barcelona, Spain; La Rambla, Barcelona, Spain; Gothic Quarter, Barcelona, Spain; Magic Fountain of Montjuïc, Barcelona, Spain", ending_point: "Park Güell, Barcelona, Spain" },
  { location: "Barcelona", guide: guide4, description: "Explore the vibrant neighborhoods of Barcelona.", price: 35, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1583422409516-2895a77efded?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Plaça de Catalunya, Barcelona, Spain", sights: "El Raval, Barcelona, Spain; Born Cultural Center, Barcelona, Spain; Picasso Museum, Barcelona, Spain; Ciutadella Park, Barcelona, Spain", ending_point: "Barceloneta Beach, Barcelona, Spain" },
  { location: "Amsterdam", guide: guide5, description: "Explore the beautiful canals and museums.", price: 55, category: "Boat Tour", photo_url: "https://images.unsplash.com/photo-1534351590666-13e3e96b5017?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Central Station, Amsterdam, Netherlands", sights: "Anne Frank House, Amsterdam, Netherlands; Van Gogh Museum, Amsterdam, Netherlands; Dam Square, Amsterdam, Netherlands; Vondelpark, Amsterdam, Netherlands", ending_point: "Rijksmuseum, Amsterdam, Netherlands" },
  { location: "Amsterdam", guide: guide5, description: "Discover the hidden gems of Amsterdam.", price: 50, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1605101100278-5d1deb2b6498?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Dam Square, Amsterdam, Netherlands", sights: "Red Light District, Amsterdam, Netherlands; Rembrandt House Museum, Amsterdam, Netherlands; Flower Market, Amsterdam, Netherlands; NEMO Science Museum, Amsterdam, Netherlands", ending_point: "Jordaan, Amsterdam, Netherlands" },
  { location: "Berlin", guide: guide6, description: "Discover Berlin’s history and modern culture.", price: 50, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1599946347371-68eb71b16afc?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Brandenburg Gate, Berlin, Germany", sights: "Checkpoint Charlie, Berlin, Germany; Museum Island, Berlin, Germany; Alexanderplatz, Berlin, Germany; East Side Gallery, Berlin, Germany", ending_point: "Berlin Wall Memorial, Berlin, Germany" },
  { location: "Berlin", guide: guide6, description: "Explore the alternative side of Berlin.", price: 45, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1587330979470-3595ac045ab0?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Kreuzberg, Berlin, Germany", sights: "RAW-Gelände, Berlin, Germany; Mauerpark, Berlin, Germany; Urban Spree, Berlin, Germany; Schlesisches Tor, Berlin, Germany", ending_point: "East Side Gallery, Berlin, Germany" },
  { location: "New York", guide: guide7, description: "The iconic New York City tour, with must-see attractions.", price: 70, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1483653364400-eedcfb9f1f88?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Statue of Liberty, New York, USA", sights: "Brooklyn Bridge, New York, USA; Empire State Building, New York, USA; Rockefeller Center, New York, USA; Times Square, New York, USA", ending_point: "Central Park, New York, USA" },
  { location: "New York", guide: guide7, description: "Discover the hidden gems of New York City.", price: 65, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1492666673288-3c4b4576ad9a?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Grand Central Terminal, New York, USA", sights: "Chrysler Building, New York, USA; Bryant Park, New York, USA; Greenwich Village, New York, USA; Chelsea Market, New York, USA", ending_point: "High Line, New York, USA" },
  { location: "Cairo", guide: guide8, description: "Tour the Great Pyramids and the Sphinx.", price: 65, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1553913861-c0fddf2619ee?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Pyramids of Giza, Cairo, Egypt", ending_point: "Egyptian Museum, Cairo, Egypt", sights: "Sphinx, Cairo, Egypt; Khan el-Khalili, Cairo, Egypt; Al-Azhar Mosque, Cairo, Egypt; Cairo Tower, Cairo, Egypt" },
  { location: "Cairo", guide: guide8, description: "Explore the historic sites of Cairo.", price: 60, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1572252009286-268acec5ca0a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Citadel of Saladin, Cairo, Egypt", ending_point: "Mosque of Muhammad Ali, Cairo, Egypt", sights: "Sultan Hassan Mosque, Cairo, Egypt; Al-Rifa'i Mosque, Cairo, Egypt; Coptic Museum, Cairo, Egypt; Hanging Church, Cairo, Egypt" },
  { location: "Tokyo", guide: guide9, description: "Experience the vibrant energy of Tokyo’s streets.", price: 80, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=2988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Shibuya Crossing, Tokyo, Japan", ending_point: "Tokyo Tower, Tokyo, Japan", sights: "Meiji Shrine, Tokyo, Japan; Asakusa, Tokyo, Japan; Ueno Park, Tokyo, Japan; Akihabara, Tokyo, Japan" },
  { location: "Tokyo", guide: guide9, description: "Discover the traditional and modern sides of Tokyo.", price: 75, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1661914240950-b0124f20a5c1?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Senso-ji Temple, Tokyo, Japan", ending_point: "Roppongi Hills, Tokyo, Japan", sights: "Tsukiji Fish Market, Tokyo, Japan; Ginza, Tokyo, Japan; Odaiba, Tokyo, Japan; Shinjuku Gyoen, Tokyo, Japan" },
  { location: "Machu Picchu", guide: guide10, description: "Take a trek to the ancient Inca ruins.", price: 90, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1587595431973-160d0d94add1?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Machu Picchu Entrance, Peru", ending_point: "Sun Gate, Machu Picchu, Peru", sights: "Temple of the Sun, Machu Picchu, Peru; Inca Bridge, Machu Picchu, Peru; Huayna Picchu, Machu Picchu, Peru; Intihuatana, Machu Picchu, Peru" },
  { location: "Sydney", guide: guide11, description: "Explore Sydney’s stunning landmarks and beaches.", price: 60, category: "Boat Tour", photo_url: "https://images.unsplash.com/photo-1546268060-2592ff93ee24?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Sydney Opera House, Sydney, Australia", ending_point: "Bondi Beach, Sydney, Australia", sights: "Harbour Bridge, Sydney, Australia; Darling Harbour, Sydney, Australia; Taronga Zoo, Sydney, Australia; The Rocks, Sydney, Australia" },
  { location: "Sydney", guide: guide11, description: "Discover the vibrant neighborhoods of Sydney.", price: 55, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Circular Quay, Sydney, Australia", ending_point: "Darling Harbour, Sydney, Australia", sights: "Royal Botanic Garden, Sydney, Australia; Hyde Park, Sydney, Australia; Queen Victoria Building, Sydney, Australia; Barangaroo, Sydney, Australia" },
  { location: "Sydney", guide: guide11, description: "Explore Sydney's iconic landmarks and scenic views.", price: 55, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1697730221799-f2aa87ab2c5d?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Circular Quay, Sydney, Australia", ending_point: "Darling Harbour, Sydney, Australia", sights: "Royal Botanic Garden, Sydney, Australia; Hyde Park, Sydney, Australia; Queen Victoria Building, Sydney, Australia; Barangaroo, Sydney, Australia" },
  { location: "Rio de Janeiro", guide: guide12, description: "Soak up the sun and culture of Rio.", price: 75, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1518639192441-8fce0a366e2e?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Christ the Redeemer, Rio de Janeiro, Brazil", ending_point: "Sugarloaf Mountain, Rio de Janeiro, Brazil", sights: "Copacabana Beach, Rio de Janeiro, Brazil; Ipanema Beach, Rio de Janeiro, Brazil; Maracanã Stadium, Rio de Janeiro, Brazil; Selarón Steps, Rio de Janeiro, Brazil" },
  { location: "Rio de Janeiro", guide: guide12, description: "Explore the vibrant neighborhoods of Rio.", price: 70, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Lapa Arches, Rio de Janeiro, Brazil", ending_point: "Botanical Garden, Rio de Janeiro, Brazil", sights: "Santa Teresa, Rio de Janeiro, Brazil; Flamengo Park, Rio de Janeiro, Brazil; Museum of Tomorrow, Rio de Janeiro, Brazil; Cinelândia, Rio de Janeiro, Brazil" },
  { location: "Dubai", guide: guide13, description: "Visit the stunning modern architecture of Dubai.", price: 85, category: "Bus Tour", photo_url: "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Burj Khalifa, Dubai, UAE", sights: "Dubai Mall, Dubai, UAE; Dubai Marina, Dubai, UAE; Burj Al Arab, Dubai, UAE; Jumeirah Beach, Dubai, UAE", ending_point: "Palm Jumeirah, Dubai, UAE" },
  { location: "Dubai", guide: guide13, description: "Explore the cultural heritage of Dubai.", price: 80, category: "Walking Tour", photo_url: "https://images.unsplash.com/photo-1580674684081-7617fbf3d745?q=80&w=3174&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Al Fahidi Historical District, Dubai, UAE", sights: "Dubai Museum, Dubai, UAE; Gold Souk, Dubai, UAE; Spice Souk, Dubai, UAE; Al Seef, Dubai, UAE", ending_point: "Dubai Creek, Dubai, UAE" },
  { location: "Hong Kong", guide: guide14, description: "A vibrant city tour through Hong Kong.", price: 65, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1518599807935-37015b9cefcb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Victoria Peak, Hong Kong, China", ending_point: "Tsim Sha Tsui, Hong Kong, China", sights: "Hong Kong Disneyland, Hong Kong, China; Avenue of Stars, Hong Kong, China; Mong Kok, Hong Kong, China; Star Ferry, Hong Kong, China" },
  { location: "Hong Kong", guide: guide14, description: "Enjoy a classic Hong Kong sightseeing experience.", price: 60, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1661887292499-cbaefdb169ce?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Temple Street Night Market, Hong Kong, China", ending_point: "Lan Kwai Fong, Hong Kong, China", sights: "Mong Kok, Hong Kong, China; Man Mo Temple, Hong Kong, China; Central, Hong Kong, China; Hong Kong Park, Hong Kong, China" },
  { location: "Athens", guide: guide15, description: "Visit ancient ruins and the Acropolis in Athens.", price: 55, category: "Van Tour", photo_url: "https://images.unsplash.com/photo-1555993539-1732b0258235?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Acropolis of Athens, Greece", sights: "Temple of Olympian Zeus, Athens, Greece; Plaka, Athens, Greece; National Archaeological Museum, Athens, Greece; Monastiraki, Athens, Greece", ending_point: "Parthenon, Athens, Greece" },
  { location: "Athens", guide: guide15, description: "Explore the historic sites of Athens.", price: 50, category: "Walking Tour", photo_url: "https://plus.unsplash.com/premium_photo-1668618252814-76fd5206f523?q=80&w=3110&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", starting_point: "Syntagma Square, Athens, Greece", sights: "Hadrian's Library, Athens, Greece; Roman Agora, Athens, Greece; Kerameikos, Athens, Greece; Philopappos Hill, Athens, Greece", ending_point: "Ancient Agora, Athens, Greece" }
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
      name: "Tour in #{tour_info[:location]} with #{tour_info[:guide].first_name}",
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

puts "All done!"

# # # validates :email, presence: true
# # # validates :encrypted_password, presence: true
# # # validates :age, presence: true, numericality: { only_integer: true }
# # # validates :guide, inclusion: { in: [true,false]}
# # # validates :language, presence: true
# # # validates :first_name, presence: true
# # # validates :last_name, presence: true
