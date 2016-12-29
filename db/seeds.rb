# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

15.times do |n|
  name = Faker::GameOfThrones.character
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(
                name:                  name,
                email:                 email,
                password:              password,
                password_confirmation: password
  )
end

4.times do |n|
  name = Faker::GameOfThrones.character
  email = "testing-#{n+1}@example.org"
  password = "password"
  role = :admin
  User.create!(
                name:                  name,
                email:                 email,
                password:              password,
                password_confirmation: password,
                role:                  role
  )
end
