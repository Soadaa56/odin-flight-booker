class AddDateAndTimeToFlightRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :flight_routes, :departure_date, :date
    add_column :flight_routes, :departure_time, :time
  end
end
