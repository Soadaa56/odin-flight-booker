class CreateFlightRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :flight_routes do |t|
      t.references :flight, foreign_key: true
      t.references :departure_airport, foreign_key: { to_table: :airports }
      t.references :arrival_airport, foreign_key: { to_table: :airports }
      t.timestamps
    end
  end
end
