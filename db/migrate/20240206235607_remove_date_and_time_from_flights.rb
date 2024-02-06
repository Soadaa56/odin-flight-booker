class RemoveDateAndTimeFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :date, :date
    remove_column :flights, :time, :time
  end
end
