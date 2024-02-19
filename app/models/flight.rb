class Flight < ApplicationRecord
  has_one :flight_route
  
  def departure_airport
    flight_route&.departure_airport
  end

  def arrival_airport
    flight_route&.arrival_airport
  end

end
