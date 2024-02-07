class RemoveDepartureAndArrivalIdsFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :departure_airport_id, :integer
    remove_column :flights, :arrival_airport_id, :integer
  end
end
