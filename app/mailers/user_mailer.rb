class UserMailer < ActionMailer::Base
  default from: "from@tns.com"

  def appointment_email(appointment)
  	@appointment = appointment
    @requester = appointment.requester
    @tutor = appointment.tutor
    @url  = "http://localhost:3000#{profile_path(appointment.tutor.profile)}"
    mail(:to => @tutor.email, :subject => "You have a new appointment from #{@requester.username}")
  end
end
