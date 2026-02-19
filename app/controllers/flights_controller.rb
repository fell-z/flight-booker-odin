class FlightsController < ApplicationController
  def index
    @airport_codes_options = Airport.pluck(:code)
    @available_dates = Flight.available_dates

    if search_sent?
      @flights = Flight.order(:date).where(
        departure_airport: Airport.find_by(code: params[:departure_code]),
        arrival_airport: Airport.find_by(code: params[:arrival_code]),
        date: params[:date].to_date.all_day
      )

      @number_of_passengers = params[:number_of_passengers]
    end
  end

  private

  def search_sent?
    %i[departure_code arrival_code date number_of_passengers].all? { |necessary_key| params.has_key?(necessary_key) }
  end
end
