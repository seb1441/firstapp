class UserMailer < ApplicationMailer
  default from: 'sebastienauriault@gmail.com'

  def contact_form(first_name, last_name, email, phone_number, message)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_number = phone_number
    @message = message

    mail(:from => email,
        :to => 'sebastienauriault@gmail.com',
        :subject => "A new contact form message from #{first_name} #{last_name}")
  end
end
