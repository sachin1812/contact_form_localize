class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.save
      flash[:success] = "Contact has been sent!"
      redirect_to root_path
    else
      flash[:errors] = @contact.errors.full_messages
      redirect_to root_path
    end
  end

private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :message)
  end
end
