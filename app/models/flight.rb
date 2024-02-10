class Flight < ApplicationRecord
  has_one :flight_route
  
  def departure_airport
    flight_route&.departure_airport
  end

  def arrival_airport
    flight_route&.arrival_airport
  end

  scope :search_by_departure_airport, ->(query) {
    joins(flight_route: :departure_airport)
      .where('airports.name LIKE ? OR airports.code LIKE ?', "%#{query}%", "%#{query}%")
      .distinct
  }

  scope :search_by_arrival_airport, ->(query) {
    joins(flight_route: :arrival_airport)
      .where('airports.name LIKE ? OR airports.code LIKE ?', "%#{query}%", "%#{query}%")
      .distinct
  }
end
