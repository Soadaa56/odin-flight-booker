class FlightRoute < ApplicationRecord
  belongs_to :flight
  belongs_to :airport
end