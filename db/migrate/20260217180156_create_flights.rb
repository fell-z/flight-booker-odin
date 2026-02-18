class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.belongs_to :departure_airport, null: false, foreign_key: { to_table: :airports }
      t.belongs_to :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
