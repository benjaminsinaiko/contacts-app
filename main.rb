require "unirest"
require "pp"

puts "Welcome to the Contacts app! Select an option:"
puts "[1] Show all contacts"
puts "[2] Show contact by id"
puts "[3] Create contact"
puts "[4] Update contact by id"
puts "[5] Delete contact by id"
input = gets.chomp

if input == "1" # show all
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body
  pp contacts
elsif input == "2" # show by id
  print "Choose contact by id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{contact_id}")
  contact = response.body
  pp contact
elsif input == "3" # create
  params = {}
  print "Enter fist name: "
  params["first_name"] = gets.chomp
  print "Enter middle name: "
  params["middle_name"] = gets.chomp
  print "Enter last name: "
  params["last_name"] = gets.chomp
  print "Enter email: "
  params["email"] = gets.chomp
  print "Enter phone number: "
  params["phone_number"] = gets.chomp
  print "Enter contact bio: "
  params["bio"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  contact = response.body
  pp contact
elsif input == "4" # update by id
  print "Enter contact by id to update: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{contact_id}")
  contact = response.body
  params = {}
  print "Enter updated first name (#{contact["first_name"]}): "
  params["first_name"] = gets.chomp
  print "Enter updated middle name (#{contact["middle_name"]}): "
  params["middle_name"] = gets.chomp
  print "Enter updated last name (#{contact["last_name"]}): "
  params["last_name"] = gets.chomp
  print "Enter updated email (#{contact["email"]}): "
  params["email"] = gets.chomp
  print "Enter updated phone number (#{contact["phone_number"]}): "
  params["phone_number"] = gets.chomp
  print "Enter updated bio (#{contact["bio"]}): "
  params["bio"] = gets.chomp
  params.delete_if { |key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{contact_id}", parameters: params)
  updated_contact = response.body
  pp updated_contact
elsif input == "5" # delete by id
  print "Choose contact by id to delete: "
  contact_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/contacts/#{contact_id}")
  contact = response.body
  pp contact
end