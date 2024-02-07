class AddArrivalTimeToFlightRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :flight_routes, :arrival_time, :time
  end
end
