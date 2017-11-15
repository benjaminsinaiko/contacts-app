class ContactsController < ApplicationController
  def first_contact
    contact = Contact.first
    render json: contact  
  end

  def all_contacts
    contacts = Contact.all
    render json: contacts.as_json
  end
end
