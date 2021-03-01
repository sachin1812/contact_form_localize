class ContactMailer < ApplicationMailer
  default from: 'testsachin700@gmail.com'
  include ActionView::Helpers::TextHelper

  def contact_email(contact)
    @contact = contact
    mail to: @contact.email,  subject: "You got a new contact details!"
  end
end
