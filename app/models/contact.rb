class Contact < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true, on: :create
  validates :email, :first_name, :last_name, :phone_number, :message, presence: true
  validates :message, length: { minimum: 20 }

  after_create :send_contact_mail

  def send_contact_mail
    ContactMailer.contact_email(self).deliver
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
