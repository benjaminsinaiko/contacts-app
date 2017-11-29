class V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all
    if params[:first_name]
      contacts = contacts.where("first_name ILIKE ?", params[:first_name])
    end
    render json: contacts.as_json
  end

  def create
    contact = Contact.new(
    first_name: params["first_name"],
    middle_name: params["middle_name"],
    last_name: params["last_name"],
    email: params["email"],
    phone_number: params["phone_number"],
    bio: params["bio"]
  )
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :bad_request
    end
  end

  def show
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json
  end

  def update
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.first_name = params[:first_name] || contact.first_name
    contact.middle_name = params[:middle_name] || contact.middle_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    contact.bio = params[:bio] || contact.bio
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    # contact_id = params[:id] # Same as previous
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: {message: "Contact successfully deleted."}
  end
end
