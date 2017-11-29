require "unirest"
require "pp"

while true
  puts "Welcome to the Contacts app! Select an option:"
  puts "[1] Show all contacts"
  puts "[2] Show contact by id"
  puts "  [2.1] Search contact by first name"
  puts "[3] Create contact"
  puts "[4] Update contact by id"
  puts "[5] Delete contact by id"
  puts
  puts "[signup] Signup (new user)"
  puts "[login] Login (create token)"
  puts "[logout] Logout (create delete token)"
  puts
  puts "[q] Quit"


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
  elsif input == "2.1" #search by name
    print "Enter first name to search by: "
    search_terms = gets.chomp
    puts "Here are the matching contacts"
    response = Unirest.get("http://localhost:3000/v1/contacts?first_name=#{search_terms}")
    contacts = response.body
    pp contacts
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
    if contact["errors"]
      puts "No good!"
      p contact["errors"]
    else
      pp contact
    end
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
    params.delete_if { |value| value.empty? }
    response = Unirest.patch("http://localhost:3000/v1/contacts/#{contact_id}", parameters: params)
    contact = response.body
    if contact["errors"]
      puts "No good!"
      p contact["errors"]
    else
      pp contact
    end
  elsif input == "5" # delete by id
    print "Choose contact by id to delete: "
    contact_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v1/contacts/#{contact_id}")
    contact = response.body
    pp contact
  elsif input == "signup"
    params = {}
    print "Name: "
    params[:name] = gets.chomp
    print "Email: "
    params[:email] = gets.chomp
    print "Password: "
    params[:password] = gets.chomp
    print "Password confirmation: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
    pp response.body
  elsif input == "login"
    puts "Login to the app"
    params = {}
    print "Email: "
    params[:email] = gets.chomp
    print "Password: "
    params[:password] = gets.chomp
    response = Unirest.post(
      "http://localhost:3000/user_token", parameters: {auth: {email: params[:email], password: params[:password]}}
    )
    pp response.body
    # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  elsif input == "logout"
    jwt = ""
    Unirest.clear_default_headers()
  elsif input == "q"
    puts "Goodbye!"
    break
  end
  puts
  puts "Press enter to continue"
  gets.chomp
end