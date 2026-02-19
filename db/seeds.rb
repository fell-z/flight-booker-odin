# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "LAX", "ATL", "DEN", "JFK", "LAS", "MIA", "SEA", "SFO", "BOS", "PHL", "SAN", "AUS" ].each do |code|
  Airport.find_or_create_by!(code: code)
end

14.times do |i|
  Airport.ids.permutation(2).each do |departure_airport_id, arrival_airport_id|
    rand(2..6).times do
      Flight.find_or_create_by!(
        departure_airport_id: departure_airport_id,
        arrival_airport_id: arrival_airport_id,
        date: Time.current.midnight + (i + 1).day + rand(0..24).hour,
        duration: (1..6).step(0.5).map { |time| time.hour.in_minutes }.sample
      )
    end
  end
end
