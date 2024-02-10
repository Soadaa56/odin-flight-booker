class Flight < ApplicationRecord
  has_one :flight_route
  
  def departure_airport
    flight_route&.departure_airport
  end

  def arrival_airport
    flight_route&.arrival_airport
  end

  def self.search(params)
    puts "Below is params"
    puts params
    puts "Above is params"
    if params.present?
      departure_airport_id = params[:departure_airport_id]
      arrival_airport_id = params[:arrival_airport_id]
      departure_flights = joins(flight_route: :departure_airport)
                            .where('airports.id = ?', departure_airport_id)

      arrival_flights = joins(flight_route: :arrival_airport)
                          .where('airports.id = ?', arrival_airport_id)

      (departure_flights + arrival_flights).uniq
    else
      all
    end
  end
end
