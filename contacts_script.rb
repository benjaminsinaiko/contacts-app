require "unirest"

system "clear"
puts "Choose an option"
puts "[1] Show one contact"
puts "[2] Show all contacts"

input = gets.chomp

if input == "1"
  response = Unirest.get("http://localhost:3000/firstcontact")
  first_contact = response.body
  puts first_contact
elsif input == "2"
  response = Unirest.get("http://localhost:3000/allcontacts")
  all_contacts = response.body
  puts all_contacts
else
  puts "Choose again"
end