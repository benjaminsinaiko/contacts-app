Rails.application.routes.draw do
  get"/firstcontact" => "contacts#first_contact"
  get"/allcontacts" => "contacts#all_contacts"
end
