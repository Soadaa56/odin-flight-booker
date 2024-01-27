class Airport < ApplicationRecord
  has_many :flight_routes_as_departure, class_name: 'FlightRoute', foreign_key: 'departure_airport_id'
  has_many :flight_routes_as_arrival, class_name: 'FlightRoute', foreign_key: 'arrival_airport_id'
  has_many :departing_flights, through: :flight_routes_as_departure, source: :flight
  has_many :arriving_flights, through: :flight_routes_as_arrival, source: :flight
end