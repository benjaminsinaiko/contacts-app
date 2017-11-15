# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

contact = Contact.new({first_name:"Bob", last_name:"Smith", email:"bob.smith@gmail.com", phone_number:"555-123-4567"})
contact.save
contact = Contact.new({first_name:"Sally", last_name:"Smith", email:"sally.smith@gmail.com", phone_number:"555-987-6543"})
contact.save

