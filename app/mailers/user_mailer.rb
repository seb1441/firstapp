class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def contact_form(name, email, message)
    @message = message

    mail(:from => email,
        :to => 'sebastienauriault@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
