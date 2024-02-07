class RemoveDepartureDateFromFlightRoutes < ActiveRecord::Migration[7.1]
  def change
    remove_column :flight_routes, :departure_date, :date
  end
end
