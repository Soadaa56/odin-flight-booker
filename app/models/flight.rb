class Flight < ApplicationRecord
  has_many :flight_routes
  has_many :airports, through: :flight_routes
end
