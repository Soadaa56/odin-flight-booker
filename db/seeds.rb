# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Airport.destroy_all
Flight.destroy_all
FlightRoute.destroy_all

puts "Resetting Database..."

# Create airports
Airport.create!([
  { name: "New York City", code: "JFK" },
  { name: "Atlanta", code: "ATL" },
  { name: "Denver", code: "DEN" },
  { name: "Los Angeles", code: "LAX" },
  { name: "Miami", code: "MIA" },
  { name: "San Francisco", code: "SFO" },
  { name: "Dallas", code: "DFW" },
  { name: "Las Vegas", code: "LAS" },
  { name: "Seattle", code: "SEA" },
  { name: "Phoenix", code: "PHX" }
])

puts "Created #{Airport.count} airports."

# Help from chatGPT to learn some seeding ideas
100.times do
  departure_airport = Airport.all.sample
  arrival_airport = (Airport.all - [departure_airport]).sample
  departure_time = Faker::Time.forward(days: 30)
  arrival_time = departure_time + rand(4..8).hours

  flight = Flight.create!

  FlightRoute.create!(
    flight: flight,
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    departure_time: departure_time,
    arrival_time: arrival_time
  )
end

puts "Created #{Flight.count} flights and #{FlightRoute.count} routes."
