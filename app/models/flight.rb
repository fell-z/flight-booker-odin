class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.available_dates
    # Self reminder: passing a symbol to ::order doesn't work when a string is passed to ::select
    select("date_trunc('day', date) AS date").distinct.order("date")
  end

  def pretty_date
    date.strftime("%d/%m/%Y")
  end

  def pretty_format
    ERB::Util.html_escape_once(
      "#{departure_airport.code} &rArr; #{arrival_airport.code}, departing at #{date.to_fs(:time)}"
    )
  end
end
