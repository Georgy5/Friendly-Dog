# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "removing the world! (cleaning up database)"
# User.destroy_all
puts "creating users"
5.times do
  name = Faker::Name.name.split(' ')
  person = User.create!(
    first_name: name.first,
    last_name: name.last,
    email: Faker::Internet.email,
    password: "password"
  )
end
puts "the people are here"
5.times do
  i = 1
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    size: ['small', 'med-small', 'medium', 'med-large', 'large'].sample,
    category: ['seeing-eye-dog', 'emotional support', 'kid-friendly', 'underdog'].sample,
    city: Faker::Address.city
  )
  dog.user = User.find(i)
  dog.save!
  i += 1
end

puts "the people each have a dog, how nice"
