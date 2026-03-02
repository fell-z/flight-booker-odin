class PassengerMailer < ApplicationMailer
  def confirmation_email(passenger)
    @passenger = passenger || params[:passenger]

    mail to: @passenger.email, subject: "Ticket booking confirmation"
  end
end
