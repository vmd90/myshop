# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Adding CATEGORIES..."

categories = [ "Animals" ,
               "Sports" ,
               "House" ,
               "Electronics" ,
               "Music and hobbies" ,
               "Kids" ,
               "Fashion" ,
               "Vehicles" ,
               "Real estate" ,
               "Jobs and business" ]

categories.each do |category|
  Category.friendly.find_or_create_by(description: category)
end

puts "CATEGORIES added successfully!"

###################

puts "Adding ADMIN..."

Admin.create!(
  name: "Admin",
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  role: 0
)

puts "ADMIN added successfully!"

###################

puts "Adding MEMBER..."

Member.create!(
  email: "member@member.com",
  password: "123456",
  password_confirmation: "123456"
)

puts "MEMBER added successfully!"
