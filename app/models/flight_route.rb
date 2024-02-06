class FlightRoute < ApplicationRecord
  belongs_to :flight
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  attribute :departure_date, :date
  attribute :departure_time, :time
end